-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2016 at 03:16 PM
-- Server version: 5.5.39
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shop-online`
--

-- --------------------------------------------------------

--
-- Table structure for table `all_settings`
--

CREATE TABLE IF NOT EXISTS `all_settings` (
`all_id` int(3) NOT NULL,
  `all_name_settings` varchar(60) NOT NULL,
  `all_value_settings` varchar(60) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `all_settings`
--

INSERT INTO `all_settings` (`all_id`, `all_name_settings`, `all_value_settings`) VALUES
(1, 'footer', 'Copyright © Hutomo Khairinnas 2016'),
(2, 'site_name', 'Bunda Scarf');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
`gro_id` tinyint(1) NOT NULL,
  `gro_name` varchar(60) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`gro_id`, `gro_name`) VALUES
(1, 'admin'),
(2, 'c_admin'),
(3, 'member');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE IF NOT EXISTS `invoices` (
`id` int(16) NOT NULL,
  `data` datetime NOT NULL,
  `due_date` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `status` enum('paid','confirmed','unpaid','canceled','expired') NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10001004 ;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `data`, `due_date`, `user_id`, `status`) VALUES
(10001001, '2015-05-06 08:13:09', '2015-05-07 08:13:09', 2, 'confirmed'),
(10001002, '2015-05-06 08:17:15', '2015-05-07 08:17:15', 3, 'unpaid'),
(10001003, '2016-10-15 09:08:25', '2016-10-16 09:08:25', 4, 'unpaid');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
`id` int(16) NOT NULL,
  `invoice_id` int(16) NOT NULL,
  `product_id` int(16) NOT NULL,
  `product_type` varchar(60) NOT NULL,
  `product_title` varchar(60) NOT NULL,
  `qty` int(3) NOT NULL,
  `price` int(9) NOT NULL,
  `options` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10001005 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `invoice_id`, `product_id`, `product_type`, `product_title`, `qty`, `price`, `options`) VALUES
(10001001, 10001001, 1, 'PC', 'Dell', 1, 25000, ''),
(10001002, 10001002, 5, 'Mobile', 'Iphone 6', 1, 46000, ''),
(10001003, 10001003, 2, 'Laptop', 'Toshiba', 1, 50000, ''),
(10001004, 10001003, 3, 'PC', 'HP', 1, 75000, '');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
`pro_id` int(16) NOT NULL,
  `pro_name` varchar(50) NOT NULL,
  `pro_title` varchar(20) NOT NULL,
  `pro_description` text NOT NULL,
  `pro_price` int(9) NOT NULL,
  `pro_stock` int(3) NOT NULL,
  `pro_image` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pro_id`, `pro_name`, `pro_title`, `pro_description`, `pro_price`, `pro_stock`, `pro_image`) VALUES
(1, 'PC', 'Dell', 'Dell INSPIRON N5111\r\nRAM 2GB\r\nCORE i5\r\nAVG 1Gb\r\nCPU 3000', 25000, 3, 'Dell_Computer.jpg'),
(2, 'Laptop', 'Toshiba', 'RAM 1GB\r\nCORE i7\r\nAVG 2Gb\r\nCPU 3500', 50000, 5, 'prod_satA205-OFTWH_300-01.jpg'),
(3, 'PC', 'HP', 'HP 300 \r\nram 2 gb\r\navg 2\r\ncpu 3500\r\ndvd\r\ncam 16 px\r\n', 75000, 1, 'images.jpg'),
(4, 'Mobile', 'HTC sensation XL', 'htc', 45000, 1, 'htc_sensation_xl_28.jpg'),
(5, 'Mobile', 'Iphone 6', 'Iphone 6', 46000, 1, 'aabffb1c6425f95fd26db8595ee28c0e_png.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
`rep_id` int(9) NOT NULL,
  `rep_name` varchar(60) NOT NULL,
  `rep_id_product` int(9) NOT NULL,
  `rep_title_product` varchar(60) NOT NULL,
  `rep_usr_name` varchar(60) NOT NULL,
  `rep_usr_group` varchar(60) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`rep_id`, `rep_name`, `rep_id_product`, `rep_title_product`, `rep_usr_name`, `rep_usr_group`) VALUES
(3, 'PC', 1, 'Dell', '', '0'),
(4, 'Laptop', 2, 'Toshiba', '', '0'),
(5, 'Mobile', 4, 'HTC sensation XL', 'test', '3'),
(6, 'Laptop', 2, 'Toshiba', 'test', '3'),
(7, 'PC', 3, 'HP', 'Gost', 'Gost'),
(8, 'PC', 1, 'Dell', 'hichamtest', '3'),
(9, 'PC', 3, 'HP', 'TommyHawk', '3');

-- --------------------------------------------------------

--
-- Table structure for table `shop_session`
--

