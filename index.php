<?php
foreach (file('.env') as $line){
    putenv($line);
}
function generateRandomString($length = 10) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyz';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}

$randomString = generateRandomString(5);
exec('./etc/bin/create_sandbox.sh '.$randomString);

?>

Sandbox Details!<br>
<hr>
Sandbox Admin User<br>
Username: <b>admin</b><br>
Password: <b>admin</b><br>
<hr>
Site address: <a href="http://<?php echo $randomString.'.'.getenv('DOMAIN');?>" target="_blank">http://<?php echo $randomString.'.'.getenv('DOMAIN');?></a><br>
