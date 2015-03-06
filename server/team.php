<?php
function getTeams()
{
    // Create connection
    $conn = connect();
// Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    $sql = "SELECT * FROM `team`";
    $result = $conn->query($sql);

    $jsonData = array();
    while ($array = $result->fetch_row()) {
        $obj = new Team($array[0], $array[1], $array[2], $array[3], $array[4], $array[5], $array[6], $array[7], $array[8]);
        $jsonData[] = $obj;
    }
    return json_encode($jsonData);

}

function getTeam($tid)
{
    // Create connection
    $conn = connect();
    $sql = "SELECT * FROM `team` WHERE id = " . toNull($pid,true) . "";
    $result = $conn->query($sql);

    $array = $result->fetch_row();
    $obj = new Team($array[0], $array[1], $array[2], $array[3], $array[4], $array[5], $array[6], $array[7], $array[8]);

    return json_encode($obj);

}


function addTeam($team)
{

    // Create connection
    $conn = connect();

    $sql = "INSERT INTO `team` (name,locale,att,mid,def,quality,version) VALUES (" . toNull($team->name,true) . "," . toNull($team->locale,true) . "," . $team->att . "," . $team->mid . "," . $team->def . ",15)";

    if ($conn->query($sql) === TRUE) {
        return true;
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

function updateTeam($team)
{
    $conn = connect();

    $sql = "UPDATE `team` 
            SET name = " . $team->name .",
             locale = " . $team->locale .",
             att = " . $team->att .",
             mid = " . $team->mid .",
             def = " . $team->def .",
             quality = " . $team->quality .",
             version = " . $team->version .",
            WHERE id=" . $team->id;

    if ($conn->query($sql) === TRUE) {
        return true;
    } else {
        echo "Error updating team: " . $conn->error;
    }
}

function deleteTeam($tid)
{
    $conn = connect();

    $sql = "DELETE FROM `team` WHERE id=" . $tid;

    if ($conn->query($sql) === TRUE) {
        return true;
    } else {
        echo "Error deleting team: " . $conn->error;
    }
}

?>