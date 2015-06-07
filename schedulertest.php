
<?php
function scheduler($teams,$shuffle=0,$reverse=0){ 
    if (count($teams)%2 != 0){ 
        array_push($teams,"bye"); 
    } 
    if ($shuffle == 1){ 
        shuffle($teams); 
    } 
    $away = array_splice($teams,(count($teams)/2)); 
    $home = $teams; 
    for ($i=0; $i < count($home)+count($away)-1; $i++){ 
        for ($j=0; $j<count($home); $j++){ 
            if (($i%2 !=0) && ($j%2 ==0)){ 
                $schedule[$i][$j]["Home"]=$away[$j]; 
                $schedule[$i][$j]["Away"]=$home[$j]; 
            } else { 
                $schedule[$i][$j]["Home"]=$home[$j]; 
                $schedule[$i][$j]["Away"]=$away[$j];  
            } 
        } 
        if(count($home)+count($away)-1 > 2){ 
            $spliced = array_splice($home,1,1);
            $shiftedarray = array_shift($spliced);
            array_unshift($away,$shiftedarray); 
            array_push($home,array_pop($away)); 
        } 
    } 
    if ($reverse == 1){ 
        for ($k=0; $k < count($home)+count($away)-1; $k++){ 
            for ($j=0; $j<count($home); $j++){ 
                if (($k%2 !=0) && ($j%2 ==0)){ 
                    $schedule[$i][$j]["Home"]=$home[$j]; 
                    $schedule[$i][$j]["Away"]=$away[$j]; 
                } else { 
                    $schedule[$i][$j]["Home"]=$away[$j]; 
                    $schedule[$i][$j]["Away"]=$home[$j];  
                } 
            } 
        if(count($home)+count($away)-1 > 2){ 
            $spliced = array_splice($home,1,1);
            $shiftedarray = array_shift($spliced);
            array_unshift($away,$shiftedarray); 
            array_push($home,array_pop($away)); 
        } 
        $i++; 
        } 
    } 
    return $schedule; 
}  

// example array 
$members = array('Robin Verhulst','Fred Boullion','Nielsen','Sven'); 

$reversed = array_reverse($members);
// call the function with reverse enabled (home & away) 
$schedule = scheduler($members,0,1); 
$schedulerev = scheduler($reversed,0,1); 
// print the results back example 
foreach($schedule AS $round => $games){ 
    echo "Round: ".($round+1)."<BR>"; 
    foreach($games AS $play){ 
        echo implode("-",$play)."<BR>"; 
    } 
    echo "<BR>"; 
} 

echo"-------------------";

foreach($schedulerev AS $round => $games){ 
    echo "Round: ".($round+1)."<BR>"; 
    foreach($games AS $play){ 
        echo implode("-",$play)."<BR>"; 
    } 
    echo "<BR>"; 
} 


?>