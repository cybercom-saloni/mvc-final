-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2021 at 05:59 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL,
  `createdat` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `status`, `createdat`, `updatedat`) VALUES
(1, 'jignesh', '0d58c94ec918e6f366e6db99c19053', 'Disabled', '2021-02-24 13:06:36', '2021-02-28 03:08:55'),
(2, 'paresh', 'd41d8cd98f00b204e9800998ecf842', 'Enabled', '2021-02-24 13:06:36', '2021-02-24 09:34:57'),
(7, 'nimesh', '96408b2aed96995066d6e07b923a46', 'Disabled', '2021-03-08 13:30:03', '2021-03-13 08:25:11'),
(34, 'Visarg123', 'visarg', 'Disabled', '2021-04-02 08:26:57', '2021-04-02 11:56:57');

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

CREATE TABLE `attribute` (
  `id` int(11) NOT NULL,
  `entityTypeId` enum('product','category') NOT NULL,
  `name` varchar(30) NOT NULL,
  `code` varchar(20) NOT NULL,
  `inputType` varchar(20) NOT NULL,
  `backendType` varchar(30) DEFAULT NULL,
  `sortOrder` int(4) NOT NULL,
  `backendModel` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attribute`
--

INSERT INTO `attribute` (`id`, `entityTypeId`, `name`, `code`, `inputType`, `backendType`, `sortOrder`, `backendModel`) VALUES
(5, 'product', 'colour', 'colour', 'select', 'varchar', 0, 'Model\\Option'),
(8, 'product', 'Size', 'size', 'checkbox', 'varchar', 6, 'Model\\Option'),
(9, 'product', 'Collection', 'collection', 'Textbox', 'varchar', 2, 'Model\\Option'),
(11, 'product', 'brand', 'brand', 'Textbox', 'text', 7, 'ModelOption');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_option`
--

CREATE TABLE `attribute_option` (
  `optionId` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `attributeId` int(11) NOT NULL,
  `sortOrder` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attribute_option`
--

INSERT INTO `attribute_option` (`optionId`, `name`, `attributeId`, `sortOrder`) VALUES
(1, 'black', 5, 2),
(2, 'pink', 5, 1),
(3, 'green', 5, 3),
(20, 'white', 5, 5),
(21, 'brown', 5, 4),
(22, '32', 8, 1),
(23, '30', 8, 2),
(24, '28', 8, 3),
(25, '26', 8, 4),
(26, 'ashley', 9, 2),
(27, 'EXD', 9, 1),
(28, 'Red', 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `image` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `image`, `status`) VALUES
(1, 'Ashleya', 'Ashley.png', 'Disabled'),
(2, 'bestar', 'bestar.png', 'Enabled'),
(3, 'casana', 'casana.png', 'Disabled'),
(5, 'ESF', 'esf.png', 'Enabled'),
(6, 'Dimplex', 'dimplex.png', 'Enabled'),
(7, 'Global', 'global.jpg', 'Enabled'),
(8, 'hammary', 'hammary.png', 'Enabled'),
(9, 'jofran', 'jofran.jpg', 'Enabled'),
(10, 'legends', 'legends.jpg', 'Enabled'),
(11, 'malouf', 'malouf.jpg', 'Enabled'),
(12, 'Moes', 'moes.jpg', 'Enabled'),
(13, 'pulaski', 'pulaski.jpg', 'Enabled');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `sessionId` varchar(50) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `shippingMethodId` int(11) NOT NULL,
  `shippingAmount` int(11) NOT NULL,
  `paymentMethodId` int(11) NOT NULL,
  `createdat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartId`, `customerId`, `sessionId`, `total`, `discount`, `shippingMethodId`, `shippingAmount`, `paymentMethodId`, `createdat`) VALUES
(1, 1, '747e2sl10m7qv396u0gnai3990', 2315, 0, 2, 2465, 8, '2021-03-25 05:30:59'),
(2, 4, NULL, 3296, 0, 2, 3446, 2, '2021-03-26 06:04:24'),
(3, 5, NULL, 0, 0, 0, 0, 0, '2021-03-26 06:08:54'),
(4, 3, NULL, 0, 0, 0, 0, 0, '2021-03-26 06:17:42'),
(5, 6, NULL, 0, 0, 0, 0, 0, '2021-03-27 07:42:49'),
(6, 7, NULL, 1496, 0, 2, 1646, 8, '2021-03-27 09:24:36'),
(7, 0, NULL, 0, 0, 0, 0, 0, '2021-04-03 07:43:56'),
(8, 8, NULL, 0, 0, 0, 0, 0, '2021-04-03 07:44:53');

-- --------------------------------------------------------

--
-- Table structure for table `cart_address`
--

CREATE TABLE `cart_address` (
  `cartAddressId` int(11) NOT NULL,
  `cartId` int(11) NOT NULL,
  `addressId` int(11) DEFAULT NULL,
  `addressType` varchar(11) NOT NULL,
  `address` varchar(75) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `zipcode` varchar(30) NOT NULL,
  `sameAsBilling` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_address`
--

INSERT INTO `cart_address` (`cartAddressId`, `cartId`, `addressId`, `addressType`, `address`, `city`, `state`, `country`, `zipcode`, `sameAsBilling`) VALUES
(3, 2, 33, 'Billing', '5,Ganesh ji society', 'Anand', 'gujarat', 'India', '12345', 0),
(5, 6, 0, 'Billing', '16/A, shiv bunglows', 'baroda', 'gujarat', 'India', '345001', 1),
(7, 1, 0, 'Billing', '16/B, Abhay flats', 'baroda', 'gujarat', 'India', '345001', 1),
(10, 5, 36, 'Billing', '80/G, Virat Society', 'Ludhiana', 'Punjab', 'India', '435008', 1),
(56, 4, NULL, 'Billing', '6, kadam nagari, pij road', 'Nadiad', 'Gujarat123', 'India', '387002', 1),
(66, 3, NULL, 'Billing', '10, kishor nagari, pij road', 'Anand', 'Gujarat', 'India', '387002', 1),
(114, 2, NULL, 'Shipping', '101, Mahendra Society', 'Mehsana', 'Maharashtra', 'India', '986001', NULL),
(115, 1, NULL, 'Shipping', '10, Akash flats, ACP road', 'Ahmedabad', 'Gujarat', 'India', '123123', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE `cart_item` (
  `cartItemId` int(11) NOT NULL,
  `cartId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `basePrice` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `createdat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_item`
--

INSERT INTO `cart_item` (`cartItemId`, `cartId`, `productId`, `quantity`, `basePrice`, `price`, `discount`, `createdat`) VALUES
(12, 4, 1, 3, 0, 1496, 10, '2021-03-26 06:17:56'),
(14, 2, 2, 3, 0, 732, 10, '2021-03-27 06:24:11'),
(15, 2, 4, 1, 0, 1100, 10, '2021-03-27 06:24:16'),
(18, 6, 1, 1, 0, 1496, 10, '2021-03-27 09:27:35'),
(20, 5, 13, 2, 0, 1216, 10, '2021-03-29 04:34:32'),
(21, 3, 1, 1, 0, 1496, 10, '2021-04-01 08:15:25'),
(22, 1, 1, 1, 0, 1496, 10, '2021-04-01 10:32:26'),
(23, 1, 3, 1, 0, 819, 10, '2021-04-01 10:32:37');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `description` varchar(30) DEFAULT NULL,
  `featured` varchar(3) DEFAULT NULL,
  `parentId` int(10) DEFAULT NULL,
  `pathId` varchar(100) DEFAULT NULL,
  `createdat` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `status`, `description`, `featured`, `parentId`, `pathId`, `createdat`, `updatedat`) VALUES
(1, 'Bedroom', 'Enabled', 'Bedroom', 'YES', 0, '1', '2021-03-21 10:06:41', '2021-03-22 01:37:56'),
(2, 'Living Room', 'Enabled', 'Living Room', 'YES', 0, '2', '2021-03-21 10:06:41', '2021-03-22 01:39:57'),
(3, 'Dining & Kitchen', ' ', 'Dining & Kitchen', 'YES', 0, '3', '2021-03-21 10:06:41', '2021-03-22 01:40:49'),
(4, 'Office', '1', 'Office', 'YES', 0, '4', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(5, 'Bar & Game Room', 'Enabled', 'Bar & Game Room', 'YES', 0, '5', '2021-03-21 10:06:41', '2021-03-22 02:30:05'),
(6, 'Accessories', ' ', 'Accessories', 'YES', 0, '6', '2021-03-21 10:06:41', '2021-03-22 23:57:59'),
(7, 'Outdoor', ' ', 'Outdoor', 'YES', 0, '7', '2021-03-21 10:06:41', '2021-03-23 00:22:53'),
(8, 'Entry & Mudroom', '1', 'Entry & Mudroom', NULL, 0, '8', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(9, 'Bedroom Sets', '1', 'Bedroom Sets\r\n', NULL, 1, '1=9', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(10, 'Beds', ' ', 'Beds', ' ', 1, '1=10', '2021-03-21 10:06:41', '2021-03-23 04:13:33'),
(11, 'Nightstands', ' ', 'Nightstands', ' ', 1, '1=11', '2021-03-21 10:06:41', '2021-03-23 04:13:40'),
(12, 'Dressers', ' ', 'Dressers', ' ', 1, '1=12', '2021-03-21 10:06:41', '2021-03-23 04:13:47'),
(13, 'Dresser Mirrors', ' ', 'Dresser Mirrors', ' ', 1, '1=13', '2021-03-21 10:06:41', '2021-03-23 04:13:54'),
(14, 'Chests', '1', 'Chests', NULL, 1, '1=14', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(15, 'Bedroom Benches', '1', 'Bedroom Benches', NULL, 1, '1=15', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(16, 'Bed Frames & Headboa', '1', 'Bed Frames & Headboards', NULL, 1, '1=16', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(17, 'Armoires and Wardrob', '1', 'Armoires and Wardrobes', NULL, 1, '1=17', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(18, 'Bedroom Vanities', '1', 'Bedroom Vanities', NULL, 1, '1=18', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(19, 'Media Chests', '1', 'Media Chests', NULL, 1, '1=19', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(20, 'Jewelry Armoires', '1', 'Jewelry Armoires', NULL, 1, '1=20', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(21, 'Day Beds and Futons', '1', 'Day Beds and Futons', NULL, 1, '1=21', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(22, 'Kids Room', '1', 'Kids Room', NULL, 1, '1=22', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(23, 'Kids and Youth Furni', '1', 'Kids and Youth Furniture', NULL, 1, '1=23', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(24, 'Baby Furniture', '1', 'Baby Furniture', NULL, 1, '1=24', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(25, 'Mattresses', '1', 'Mattresses', NULL, 1, '1=25', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(26, 'Box Springs & Founda', '0', 'Box Springs & Foundations', NULL, 1, '1=26', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(27, 'Adjustable Beds', '1', 'Adjustable Beds', NULL, 1, '1=27', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(28, 'Pillows', '1', 'Pillows', NULL, 1, '1=28', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(29, 'Bedding and Comforte', '1', 'Bedding and Comforter Sets', NULL, 1, '1=29', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(30, 'Living Room Sets', ' ', 'Living Room Sets', ' ', 2, '2=30', '2021-03-21 10:06:41', '2021-03-23 04:15:00'),
(31, 'Sectionals', '1', 'Sectionals', NULL, 2, '2=31', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(32, 'Sofas', '1', 'Sofas', NULL, 2, '2=32', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(33, 'Loveseats', '1', 'Loveseats', NULL, 2, '2=33', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(34, 'Reclining Loveseats', '1', 'Reclining Loveseats', NULL, 2, '2=34', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(35, 'Sleeper Sofas', '1', 'Sleeper Sofas', NULL, 2, '2=35', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(36, 'Recliners and Rocker', '1', 'Recliners and Rockers', NULL, 2, '2=36', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(37, 'Theater Seating', '1', 'Theater Seating', NULL, 2, '2=37', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(38, 'Chairs', '1', 'Chairs', NULL, 2, '2=38', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(39, 'Accent Chairs', '1', 'Accent Chairs', NULL, 2, '2=39', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(40, 'Chaises', '1', 'Chaises', NULL, 2, '2=40', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(41, 'Ottomans', '1', 'Ottomans', NULL, 2, '2=41', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(42, 'Futons', '1', 'Futons', NULL, 2, '2=42', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(43, 'Leather Furniture', '1', 'Leather Furniture', NULL, 2, '2=43', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(44, 'Occasional Table Set', '1', 'Occasional Table Sets', NULL, 2, '2=44', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(45, 'Sofa Tables', '1', 'Sofa Tables', NULL, 2, '2=45', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(46, 'Accent Chests and Ca', '1', 'Accent Chests and Cabinets', NULL, 2, '2=46', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(47, 'Console Tables', '1', 'Console Tables', NULL, 2, '2=47', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(48, 'Coffee and Cocktail ', '1', 'Coffee and Cocktail Tables', NULL, 2, '2=48', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(49, 'End Tables', '1', 'End Tables', NULL, 2, '2=49', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(50, 'Accent Tables', '1', 'Accent Tables', NULL, 2, '2=50', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(51, 'Side Tables', '1', 'Side Tables', NULL, 2, '2=51', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(52, 'Rugs and Accessories', '1', 'Rugs and Accessories', NULL, 2, '2=52', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(53, 'Entertainment Center', '1', 'Entertainment Centers and Wall', NULL, 2, '2=53', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(54, 'TV Stands and TV Con', '1', 'TV Stands and TV Consoles', NULL, 2, '2=54', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(55, 'CD and DVD Media Sto', '1', 'CD and DVD Media Storage', NULL, 2, '2=55', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(56, 'Dining Sets', ' ', 'Dining Sets', ' ', 3, '3=56', '2021-03-21 10:06:41', '2021-03-23 04:19:35'),
(57, 'Dinette Sets', '1', 'Dinette Sets', NULL, 3, '3=57', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(58, 'Dining Chairs', '1', 'Dining Chairs', NULL, 3, '3=58', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(59, 'Dining Tables', '1', 'Dining Tables', NULL, 3, '3=59', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(60, 'Dining Benches', '1', 'Dining Benches', NULL, 3, '3=60', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(61, 'China Cabinets', '1', 'China Cabinets', NULL, 3, '3=61', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(62, 'Curios & Displays', '1', 'Curios & Displays', NULL, 3, '3=62', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(63, 'Kitchen Island, Kitc', '1', 'Kitchen Island, Kitchen Cart', NULL, 3, '3=63', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(64, 'Servers, Sideboards ', '1', 'Servers, Sideboards & Buffets', NULL, 3, '3=64', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(65, 'Home Office Sets', '1', 'Home Office Sets', NULL, 4, '4=65', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(66, 'Office Chairs', '1', 'Office Chairs', NULL, 4, '4=66', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(67, 'Desks & Hutches', '1', 'Desks & Hutches', NULL, 4, '4=67', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(68, 'Modular Office Furni', '1', 'Modular Office Furniture', NULL, 4, '4=68', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(69, 'Conference Room', '1', 'Conference Room', NULL, 4, '4=69', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(70, 'Filing Cabinets and ', '1', 'Filing Cabinets and Storage', NULL, 4, '4=70', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(71, 'Bookcases, Book Shel', '1', 'Bookcases, Book Shelves', NULL, 4, '4=71', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(72, 'Office Accessories', '1', 'Office Accessories', NULL, 4, '4=72', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(73, 'Miscellaneous', '1', 'Miscellaneous', NULL, 4, '4=73', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(75, 'Bistro and Bar Table', '1', 'Bistro and Bar Table Sets', NULL, 5, '5=75', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(76, 'Game Table Sets', '1', 'Game Table Sets', NULL, 5, '5=76', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(77, 'Bar Tables and Pub T', '1', 'Bar Tables and Pub Tables', NULL, 5, '5=77', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(78, 'Barstools', '1', 'Barstools', NULL, 5, '5=78', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(79, 'Wine Racks', '1', 'Wine Racks', NULL, 5, '5=79', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(80, 'Game Tables', '1', 'Game Tables', NULL, 5, '5=80', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(81, 'Game Room Chairs', '1', 'Game Room Chairs', NULL, 5, '5=81', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(82, 'Bar and Wine Cabinet', '1', 'Bar and Wine Cabinets', NULL, 5, '5=82', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(83, 'Rugs', '1', 'Rugs', NULL, 6, '6=83', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(84, 'Wall Art', '1', 'Wall Art', NULL, 6, '6=84', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(85, 'Accent and Storage B', '1', 'Accent and Storage Benches', NULL, 6, '6=85', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(86, 'Accent Mirrors', '1', 'Accent Mirrors', NULL, 6, '6=86', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(87, 'Curios', '1', 'Curios', NULL, 6, '6=87', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(88, 'Pillows and Throws', '1', 'Pillows and Throws', NULL, 6, '6=88', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(89, 'Decorative Accessori', '1', 'Decorative Accessories', NULL, 6, '6=89', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(90, 'Entryway Furniture', '1', 'Entryway Furniture', NULL, 6, '6=90', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(91, 'Storage and Organiza', '1', 'Storage and Organization', NULL, 6, '6=91', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(92, 'Etageres', '1', 'Etageres', NULL, 6, '6=92', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(93, 'Clocks', '1', 'Clocks', NULL, 6, '6=93', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(94, 'Artificial Plants', '1', 'Artificial Plants', NULL, 6, '6=94', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(95, 'Picture Frames', '1', 'Picture Frames', NULL, 6, '6=95', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(96, 'Lighting', '1', 'Lighting', NULL, 6, '6=96', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(97, 'Desk and Buffet Lamp', '1', 'Desk and Buffet Lamps', NULL, 6, '6=97', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(98, 'Lamp Sets', '1', 'Lamp Sets', NULL, 6, '6=98', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(99, 'Floor Lamps', '1', 'Floor Lamps', NULL, 6, '6=99', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(101, 'Wall Sconces', '1', 'Wall Sconces', NULL, 6, '6=101', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(102, 'Bathroom Furniture', '1', 'Bathroom Furniture', NULL, 6, '6=102', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(104, 'Outdoor Dining Furni', '1', 'Outdoor Dining Furniture', NULL, 7, '7=104', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(105, 'Outdoor Tables', '1', 'Outdoor Tables', NULL, 7, '7=105', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(106, 'Outdoor Chairs', '1', 'Outdoor Chairs', NULL, 7, '7=106', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(107, 'Outdoor Sofas & Love', '1', 'Outdoor Sofas & Loveseats', NULL, 7, '7=107', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(108, 'Outdoor Chaise Loung', '1', 'Outdoor Chaise Loungers', NULL, 7, '7=108', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(109, 'Outdoor Bar Furnitur', '1', 'Outdoor Bar Furniture', NULL, 7, '7=109', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(110, 'Outdoor Accessories', '1', 'Outdoor Accessories', NULL, 7, '7=110', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(111, 'Outdoor Fireplaces', '1', 'Outdoor Fireplaces', NULL, 7, '7=111', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(112, 'Outdoor Benches', '1', 'Outdoor Benches', NULL, 7, '7=112', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(113, 'Outdoor Ottomans', '1', 'Outdoor Ottomans', NULL, 7, '7=113', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(114, 'Console Tables', '1', 'Console Tables', NULL, 8, '8=114', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(115, 'Storage Benches', '1', 'Storage Benches', NULL, 8, '8=115', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(116, 'Hall Trees', '1', 'Hall Trees', NULL, 8, '8=116', '2021-03-21 10:06:41', '2021-03-21 10:06:41'),
(117, 'Coat Racks', '1', 'Coat Racks', NULL, 8, '8=117', '2021-03-21 10:06:41', '2021-03-21 10:06:41');

-- --------------------------------------------------------

--
-- Table structure for table `category_media`
--

CREATE TABLE `category_media` (
  `id` int(11) NOT NULL,
  `image` varchar(30) NOT NULL,
  `label` varchar(30) DEFAULT NULL,
  `icon` varchar(10) DEFAULT NULL,
  `base` varchar(10) DEFAULT NULL,
  `banner` varchar(10) DEFAULT NULL,
  `active` varchar(10) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_media`
--

INSERT INTO `category_media` (`id`, `image`, `label`, `icon`, `base`, `banner`, `active`, `categoryId`) VALUES
(1, 'Banner-1.jpg', 'Bedset', '0', '1', '1', '0', 17),
(4, 'Banner-2.png', 'Sofa', '0', '0', '1', '0', 17),
(5, 'Banner-3.jpg', 'Sofaset', '0', '0', '1', '0', 17),
(6, 'Banner-4.jpg', 'Living Rooom', '0', '0', '1', '0', 17),
(15, 'game-room.jpg', 'game-room', '0', '1', '0', '0', 5),
(16, 'Accessories.jpg', 'Assessories', '0', '1', '0', '0', 6),
(17, 'bedroom.jpg', 'bedroom', '0', '1', '0', '0', 1),
(18, 'Living-room.jpg', 'Living-room', '0', '1', '0', '0', 2),
(19, 'kitchen.jpg', 'Kitchen', '0', '1', '0', '0', 3),
(22, 'outdoor.jpg', 'outdoor', '0', '1', '0', '0', 7),
(23, 'office.png', 'Office', '0', '1', '0', '0', 4);

-- --------------------------------------------------------

--
-- Table structure for table `cms_page`
--

CREATE TABLE `cms_page` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `identifier` varchar(30) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `status` varchar(10) NOT NULL,
  `createdat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms_page`
--

INSERT INTO `cms_page` (`id`, `title`, `identifier`, `content`, `status`, `createdat`) VALUES
(1, 'Anything', 'anything', 'any', 'Enabled', '2021-03-07 14:03:53'),
(15, 'About us', 'about us', '<b>                                                                                                         <u>About us</u></b>', 'Disabled', '2021-03-16 02:08:05');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(20) NOT NULL,
  `firstname` varchar(15) NOT NULL,
  `lastname` varchar(15) NOT NULL,
  `email` varchar(35) NOT NULL,
  `password` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `createdat` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `firstname`, `lastname`, `email`, `password`, `status`, `group_id`, `createdat`, `updatedat`) VALUES
(3, 'Manish bhai', 'Parmar', 'm@gmail.com', 'm123', 'Disabled', 1, '2021-03-14 01:37:59', '2021-03-27 09:02:56'),
(4, 'TILAK', 'PANDYA', 'tilakpandya2@gmail.com', 'anything', 'Enabled', 3, '2021-03-14 10:35:07', '2021-03-14 15:05:07'),
(5, 'Rakesh', 'Patel', 'rakesh@gmail.com', 'rakesh123', 'Disabled', 1, '2021-03-14 10:57:25', '2021-03-14 15:27:25'),
(6, 'Pradipbhai', 'Pandya', 'p@gmail.com', 'pandya', 'Disabled', 1, '2021-03-16 02:03:12', '2021-03-16 06:33:12'),
(7, 'Saloni', 'sindhi', 'salono@gmail.com', 'saloni123', 'Enabled', 1, '2021-03-22 01:11:47', '2021-03-22 05:41:47'),
(8, 'Shailesh', 'Prajapati', 'shaileshprajapati@gmail.com', 'shailesh123', 'Enabled', NULL, '2021-03-30 02:11:17', '2021-03-30 05:41:18');

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `id` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `country` varchar(30) NOT NULL,
  `addressType` varchar(15) NOT NULL,
  `customerId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`id`, `address`, `city`, `state`, `zipcode`, `country`, `addressType`, `customerId`) VALUES
(19, '7, kishor nagari, pij road', 'Nadiad', 'Gujarat456', '387002', 'India', 'Shipping', 3),
(20, '6, kadam nagari, pij road', 'Nadiad', 'Gujarat123', '387002', 'India', 'Billing', 3),
(23, '10, Akash flats, ACP road', 'Anand', 'Gujarat', '123123', 'India', 'Shipping', 5),
(24, '10, kishor nagari, pij road', 'Anand', 'Gujarat', '387002', 'India', 'Billing', 5),
(32, '101, Mahendra Society', 'Mehsana', 'Maharashtra', '986001', 'India', 'Shipping', 4),
(33, '5,Ganesh ji society', 'Anand', 'gujarat', '12345', 'India', 'Billing', 4),
(34, '16/A, krishna bunglows', 'baroda', 'gujarat', '345001', 'India', 'Billing', 7),
(35, '10, radha flats, ABC flats', 'Ahmedabad', 'Gujarat', '123456', 'India', 'Shipping', 7),
(36, '80/G, Virat Society', 'Ludhiana', 'Punjab', '435008', 'India', 'Billing', 6);

-- --------------------------------------------------------

--
-- Table structure for table `customer_group`
--

CREATE TABLE `customer_group` (
  `id` int(20) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Default` int(1) DEFAULT NULL,
  `createdat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_group`
--

INSERT INTO `customer_group` (`id`, `Name`, `Default`, `createdat`) VALUES
(1, 'Retailer', 0, '2021-03-02 03:01:44'),
(2, 'Wholesaler', 1, '2021-03-02 03:02:00'),
(3, 'GroupExample', 1, '2021-03-09 07:34:27');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) NOT NULL,
  `label` varchar(10) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `thumbnail` varchar(10) DEFAULT NULL,
  `base` varchar(10) DEFAULT NULL,
  `small` varchar(10) DEFAULT NULL,
  `gallery` varchar(10) NOT NULL,
  `productId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `label`, `image`, `thumbnail`, `base`, `small`, `gallery`, `productId`) VALUES
(38, 'Bedset', 'bedroom.jpg', '1', '0', '1', '1', 1),
(39, 'sofaset', 'Living-room.jpg', '1', '1', '1', '0', 2),
(40, 'bedroom', 'bedroom1.jpg', '1', '0', '0', '0', 3),
(41, 'sofaset', 'Category-Living.jpg', '1', '0', '0', '0', 4),
(42, 'furniture', 'furniture.jpg', '1', '1', '0', '0', 5),
(43, 'Cupboard', 'cupboard.jpg', '1', '0', '0', '0', 6),
(44, 'Dinning', 'dinning.jpg', '1', '0', '0', '0', 7),
(45, 'Office', 'office.png', '1', '0', '0', '0', 8),
(46, 'bedroom', 'bedroom1.jpg', '1', '0', '0', '0', 9),
(47, 'Accessorie', 'Accessories.jpg', '1', '0', '0', '0', 10),
(48, 'Bedset 2', 'bedroom1.jpg', '0', '0', '0', '0', 1),
(49, 'bed ', 'bed1.jpg', '0', '1', '0', '0', 1),
(50, NULL, 'bed2.jpg', NULL, NULL, NULL, '', 4),
(51, NULL, 'furniture.jpg', NULL, NULL, NULL, '', 4),
(52, NULL, 'furniture.jpg', NULL, NULL, NULL, '', 2),
(53, NULL, 'Category-Living.jpg', NULL, NULL, NULL, '', 2),
(54, NULL, 'cupboard.jpg', NULL, NULL, NULL, '', 6),
(55, NULL, 'office.png', NULL, NULL, NULL, '', 6),
(56, NULL, 'game-room.jpg', NULL, NULL, NULL, '', 7),
(57, NULL, 'outdoor.jpg', NULL, NULL, NULL, '', 7),
(58, NULL, 'office.jpg', NULL, NULL, NULL, '', 8),
(59, NULL, 'Accessories.jpg', NULL, NULL, NULL, '', 8),
(60, NULL, 'bed1.jpg', NULL, NULL, NULL, '', 9),
(61, NULL, 'bed2.jpg', NULL, NULL, NULL, '', 9),
(62, NULL, 'cupboard.jpg', NULL, NULL, NULL, '', 10),
(63, NULL, 'bed1.jpg', NULL, NULL, NULL, '', 11),
(64, NULL, 'bed2.jpg', NULL, NULL, NULL, '', 11),
(65, NULL, 'bed3.jpg', NULL, NULL, NULL, '', 11),
(66, NULL, 'bed3.jpg', NULL, NULL, NULL, '', 12),
(67, NULL, 'bed2.jpg', NULL, NULL, NULL, '', 12),
(68, NULL, 'bed1.jpg', NULL, NULL, NULL, '', 12),
(69, '', 'bed2.jpg', '0', '0', '0', '0', 13),
(70, NULL, 'bed1.jpg', NULL, NULL, NULL, '', 13),
(71, NULL, 'bed3.jpg', NULL, NULL, NULL, '', 13),
(72, NULL, 'bedroom1.jpg', NULL, NULL, NULL, '', 14),
(73, NULL, 'bed2.jpg', NULL, NULL, NULL, '', 14),
(74, NULL, 'bedroom.jpg', NULL, NULL, NULL, '', 15),
(75, NULL, 'bed1.jpg', NULL, NULL, NULL, '', 15),
(76, NULL, 'bed3.jpg', NULL, NULL, NULL, '', 16),
(77, NULL, 'bed2.jpg', NULL, NULL, NULL, '', 16),
(78, NULL, 'bed1.jpg', NULL, NULL, NULL, '', 17),
(79, NULL, 'bed3.jpg', NULL, NULL, NULL, '', 17),
(80, NULL, 'bedroom.jpg', NULL, NULL, NULL, '', 18),
(81, NULL, 'bedroom1.jpg', NULL, NULL, NULL, '', 19);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `orderId` int(11) NOT NULL,
  `customerId` int(11) DEFAULT NULL,
  `customerName` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `paymentMethodId` int(11) DEFAULT NULL,
  `paymentMethodName` varchar(20) NOT NULL,
  `shippingMethodId` int(11) DEFAULT NULL,
  `shippingMethodName` varchar(30) NOT NULL,
  `shippingMethodCode` varchar(20) NOT NULL,
  `shippingCharges` int(11) NOT NULL,
  `shippingAmount` int(11) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_address`
--

CREATE TABLE `order_address` (
  `orderAddressId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `addressId` int(11) DEFAULT NULL,
  `addressType` varchar(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `zipcode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `orderItemId` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `productName` varchar(60) NOT NULL,
  `quantity` int(11) NOT NULL,
  `basePrice` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `createdat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL,
  `createdat` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedat` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `name`, `code`, `description`, `status`, `createdat`, `updatedat`) VALUES
(2, 'Credit Card', 'credit', 'Credit Card', 'Enabled', '2021-02-17 07:09:05', '2021-02-19 09:52:19'),
(3, 'Debit Card', 'Debit', 'Debit Card', 'Enabled', '2021-02-17 07:11:23', '2021-02-19 09:52:19'),
(4, 'Paypal', 'paypal', 'Paypal', 'Enabled', '2021-02-17 07:14:36', '2021-03-22 18:47:31'),
(8, 'Cash on delivery', 'COD', 'Cash on delivery', 'Enabled', '2021-04-01 05:29:26', '2021-04-01 07:29:26');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(7) NOT NULL,
  `createdat` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedat` timestamp NOT NULL DEFAULT current_timestamp(),
  `color` varchar(15) DEFAULT NULL,
  `collection` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `sku`, `name`, `price`, `discount`, `quantity`, `description`, `status`, `createdat`, `updatedat`, `color`, `collection`, `brand`) VALUES
(1, 'B720-57-54-96;B720-92', 'Birlanny Silver Upholstered Panel Bedroom', '1496.00', '10.00', 3, 'Lose yourself in luxury with this Brilanny Silver Upholstered Panel Bedroom Set, created by the master furniture crafters of Signature Design by Ashley.', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(2, 'B733-77-74-98;B733-92', 'Lettner Light Gray Sleigh Bedroom Set', '731.70', '10.00', 3, 'Part of Lettner Collection from Ashley.Crafted fom select birch veneers and hardwood solids.Burnished light gray finish.Nightstand, Dresser & Chest features patinated silver color knob and back plate drawers, Dovetail Drawer Construction , color finish drawer interior, ball bearing drawer glides & felt drawer bottoms on select drawers', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(3, '?B647-54-77-96;B647-191', 'Bolanburg White Louvered Panel Bedroom Set', '819.30', '10.00', 3, 'Part of Bolanburg Collection.Crafted from acacia veneers and solids.Textured antique white finish.Shelter style panel bed.Louvered design', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(4, 'B647-54-77-96;B647-192', 'Bolanburg White Panel Bedroom Set ', '1100.00', '10.00', 3, 'Part of Tashay Collection from ACME Furniture.Upholstered in green fabric.Weather wicker frame.Square side table.', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(5, 'B647-54-77-96;B647-193', 'Lettner Light Gray Panel Storage Bedroom Set ', '2100.00', '10.00', 3, 'Grace your room with the opulence of the birlanny bed. Carved mouldings curving around the top and bottom along with fluted pilasters', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(6, 'B647-54-77-96;B647-194', 'Lettner Light Gray Panel Bedroom Set ', '230.00', '10.00', 3, 'Cypress Point Ocean Terrace features a distinctive V-pattern of all-weather woven wicker, aluminum frames in a custom aged iron finish?', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(7, 'B647-54-77-96;B647-195', 'Magnolia Manor Antique White Upholstered Panel Bed', '500.00', '10.00', 3, 'Grace your room with the opulence of the birlanny bed. Carved mouldings curving around the top and bottom along with fluted pilasters', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(8, 'B647-54-77-96;B647-196', 'Mirage Panel Bedroom Set ', '490.00', '10.00', 3, 'Designs in Island Estate Lanai celebrate the natural beauty and classic look of woven wicker.?', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(9, 'B647-54-77-96;B647-197', 'Cassimore Pearl Silver Panel Bedroom Set ', '2300.00', '10.00', 3, 'Part of Tashay Collection from ACME Furniture.Upholstered in green fabric.Weather wicker frame.Square side table.', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(10, 'B647-54-77-96;B647-198', 'Cassimore North Shore Pearl Silver Panel Bedroom S', '1167.08', '10.00', 3, 'Accent a room with the bolanburg bed that exudes a mix of styles including shabby chic casual cottage and a touch of down home country.?', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(11, 'B647-54-77-96;B647-199', 'North Shore Panel Bedroom Set ', '1183.45', '10.00', 3, 'Lose yourself in luxury with this Brilanny Silver Upholstered Panel Bedroom Set, created by the master furniture crafters of Signature Design by Ashley.', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(12, 'B647-54-77-96;B647-200', 'North Shore Sleigh Bedroom Set ', '1199.82', '10.00', 3, 'Accent a room with the bolanburg bed that exudes a mix of styles including shabby chic casual cottage and a touch of down home country.?', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(13, 'B647-54-77-96;B647-201', 'Flynnter Medium Brown Sleigh Storage Bedroom Set ', '1216.20', '10.00', 3, 'Grace your room with the opulence of the birlanny bed. Carved mouldings curving around the top and bottom along with fluted pilasters', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(14, 'B647-54-77-96;B647-202', 'Allyson Park Wire Brushed White Panel Bedroom Set ', '1232.57', '10.00', 3, 'Part of Lettner Collection from Ashley.Crafted fom select birch veneers and hardwood solids.Burnished light gray finish.Nightstand, Dresser & Chest features patinated silver color knob and back plate drawers, Dovetail Drawer Construction , color finish drawer interior, ball bearing drawer glides & felt drawer bottoms on select drawers', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(15, 'B647-54-77-96;B647-203', 'Seville Storage Bedroom Set ', '1248.94', '10.00', 3, 'Lose yourself in luxury with this Brilanny Silver Upholstered Panel Bedroom Set, created by the master furniture crafters of Signature Design by Ashley.', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(16, 'B647-54-77-96;B647-204', 'Tacoma Panel Bedroom Set ', '1265.31', '10.00', 3, 'Part of Tashay Collection from ACME Furniture.Upholstered in green fabric.Weather wicker frame.Square side table.', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(17, 'B647-54-77-96;B647-205', 'Linda Bookcase Storage Bedroom Set (Black) ', '1281.68', '10.00', 3, 'Accent a room with the bolanburg bed that exudes a mix of styles including shabby chic casual cottage and a touch of down home country.?', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(18, 'B647-54-77-96;B647-206', 'Lyssa Panel Bedroom Set ', '1298.05', '10.00', 3, 'Designs in Island Estate Lanai celebrate the natural beauty and classic look of woven wicker.?', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(19, 'B647-54-77-96;B647-207', 'Crown Mark Furniture Emily Captain\'s Bedroom Set i', '1314.43', '10.00', 3, 'Part of Bolanburg Collection.Crafted from acacia veneers and solids.Textured antique white finish.Shelter style panel bed.Louvered design', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(20, 'B647-54-77-96;B647-208', 'Naples White Lacquer Platform Bedroom Set ', '1330.80', '10.00', 3, 'Cypress Point Ocean Terrace features a distinctive V-pattern of all-weather woven wicker, aluminum frames in a custom aged iron finish?', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(21, 'B647-54-77-96;B647-209', 'Celandine Silver Panel Bedroom Set ', '1347.17', '10.00', 3, 'Part of Lettner Collection from Ashley.Crafted fom select birch veneers and hardwood solids.Burnished light gray finish.Nightstand, Dresser & Chest features patinated silver color knob and back plate drawers, Dovetail Drawer Construction , color finish drawer interior, ball bearing drawer glides & felt drawer bottoms on select drawers', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(22, 'B647-54-77-96;B647-210', 'Sheffield Panel Bedroom Set (Antique Grey) ', '1363.54', '10.00', 3, 'Accent a room with the bolanburg bed that exudes a mix of styles including shabby chic casual cottage and a touch of down home country.?', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(23, 'B647-54-77-96;B647-211', 'Farrow Panel Bedroom Set (Chocolate) ', '1379.91', '10.00', 3, 'Grace your room with the opulence of the birlanny bed. Carved mouldings curving around the top and bottom along with fluted pilasters', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(24, 'B647-54-77-96;B647-212', 'Stanley Sleigh Bedroom Set ', '1396.28', '10.00', 3, 'Part of Tashay Collection from ACME Furniture.Upholstered in green fabric.Weather wicker frame.Square side table.', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(25, 'B647-54-77-96;B647-213', 'Turin Light Grey and Black Lacquer Platform Bedroo', '1412.66', '10.00', 3, 'Lose yourself in luxury with this Brilanny Silver Upholstered Panel Bedroom Set, created by the master furniture crafters of Signature Design by Ashley.', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(26, 'B647-54-77-96;B647-214', 'Global Furniture Hudson Platform Bedroom Set in Ze', '1429.03', '10.00', 3, 'Designs in Island Estate Lanai celebrate the natural beauty and classic look of woven wicker.?', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(27, 'B647-54-77-96;B647-215', 'Bracco Brown Platform Storage Bedroom Set ', '1445.40', '10.00', 3, 'Cypress Point Ocean Terrace features a distinctive V-pattern of all-weather woven wicker, aluminum frames in a custom aged iron finish?', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(28, 'B647-54-77-96;B647-216', 'Lucca Black Lacquer Platform Bedroom Set ', '1461.77', '10.00', 3, 'Part of Lettner Collection from Ashley.Crafted fom select birch veneers and hardwood solids.Burnished light gray finish.Nightstand, Dresser & Chest features patinated silver color knob and back plate drawers, Dovetail Drawer Construction , color finish drawer interior, ball bearing drawer glides & felt drawer bottoms on select drawers', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(29, 'B647-54-77-96;B647-217', 'Global Furniture Linda/8269 Platform Bedroom Set i', '1478.14', '10.00', 3, 'Part of Bolanburg Collection.Crafted from acacia veneers and solids.Textured antique white finish.Shelter style panel bed.Louvered design', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(30, 'B647-54-77-96;B647-218', 'Barcelona Platform Bedroom Set ', '1494.51', '10.00', 3, 'Lose yourself in luxury with this Brilanny Silver Upholstered Panel Bedroom Set, created by the master furniture crafters of Signature Design by Ashley.', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(31, 'B647-54-77-96;B647-219', 'Madison II Bookcase Storage Bedroom Set ', '1510.89', '10.00', 3, 'Lose yourself in luxury with this Brilanny Silver Upholstered Panel Bedroom Set, created by the master furniture crafters of Signature Design by Ashley.', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(32, 'B647-54-77-96;B647-220', 'Madison Espresso Platform Bedroom Set ', '1527.26', '10.00', 3, 'Cypress Point Ocean Terrace features a distinctive V-pattern of all-weather woven wicker, aluminum frames in a custom aged iron finish?', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(33, 'B647-54-77-96;B647-221', 'Albright Driftwood Gray Upholstered Bedroom Set ', '1543.63', '10.00', 3, 'Designs in Island Estate Lanai celebrate the natural beauty and classic look of woven wicker.?', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(34, 'B647-54-77-96;B647-222', 'Janeiro Rustic Natural Bedroom Set ', '1560.00', '10.00', 3, 'Part of Bolanburg Collection.Crafted from acacia veneers and solids.Textured antique white finish.Shelter style panel bed.Louvered design', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(35, 'B647-54-77-96;B647-223', 'Porto Natural Light Grey Lacquer Platform Bedroom ', '1576.37', '10.00', 3, 'Grace your room with the opulence of the birlanny bed. Carved mouldings curving around the top and bottom along with fluted pilasters', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(36, 'B647-54-77-96;B647-224', 'Balfour Brown Cherry Panel Storage Bedroom Set ', '1592.74', '10.00', 3, 'Lose yourself in luxury with this Brilanny Silver Upholstered Panel Bedroom Set, created by the master furniture crafters of Signature Design by Ashley.', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(37, 'B647-54-77-96;B647-225', 'Marley Sleigh Bedroom Set (Silver) ', '1609.12', '10.00', 3, 'Part of Lettner Collection from Ashley.Crafted fom select birch veneers and hardwood solids.Burnished light gray finish.Nightstand, Dresser & Chest features patinated silver color knob and back plate drawers, Dovetail Drawer Construction , color finish drawer interior, ball bearing drawer glides & felt drawer bottoms on select drawers', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(38, 'B647-54-77-96;B647-226', 'Flandreau Brown Panel Bedroom Set ', '1625.49', '10.00', 3, 'Lose yourself in luxury with this Brilanny Silver Upholstered Panel Bedroom Set, created by the master furniture crafters of Signature Design by Ashley.', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(39, 'B647-54-77-96;B647-227', 'Deryn Park Poster Bedroom Set ', '1641.86', '10.00', 3, 'Part of Bolanburg Collection.Crafted from acacia veneers and solids.Textured antique white finish.Shelter style panel bed.Louvered design', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(40, 'B647-54-77-96;B647-228', 'Braga Natural Grey Lacquer Platform Bedroom Set ', '1658.23', '10.00', 3, 'With designs highlighted by sweeping contours and graceful lines, the Pavlova collections offers a fresh interpretation of classic contemporary styling.?', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(41, 'B647-54-77-96;B647-229', 'Platinum Legno Bedroom Set ', '1674.60', '10.00', 3, 'Savor every moment outdoors with this contemporary dining set. Designed with gorgeous natural eucalyptus wood for value and versatility, friends and family will spend hours in one of the four comfy armchairs that surround its generous dining table.', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(42, 'B647-54-77-96;B647-230', 'Barocco Bedroom Set (Ivory) ', '1690.97', '10.00', 3, 'Part of Tashay Collection from ACME Furniture.Upholstered in green fabric.Weather wicker frame.Square side table.', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(43, 'B647-54-77-96;B647-231', 'Royal Highlands Rich Cherry Panel Bedroom Set ', '1707.35', '10.00', 3, 'Part of Tashay Collection from ACME Furniture.Upholstered in green fabric.Weather wicker frame.Square side table.', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(44, 'B647-54-77-96;B647-232', 'Tamblin Panel Bedroom Set ', '1723.72', '10.00', 3, 'Savor every moment outdoors with this contemporary dining set. Designed with gorgeous natural eucalyptus wood for value and versatility, friends and family will spend hours in one of the four comfy armchairs that surround its generous dining table.', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(45, 'B647-54-77-96;B647-233', 'Sanremo B Platform Bedroom Set ', '1740.09', '10.00', 3, 'Part of Tashay Collection from ACME Furniture.Upholstered in green fabric.Weather wicker frame.Square side table.', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(46, 'B647-54-77-96;B647-234', 'Cotterill Cherry Panel Bedroom Set ', '1756.46', '10.00', 3, 'Cypress Point Ocean Terrace features a distinctive V-pattern of all-weather woven wicker, aluminum frames in a custom aged iron finish?', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(47, 'B647-54-77-96;B647-235', 'Rhapsody Brown Panel Bedroom Set ', '1772.83', '10.00', 3, 'Designs in Island Estate Lanai celebrate the natural beauty and classic look of woven wicker.?', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(48, 'B647-54-77-96;B647-236', 'Ireland White Youth Bookcase Storage Bedroom Set', '1789.20', '10.00', 3, 'With designs highlighted by sweeping contours and graceful lines, the Pavlova collections offers a fresh interpretation of classic contemporary styling.?', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(49, 'B647-54-77-96;B647-237', 'Paris Light Gray Platform Bedroom Set ', '1805.58', '10.00', 3, 'Part of Tashay Collection from ACME Furniture.Upholstered in green fabric.Weather wicker frame.Square side table.', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(50, 'B647-54-77-96;B647-238', 'Louis Philippe Antique Gray Sleigh Bedroom Set ', '1821.95', '10.00', 3, 'Savor every moment outdoors with this contemporary dining set. Designed with gorgeous natural eucalyptus wood for value and versatility, friends and family will spend hours in one of the four comfy armchairs that surround its generous dining table.', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', NULL, NULL, NULL),
(51, 'B647-54-77-96;B647-289', 'Aviano Chaise Lounge ', '2656.90', '10.00', 3, 'With designs highlighted by sweeping contours and graceful lines, the Pavlova collections offers a fresh interpretation of classic contemporary styling.?', '1', '2021-03-18 08:42:14', '2021-03-18 08:42:14', '36', '32', ' brand1');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `productId`, `categoryId`) VALUES
(4, 1, 9),
(5, 1, 10),
(6, 2, 9),
(7, 2, 10),
(8, 3, 9),
(9, 3, 10),
(10, 3, 11),
(11, 4, 10),
(12, 4, 11),
(13, 4, 12),
(14, 4, 13),
(15, 5, 11),
(16, 5, 12),
(17, 5, 13),
(18, 5, 14),
(19, 6, 12),
(20, 6, 13),
(21, 6, 14),
(22, 6, 15),
(23, 6, 9),
(24, 6, 10),
(25, 6, 11),
(26, 7, 13),
(27, 7, 14),
(28, 7, 15),
(29, 7, 16),
(30, 8, 14),
(31, 8, 15),
(32, 8, 16),
(33, 8, 17),
(34, 8, 15),
(37, 8, 18),
(42, 16, 11),
(43, 16, 12),
(44, 16, 13),
(46, 9, 15),
(47, 9, 16),
(48, 9, 17),
(49, 9, 18),
(50, 10, 15),
(51, 10, 16),
(52, 10, 17),
(53, 10, 18),
(54, 11, 15),
(55, 11, 16),
(56, 11, 17),
(57, 11, 18),
(58, 11, 15),
(59, 11, 16),
(60, 11, 17),
(61, 11, 18),
(62, 12, 15),
(63, 12, 16),
(64, 12, 17),
(65, 12, 18),
(66, 12, 15),
(67, 12, 16),
(68, 12, 17),
(69, 12, 18),
(70, 13, 15),
(71, 13, 16),
(72, 14, 17),
(73, 14, 18),
(74, 14, 15),
(75, 14, 16),
(76, 15, 17),
(77, 15, 18),
(78, 5, 9),
(79, 10, 9);

-- --------------------------------------------------------

--
-- Table structure for table `product_customer_group_price`
--

CREATE TABLE `product_customer_group_price` (
  `entityId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `customerGroupId` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_customer_group_price`
--

INSERT INTO `product_customer_group_price` (`entityId`, `productId`, `customerGroupId`, `price`) VALUES
(47, 1, 1, 19000),
(48, 1, 2, 15000),
(49, 1, 3, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `id` int(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `code` varchar(10) NOT NULL,
  `amount` varchar(10) NOT NULL,
  `description` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL,
  `createdat` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`id`, `name`, `code`, `amount`, `description`, `status`, `createdat`, `updatedat`) VALUES
(1, 'Express Delivery ', 'Express ', ' 300', 'Express Delivery ', 'Enabled', '2021-02-17 06:20:02', '2021-02-27 04:44:27'),
(2, 'Platinum Delivery', 'Platinum', '150', 'Platinum Delivery', 'Enabled', '2021-02-25 06:20:02', '2021-02-20 06:46:35'),
(3, 'Free Delivery', 'free', '00', 'Free Delivery', 'Enabled', '2021-02-17 06:37:44', '2021-02-20 06:46:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_option`
--
ALTER TABLE `attribute_option`
  ADD PRIMARY KEY (`optionId`),
  ADD KEY `attribute_option_ibfk_1` (`attributeId`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartId`);

--
-- Indexes for table `cart_address`
--
ALTER TABLE `cart_address`
  ADD PRIMARY KEY (`cartAddressId`);

--
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`cartItemId`),
  ADD KEY `cartId` (`cartId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parentId` (`parentId`);

--
-- Indexes for table `category_media`
--
ALTER TABLE `category_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indexes for table `cms_page`
--
ALTER TABLE `cms_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identifier` (`identifier`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_ibfk_1` (`group_id`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_address_ibfk_1` (`customerId`);

--
-- Indexes for table `customer_group`
--
ALTER TABLE `customer_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `order_address`
--
ALTER TABLE `order_address`
  ADD PRIMARY KEY (`orderAddressId`),
  ADD KEY `orderId` (`orderId`),
  ADD KEY `addressId` (`addressId`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`orderItemId`),
  ADD KEY `productId` (`productId`),
  ADD KEY `order_item_ibfk_1` (`orderId`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_category_ibfk_2` (`productId`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indexes for table `product_customer_group_price`
--
ALTER TABLE `product_customer_group_price`
  ADD PRIMARY KEY (`entityId`),
  ADD KEY `product_customer_group_price_ibfk_1` (`customerGroupId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `attribute`
--
ALTER TABLE `attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `attribute_option`
--
ALTER TABLE `attribute_option`
  MODIFY `optionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart_address`
--
ALTER TABLE `cart_address`
  MODIFY `cartAddressId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `category_media`
--
ALTER TABLE `category_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `cms_page`
--
ALTER TABLE `cms_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `customer_group`
--
ALTER TABLE `customer_group`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_address`
--
ALTER TABLE `order_address`
  MODIFY `orderAddressId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `orderItemId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `product_customer_group_price`
--
ALTER TABLE `product_customer_group_price`
  MODIFY `entityId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `shipping`
--
ALTER TABLE `shipping`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_option`
--
ALTER TABLE `attribute_option`
  ADD CONSTRAINT `attribute_option_ibfk_1` FOREIGN KEY (`attributeId`) REFERENCES `attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`cartId`) REFERENCES `cart` (`cartId`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `category_media`
--
ALTER TABLE `category_media`
  ADD CONSTRAINT `category_media_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `customer_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD CONSTRAINT `customer_address_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_3` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_address`
--
ALTER TABLE `order_address`
  ADD CONSTRAINT `order_address_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`),
  ADD CONSTRAINT `order_address_ibfk_2` FOREIGN KEY (`addressId`) REFERENCES `customer_address` (`id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Constraints for table `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `product_category_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_category_ibfk_3` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_customer_group_price`
--
ALTER TABLE `product_customer_group_price`
  ADD CONSTRAINT `product_customer_group_price_ibfk_1` FOREIGN KEY (`customerGroupId`) REFERENCES `customer_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_customer_group_price_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
