<?php
include "header-admin.php";
$aksi="aksi_order.php";
switch($_GET[act]){

  default:
    echo "<h2>Order</h2>
          <table>
          <tr><th>no.order</th><th>nama konsumen</th><th>tgl. order</th><th>jam</th><th>status</th><th>aksi</th></tr>";



    $tampil = mysqli_query($GLOBALS["___mysqli_ston"], "SELECT * FROM orders ");

    while($r=mysqli_fetch_array($tampil)){
      $tanggal=tgl_indo($r[tgl_order]);
      echo "<tr><td align=center>$r[id_orders]</td>
                <td>$r[nama_kustomer]</td>
                <td>$tanggal</td>
                <td>$r[jam_order]</td>
                <td>$r[status_order]</td>
		            <td><a href=?module=order&act=detailorder&id=$r[id_orders]>Detail</a></td></tr>";
      $no++;
    }
    echo "</table>";

    $jmldata = mysqli_num_rows(mysqli_query($GLOBALS["___mysqli_ston"], "SELECT * FROM orders"));

    break;


  case "detailorder":
    $edit = mysqli_query($GLOBALS["___mysqli_ston"], "SELECT * FROM orders WHERE id_orders='$_GET[id]'");
    $r    = mysqli_fetch_array($edit);
    $tanggal=tgl_indo($r[tgl_order]);

    $pilihan_status = array('Baru', 'Lunas', 'Dikirim');
    $pilihan_order = '';
    foreach ($pilihan_status as $status) {
	   $pilihan_order .= "<option value=$status";
	   if ($status == $r[status_order]) {
		    $pilihan_order .= " selected";
	   }
	   $pilihan_order .= ">$status</option>\r\n";
    }

    echo "<h2>Detail Order</h2>
          <form method=POST action=$aksi?module=order&act=update>
          <input type=hidden name=id value=$r[id_orders]>
          <input type=hidden name=status_order_lama value='$r[status_order]'>

          <table>
          <tr><td>No. Order</td>        <td> : $r[id_orders]</td></tr>
          <tr><td>Tgl. & Jam Order</td> <td> : $tanggal & $r[jam_order]</td></tr>
          <tr><td>Status Order      </td><td>: <select name=status_order>$pilihan_order</select>
          <input type=submit value='Ubah Status'></td></tr>
          </table></form>";

  $sql2=mysqli_query($GLOBALS["___mysqli_ston"], "SELECT * FROM orders_detail, produk
                     WHERE orders_detail.id_produk=produk.id_produk
                     AND orders_detail.id_orders='$_GET[id]'");

  echo "<table border=0 width=500>
        <tr><th>Nama Produk</th><th>Berat(kg)</th><th>Jumlah</th><th>Harga Satuan</th><th>Sub Total</th></tr>";

  while($s=mysqli_fetch_array($sql2)){
     // rumus untuk menghitung subtotal dan total
    $subtotal    = $s[harga] * $s[jumlah];
    $total       = $total + $subtotal;
    $subtotal_rp = format_rupiah($subtotal);
    $total_rp    = format_rupiah($total);
    $harga       = format_rupiah($s[harga]);

   $subtotalberat = $s[berat] * $s[jumlah]; // total berat per item produk
   $totalberat  = $totalberat + $subtotalberat; // grand total berat all produk yang dibeli

    echo "<tr><td>$s[nama_produk]</td><td align=center>$s[berat]</td><td align=center>$s[jumlah]</td><td>Rp. $harga</td><td>Rp. $subtotal_rp</td></tr>";
  }

  $ongkos=mysqli_fetch_array(mysqli_query($GLOBALS["___mysqli_ston"], "SELECT * FROM kota,orders WHERE orders.id_kota=kota.id_kota AND id_orders='$_GET[id]'"));
  $ongkoskirim1=$ongkos[ongkos_kirim];
  $ongkoskirim=$ongkoskirim1 * $totalberat;

  $grandtotal    = $total + $ongkoskirim;

  $ongkoskirim_rp = format_rupiah($ongkoskirim);
  $ongkoskirim1_rp = format_rupiah($ongkoskirim1);
  $grandtotal_rp  = format_rupiah($grandtotal);

echo "<tr><td colspan=4 align=right>Total              Rp. : </td><td align=right><b>$total_rp</b></td></tr>
      <tr><td colspan=4 align=right>Ongkos Kirim       Rp. : </td><td align=right><b>$ongkoskirim1_rp</b>/Kg</td></tr>
      <tr><td colspan=4 align=right>Total Berat            : </td><td align=right><b>$totalberat</b> Kg</td></tr>
      <tr><td colspan=4 align=right>Total Ongkos Kirim Rp. : </td><td align=right><b>$ongkoskirim_rp</b></td></tr>
      <tr><td colspan=4 align=right>Grand Total        Rp. : </td><td align=right><b>$grandtotal_rp</b></td></tr>
      </table>";

  // tampilkan data kustomer
  echo "<table border=0 width=500>
        <tr><th colspan=2>Data Kustomer</th></tr>
        <tr><td>Nama Pembeli</td><td> : $r[nama_kustomer]</td></tr>
        <tr><td>Alamat Pengiriman</td><td> : $r[alamat]</td></tr>
        <tr><td>No. Telpon/HP</td><td> : $r[telpon]</td></tr>
        <tr><td>Email</td><td> : $r[email]</td></tr>
        </table>";

    break;
}

?>
