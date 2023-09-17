<?php
error_reporting(0);
/**
 * Database mysql
 */
$db_host = "localhost";
$db_user = "web";
$db_pass = "web";
$db_name = "web";
$conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name);
if (!$conn) {
    die("connect error: " . mysqli_connect_error());
}
$sql = "select * from flag";
$result = mysqli_query($conn, $sql);
$res    = mysqli_fetch_array($result);
var_dump($res);
mysqli_close($conn);
phpinfo();
?>
