-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2020 at 07:17 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ppl`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(4) NOT NULL,
  `nama_barang` varchar(25) NOT NULL,
  `jumlah_barang` int(4) NOT NULL,
  `harga_barang` bigint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `jumlah_barang`, `harga_barang`) VALUES
(1, 'bayam', 36, 10000),
(2, 'Terong', 90, 10000),
(3, 'cabai', 2, 15000),
(4, 'sawi', 1, 5000),
(5, 'pare', 32, 6000),
(6, 'kacang panjang', 24, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `item_stock`
--

CREATE TABLE `item_stock` (
  `id_stock` varchar(8) NOT NULL,
  `id_barang` int(4) NOT NULL,
  `jumlah_barang` int(4) NOT NULL,
  `harga_item` bigint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item_stock`
--

INSERT INTO `item_stock` (`id_stock`, `id_barang`, `jumlah_barang`, `harga_item`) VALUES
('ST000004', 1, 12, 12000);

-- --------------------------------------------------------

--
-- Table structure for table `item_transaksi`
--

CREATE TABLE `item_transaksi` (
  `id_transaksi` varchar(8) NOT NULL,
  `id_barang` int(4) NOT NULL,
  `jumlah_barang` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item_transaksi`
--

INSERT INTO `item_transaksi` (`id_transaksi`, `id_barang`, `jumlah_barang`) VALUES
('TR000001', 1, 12),
('TR000001', 3, 9),
('TR000001', 6, 9),
('TR000002', 4, 10);

-- --------------------------------------------------------

--
-- Table structure for table `password`
--

CREATE TABLE `password` (
  `no` int(11) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `password`
--

INSERT INTO `password` (`no`, `password`) VALUES
(1, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `reset`
--

CREATE TABLE `reset` (
  `no` int(11) NOT NULL,
  `jenis` varchar(10) NOT NULL,
  `question` text NOT NULL,
  `answer` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reset`
--

INSERT INTO `reset` (`no`, `jenis`, `question`, `answer`) VALUES
(1, 'nama kecil', 'Siapa nama kecil Anda?', 'nasrull'),
(2, 'hari lahir', 'Kapan hari lahir Anda?', 'rabu');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id_stock` varchar(8) NOT NULL,
  `tanggal_stock` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id_stock`, `tanggal_stock`) VALUES
('ST000001', '2020-04-25 23:20:43'),
('ST000002', '2020-04-25 23:21:39'),
('ST000003', '2020-04-25 23:22:07'),
('ST000004', '2020-04-25 23:22:31');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(8) NOT NULL,
  `tanggal_transaksi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `jumlah_transaksi` bigint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `tanggal_transaksi`, `jumlah_transaksi`) VALUES
('TR000001', '2020-04-26 15:56:24', 273000),
('TR000002', '2020-04-26 15:56:47', 50000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `item_stock`
--
ALTER TABLE `item_stock`
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_stock` (`id_stock`);

--
-- Indexes for table `item_transaksi`
--
ALTER TABLE `item_transaksi`
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id_stock`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `item_stock`
--
ALTER TABLE `item_stock`
  ADD CONSTRAINT `item_stock_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `item_stock_ibfk_2` FOREIGN KEY (`id_stock`) REFERENCES `stock` (`id_stock`);

--
-- Constraints for table `item_transaksi`
--
ALTER TABLE `item_transaksi`
  ADD CONSTRAINT `item_transaksi_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `item_transaksi_ibfk_2` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
