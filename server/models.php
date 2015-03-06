<?php


class Comment
{
    public $id;
    public $matchId;
    public $userId;
    public $regDate;
    public $comment;
    public function __construct($id, $matchId, $userId, $regDate, $comment)
    {
        $this->id = $id;
        $this->matchId = $matchId;
        $this->userId = $userId;
        $this->regDate = $regDate;
        $this->comment = $comment;
    }

}

class League
{
    public $id;
    public $name;
    public $password;

    // Assigning the values
    public function __construct($id, $name,$password)
    {
        $this->id = $id;
        $this->name = $name;
        $this->password = $password;
    }

}

class Match
{
    public $id;
    public $homeId;
    public $homeScore;
    public $awayId;
    public $awayScore;
    public $adminId;
    public $tournamentId;
    public $regDate;
    public $version;
    public $random;

    // Assigning the values
    public function __construct($id, $homeId,$homeScore,$awayId,$awayScore,$adminId,$tournamentId,$regDate,$version,$random)
    {
        $this->id = $id;
        $this->homeId = $homeId;
        $this->homeScore = $homeScore;
        $this->awayId = $awayId;
        $this->awayScore = $awayScore;
        $this->adminId = $adminId;
        $this->tournamentId = $tournamentId;
        $this->regDate = $regDate;
        $this->version = $version;
        $this->random = $random;
    }

}

class ListMatch
{
    public $id;
    public $homePlayer;
    public $homeTeam;
    public $homeScore;
    public $awayPlayer;
    public $awayTeam;
    public $awayScore;
    public $regDate;
    public $random;

    // Assigning the values
    public function __construct($id, $homePlayer,$homeTeam,$homeScore,$awayPlayer,$awayTeam,$awayScore,$adminId,$tournamentId,$regDate,$version,$random)
    {
        $this->id = $id;
        $this->homePlayer = $homePlayer;
        $this->homeTeam = $homeTeam;
        $this->homeScore = $homeScore;
        $this->awayPlayer = $awayPlayer;
        $this->awayTeam = $awayTeam;
        $this->awayScore = $awayScore;
        $this->regDate = $regDate;
        $this->random = $random;
    }

}

class MatchElo
{
    public $matchId;
    public $homePoints;
    public $awayPoints;

    // Assigning the values
    public function __construct($matchId,$homePoints,$awayPoints)
    {
        $this->matchId = $matchId;
        $this->homePoints = $homePoints;
        $this->awayPoints = $awayPoints;
    }

}

class MatchTeam
{
    public $matchId;
    public $userId;
    public $teamId;

    // Assigning the values
    public function __construct($matchId,$userId,$teamId)
    {
        $this->matchId = $matchId;
        $this->userId = $userId;
        $this->teamId = $teamId;
    }

}

class Role
{
    public $id;
    public $name;

    // Assigning the values
    public function __construct($id,$name)
    {
        $this->id = $id;
        $this->name = $name;
    }
}

class Team
{
    public $id;
    public $name;
    public $locale;
    public $att;
    public $mid;
    public $def;
    public $quality;
    public $version;
    public $abbreviation;

    // Assigning the values
    public function __construct($id, $name,$locale,$att,$mid,$def,$quality,$version,$abbreviation)
    {
        $this->id = $id;
        $this->name = $name;
        $this->locale = $locale;
        $this->att = $att;
        $this->mid = $mid;
        $this->def = $def;
        $this->quality = $quality;
        $this->version = $version;
        $this->abbreviation = $abbreviation;
    }
}

class Tournament
{
    public $id;
    public $name;
    public $hostId;
    public $regDate;
    public $closed;
    public $version;
    public $leagueId;
    public $elo;

    // Assigning the values
    public function __construct($id,$name,$hostId,$regDate,$closed,$version,$leagueId,$elo)
    {
        $this->id = $id;
        $this->name = $name;
        $this->hostId = $hostId;
        $this->regDate = $regDate;
        $this->closed = $closed;
        $this->version = $version;
        $this->leagueId = $leagueId;
        $this->elo = $elo;
    }
}

class User
{
    public $id;
    public $firstName;
    public $lastName;
    public $email;
    public $password;
    public $lastLogin;

    // Assigning the values
    public function __construct($id,$firstName,$lastName,$email,$password,$lastLogin)
    {
        $this->id = $id;
        $this->firstName = $firstName;
        $this->lastName = $lastName;
        $this->email = $email;
        $this->password = $password;
        $this->lastLogin = $lastLogin;
    }
}

//Player is fictive class representing a row in a tournament table for a player
class Player
{
    public $id;
    public $firstName;
    public $lastName;
    public $team;
    public $played;
    public $wins;
    public $draws;
    public $losses;
    public $goalsFor;
    public $goalsAgainst;
    public $goalsDiff;
    public $points;

    // Assigning the values
    public function __construct($id,$firstName,$lastName,$team,$played,$wins,$draws,$losses,$goalsFor,$goalsAgainst,$goalsDiff,$points)
    {
        $this->id = $id;
        $this->firstName = $firstName;
        $this->lastName = $lastName;
        $this->team = $team;
        $this->played = $played;
        $this->wins = $wins;
        $this->draws = $draws;
        $this->losses = $losses;
        $this->goalsFor = $goalsFor;
        $this->goalsAgainst = $goalsAgainst;
        $this->goalsDiff = $goalsDiff;
        $this->points = $points;
    }
}

?>