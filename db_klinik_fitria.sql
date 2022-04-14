-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 14, 2022 at 02:37 AM
-- Server version: 5.7.33
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_klinik_fitria`
--

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `idobat` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `harga` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `idpasien` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `tgllahir` date NOT NULL,
  `notelp` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rawat`
--

CREATE TABLE `rawat` (
  `idrawat` int(11) NOT NULL,
  `tglrawat` date NOT NULL,
  `totaltindakan` int(255) NOT NULL,
  `totalobat` int(255) NOT NULL,
  `totalharga` int(255) NOT NULL,
  `uangmuka` int(255) NOT NULL,
  `kurang` int(255) NOT NULL,
  `idpasien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rawatobat`
--

CREATE TABLE `rawatobat` (
  `idrawatobat` int(11) NOT NULL,
  `norawat` varchar(255) NOT NULL,
  `idobat` int(11) NOT NULL,
  `jumlah` int(20) NOT NULL,
  `harga` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rawattindakan`
--

CREATE TABLE `rawattindakan` (
  `idrawattindakan` int(11) NOT NULL,
  `idrawat` int(11) NOT NULL,
  `idtindakan` int(11) NOT NULL,
  `namadokter` varchar(255) NOT NULL,
  `harga` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tindakan`
--

CREATE TABLE `tindakan` (
  `idtindakan` int(11) NOT NULL,
  `namatindakan` varchar(255) NOT NULL,
  `biaya` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`idobat`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`idpasien`);

--
-- Indexes for table `rawat`
--
ALTER TABLE `rawat`
  ADD PRIMARY KEY (`idrawat`),
  ADD KEY `rawat_ibfk_1` (`idpasien`);

--
-- Indexes for table `rawatobat`
--
ALTER TABLE `rawatobat`
  ADD PRIMARY KEY (`idrawatobat`),
  ADD KEY `idobat` (`idobat`);

--
-- Indexes for table `rawattindakan`
--
ALTER TABLE `rawattindakan`
  ADD PRIMARY KEY (`idrawattindakan`),
  ADD KEY `idtindakan` (`idtindakan`),
  ADD KEY `idrawat` (`idrawat`);

--
-- Indexes for table `tindakan`
--
ALTER TABLE `tindakan`
  ADD PRIMARY KEY (`idtindakan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `idobat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `idpasien` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rawat`
--
ALTER TABLE `rawat`
  MODIFY `idrawat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rawatobat`
--
ALTER TABLE `rawatobat`
  MODIFY `idrawatobat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rawattindakan`
--
ALTER TABLE `rawattindakan`
  MODIFY `idrawattindakan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tindakan`
--
ALTER TABLE `tindakan`
  MODIFY `idtindakan` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rawat`
--
ALTER TABLE `rawat`
  ADD CONSTRAINT `rawat_ibfk_1` FOREIGN KEY (`idpasien`) REFERENCES `pasien` (`idpasien`);

--
-- Constraints for table `rawatobat`
--
ALTER TABLE `rawatobat`
  ADD CONSTRAINT `rawatobat_ibfk_1` FOREIGN KEY (`idobat`) REFERENCES `obat` (`idobat`);

--
-- Constraints for table `rawattindakan`
--
ALTER TABLE `rawattindakan`
  ADD CONSTRAINT `rawattindakan_ibfk_1` FOREIGN KEY (`idtindakan`) REFERENCES `tindakan` (`idtindakan`),
  ADD CONSTRAINT `rawattindakan_ibfk_2` FOREIGN KEY (`idrawat`) REFERENCES `rawat` (`idrawat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
