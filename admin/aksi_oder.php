<?php
error_reporting(E_ALL ^ (E_NOTICE | E_WARNING));

session_start();

include "../web_config_vars.php";

include "../db_conn.php";

$module=$_GET[module];
$act=$_GET[act];

if ($module=='order' AND $act=='update'){

   if ($_POST['status_order_lama']=='Lunas' AND $_POST['status_order']!='Lunas'){

      mysqli_query($GLOBALS["___mysqli_ston"], "UPDATE produk,orders_detail SET produk.stok=produk.stok+orders_detail.jumlah WHERE orders_detail.id_orders='$_POST[id]'");

      mysqli_query($GLOBALS["___mysqli_ston"], "UPDATE produk,orders_detail SET produk.dibeli=produk.dibeli-orders_detail.jumlah WHERE orders_detail.id_orders='$_POST[id]'");

      mysqli_query($GLOBALS["___mysqli_ston"], "UPDATE orders SET status_order='$_POST[status_order]' where id_orders='$_POST[id]'");
  }

  elseif ($_POST['status_order_lama']!='Lunas' AND $_POST['status_order']=='Lunas'){

      mysqli_query($GLOBALS["___mysqli_ston"], "UPDATE produk,orders_detail SET produk.stok=produk.stok-orders_detail.jumlah WHERE orders_detail.id_orders='$_POST[id]'");

      mysqli_query($GLOBALS["___mysqli_ston"], "UPDATE produk,orders_detail SET produk.dibeli=produk.dibeli+orders_detail.jumlah WHERE orders_detail.id_orders='$_POST[id]'");

      mysqli_query($GLOBALS["___mysqli_ston"], "UPDATE orders SET status_order='$_POST[status_order]' where id_orders='$_POST[id]'");

  }

  else{
     mysqli_query($GLOBALS["___mysqli_ston"], "UPDATE orders SET status_order='$_POST[status_order]' where id_orders='$_POST[id]'");
  }
  header('location:../../media.php?module='.$module);
}


?>
