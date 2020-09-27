-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2020 at 06:55 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `BID` int(11) NOT NULL,
  `BNAME` varchar(255) DEFAULT NULL,
  `BADDRESS` varchar(255) DEFAULT NULL,
  `BPHONE` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`BID`, `BNAME`, `BADDRESS`, `BPHONE`) VALUES
(1, 'Apple', 'Việt Nam', '023456789'),
(2, 'Samsung', 'Việt Nam', '034526789'),
(3, 'Oppo', 'Việt Nam', '056743289');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `CTID` int(11) NOT NULL,
  `CID` int(11) DEFAULT NULL,
  `USID` int(11) DEFAULT NULL,
  `CTDATE` datetime DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cart_detail`
--

CREATE TABLE `cart_detail` (
  `PID` int(11) NOT NULL,
  `CTID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CAID` int(11) NOT NULL,
  `CANAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CAID`, `CANAME`) VALUES
(1, 'Phone');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CID` int(11) NOT NULL,
  `CNAME` varchar(255) DEFAULT NULL,
  `CPHONE` decimal(10,0) NOT NULL,
  `CADDRESS` varchar(255) DEFAULT NULL,
  `CPASSWORD` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `IID` int(11) NOT NULL,
  `USID` int(11) DEFAULT NULL,
  `IDATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_detail`
--

CREATE TABLE `invoice_detail` (
  `IID` int(11) NOT NULL,
  `PID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `PID` int(11) NOT NULL,
  `BID` int(11) NOT NULL,
  `CAID` int(11) NOT NULL,
  `PNAME` varchar(255) DEFAULT NULL,
  `PIMAGE` text DEFAULT NULL,
  `PPRICE` int(11) DEFAULT NULL,
  `PQUANTITY` int(11) DEFAULT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `STATUS` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`PID`, `BID`, `CAID`, `PNAME`, `PIMAGE`, `PPRICE`, `PQUANTITY`, `DESCRIPTION`, `STATUS`) VALUES
(1, 1, 1, 'Iphone X', 'im', 15000000, 20, 'Iphone', 1),
(2, 1, 1, 'Iphone Xs', 'im', 17000000, 10, 'iphone', 1),
(3, 2, 1, 'Samsung Galaxy A11', 'im', 3000000, 10, 'samsung', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `USID` int(11) NOT NULL,
  `UNAME` varchar(255) DEFAULT NULL,
  `UPHONE` varchar(10) DEFAULT NULL,
  `UADDRESS` varchar(255) DEFAULT NULL,
  `UEMAIL` varchar(255) NOT NULL,
  `UPASSWORD` varchar(255) DEFAULT NULL,
  `ROLE` int(11) DEFAULT NULL,
  `SALARY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`USID`, `UNAME`, `UPHONE`, `UADDRESS`, `UEMAIL`, `UPASSWORD`, `ROLE`, `SALARY`) VALUES
(1, 'Lê Đức Sơn', '0963990128', 'HCM', 'ducson@mail.com', '12345', 0, 5000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`BID`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`CTID`),
  ADD KEY `FK_ORDER_CUS` (`CID`),
  ADD KEY `FK_USER_CART` (`USID`);

--
-- Indexes for table `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD PRIMARY KEY (`PID`,`CTID`),
  ADD KEY `FK_CART_DETAIL2` (`CTID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CAID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CID`),
  ADD UNIQUE KEY `AK_UNIQUE` (`CPHONE`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`IID`),
  ADD KEY `FK_USER_INVOICE` (`USID`);

--
-- Indexes for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD PRIMARY KEY (`IID`,`PID`),
  ADD KEY `FK_INVOICE_DETAIL2` (`PID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`PID`),
  ADD KEY `FK_BRAND_PRODUCT` (`BID`),
  ADD KEY `FK_category_PRODUCT` (`CAID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USID`),
  ADD UNIQUE KEY `AK_UNIQUE` (`UEMAIL`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `BID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `CTID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CAID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `IID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `PID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `USID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_ORDER_CUS` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`),
  ADD CONSTRAINT `FK_USER_CART` FOREIGN KEY (`USID`) REFERENCES `users` (`USID`);

--
-- Constraints for table `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD CONSTRAINT `FK_CART_DETAIL` FOREIGN KEY (`PID`) REFERENCES `product` (`PID`),
  ADD CONSTRAINT `FK_CART_DETAIL2` FOREIGN KEY (`CTID`) REFERENCES `cart` (`CTID`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `FK_USER_INVOICE` FOREIGN KEY (`USID`) REFERENCES `users` (`USID`);

--
-- Constraints for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD CONSTRAINT `FK_INVOICE_DETAIL` FOREIGN KEY (`IID`) REFERENCES `invoice` (`IID`),
  ADD CONSTRAINT `FK_INVOICE_DETAIL2` FOREIGN KEY (`PID`) REFERENCES `product` (`PID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_BRAND_PRODUCT` FOREIGN KEY (`BID`) REFERENCES `brand` (`BID`),
  ADD CONSTRAINT `FK_category_PRODUCT` FOREIGN KEY (`CAID`) REFERENCES `category` (`CAID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
