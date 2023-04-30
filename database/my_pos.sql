-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 14, 2022 at 08:10 AM
-- Server version: 8.0.17
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_member`
--

CREATE TABLE `tbl_member` (
  `mem_id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `ref_l_id` int(11) NOT NULL,
  `mem_name` varchar(50) NOT NULL,
  `mem_username` varchar(20) NOT NULL,
  `mem_password` varchar(100) NOT NULL,
  `mem_img` varchar(200) NOT NULL,
  `dateinsert` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_member`
--

INSERT INTO `tbl_member` (`mem_id`, `ref_l_id`, `mem_name`, `mem_username`, `mem_password`, `mem_img`, `dateinsert`) VALUES
(001, 1, 'Admin22', '1', '356a192b7913b04c54574d18c28d46e6395428ab', '27100874020210707_113953.png', '2019-09-04 03:40:46'),
(022, 2, 'MEM', 'mem22', '362ffba30a19e9abd2d90c45b6890c632da9675a', '27100874020210707_113953.png', '2020-04-23 10:38:09'),
(035, 1, 'anucha', 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', '18847198220220308_040654.png', '2022-03-07 21:06:54');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(4) UNSIGNED ZEROFILL NOT NULL,
  `mem_id` int(11) NOT NULL,
  `receive_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อผู้รับ',
  `order_status` int(1) NOT NULL,
  `b_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ชื่อธนาคาร',
  `pay_amount` float(10,2) DEFAULT NULL,
  `pay_amount2` float(10,2) NOT NULL,
  `order_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `mem_id`, `receive_name`, `order_status`, `b_name`, `pay_amount`, `pay_amount2`, `order_date`) VALUES
(0001, 35, 'ลูกค้าหน้าร้าน', 4, 'ชำระเงินแล้ว', 70890.00, 71000.00, '2022-03-11 16:03:23'),
(0002, 35, 'ลูกค้าหน้าร้าน', 4, 'ชำระเงินแล้ว', 128990.00, 130000.00, '2022-03-11 16:30:14'),
(0003, 35, 'ลูกค้าหน้าร้าน', 4, 'ชำระเงินแล้ว', 217880.00, 218000.00, '2022-03-14 12:57:37');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_detail`
--

CREATE TABLE `tbl_order_detail` (
  `d_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `p_c_qty` int(11) NOT NULL,
  `total` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_order_detail`
--

INSERT INTO `tbl_order_detail` (`d_id`, `order_id`, `p_id`, `p_c_qty`, `total`) VALUES
(1, 1, 8, 1, 38990),
(2, 1, 9, 1, 31900),
(3, 2, 13, 1, 49000),
(4, 2, 7, 1, 79990),
(5, 3, 9, 1, 31900),
(6, 3, 10, 2, 185980);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `p_id` int(20) NOT NULL,
  `p_name` varchar(100) NOT NULL,
  `p_detail` text NOT NULL,
  `p_price` float NOT NULL,
  `p_qty` int(5) NOT NULL,
  `p_img` varchar(255) NOT NULL,
  `p_date_save` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`p_id`, `p_name`, `p_detail`, `p_price`, `p_qty`, `p_img`, `p_date_save`) VALUES
(1, 'Acer Nitro AN515-45-R2MT/T008', '15.6 inch / AMD Ryzen 5 5600H / 8GB DDR4 / 512GB SSD / GeForce RTX 3050 4GB GDDR6 / Win 11', 31900, 10, '90869196020220308_000624.jpg', '2022-03-07 17:06:24'),
(2, 'Acer Nitro AN515-57-5959/T003', '15.6 inch / Intel i5-11400H / 8GB DDR4 / 512GB SSD / GeForce RTX 3050 Ti 4GB', 34900, 10, '72662573520220308_063214.jpg', '2022-03-07 17:09:57'),
(4, 'Acer Nitro AN515-45-R4U8/T00A', '15.6 inch / AMD Ryzen 7 5800H / 16GB DDR4 / 512GB SSD / GeForce RTX 3060 6GB GDDR6 / Win 11', 43900, 10, '31996072320220308_063451.jpg', '2022-03-07 22:23:06'),
(5, 'Acer Nitro AN515-57-99W3/T006', '15.6 inch / Intel i9-11900H / 16GB DDR4 / 1TB SSD / GeForce RTX 3070 8GB GDDR6 / Win 11', 59900, 10, '79388296820220308_063533.jpg', '2022-03-07 23:35:33'),
(6, 'Acer Predator PT516-51s-7518/T001', '16.0 inch / Intel i7-11800H / 16GB DDR4 / 512GB SSD / GeForce RTX 3070 8GB GDDR6 / Win 10', 89900, 10, '147362977920220308_063615.jpg', '2022-03-07 23:36:15'),
(7, 'Asus ROG Strix Scar 17 G743QS-HG254T', '17.3 inch / AMD Ryzen 9 5900HX / 16GB DDR4 / 1TB SSD / GeForce RTX 3080 8GB GDDR6 / Win 10', 79990, 14, '33255210320220308_063820.jpg', '2022-03-07 23:38:20'),
(8, 'Asus ROG Strix G15 GL543IE-HN062W', '15.6 inch / AMD Ryzen 7 4800H / 16GB DDR4 / 512GB SSD / GeForce RTX 3050 Ti 4GB GDDR6 / Win 11', 38990, 9, '41664338120220308_063914.jpg', '2022-03-07 23:39:14'),
(9, 'MSI Pulse GL66 11UDK-605TH', '15.6 inch / Intel i5-11400H / 16GB DDR4 / 512GB SSD / GeForce RTX 3050 Ti 4GB GDDR6 / Win 10', 31900, 8, '8408587120220308_064027.jpg', '2022-03-07 23:40:27'),
(10, 'MSI Raider GE66 12UGS-073TH', '15.6 inch / Intel i7-12700H / 16GB DDR5 / 1TB SSD / GeForce RTX 3070 Ti 8GB GDDR6 / Win 11', 92990, 8, '205910835420220308_064111.jpg', '2022-03-07 23:41:11'),
(11, 'DELL AWM15R5R-W569212800ATHW10', '15.6 inch / AMD Ryzen 7 5800H / 32GB DDR4 / 1TB SSD / GeForce RTX 3070 8GB GDDR6 / Win 10', 89900, 10, '163686980720220308_064424.jpg', '2022-03-07 23:44:24'),
(12, 'DELL AWM15R6-W569212300THW10', '5.6 inch / Intel i7-11800H / 32GB DDR4 / 1TB SSD / GeForce RTX 3070 8GB GDDR6 / Win 11', 99900, 10, '35817793920220308_064510.jpg', '2022-03-07 23:45:10'),
(13, 'Macbook Pro', 'Macbook Pro 2022', 49000, 1, '39550809220220311_162901.jpg', '2022-03-11 09:29:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_member`
--
ALTER TABLE `tbl_member`
  ADD PRIMARY KEY (`mem_id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`p_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_member`
--
ALTER TABLE `tbl_member`
  MODIFY `mem_id` int(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  MODIFY `d_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `p_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
