-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2020 at 10:20 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_web`
--

CREATE TABLE `admin_web` (
  `id_admin` int(3) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `telepon` varchar(12) NOT NULL,
  `jabatan` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_web`
--

INSERT INTO `admin_web` (`id_admin`, `username`, `password`, `nama`, `telepon`, `jabatan`) VALUES
(22, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', '087876543342', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id_kategori` int(4) NOT NULL,
  `nama` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id_kategori`, `nama`) VALUES
(61, 'Logitech'),
(60, 'Lenovo'),
(54, 'Acer'),
(58, 'Dell'),
(57, 'Asus'),
(59, 'Hp');

-- --------------------------------------------------------

--
-- Table structure for table `daftar_order`
--

CREATE TABLE `daftar_order` (
  `kode_order` varchar(25) NOT NULL,
  `tanggal_order` date NOT NULL,
  `jam_order` time NOT NULL,
  `orders_info` text NOT NULL,
  `status` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `daftar_order`
--

INSERT INTO `daftar_order` (`kode_order`, `tanggal_order`, `jam_order`, `orders_info`, `status`) VALUES
('20200610023048', '2020-06-10', '02:43:40', '<table  cellspacing=0 cellpadding=0 id=\"checkout_last\"><tr><td><b>NO</td>\r\n                     <td><b>Kode Barang</td>\r\n                     <td><b>Nama </td>\r\n\r\n                     <td><b>Harga</b></td>\r\n                     <td><b>Jumlah Beli</b></td>\r\n                     <td><b>Subtotal</b></td>\r\n\r\n                     </tr><tr><td>1.</td><td>BR153</td><td>Logitech Keyboard</td><td>Rp. 9.999.999,-</td><td>1[Items]</td><td>Rp. 9.999.999,-</td></tr><tr><td colspan=\"5\"  class=\"num\">TOTAL BAYAR</td><td>Rp. 9.999.999,-</td></tr></table><br>', 'NEW'),
('20200610023048', '2020-06-10', '02:51:33', '<table  cellspacing=0 cellpadding=0 id=\"checkout_last\"><tr><td><b>NO</td>\r\n                     <td><b>Kode Barang</td>\r\n                     <td><b>Nama </td>\r\n\r\n                     <td><b>Harga</b></td>\r\n                     <td><b>Jumlah Beli</b></td>\r\n                     <td><b>Subtotal</b></td>\r\n\r\n                     </tr><tr><td>1.</td><td>BR153</td><td>Logitech Keyboard</td><td>Rp. 9.999.999,-</td><td>1[Items]</td><td>Rp. 9.999.999,-</td></tr><tr><td colspan=\"5\"  class=\"num\">TOTAL BAYAR</td><td>Rp. 9.999.999,-</td></tr></table><br>', 'NEW'),
('20200610025201', '2020-06-10', '02:52:15', '<table  cellspacing=0 cellpadding=0 id=\"checkout_last\"><tr><td><b>NO</td>\r\n                     <td><b>Kode Barang</td>\r\n                     <td><b>Nama </td>\r\n\r\n                     <td><b>Harga</b></td>\r\n                     <td><b>Jumlah Beli</b></td>\r\n                     <td><b>Subtotal</b></td>\r\n\r\n                     </tr><tr><td>1.</td><td>BR152</td><td>Logitech Headset</td><td>Rp. 9.999.999,-</td><td>1[Items]</td><td>Rp. 9.999.999,-</td></tr><tr><td colspan=\"5\"  class=\"num\">TOTAL BAYAR</td><td>Rp. 9.999.999,-</td></tr></table><br>', 'NEW'),
('20200610025251', '2020-06-10', '02:53:01', '<table  cellspacing=0 cellpadding=0 id=\"checkout_last\"><tr><td><b>NO</td>\r\n                     <td><b>Kode Barang</td>\r\n                     <td><b>Nama </td>\r\n\r\n                     <td><b>Harga</b></td>\r\n                     <td><b>Jumlah Beli</b></td>\r\n                     <td><b>Subtotal</b></td>\r\n\r\n                     </tr><tr><td>1.</td><td>BR152</td><td>Logitech Headset</td><td>Rp. 9.999.999,-</td><td>1[Items]</td><td>Rp. 9.999.999,-</td></tr><tr><td colspan=\"5\"  class=\"num\">TOTAL BAYAR</td><td>Rp. 9.999.999,-</td></tr></table><br>', 'NEW');

-- --------------------------------------------------------

--
-- Table structure for table `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `kode_order` varchar(50) NOT NULL,
  `tanggal` varchar(50) NOT NULL,
  `nama_pemilik` varchar(50) NOT NULL,
  `nama_bank` varchar(50) NOT NULL,
  `jumlah_transfer` varchar(50) NOT NULL,
  `alamat_kirim` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `kode_order` varchar(25) NOT NULL,
  `nama_pembeli` varchar(50) NOT NULL,
  `email_pembeli` varchar(25) NOT NULL,
  `telepon_pembeli` varchar(25) NOT NULL,
  `alamat_pembeli` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`kode_order`, `nama_pembeli`, `email_pembeli`, `telepon_pembeli`, `alamat_pembeli`) VALUES
