<?php
$scanDir = scandir('../box/');
foreach ($scanDir as $dir){
    if ($dir === '.' || $dir === '..'){
        continue;
    }
    $date = new DateTime(file_get_contents('../box/'.$dir.'/.createtime'));
    if((clone $date)->add(new \DateInterval('P1D')) < new DateTime()){
        exec('rm -rf ../box/'.$dir);
    }
}
