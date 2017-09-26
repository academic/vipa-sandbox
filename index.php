<?php

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
Sandbox User<br>
Username: <b>sandbox</b><br>
Password: <b>sandbox</b><br>
<hr>
Dashboard address: <a href="http://<?php echo $randomString ?>.baboonenv.com:1111" target="_blank">http://<?php echo $randomString ?>.baboonenv.com:1111</a><br>
Site address: <a href="http://<?php echo $randomString ?>.baboonenv.com" target="_blank">http://<?php echo $randomString ?>.baboonenv.com</a>