('20200610023048', 'agus', 'agussepriyandiansah@gmail', '088776655443', 'bumi'),
('20200610025201', 'agus', 'agussepriyandiansah@gmail', '088776655443', 'bumi'),
('20200610025251', 'agus', 'agussepriyandiansah@gmail', '088776655443', 'bumi');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(5) NOT NULL,
  `category` varchar(20) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` double NOT NULL,
  `stok` varchar(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `category`, `nama_produk`, `deskripsi`, `harga`, `stok`) VALUES
(129, 'Acer', 'Acer Handphone', '<p>Acer Handphone</p>\r\n', 9999, '99'),
(144, 'Lenovo', 'Lenovo Handphone', '<p>Lenovo Handphone</p>\r\n', 9999999, '99'),
(130, 'Dell', 'Dell Mouse', '<p>Dell Mouse</p>\r\n', 9999999, '99'),
(145, 'Hp', 'Hp Mouse', '<p>Hp Mouse</p>\r\n', 9999999, '99'),
(146, 'Hp', 'Hp Laptop', '<p>Hp Laptop</p>\r\n', 9999999, '99'),
(147, 'Hp', 'Hp Komputer', '<p>Hp Komputer</p>\r\n', 9999999, '99'),
(132, 'Dell', 'Dell Keyboard', '<p>Dell Keyboard</p>\r\n', 9999999, '99'),
(133, 'Dell', 'Dell Headset', '<p>Dell Headset</p>\r\n', 9999999, '99'),
(134, 'Asus', 'Asus Mouse', '<p>wwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwwwwwwww</p>\r\n', 9999999, '99'),
(135, 'Asus', 'Asus Laptop', '<p>wwwwwwwwwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwwwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwww</p>\r\n', 9999999, '99'),
(136, 'Asus', 'Asus Komputer', '<p>wwwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwwwwwwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwwwwwwwwww</p>\r\n', 9999999, '99'),
(137, 'Asus', 'Asus Handphone', '<p>wwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwwwwwwwww</p>\r\n', 9999999, '99'),
(138, 'Acer', 'Acer Mouse', '<p>wwwwwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwwwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwwwwwwww</p>\r\n', 9999999, '99'),
(140, 'Acer', 'Acer Laptop', '<p>wwwwwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwwwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwwwwwwwwwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww</p>\r\n', 9999999, '99'),
(141, 'Acer', 'Acer Komputer', '<p>wwwwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwwwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwwwwwwwwwwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwwwwwwwwwwwwwwwwwwwwww</p>\r\n\r\n<p>wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww</p>\r\n', 9999999, '99'),
(131, 'Dell', 'Dell Laptop', '<p>Dell Laptop</p>\r\n', 9999999, '99'),
(148, 'Hp', 'Hp Keyboard', '<p>Hp Keyboard</p>\r\n', 9999999, '99'),
(149, 'Lenovo', 'Lenovo Komputer', '<p>Lenovo Komputer</p>\r\n', 9999999, '99'),
(150, 'Lenovo', 'Lenovo Laptop', '<p>Lenovo Laptop</p>\r\n', 9999999, '99'),
(151, 'Lenovo', 'Lenovo Mouse', '<p>Lenovo Mouse</p>\r\n', 9999999, '99'),
(152, 'Logitech', 'Logitech Headset', '<p>Logitech Headset</p>\r\n', 9999999, '99'),
(153, 'Logitech', 'Logitech Keyboard', '<p>Logitech Keyboard</p>\r\n', 9999999, '99'),
(154, 'Logitech', 'Logitech Mouse', '<p>Logitech Mouse</p>\r\n', 9999999, '99'),
(155, 'Logitech', 'Logitech Sound', '<p>Logitech Sound</p>\r\n', 9999999, '99');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_web`
--
ALTER TABLE `admin_web`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `daftar_order`
--
ALTER TABLE `daftar_order`
  ADD KEY `kode_order` (`kode_order`);

--
-- Indexes for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`kode_order`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`kode_order`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_web`
--
ALTER TABLE `admin_web`
  MODIFY `id_admin` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_kategori` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
