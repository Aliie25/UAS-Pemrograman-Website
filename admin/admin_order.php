
<?php

include "header-admin.php";
 echo"<div id='bgkonten'>";

if (!empty($_GET['page'])) $_SESSION['page']=$_GET['page'];
if (!empty($_SESSION['page'])) $_GET['page']=$_SESSION['page'];


if ( ($_GET['act']=="delete") && !empty($_GET[id]) ){
    @mysqli_query($GLOBALS["___mysqli_ston"], "DELETE FROM daftar_order WHERE kode_order='".$_GET[id]."'");
}


$status=$_POST['status'];
echo"<center>";
echo '<h1 align="center">Daftar Orderan Masuk</h1>'.$msg;

$total=mysqli_num_rows(mysqli_query($GLOBALS["___mysqli_ston"], "SELECT kode_order FROM daftar_order;"));

$rowperpage=1;

if (!empty($_GET['page'])) $recno=($_GET['page']-1)*$rowperpage; else $recno=0;
$sql = "SELECT * FROM daftar_order ORDER BY kode_order DESC LIMIT $recno,$rowperpage;";
$result = mysqli_query($GLOBALS["___mysqli_ston"], $sql);
$ada = mysqli_num_rows($result);
$no=0;
if ( ($total>0) && ($ada == 0) ) echo '<script>window.location="'.$_SERVER['PHP_SELF'].'?page=1";</script>';

if ($ada>0){
    if ($total>$rowperpage){ 

    if (empty($_GET['page'])) $_GET['page']=1;

if ($_GET['page']>1) echo '<a href="'.$_SERVER['PHP_SELF'].'?page='.($_GET['page']-1).'">&laquo; </a> | ';
    for ($i=1; $i<= ceil($total/$rowperpage); $i++){
        echo '<a href="'.$_SERVER['PHP_SELF'].'?page='.$i.'">'.$i.'</a> | ';
    }
    if ($_GET['page']<ceil($total/$rowperpage)) echo '<a href="'.$_SERVER['PHP_SELF'].'?page='.($_GET['page']+1).'">&raquo; </a> ';

    } 



$status="LUNAS";
while ($row = mysqli_fetch_array($result)){

$cek = mysqli_query($GLOBALS["___mysqli_ston"], "SELECT * FROM konfirmasi WHERE kode_order ='".$row['kode_order']."'");

$num_row = mysqli_num_rows($cek);
if ($num_row ==0){
    $konfirmasi="<blink>Belum</blink>";
}
else{
    $konfirmasi="<s>Sudah</s>";
}
$sql="SELECT * FROM pembeli WHERE kode_order= '".$row['kode_order']."' ";
$hasil = mysqli_query($GLOBALS["___mysqli_ston"], $sql);

if ($data = mysqli_fetch_array($hasil))
       {
           $nama=$data['nama_pembeli'];
           $email=$data['email_pembeli'];
           $telepon=$data['telepon_pembeli'];
           $alamat=$data['alamat_pembeli'];
     }



         echo"<table id='data_pembeli'>";
                echo "<tr><td>";



         echo"<a href=\"".$_SERVER['PHP_SELF']."?id=".$row['kode_order']."&amp;act=update\"> <input type='button' value='Lunas' class='btn_submit'></a> "
            ."<a onclick=\"return confirm('Are you sure to Delete?');\" href=\"".$_SERVER['PHP_SELF']."?id=".$row['kode_order']."&amp;act=delete\">
            <input type='button' value='Delete' class='btn_submit'></a>


            </td>";
			echo "</tr>";

            if ( ($_GET['act']=="update") && ($_GET['id']==$row['kode_order']) ){
            $orders_info=@mysql_result(@mysqli_query($GLOBALS["___mysqli_ston"], "UPDATE daftar_order SET status ='".$status."' WHERE kode_order='".$_GET['id']."'"));
         }
                 $no++;
                echo "<tr><td>&raquo; Status   :<del> ".$row['status']."</del></td></tr>";
                echo "<tr><td>&raquo; Status Konfirmasi : ".$konfirmasi."</td></tr>";
                echo "<tr><td>&raquo; Kode Order  : ".$row['kode_order']."</td></tr>";
				echo "<tr><td>&raquo; Tanggal Order  : ".$row['tanggal_order']."</td></tr>";
                echo "<tr><td>&raquo; Jam Order  : ".$row['jam_order']."</td></tr>";
                echo "<tr><td>&raquo; Info belanja : ".$row['orders_info']."</td></tr>";

           echo"</table>";

           echo"<table id='alamat_pembeli'>";



            echo'<tr><td><h4>ALAMAT PEMBELI</h4></td></tr>';
            echo "<tr><td>&raquo; Nama  &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;     : ".$nama."</td></tr>";
            echo "<tr><td>&raquo; Email &nbsp;&nbsp; &nbsp; &nbsp;   &nbsp;&nbsp;   : ".$email."</td></tr>";
            echo "<tr><td>&raquo; Telepon &nbsp;&nbsp; &nbsp;&nbsp;  : ".$telepon."</td></tr>";
            echo "<tr><td>&raquo; Alamat &nbsp;&nbsp; &nbsp; &nbsp;     : ".$alamat."</td></tr>";
			echo "</tr>";

}
  echo"</table>";

}
echo"</center>";
echo"</div>";
?>
<div class="cleared"></div>
<?php
include"footer.php";
?>

