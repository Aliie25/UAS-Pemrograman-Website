<?php
// KONEKSI DATABASE
$conn = ($GLOBALS["___mysqli_ston"] = mysqli_connect($db_host, $db_user, $db_pass)) or die("can not access database");
mysqli_select_db($conn, $db_name) or die("can not connect");
?>