CREATE TABLE IF NOT EXISTS `shop_session` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_session`
--

INSERT INTO `shop_session` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('11b433b91da91fd2df474c65209d5bdf04f52391', '::1', 1430886198, 0x5f5f63695f6c6173745f726567656e65726174657c693a313433303838353930363b757365726e616d657c733a363a2268696368616d223b67726f75707c733a313a2233223b),
('18e5031ed538645b4ccb810918bb6bb4def54f0f', '::1', 1430885736, 0x5f5f63695f6c6173745f726567656e65726174657c693a313433303838353630353b757365726e616d657c733a363a2268696368616d223b67726f75707c733a313a2233223b),
('216782d346ecb725467fa1a08f49f3e057705ad8', '::1', 1430882453, 0x5f5f63695f6c6173745f726567656e65726174657c693a313433303838323430303b757365726e616d657c733a363a2268696368616d223b67726f75707c733a313a2233223b),
('303d5ff594029d513c5b48c68edde9af03ed959f', '::1', 1430889412, 0x5f5f63695f6c6173745f726567656e65726174657c693a313433303838393133383b757365726e616d657c733a363a2268696368616d223b67726f75707c733a313a2233223b),
('473886d26486392bbc947defc69cdcf66424de77', '::1', 1430886630, 0x5f5f63695f6c6173745f726567656e65726174657c693a313433303838363433363b757365726e616d657c733a363a2268696368616d223b67726f75707c733a313a2233223b),
('592ede52af5f4eef6843aff1ea01a378796f25cc', '::1', 1476528152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313437363532383133323b),
('61220b9bd64e6480a070ea5b8c3b44c2e5ad1dc5', '::1', 1476515802, 0x5f5f63695f6c6173745f726567656e65726174657c693a313437363531353731373b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('75026a28ee50856686459e50bbf04e02fbdbe1b7', '::1', 1430887393, 0x5f5f63695f6c6173745f726567656e65726174657c693a313433303838373136333b757365726e616d657c733a363a2268696368616d223b67726f75707c733a313a2233223b),
('89e90ce83eace8395bc9da51f9c0d3b0b85df95d', '::1', 1476516108, 0x5f5f63695f6c6173745f726567656e65726174657c693a313437363531363130383b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('8f1b75f2af02d572e0b06950a4286efa36064e28', '::1', 1430892337, 0x5f5f63695f6c6173745f726567656e65726174657c693a313433303839323333353b),
('8f5d8f2b27c17d06a261c2d12b9c6783791f23b0', '::1', 1430888044, 0x5f5f63695f6c6173745f726567656e65726174657c693a313433303838373836323b757365726e616d657c733a363a2268696368616d223b67726f75707c733a313a2233223b),
('a460a08a293ae491ad52e0381efaa0070ec01c76', '::1', 1430888288, 0x5f5f63695f6c6173745f726567656e65726174657c693a313433303838383137303b757365726e616d657c733a363a2268696368616d223b67726f75707c733a313a2233223b),
('ac03e0e37872a413802709d8289adcfe1d6574db', '::1', 1430887766, 0x5f5f63695f6c6173745f726567656e65726174657c693a313433303838373437343b757365726e616d657c733a363a2268696368616d223b67726f75707c733a313a2233223b),
('c64d3fd803821b27ddca58c1de092623cc89ee8a', '::1', 1430890441, 0x5f5f63695f6c6173745f726567656e65726174657c693a313433303839303334343b757365726e616d657c733a363a2268696368616d223b67726f75707c733a313a2233223b6d6573736167657c733a35383a225468616e6b20796f75202e2e2e2e2e2077652077696c6c20636865636b206f6e20796f7572207061796d656e7420636f6e6669726d6174696f6e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('d03788541a1ed30cb5f5fb7acc025264b50bf1fe', '::1', 1430888790, 0x5f5f63695f6c6173745f726567656e65726174657c693a313433303838383532303b757365726e616d657c733a363a2268696368616d223b67726f75707c733a313a2233223b),
('d7a7a2250ad798163a90ba09c3e0501aa17bbf2b', '::1', 1430883463, 0x5f5f63695f6c6173745f726567656e65726174657c693a313433303838333230313b757365726e616d657c733a363a2268696368616d223b67726f75707c733a313a2233223b),
('e5a96ef2ea1800a7dc0a794c1fc53ebbd742aa3e', '::1', 1430893426, 0x5f5f63695f6c6173745f726567656e65726174657c693a313433303839333432363b),
('e6528b002d7aacfeaa0d5e91ca1b9e3d714d5487', '::1', 1430891019, 0x5f5f63695f6c6173745f726567656e65726174657c693a313433303839303733343b757365726e616d657c733a363a2268696368616d223b67726f75707c733a313a2233223b),
('e6f97a8dd2bc112d8892e281feee48cb63cb8b5d', '::1', 1476515050, 0x5f5f63695f6c6173745f726567656e65726174657c693a313437363531343735303b757365726e616d657c733a393a22546f6d6d794861776b223b67726f75707c733a313a2233223b636172745f636f6e74656e74737c613a333a7b733a31303a22636172745f746f74616c223b643a35303030303b733a31313a22746f74616c5f6974656d73223b643a313b733a33323a226338316537323864396434633266363336663036376638396363313438363263223b613a373a7b733a323a226964223b733a313a2232223b733a333a22717479223b643a313b733a353a227072696365223b643a35303030303b733a343a226e616d65223b733a363a224c6170746f70223b733a353a227469746c65223b733a373a22546f7368696261223b733a353a22726f776964223b733a33323a226338316537323864396434633266363336663036376638396363313438363263223b733a383a22737562746f74616c223b643a35303030303b7d7d);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`usr_id` int(10) NOT NULL,
  `usr_name` varchar(25) NOT NULL,
  `usr_password` varchar(60) NOT NULL,
  `usr_group` tinyint(1) NOT NULL,
  `stuts` tinyint(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`usr_id`, `usr_name`, `usr_password`, `usr_group`, `stuts`) VALUES
(1, 'admin', 'a2b28cab2aa8b348304ecdca9e0349c9', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `all_settings`
--
ALTER TABLE `all_settings`
 ADD PRIMARY KEY (`all_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
 ADD PRIMARY KEY (`gro_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`pro_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
 ADD PRIMARY KEY (`rep_id`);

--
-- Indexes for table `shop_session`
--
ALTER TABLE `shop_session`
 ADD PRIMARY KEY (`id`), ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`usr_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `all_settings`
--
ALTER TABLE `all_settings`
MODIFY `all_id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
MODIFY `gro_id` tinyint(1) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
MODIFY `id` int(16) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10001004;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `id` int(16) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10001005;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `pro_id` int(16) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
MODIFY `rep_id` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `usr_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
