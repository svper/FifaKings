<?php
header('Access-Control-Allow-Origin: *');  
$FIFA_VERSION = 15;

include 'connect.php';
include 'models.php';
include 'team.php';
include 'player.php';
include 'user.php';
include 'match.php';
include 'tournament.php';

$data = file_get_contents("php://input");



function escape($input)
{
    if (!get_magic_quotes_gpc()) {
        $input = mysql_real_escape_string($input);
    }
    return $input;
}

function toNull($input, $quote)
{
    if ($input == "") {
        return "NULL";
    } else {
        if ($quote) {
            return "'" . $input . "'";
        } else {
            return $input;
        }
    }
}

function add($item)
{

    if (!isset($item->ShopId)) $item->ShopId = 1;

    // Create connection
    $conn = connect();

    if (isset($item->Quantity))
        $sql = "INSERT INTO listitem (ShopId,Description, Quantity) VALUES (" . $item->ShopId . "," . toNull($item->Description,true) . "," . toNull($item->Quantity,true) . ")";
    else
        $sql = "INSERT INTO listitem (ShopId,Description) VALUES (" . $item->ShopId . "," . toNull($item->Description,true) . ")";

    if ($conn->query($sql) === TRUE) {
        return true;
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

//Routing


$objData = json_decode($data);

switch ($_GET['method']) {
    //players
    case "getPlayers":
    echo getPlayers();
    break;
    case "getPlayer":
    echo getPlayer($objData->id);
    break;
    //users
    case "getUsers":
    echo getUsers();
    break;
    case "getUser":
    echo getUser($objData->id);
    break;
    //tournaments
    case "getTournament":
    echo getTournament($objData->id);
    break;
    case "getTournaments":
    echo getTournaments();
    break;
    case "addTournament":
    echo addTournament($objData->tour);
    break;
    //teams
    case "getTeams":
    echo getTeams();
    break;
    case "addTeam":
    echo add($objData->team);
    //matches
    case "getListMatches":
    echo getListMatches();
    break;
    break;
}


?>