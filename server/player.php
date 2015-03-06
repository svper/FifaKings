<?php

function getPlayers()
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
  ) as tot
JOIN `user` u ON tot.User=u.id
GROUP BY User
ORDER BY SUM(Pts) DESC ";
$result = $conn->query($sql);

$jsonData = array();
while ($array = $result->fetch_row()) {
    $obj = new Player($array[0], $array[1], $array[2],null, $array[3], $array[4], $array[5], $array[5], $array[6], $array[7], $array[8], $array[9], $array[10]);
    $jsonData[] = $obj;
}
return json_encode($jsonData);
}


function getPlayersByTournament($tid)
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

    $array = $result->fetch_row();
    $obj = new Player($array[0], $array[1], $array[2], $array[3], $array[4], $array[5]);

    return json_encode($obj);
}

?>