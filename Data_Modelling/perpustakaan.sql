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
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_buku`
--

CREATE TABLE `data_buku` (
  `Id_buku` int(11) NOT NULL,
  `judul_buku` varchar(50) NOT NULL,
  `pengarang` varchar(50) NOT NULL,
  `penerbit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_buku`
--

INSERT INTO `data_buku` (`Id_buku`, `judul_buku`, `pengarang`, `penerbit`) VALUES
(1, 'Overlord, Vol. 1: The Undead King', ' Kugane Maruyama', 'Gramedia'),
(2, 'Overlord, Vol. 2: The Dark Warrior', 'Kugane Maruyama', 'Gramedia'),
(3, 'Detective Conan, Vol. 1', 'Gosho Aoyama', 'Gramedia');

-- --------------------------------------------------------

--
-- Table structure for table `data_pegawai`
--

CREATE TABLE `data_pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_pegawai`
--

INSERT INTO `data_pegawai` (`id_pegawai`, `nama_pegawai`, `alamat`, `no_hp`) VALUES
(1, 'Adi', 'Surabaya', '081253846329'),
(2, 'Ali', 'Surabaya', '083736182323'),
(3, 'Dian', 'Sidoarjo', '083273281232');

-- --------------------------------------------------------

--
-- Table structure for table `data_peminjam`
--

CREATE TABLE `data_peminjam` (
  `Id_peminjam` int(11) NOT NULL,
  `nama_peminjam` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_peminjam`
--

INSERT INTO `data_peminjam` (`Id_peminjam`, `nama_peminjam`, `alamat`, `no_hp`) VALUES
(1, 'Ilham', 'Krian', '081273639234'),
(2, 'Alan', 'Sidoarjo', '083783672812'),
(3, 'Ihsan', 'Surabaya', '083271282343');

-- --------------------------------------------------------

--
-- Table structure for table `data_pinjam`
--

CREATE TABLE `data_pinjam` (
  `Id_pinjam` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `id_peminjam` int(11) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_pinjam`
--

INSERT INTO `data_pinjam` (`Id_pinjam`, `id_buku`, `id_pegawai`, `id_peminjam`, `tgl_pinjam`, `tgl_kembali`) VALUES
(1, 1, 1, 1, '2021-05-03', '2021-05-10'),
(2, 2, 2, 2, '2021-05-12', '2021-05-19'),
(3, 3, 3, 3, '2021-05-14', '2021-05-21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_buku`
--
ALTER TABLE `data_buku`
  ADD PRIMARY KEY (`Id_buku`);

--
-- Indexes for table `data_pegawai`
--
ALTER TABLE `data_pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `data_peminjam`
--
ALTER TABLE `data_peminjam`
  ADD PRIMARY KEY (`Id_peminjam`);

--
-- Indexes for table `data_pinjam`
--
ALTER TABLE `data_pinjam`
  ADD PRIMARY KEY (`Id_pinjam`),
  ADD KEY `fk_buku` (`id_buku`),
  ADD KEY `fk_pegawai` (`id_pegawai`),
  ADD KEY `fk_peminjam` (`id_peminjam`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_pinjam`
--
ALTER TABLE `data_pinjam`
  ADD CONSTRAINT `fk_buku` FOREIGN KEY (`id_buku`) REFERENCES `data_buku` (`Id_buku`),
  ADD CONSTRAINT `fk_pegawai` FOREIGN KEY (`id_pegawai`) REFERENCES `data_pegawai` (`id_pegawai`),
  ADD CONSTRAINT `fk_peminjam` FOREIGN KEY (`id_peminjam`) REFERENCES `data_peminjam` (`Id_peminjam`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
