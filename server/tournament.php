<?php

function getTournaments()
{
    // Create connection
    $conn = connect();
    $sql = "SELECT * FROM `tournament`";
    $result = $conn->query($sql);

    $jsonData = array();
    while ($array = $result->fetch_row()) {
        $obj = new Tournament($array[0], $array[1], $array[2], $array[3], $array[4], $array[5],$array[6], $array[7]);
        $jsonData[] = $obj;
    }
    return json_encode($jsonData);
}

function getTournament($tid)
{
    // Create connection
    $conn = connect();
    $sql = "SELECT * FROM `tournament` WHERE id = " . toNull($tid,true) . "";
    $result = $conn->query($sql);

    $array = $result->fetch_row();
    $obj = new Tournament($array[0], $array[1], $array[2], $array[3], $array[4], $array[5],$array[6], $array[7]);

    return json_encode($obj);

}

function getTournamentPlayers($tid)
{
    // Create connection
    $conn = connect();
    $sql = "SELECT user_id FROM `user_tournament` WHERE tournament_id = " .toNull($tid,true);
    $result = $conn->query($sql);

    $jsonData = array();
    while ($array = $result->fetch_row()) {
        $jsonData[] = $array[0];
    }
    return $jsonData;
}

function getEmptyTournamentPlayer($pid)
{
    // Create connection
    $conn = connect();
    $sql = "SELECT id,first_name,last_name  
            FROM `user` 
            WHERE id  = " .$pid;
    $result = $conn->query($sql);


    $array = $result->fetch_row();
    $obj = new Player($array[0], $array[1], $array[2],0, 0, 0, 0, 0, 0, 0, 0);

    return $obj;
}



function getTournamentTable($tid)
{
    // Create connection
    $conn = connect();
    $sql = "SELECT
    u.id,u.first_name,u.last_name , Sum(P) AS P,Sum(W) AS W,Sum(D) AS D,Sum(L) AS L,
    SUM(F) as F,SUM(A) AS A,SUM(GD) AS GD,SUM(Pts) AS Pts
    FROM(
      SELECT
      home_id User,
      1 P,
      IF(home_score > away_score,1,0) W,
      IF(home_score = away_score,1,0) D,
      IF(home_score < away_score,1,0) L,
      home_score F,
      away_score A,
      home_score-away_score GD,
      CASE WHEN home_score > away_score THEN 3 WHEN home_score = away_score THEN 1 ELSE 0 END PTS
      FROM `match`
      WHERE tournament_id = " .toNull($tid,true) ."
      UNION ALL
      SELECT
      away_id,
      1,
      IF(home_score < away_score,1,0),
      IF(home_score = away_score,1,0),
      IF(home_score > away_score,1,0),
      away_score,
      home_score,
      away_score-home_score GD,
      CASE WHEN home_score < away_score THEN 3 WHEN home_score = away_score THEN 1 ELSE 0 END
      FROM `match`
      WHERE tournament_id = " .toNull($tid,true) ."
      ) as tot
        JOIN `user` u ON tot.User=u.id
        GROUP BY User
        ORDER BY SUM(Pts) DESC ";
        $result = $conn->query($sql);

    $jsonData = array();
    $playerIds = array();
    while ($array = $result->fetch_row()) {
      $playerIds[] = $array[0];
      $obj = new Player($array[0], $array[1], $array[2], $array[3], $array[4], $array[5], $array[6], $array[7], $array[8], $array[9], $array[10]);
      
      $jsonData[] = $obj;
    }
   $jsonData = array_merge($jsonData,addEmptyPlayerRows($playerIds,$tid));
return json_encode($jsonData);
}

function addEmptyPlayerRows($ids,$tournamentId){

  $tournamentPlayers = getTournamentPlayers($tournamentId);
  $emptyIds = array_diff($tournamentPlayers, $ids);
  $emptyPlayers = array();
  foreach ($emptyIds as $pid) {
    $emptyPlayers[] = getEmptyTournamentPlayer($pid);
  }
  return $emptyPlayers;
}

function getTournamentMatches($id)
{
    // Create connection
    $conn = connect();
    $sql = "SELECT m.id as Id,u1.*,u2.*,t1.*,t2.*,m.home_score,m.away_score,m.admin_id,m.tournament_id,m.date as MatchDate,m.version,m.random
    FROM `match` m , `user` u1,`user` u2 , `team` t1,`team` t2, `match_team` mt1,`match_team` mt2
    WHERE u1.id = m.home_id
    AND u2.id = m.away_id
    AND mt1.match_id = m.id
    AND mt2.match_id = m.id
    AND mt1.user_id = m.home_id
    AND mt2.user_id = m.away_id
    AND t1.id = mt1.team_id
    AND t2.id = mt2.team_id
    AND m.tournament_id = " . $id ." 
    ORDER BY MatchDate DESC";
    $result = $conn->query($sql);

    $jsonData = array();
    while ($array = $result->fetch_row()) {
        $homePlayer = new User($array[1], $array[2], $array[3], $array[4], 'undefined', $array[6]);
        $awayPlayer = new User($array[7], $array[8], $array[9], $array[10], 'undefined', $array[12]);
        $homeTeam = new Team($array[13], $array[14], $array[15], $array[16], $array[17], $array[18], $array[19], $array[20], $array[21]);
        $awayTeam = new Team($array[22], $array[23], $array[24], $array[25], $array[26], $array[27], $array[28], $array[29], $array[30]);
        $match = new ListMatch($array[0], $homePlayer,$homeTeam,$array[31],$awayPlayer,$awayTeam,$array[32],$array[33],$array[34],$array[35],$array[36],$array[37]);

        $jsonData[] = $match;
    }
    return json_encode($jsonData);
}

function addTournament($tour)
{

    $conn = connect();

    $sql = "INSERT INTO `tournament` (`name`, `host_id`, `version`, `league_id`) VALUES (" . toNull($tour->name,true) ."," . $tour->hostId . "," . $tour->version . ",". $tour->leagueId . ")";

    if ($conn->query($sql) === TRUE) {
        $tourId = $conn->insert_id;

        foreach ($tour->players as $player) {
         $sql = "INSERT INTO `user_tournament` (`tournament_id`, `user_id`) VALUES (" . $tourId . "," . $player->id . ")";
         $conn->query($sql);
     }

     return $tourId;
 } else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
}

?>