<div id='wrapper'>
<?php

include "header-admin.php";

if ($_POST['act']=="delete"){
    $sql_delete="DELETE  FROM news "
    ."WHERE id='".$_POST['id']."' ";

    @mysqli_query($GLOBALS["___mysqli_ston"], $sql_delete);
    echo'<script>alert("Sure to Delete??");window.location ="admin_artikel.php";</script>';
}

if (!empty($_GET['id'])){

    $rs=@mysqli_query($GLOBALS["___mysqli_ston"], "SELECT * FROM news WHERE id='".$_GET['id']."'");
    $row=@mysqli_fetch_array($rs);



echo '
<div id="bgkonten">
<form method="post" enctype="multipart/form-data">
Judul : '.$row['judul'].'<br>
Isi : <textarea class="ckeditor"  class="ckeditor" cols="10" rows="40" name="isi">'.$row['isi'].'</textarea><br>

    <a href="admin_artikel.php">[BACK]</a>
    <input type="submit" value="HAPUS POST" class="btn">
    <input type="hidden" name="act" value="delete" >
    <input type="hidden" name="id" value="'.$row['id'].'">
    </form>';

}
echo"</div>";
?>

<?php
echo'<div class="cleared"></div><br>';
include"footer_2.php";
?>
</div>
