<?php

$sql_add="INSERT INTO pages(nama,email,komentar) VALUES ("
    ."'".$_POST['nama']."','".$_POST['email']."','".$_POST['komentar']."') ";
    @mysqli_query($GLOBALS["___mysqli_ston"], $sql_add);

    echo'<script>alert("Thank you For Comment");window.location ="isi_testi.php";</script>';
    
?>

