-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2021 at 07:00 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_barang`
--

CREATE TABLE `data_barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_barang`
--

INSERT INTO `data_barang` (`id_barang`, `nama_barang`, `stok`, `harga`) VALUES
(1, 'Sunlight', 100, 10000),
(2, 'RInso', 100, 15000);

-- --------------------------------------------------------

--
-- Table structure for table `data_pembeli`
--

CREATE TABLE `data_pembeli` (
  `id_pembeli` int(11) NOT NULL,
  `nama_pembeli` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_pembeli`
--

INSERT INTO `data_pembeli` (`id_pembeli`, `nama_pembeli`, `alamat`, `no_hp`) VALUES
(1, 'Adi', 'Surabaya', '081043823434'),
(2, 'Fika', 'Surabaya', '08327328321');

-- --------------------------------------------------------

--
-- Table structure for table `data_penjual`
--

CREATE TABLE `data_penjual` (
  `id_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_penjual`
--

INSERT INTO `data_penjual` (`id_pegawai`, `nama_pegawai`, `alamat`, `no_hp`) VALUES
(1, 'Lila', 'Krian', '081253846329'),
(2, 'Dian', 'Sidoarjo', '083783672812');

-- --------------------------------------------------------

--
-- Table structure for table `data_pesan_online`
--

CREATE TABLE `data_pesan_online` (
  `id_pesan_online` int(11) NOT NULL,
  `id_pembeli` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_pesan_online`
--

INSERT INTO `data_pesan_online` (`id_pesan_online`, `id_pembeli`, `id_barang`) VALUES
(1, 1, 2),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `data_transaksi`
--

CREATE TABLE `data_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pesan_online` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `id_pembeli` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `stok_dibeli` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_transaksi`
--

INSERT INTO `data_transaksi` (`id_transaksi`, `id_pesan_online`, `id_pegawai`, `id_pembeli`, `id_barang`, `stok_dibeli`, `total_harga`) VALUES
(1, 1, 1, 1, 2, 1, 10000),
(2, 2, 2, 1, 1, 1, 15000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_barang`
--
ALTER TABLE `data_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `data_pembeli`
--
ALTER TABLE `data_pembeli`
  ADD PRIMARY KEY (`id_pembeli`);

--
-- Indexes for table `data_penjual`
--
ALTER TABLE `data_penjual`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `data_pesan_online`
--
ALTER TABLE `data_pesan_online`
  ADD PRIMARY KEY (`id_pesan_online`),
  ADD KEY `fk_pembeli` (`id_pembeli`),
  ADD KEY `fk_barang` (`id_barang`);

--
-- Indexes for table `data_transaksi`
--
ALTER TABLE `data_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `fk_pesan` (`id_pesan_online`),
  ADD KEY `fk_pegawai` (`id_pegawai`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_pesan_online`
--
ALTER TABLE `data_pesan_online`
  ADD CONSTRAINT `fk_barang` FOREIGN KEY (`id_barang`) REFERENCES `data_barang` (`id_barang`),
  ADD CONSTRAINT `fk_pembeli` FOREIGN KEY (`id_pembeli`) REFERENCES `data_pembeli` (`id_pembeli`);

--
-- Constraints for table `data_transaksi`
--
ALTER TABLE `data_transaksi`
  ADD CONSTRAINT `fk_pegawai` FOREIGN KEY (`id_pegawai`) REFERENCES `data_penjual` (`id_pegawai`),
  ADD CONSTRAINT `fk_pesan` FOREIGN KEY (`id_pesan_online`) REFERENCES `data_pesan_online` (`id_pesan_online`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
