-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.21 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table shopping.brands
CREATE TABLE IF NOT EXISTS `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopping.brands: ~7 rows (approximately)
DELETE FROM `brands`;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` (`id`, `name`, `description`, `logo`, `banner`, `active`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Dell', 'Dell', '/uploads/207AR4D2wW.png', '/uploads/z2UVh6glsi.png', 1, 0, 0, '2018-11-06 15:44:41', '2018-12-14 06:54:54'),
	(2, 'HP', 'hp  afaf', '/uploads/C4h5WoFTDT.png', '/uploads/dXk8jwCj1C.png', 1, 0, 0, '2018-11-06 15:48:53', '2018-12-14 06:55:07'),
	(4, 'Lenovo', 'Lenovo', '/uploads/aaVnJKkKcE.png', '/uploads/hecsyHLPCT.png', 1, 0, 0, '2018-11-06 15:59:05', '2018-12-14 07:07:30'),
	(5, 'Asus', 'Asus', '/uploads/TI6dpyYgfJ.png', '/uploads/r0JfiEJP15.png', 1, 0, 0, '2018-11-06 15:59:29', '2018-12-14 07:10:39'),
	(6, 'Acer', 'Acer', '/uploads/PFkcEo5vgN.png', '/uploads/7vonFM8x9p.png', 1, 0, 0, '2018-11-06 16:00:25', '2018-12-14 07:21:02'),
	(7, 'Alienware', 'Alienware', '/uploads/VpawmGtbej.png', '/uploads/EOnRdK7M58.png', 1, 0, 0, '2018-11-06 16:12:28', '2018-12-18 04:29:24'),
	(8, 'MSI', 'msi', '/uploads/6bX25iomwu.png', '/uploads/XaFsY0EcvZ.png', 1, 0, 0, '2018-12-11 07:21:25', '2018-12-24 03:49:57');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;

-- Dumping structure for table shopping.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopping.categories: ~6 rows (approximately)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `description`, `image`, `active`, `created_at`, `updated_at`) VALUES
	(4, 'Accessories', 'Hello', '/uploads/keJndL9AC7.png', 1, '2018-10-12 01:04:38', '2018-12-26 10:04:29'),
	(5, 'Gaming Laptop', 'Hardcore gamers', '/uploads/Tz8jirjPb4.png', 1, '2018-10-15 01:17:54', '2018-12-26 10:06:14'),
	(6, 'Laptop', 'Important', '/uploads/2wdoN0aq28.png', 1, '2018-10-15 01:18:18', '2018-12-26 10:01:52'),
	(7, 'Desktop', 'Desktop computers', '/uploads/umWor0Dphb.png', 1, '2018-10-15 01:18:38', '2018-12-26 09:56:12'),
	(8, 'Tablet', 'Light and powerful', '/uploads/3FPztA6CAp.png', 1, '2018-10-15 01:19:00', '2018-12-26 09:57:28'),
	(9, 'Networking', 'Networking stuffs', '/uploads/VkUoZfmVTN.png', 1, '2018-10-16 01:39:09', '2018-12-26 09:56:51');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table shopping.category_wise_specifications
CREATE TABLE IF NOT EXISTS `category_wise_specifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `specification_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopping.category_wise_specifications: ~19 rows (approximately)
DELETE FROM `category_wise_specifications`;
/*!40000 ALTER TABLE `category_wise_specifications` DISABLE KEYS */;
INSERT INTO `category_wise_specifications` (`id`, `category_id`, `specification_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(49, 8, 1, 0, 0, NULL, NULL),
	(50, 8, 2, 0, 0, NULL, NULL),
	(51, 8, 3, 0, 0, NULL, NULL),
	(52, 8, 6, 0, 0, NULL, NULL),
	(53, 8, 8, 0, 0, NULL, NULL),
	(54, 8, 5, 0, 0, NULL, NULL),
	(69, 7, 1, 0, 0, NULL, NULL),
	(70, 7, 4, 0, 0, NULL, NULL),
	(71, 7, 8, 0, 0, NULL, NULL),
	(151, 9, 6, 0, 0, NULL, NULL),
	(152, 9, 8, 0, 0, NULL, NULL),
	(153, 9, 7, 0, 0, NULL, NULL),
	(169, 6, 1, 0, 0, NULL, NULL),
	(170, 6, 2, 0, 0, NULL, NULL),
	(171, 6, 3, 0, 0, NULL, NULL),
	(172, 6, 4, 0, 0, NULL, NULL),
	(173, 6, 6, 0, 0, NULL, NULL),
	(174, 6, 10, 0, 0, NULL, NULL),
	(175, 6, 11, 0, 0, NULL, NULL);
/*!40000 ALTER TABLE `category_wise_specifications` ENABLE KEYS */;

-- Dumping structure for table shopping.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_dealer` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopping.customers: ~7 rows (approximately)
DELETE FROM `customers`;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`id`, `name`, `email`, `password`, `phone`, `company`, `country`, `state`, `address`, `is_dealer`, `active`, `created_at`, `updated_at`) VALUES
	(1, 'YYY Hasan', 'yyy@ppp.com', '$2y$10$9SIFcthRDsxaBBoLx5jIVOyoiVdhlAKimFAvQjBP8jGA5wbLjyUU6', '08043146670', 'KJS', 'Japan', 'Miyazaki', 'Kiyotake, Kano', 1, 1, '2018-11-22 23:49:11', '2018-11-23 00:12:00'),
	(2, 'Golam Mahmud Rafi', 'rafi.aust@live.com', '$2y$10$HHkNjD8iM80dTsEsWO/xt.N8CoAf.aXF4IwcV69GuBFjyPa1999Gm', '08043146670', 'KJS', 'Japan', 'Miyazaki', 'Kiyotake-oho, Kano otsu', 0, 1, '2018-11-23 00:35:13', '2018-11-23 00:35:13'),
	(3, 'Administrator', 'admin@admin.net', '$2y$10$FJzsL2/f/S5gQL0Ccv4Zq.kwSi2KFo9r6hAUdBRb4lY8RrRnZnoT2', '08043146670', 'Intelle Hub', 'Bangladesh', 'Dhaka', 'Mohammadpur', 1, 1, '2018-11-23 01:58:37', '2018-11-23 03:29:07'),
	(4, 'YYY', 'yyy@yyy.yyy', '$2y$10$jIcxxeE5wnH5C5E7kpWVmuIZe9I7PgLUA0buIKLPpOnSkmgv0PhtO', '08046464646`', 'company', 'country', 'state', 'address', 1, 1, '2018-11-23 03:41:24', '2018-12-09 09:01:00'),
	(5, 'Md Salahuddin', 'sacse2010@gmail.com', '$2y$10$ZyJCeOXoDQ83CTBiGKtDN.3it4rRONFfxM.SparCEbP2V5tSFfi1C', '+60176384317', 'goTechBD', 'BD', 'Dhaka', 'Gulshan2', 1, 1, '2018-11-23 14:59:41', '2018-11-23 15:00:43'),
	(6, 'Mohammad Ariful Islam', 'rosearif2002@gmail.com', '$2y$10$.WOh/ubMYW6uludfzEZAAOzRJBqr3X08EE.EbnyAe0jK4DcjHAvOO', '+601121695589', 'Bishwobazar', 'Malaysia', 'Kuala Lumpur', 'Sunway Pyramid, Unit 16, Digital Center, F1.39B, No. 3, Jalan PJS 11/15, Bandar Sunway, 47500 Subang Jaya, Selangor', 1, 1, '2018-12-09 08:12:17', '2018-12-09 08:43:14'),
	(7, 'MD SALAHUDDIN MOLLA', 'sacse2010@gmail.com', '$2y$10$8ZfkPaMWz5Ak8bxtHdHPfuXGJNmC66bi7kkDOA7IdQidkfMtgEQHe', '176384317', 'AGD IT Solution Sdn Bhd. Malaysia', 'Malaysia', 'Segumbat', 'Menara Duta 2, Jalan Dutamas,', 0, 1, '2018-12-14 03:05:21', '2018-12-14 03:05:21');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

-- Dumping structure for table shopping.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopping.migrations: ~16 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(49, '2014_10_12_000000_create_users_table', 1),
	(50, '2014_10_12_100000_create_password_resets_table', 1),
	(51, '2018_10_06_223920_create_categories_table', 1),
	(52, '2018_10_12_050910_create_sub_categories_table', 1),
	(53, '2018_10_14_101528_create_specifications_table', 1),
	(54, '2018_10_14_111345_create_category_wise_specifications_table', 1),
	(55, '2018_10_14_125045_create_brands_table', 1),
	(56, '2018_10_16_024751_create_product_wise_specifications_table', 1),
	(57, '2018_10_16_044305_create_products_table', 1),
	(58, '2018_11_11_131431_create_customers_table', 1),
	(59, '2018_11_12_010900_create_orders_table', 1),
	(60, '2018_11_12_014250_create_order_details_table', 1),
	(61, '2018_11_21_005212_create_quote_requests_table', 1),
	(62, '2019_01_26_041404_create_sellers_table', 1),
	(63, '2019_01_26_045238_create_purchases_table', 1),
	(64, '2019_01_26_051153_create_stocks_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table shopping.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `discount` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `billing_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopping.orders: ~0 rows (approximately)
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table shopping.order_details
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `cost_price` decimal(5,2) NOT NULL,
  `selling_price` decimal(5,2) NOT NULL,
  `discount` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopping.order_details: ~0 rows (approximately)
DELETE FROM `order_details`;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;

-- Dumping structure for table shopping.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopping.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table shopping.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condition` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `discount_price` decimal(8,2) NOT NULL,
  `more_info` longtext COLLATE utf8mb4_unicode_ci,
  `inside_box` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `new` tinyint(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopping.products: ~32 rows (approximately)
DELETE FROM `products`;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `name`, `category_id`, `sub_category_id`, `brand_id`, `description`, `image`, `reference`, `condition`, `price`, `discount_price`, `more_info`, `inside_box`, `active`, `new`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(57, 'MSI GL63-8RC-412', 6, 13, 8, '<ul style="box-sizing: border-box; list-style-position: initial; list-style-image: initial; margin-left: 20px; padding-left: 15px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><li style="box-sizing: border-box; list-style: disc; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">Intel® Core™ i5-8300H Processor</span></font></li><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">4GB DDR4 2400Mhz Ram</span></font></li><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">1TB 2.5" SATA HDD</span></font></li><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">GeForce® GTX 1050 with 4GB GDDR5</span></font></li><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">15.6" FHD (1920x1080), Wide-View</span></font></li><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">Windows 10 Home</span></font></li><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">2 Years MSI Warranty</span></font></li><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">Free MSI Loot Box</span></font></li></li></ul>', '/uploads/QPFsTZb0Cr.png', 'GL63-8RC-412', 'New', 3499.00, 319.00, '<img src="/uploads/jOzdr3xb.jpg">', '<ul><li>1 x&nbsp;MSI GF63 8RC-084 15.6" FHD Gaming Laptop<br></li><li>1 x Manual<br></li><li>1 x Power Adapter<br></li><li>1 x MSI Backpack<br></li></ul>', 1, 1, 0, 0, '2018-12-14 08:58:52', '2018-12-26 04:19:11'),
	(58, 'MSI GL63 8RD-410', 6, 13, 8, '<div><ul><li>Intel® Core™ i7-8750H Processor<br></li><li>8GB DDR4 Ram<br></li><li>1TB2.5" SATA HDD + 128GB M.2 SSD<br></li><li>Nvidia GeForce® GTX 1050 Ti with 4GB GDDR5<br></li><li>15.6" FHD (1920x1080), Wide-View<br></li><li>Windows 10 Home<br></li><li>2 Years MSI Warranty<br></li><li>Free MSI Loot Box<br></li></ul></div>', '/uploads/QeMrT5H4v3.png', 'GL63 8RD-410', 'New', 4599.00, 390.00, '<img src="/uploads/AuYod11h.jpg">', '<div><ul><li>1 x MSI GL63 8RD-410 15.6" FHD Gaming Laptop Black&nbsp;<br></li><li>1 x Power Adapter&nbsp;<br></li><li>1 x Manual&nbsp;<br></li><li>1 x MSI Backpack<br></li></ul></div>', 1, 1, 0, 0, '2018-12-14 09:04:23', '2018-12-26 04:18:18'),
	(59, 'MSI PS42-8RB-431', 6, 13, 8, '<ul style="box-sizing: border-box; list-style-position: initial; list-style-image: initial; margin-left: 20px; padding-left: 15px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><li style="box-sizing: border-box; list-style: disc; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">Intel® Core™ i7-8550U Processor</span></font></li><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">16GB DDR4 2400Mhz Ram</span></font></li><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">256GB M.2 NVMe PCIe SSD</span></font></li><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">Nvidia Geforce® MX150 with 2GB GDDR5</span></font></li><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">14.0" FHD (1920x1080), IPS-Level</span></font></li><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">Windows 10 Home</span></font></li><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">2 Years MSI Warranty</span></font></li></li></ul>', '/uploads/P8zogoNzm1.png', 'PS42-8RB-431', 'New', 4999.00, 200.00, '<img src="/uploads/StOKpt4t.jpg">', '<div><ul><li>1 x MSI PS42 8RB-431 14" FHD Laptop&nbsp;<br></li><li>1 x Power Adapter&nbsp;<br></li><li>1 x Manual&nbsp;<br></li><li>1 x MSI Bag<br></li></ul></div>', 1, 1, 0, 0, '2018-12-14 09:09:26', '2018-12-26 04:16:32'),
	(60, 'MSI GP63-8RD-409', 6, 13, 8, '<ul style="box-sizing: border-box; list-style-position: initial; list-style-image: initial; margin-left: 20px; padding-left: 15px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><li style="box-sizing: border-box; list-style: disc; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">Intel® Core™ i7-8750H Processor</span></font></li><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">8GB DDR4 Ram</span></font></li><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">1TB2.5" SATA HDD + 128GB M.2 SSD</span></font></li><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">Nvidia GeForce® GTX 1050 Ti with 4GB GDDR5</span></font></li><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">15.6" FHD (1920x1080), Wide-View</span></font></li><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">Windows 10 Home</span></font></li><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">2 Years MSI Warranty</span></font></li><li style="font-variant-numeric: inherit; font-variant-east-asian: inherit; box-sizing: border-box; list-style: disc; border: 0px; font-stretch: inherit; line-height: inherit; vertical-align: baseline; outline: 0px !important;"><font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;">Free MSI Loot Box</span></font></li></li></ul>', '/uploads/SH2Lt5LxCI.png', 'GP63-8RD-409', 'New', 4999.00, 410.00, '<img src="/uploads/VpgiVl16.jpg">', '<div><ul><li>1 x MSI GP63 8RD-409 15.6" FHD Gaming Laptop Black&nbsp;<br></li><li>1 x Power Adapter&nbsp;<br></li><li>1 x Manual&nbsp;<br></li><li>1 x MSI Backpack<br></li></ul></div>', 1, 1, 0, 0, '2018-12-14 09:14:06', '2018-12-26 04:17:38'),
	(73, 'DELL ALIENWARE CA17-8916158G-1080-QHD-SSD', 6, 17, 7, '<font color="#666666" face="Arial, Helvetica, sans-serif"><span style="font-size: 13px;"><div style=""><ul><li>CPU / ProcessorIntel(R) Core(TM) i9-8950HK (6-Core, 12MB Cache, Overclocking up to 5.0GHz)Memory16GB, 1x16GB, DDR4, 2666MHzMemory SlotTotal 2 ram slots, Maz up to 32GBStorage512GB PCIe M.2 SSD + 1TB 7200RPM HDDGraphic CardNVIDIA® GeForce® GTX 1080 OC with 8GB GDDR5XDisplay Screen / Design / Resolution17.3 inch QHD (2560 x 1440) 120Hz TN+WVA Anti-Glare 400-nits NVIDIA G-SYNC with Tobii Eye-trackingCameraAlienware HD+IR presence detection camera (Standard)<br></li><li>Alienware FHD camera for systems with Tobii IR Eye-tracking presence detection<br></li><li>Windows Hello technologyOperation SystemWindows 10 Home (64bit) Single Language EnglishOptical Drive-Audio &amp; VideoAlienware Sound Center and Audio Recon softwareNetwork / Connectivity TechnologyKiller 1550 802.11ac 2x2 WiFi and Bluetooth 5.0Interface1 x RJ-45 Killer Networks e2500 Gigabit Ethernet Port<br></li><li>1 x Type-A SuperSpeed USB 3.0 Port<br></li><li>1 x Type-A SuperSpeed USB 3.0 Port with PowerShare technology<br></li><li>1 x Type-C SuperSpeed USB 3.0 Port<br></li><li>1 x Thunderbolt™ 3 Port (USB Type-C™ with support for SuperSpeedBattery / Power SupplyLithium Ion (99 Wh) BatteryDimensionsHeight: 29.99 mm x Width: 424 mm x Depth: 332 mmWeight4.42 kgRemark1Yr Premium Support Plus:Onsite Service-Retail<br></li></ul></div></span></font>', '/uploads/5B9bYfk4UZ.png', 'CA17-8916158G', 'New', 15999.00, 1720.00, '<img src="/uploads/idMTYwBt.jpg">', '<ul><li>1 x&nbsp;Dell Alienware CA17-8916158G-1080 17.3" FHD Gaming Laptop<br></li><li>1 x Power Adapter<br></li><li>1 x Manual<br></li><li>1 x&nbsp;Alienware Vindicator-2.0 17" Backpack<br></li></ul>', 1, 1, 0, 0, '2018-12-14 12:16:58', '2018-12-26 04:57:45'),
	(74, 'DELL ALIENWARE CAV15-87816G-1060', 6, 17, 7, '<div><ul><li>Intel(R) Core(TM) i7-8750H (6-Core, 9MB Cache, up to 4.1GHz w/ Turbo Boost)<br></li><li>8GB, DDR4, 2400MHz Memory Slot Total 2 ram slots, Maz 32GB&nbsp;<br></li><li>Storage1TB 5400 rpm Hybrid Hard Drive 8GB Cache&nbsp;<br></li><li>Graphic Card NVIDIA GeForce GTX 1060 with 6GB GDDR5&nbsp;<br></li><li>Resolution15.6 inch FHD (1920 x 1080) 60Hz IPS Display<br></li><li>Camera HD+IR presence detection camera (Standard)<br></li><li>Windows 10 Home Single Language<br></li></ul></div>', '/uploads/JGqjIJHT9s.png', 'CAV15-87816G-1060', 'Regular', 7299.00, 520.00, '<img src="/uploads/M20Tdh42.png">', '<div><ul><li>1 x Dell Alienware CAV15-87816G-1060 15.6" FHD Gaming Laptop&nbsp;<br></li><li>1 x Power Adapter&nbsp;<br></li><li>1 x Manual&nbsp;<br></li><li>1 x Alienware Vindicator-2.0 15" Backpack<br></li></ul></div>', 1, 1, 0, 0, '2018-12-15 03:18:00', '2018-12-26 04:58:30'),
	(75, 'DELL ALIENWARE CAV17-87816G-1060', 6, 17, 7, '<ul><li>Intel(R) Core(TM) i7-8750H (6-Core, 9MB Cache, up to 4.1GHz w/ Turbo Boost)<br></li><li>8GB DDR4 at 2400MHz (1x8GB) Memory Slot Total 2 ram slots, Maz 32GB<br></li><li>1TB 5400 rpm Hybrid Hard Drive<br></li><li>8GB CacheGraphic Card NVIDIA GeForce GTX 1060 with 6GB GDDR5 graphics memory<br></li><li>17.3 inch FHD (1920 x 1080) 60Hz IPS Anti-Glare<br></li><li>Windows 10 Home Single Language, English, 64-bit<br></li><li>Alienware HD+IR presence detection camera&nbsp;<br></li><li>Type-C Super Speed USB 3.0 Port</li><li>HDMI 2.0&nbsp;</li></ul>', '/uploads/AVHcq46tUs.png', 'CAV17-87816G-1060', 'New', 7549.00, 650.00, '<img src="/uploads/tMLWEM68.png">', '<div><ul><li>1 x Dell Alienware CAV17-87816G-1060 17.3" FHD Gaming Laptop&nbsp;<br></li><li>1 x Power Adapter&nbsp;<br></li><li>1 x Manual&nbsp;<br></li><li>1 x Alienware Vindicator-2.0 17" Backpac<br></li></ul></div>', 1, 1, 0, 0, '2018-12-15 03:40:53', '2018-12-26 04:59:50'),
	(77, 'DELL VOSTRO  V5471-82412G-W10', 6, 18, 1, '<div><ul><li>Intel® Core™ i5-8250U Processor (6MB Cache, up to 3.4 GHz)<br></li><li>4GB DDR4 Memory (1x4GB) 2400MHz<br></li><li>1TB 5400 rpm SATA Hard Drive<br></li><li>AMD Radeon® 530 Graphics with 2G GDDR5<br></li><li>14.0-inch FHD (1920 x 1080) Anti-Glare LED-Backlit Display<br></li><li>Windows 10 Home Single Language 64bit English<br></li><li>1 Year Pro Support: Next Business Day Onsite Service-Retail<br></li></ul></div>', '/uploads/9blj5ho7kn.png', 'V5471-82412G-W10', 'New', 2999.00, 340.00, '<img src="/uploads/xNAdJjeC.jpg">', '<div><ul><li>1 x Dell Vostro V5471-82412G-W10 14" FHD Laptop Rose Gold&nbsp;<br></li><li>1 x Power Adapter&nbsp;<br></li><li>1 x Manual&nbsp;<br></li><li>1 x Dell Backpack<br></li></ul></div>', 1, 1, 0, 0, '2018-12-15 04:21:20', '2018-12-26 09:06:52'),
	(78, 'DELL INSPIRON G3 15 Gaming G3-83414GFHD-W10', 6, 18, 1, '<div><ul><li>Intel(R) Core(TM) i5-8300H Processor (Quad-Core, 8MB Cache, up to 3.9GHz w/ Turbo Boost)<br></li><li>4GB, 1x4GB, DDR4, 2666MHz<br></li><li>1TB 5400RPM Hard Drive<br></li><li>NVIDIA(R) GeForce(R) GTX 1050 with 4GB GDDR5 graphics memory<br></li><li>15.6-inch FHD (1920 x 1080) IPS Anti-Glare LED-Backlit Display<br></li><li>Windows 10 Home (64bit) Single Language<br></li><li>2 Year Premium Support:Onsite Service-Retail<br></li></ul></div>', '/uploads/G4uexK175c.png', 'G3-83414GFHD-W10', 'New', 3209.00, 110.00, '<img src="/uploads/g6fqjKW8.jpg">', '<div><ul><li>1 x Dell Inspiron G3 15 Gaming G3-83414GFHD-W10&nbsp;<br></li><li>1 x Manual&nbsp;<br></li><li>1 x Power Adapter&nbsp;<br></li><li>1 x Dell Backpack<br></li></ul></div>', 1, 1, 0, 0, '2018-12-15 04:29:41', '2018-12-26 09:07:36'),
	(79, 'DELL INSPIRON 15 7588 G7-83814GFHD-W10', 6, 18, 1, '<div><ul><li>Intel® Core™ i5-8300H Processor (Quad-Core, 8MB Cache, up to 3.9GHz w/ Turbo Boost)<br></li><li>8GB DDR4, 2666MHz<br></li><li>1TB 5400 rpm Hybrid Hard Drive with 8GB Cache<br></li><li>NVIDIA® GeForce® GTX 1050 with 4GB GDDR5 graphics memory<br></li><li>15.6-inch FHD (1920 x 1080) IPS Anti-Glare LED-Backlit Display<br></li><li>Windows 10 Home Single Language (64bit)<br></li><li>2 Year Premium Support:Onsite Service W/Accidental Damage-Retail<br></li></ul></div>', '/uploads/AAHjEkEa8j.png', 'G7-83814GFHD-W10', 'New', 3769.00, 180.00, '<img src="/uploads/QsXPCZ1x.jpg">', '<div><ul><li>1 x Dell Inspiron 15 7588 G7-83814GFHD-W10-1050 15.6" FHD IPS Laptop&nbsp;<br></li><li>1 x Manual&nbsp;<br></li><li>1 x Power Adapter&nbsp;<br></li><li>1 x Dell Gaming Backpack<br></li></ul></div>', 1, 1, 0, 0, '2018-12-15 04:44:10', '2018-12-26 09:09:00'),
	(80, 'DELL INSPIRON 13 5370-25422G-W10', 6, 18, 1, '<div><ul><li>Intel(R) Core(TM) i5-8250U Processor (6MB Cache, up to 3.4 GHz)<br></li><li>4GB, DDR4, 2400MHz<br></li><li>256GB Solid State Drive<br></li><li>AMD Radeon(R) 530 Graphics with 2G GDDR5 graphics memory<br></li><li>13.3-inch FHD (1920 x 1080) Anti-glare LED-Backlit Display<br></li><li>Windows 10 Home (64bit) Single Language English<br></li><li>2 Year Premium Support:Onsite Service-Retail<br></li></ul></div>', '/uploads/r8gZPoySrF.png', '5370-25422G-W10', 'New', 3299.00, 510.00, '<img src="/uploads/OupK9vOy.png">', '<div><ul><li>1 x Dell Inspiron 13 5370-25422G-W10 13.3 inch FHD Laptop Pink&nbsp;<br></li><li>1 x Power Adapter&nbsp;<br></li><li>1 x Manual&nbsp;<br></li><li>1 x Dell Bag<br></li></ul></div>', 1, 1, 0, 0, '2018-12-15 04:51:30', '2018-12-26 09:09:41'),
	(81, 'HP 14S CF0059TX', 6, 16, 2, '<div><ul><li>Intel® Core™ i5-8250U (1.6 GHz base frequency, up to 3.4 GHz with Intel® Turbo Boost Technology)<br></li><li>4 GB DDR4-2400 SDRAM (1 x 4 GB)<br></li><li>256 GB PCIe® NVMe™ M.2 SSD<br></li><li>AMD Radeon™ 530 Graphics (2 GB GDDR5 dedicated)<br></li><li>14" diagonal FHD IPS BrightView micro-edge WLED-backlit (1920 x 1080)<br></li><li>Windows 10 Home 64<br></li><li>2 years Local Onsite Warranty inclusive of 1 year limited International Warranty<br></li></ul></div>', '/uploads/F1IjUHUlTE.png', 'CF0059TX', 'Regular', 2399.00, 84.00, '<div><b>8th Generation Intel® Core™ processor</b></div><div>Upgrade performance with smooth system responsiveness and fast load times for an exceptional PC experience. Supporting resolution up to stunning 4K, stream premium content or even create your own.</div><div><br></div><div><b>DDR4 RAM options</b></div><div>Designed to run more efficiently and more reliably at faster speeds, DDR4 is the future of RAM. With its higher bandwidth, everything from multi-tasking to playing games gets a performance boost.</div><div><br></div><div><b>HP Fast Charge</b></div><div>When your laptop is low on power, no one has time to wait hours to recharge. Power down your device and go from 0 to 50% charge in approximately 45 minutes.</div><div><br></div><div><b>USB-C™</b></div><div>Power your device, transfer up to 5Gbs of data, or connect to an external display all from just one USB-C™ port. And it\'s reversible, so you never have to worry about plugging in upside down.</div><div><br></div><div><b>Tuned stereo speakers</b></div><div>Through rigorous testing and refinement, HP custom tunes the dual speaker setup in every notebook for exceptional stereo quality.</div><div><br></div><div><b>Choose your color</b></div><div>Personalize your PC with your choice of color, for style that matches yours.</div>', '<div><ul><li>1 x HP 14S-CF0059TX NOTEBOOK&nbsp;<br></li><li>1 x USER MANUAL&nbsp;<br></li><li>1 x POWER ADAPTER&nbsp;<br></li><li>1 x BACKPACK<br></li></ul></div>', 1, 1, 0, 0, '2018-12-15 08:01:18', '2018-12-26 08:51:10'),
	(82, 'HP PAVILION X360 14-CD0021TX', 6, 16, 2, '<div><ul><li>Intel® Core™ i3-8130U (2.2 GHz base frequency, up to 4 GHz with Intel® Turbo Boost Technology, 4 MB cache, 2 cores)<br></li><li>4 GB DDR4-2400 SDRAM (1 x 4 GB)<br></li><li>500 GB 5400 rpm SATA HDD<br></li><li>14" diagonal HD SVA micro-edge WLED-backlit multitouch-enabled edge-to-edge glass (1366 x 768)<br></li><li>NVIDIA GeForce MX130 2GB<br></li><li>Windows 10 Home<br></li><li>2 Years HP onsite Warranty<br></li></ul></div>', '/uploads/fEfyzxd2P8.png', 'X360 14-CD0021TX', 'Regular', 2499.00, 300.00, '<div><b>Accomplish more</b></div><div>All your activities become easier and faster than before with the latest processor and advanced graphics. Watch videos, edit photos, and connect to family and friends with all the power you need to get things done.</div><div><br></div><div><b>Work. Write. Play. Naturally</b></div><div>A durable 360-degree geared hinge gets you in the perfect position to work, write, watch, and play. Easily convert to tablet for notetaking and drawing that feels as natural as pen on paper.</div><div><br></div><div><b>A truly powerful audio experience</b></div><div>With dual HP speakers, HP Audio Boost, and custom tuning by the experts at B&amp;O PLAY, you can experience rich, authentic audio. Let the sound move you.</div>', '<div><ul><li>1 x HP Pavilion x360 14-CD0021TX 14" Touch Laptop Silver&nbsp;<br></li><li>1 x Power Adapter&nbsp;<br></li><li>1 x Manual&nbsp;<br></li><li>1 x Active Pen<br></li></ul></div>', 1, 1, 0, 0, '2018-12-15 08:11:56', '2018-12-26 08:52:41'),
	(83, 'HP 14-BS728TU', 6, 16, 2, '<div><ul><li>Intel® Core™ i3-7020U (2.3 GHz(2b), 3 MB cache, 2 cores)<br></li><li>4 GB DDR4-2133 SDRAM (1 x 4 GB)<br></li><li>1TB (5400RPM) hard drive<br></li><li>Intel® HD Graphics 620<br></li><li>14" diagonal HD SVA BrightView WLED-backlit (1366 x 768)<br></li><li>Windows 10 (64bit)<br></li><li>1 year local onsite warranty inclusive of 1 year limited International Warranty (part/labor/carry-in)<br></li></ul></div>', '/uploads/MiHAeGNLMK.png', 'BS728TU', 'Regular', 1735.00, 90.00, '<div><b>The PC you can rely on</b></div><div>With the latest Intel processor you are guaranteed the reliable performance you need to work and play. Enjoy long-lasting durability on a laptop designed to do what you want with ease.</div><div><br></div><div><b>Connect with what matters</b></div><div>Stay entertained and keep connected with friends and family with a long-lasting HP fast charge battery, rich HD1 or FHD2 display and optional HD camera3. Plus, easily store and enjoy your favorite music, movies, and photos.</div><div><br></div><div><b>Thoughtfully designed. Inside and out.</b></div><div>Beautifully designed inside and out this HP 14" diagonal laptop is perfectly suited for your lifestyle. Playful patterns, unique textures and a chrome plated hinge add a little color to your everyday.</div><div><br></div><div><b>Windows 10</b></div><div>Do great things confidently with the familiar feel of Windows—only better.</div><div><br></div><div><b>7th Generation Intel® Core™ processor</b></div><div>Powerful performance easily keeps up with all your multitasking demands, enables new ways to interact with your PC, and delivers enhanced 4K video capabilities.</div><div><br></div><div><b>High-definition display</b></div><div>See your digital world in a whole new way. Enjoy movies and photos with the great image quality and high-definition detail of 1 million pixels.</div><div><br></div><div><b style="">Micro-edge display</b></div><div>By squeezing a larger screen into a smaller frame, this ultra-thin, barely visible bezel revolutionizes your display\'s appearance with a beautifully efficient design.</div><div><br></div><div><b>Intel® HD Graphics</b></div><div>Impressive graphics help with everything you do. Whether it\'s watching a video or just surfing the web, Intel® HD Graphics render all the visuals on your screen with smooth, vivid quality.</div><div><br></div><div><b>Hard drive storage (1 TB)</b></div><div>Don\'t worry about growing your collection of digital movies, songs, and pictures. With massive storage options you can save it all, and still have plenty of room left over.</div><div><br></div><div><b>DDR4 RAM options</b></div><div>Designed to run more efficiently and more reliably at faster speeds, DDR4 is the future of RAM. With its higher bandwidth, everything from multi-tasking to playing games gets a performance boost.</div><div><br></div><div><b>Tuned stereo speakers</b></div><div>Through rigorous testing and refinement, HP custom tunes the dual speaker setup in every notebook for exceptional stereo quality.</div>', '<div><ul><li>1 x HP 14-BS728TU 14" Laptop Red&nbsp;<br></li><li>1 x Manual&nbsp;<br></li><li>1 x Power Adapter&nbsp;<br></li><li>1 x HP Backpack<br></li></ul></div>', 1, 1, 0, 0, '2018-12-15 08:24:11', '2018-12-26 08:53:28'),
	(84, 'HP 14S-CF0043TX', 6, 16, 2, '<div><ul><li>Intel® Core™ i7-8550U (1.8 GHz base frequency, up to 4 GHz)<br></li><li>4 GB DDR4-2400 SDRAM (1 x 4 GB)<br></li><li>1 TB 5400 rpm SATA<br></li><li>AMD Radeon™ 530 Graphics (2 GB GDDR5 dedicated)<br></li><li>14" diagonal FHD IPS BrightView micro-edge WLED-backlit (1920 x 1080)<br></li><li>Windows 10 Home 64<br></li><li>2 year local onsite warranty inclusive of 1 year limited International Warranty (part/labor/carry-in) HP Warranty<br></li></ul></div>', '/uploads/H8SMgfnhl2.png', 'CF0043TX', 'Regular', 2829.00, 180.00, '<div>8th Generation Intel® Core™ processor</div><div>Upgrade performance with smooth system responsiveness and fast load times for an exceptional PC experience. Supporting resolution up to stunning 4K, stream premium content or even create your own.</div><div><br></div><div><b>DDR4 RAM options</b></div><div>Designed to run more efficiently and more reliably at faster speeds, DDR4 is the future of RAM. With its higher bandwidth, everything from multi-tasking to playing games gets a performance boost.</div><div><br></div><div><b>HP Fast Charge</b></div><div>When your laptop is low on power, no one has time to wait hours to recharge. Power down your device and go from 0 to 50% charge in approximately 45 minutes.</div><div><br></div><div><b>USB-C™</b></div><div>Power your device, transfer up to 5Gbs of data, or connect to an external display all from just one USB-C™ port. And it\'s reversible, so you never have to worry about plugging in upside down.</div><div><br></div><div><b>Tuned stereo speakers</b></div><div>Through rigorous testing and refinement, HP custom tunes the dual speaker setup in every notebook for exceptional stereo quality.</div><div><br></div><div><b>Choose your color</b></div><div>Personalize your PC with your choice of color, for style that matches yours</div>', '<div><ul><li>1 X HP Laptop&nbsp;<br></li><li>1 X Power Supply&nbsp;<br></li><li>1 X Quick Start Guide<br></li></ul></div>', 1, 1, 0, 0, '2018-12-15 08:32:46', '2018-12-26 08:53:56'),
	(85, 'ACER PREDATOR HELIOS 300 PH317-52-75BK', 6, 14, 6, '<div><ul><li>Intel® Core™ i7-8750H (9MB Cache, Up to 4.1GHz)<br></li><li>8GB DDR4 Memory (2x4GB) 2133 MHz<br></li><li>256GB PCIE SSD + 1TB HDD 5400 RPM<br></li><li>NVIDIA® GeForce® GTX 1060 6GB GDDR5<br></li><li>17.3" FHD IPS Display<br></li><li>Windows 10 Home Single Language 64bit English<br></li><li>2 Year Acer On-Site Warranty IncludedAccidental and Theft Warranty<br></li><li>Free : Acer Predator Gaming Mouse, Acer Nitro Gaming Headset<br></li></ul></div>', '/uploads/6cKjqVZIdH.png', 'PH317-52-75BK', 'News', 5999.00, 400.00, '<img src="/uploads/LWQfnHXN.jpg">', '<ul><li>1 x&nbsp;Acer Predator Helios 300 PH317-52-75BK<br></li><li>1 x Manual<br></li><li>1 x Power Adapter<br></li><li>1 x Predator Backpack<br></li></ul>', 1, 1, 0, 0, '2018-12-15 08:50:56', '2018-12-26 07:04:56'),
	(86, 'ACER SWIFT 5 SF514-52T-59ZV', 6, 14, 6, '<div><ul><li>Intel® Core i5-8250U processor (6 MB Smart Cache, 1.6 GHz with Turbo Boost up to 3.4 GHz)<br></li><li>8GB DDR3L RAM(not upgradable)<br></li><li>256GB PCIe SSD<br></li><li>14" IPS FHD 1920 x 1080, LED-backlit TFT LCD with Multi Touch<br></li><li>Intel® UHD Graphics 620<br></li><li>Windows 10 Home 64-bit<br></li><li>2-Year Acer Local Warranty<br></li></ul></div>', '/uploads/7HlUu8Z8jD.png', 'SF514-52T-59ZV', 'New', 3799.00, 300.00, '<img src="/uploads/3gQjzWW8.jpg">', '<div><ul><li>1 x Acer Swift 5 SF514-52T-59ZV 14" FHD IPS Laptop (Stellar Blue)&nbsp;<br></li><li>1 x Power Adapter&nbsp;<br></li><li>1 x Manual&nbsp;<br></li><li>1 x Acer Backpack<br></li></ul></div>', 1, 1, 0, 0, '2018-12-15 08:58:52', '2018-12-26 07:05:48'),
	(87, 'ACER SWIFT 3 SF314-54-55JD', 6, 14, 6, '<div><ul><li>Intel® Core i5-8250U processor (1.6 GHz with Turbo Boost up to 3.4 GHz)<br></li><li>4GB DDR4 RAM(1 x upgradable slot)<br></li><li>128GB SSD + 1TB HDD<br></li><li>Intel® UHD Graphics 620<br></li><li>14" IPS Full HD 1920 x 1080, LED-backlit TFT LCD<br></li><li>Windows 10 Home 64-bit<br></li><li>2-Year Local Warranty<br></li><li>New Model with Slim Bezel<br></li></ul></div>', '/uploads/mKW7dlu89M.png', 'SF314-54-55JD', 'New', 2899.00, 260.00, '<div style="text-align: center;"><img src="/uploads/ng4iqwOX.jpg" style="color: inherit; font-family: inherit;"></div>', '<div><ul><li>1 x ACER SWIFT 3 NOTEBOOK&nbsp;<br></li><li>1 x USER MANUAL&nbsp;<br></li><li>1 x POWER ADAPTER&nbsp;<br></li><li>1 x BACKPACK<br></li></ul></div>', 1, 1, 0, 0, '2018-12-15 09:42:27', '2018-12-26 07:06:50'),
	(88, 'ACER SWIFT 3 SF314-54-59T5', 6, 14, 6, '<div><ul><li>Intel® Core i5-8250U processor (1.6 GHz with Turbo Boost up to 3.4 GHz)<br></li><li>4GB DDR4 RAM(1 x upgradable slot)<br></li><li>128GB SSD + 1TB HDD<br></li><li>Intel® UHD Graphics 620<br></li><li>14" IPS Full HD 1920 x 1080, LED-backlit TFT LCD<br></li><li>Windows 10 Home 64-bit<br></li><li>2-Year Local Warranty<br></li><li>New Model with Slim Bezel<br></li></ul></div>', '/uploads/YUAjOIn5hy.png', 'SF314-54-59T5', 'New', 2899.00, 260.00, '<img src="/uploads/12QzFo2l.jpg">', '<div><ul><li>1 x Acer Swift 3 SF314-54-59T5 Pink&nbsp;<br></li><li>1 x Adapter<br></li><li>1 x User Manual<br></li></ul></div>', 1, 1, 0, 0, '2018-12-15 09:51:28', '2018-12-26 07:07:48'),
	(89, 'ASUS FX503V-ME4215T', 6, 12, 5, '<div><ul><li>Intel® Core™ i5-7300HQ Processor 2.5 GHz (6M Cache, up to 3.5 GHz)<br></li><li>DRAM DDR4 4GB 2400<br></li><li>SATA 1TB 5400RPM 2.5\' HDD + 128GB M.2 SATA SSD<br></li><li>NVIDIA GeForce GTX 1060 3GB GDDR5<br></li><li>15.6" FHD//60Hz/IPS level//250nits//Anti-glare<br></li><li>Windows 10 (64bit)<br></li><li>2 Years Asus Global Warranty<br></li></ul></div>', '/uploads/zMH7lVmt3J.png', 'FX503V-ME4215T', 'New', 4299.00, 1010.00, '<img src="/uploads/teVo8Bma.jpg">', '<div><ul><li>1 x Asus FX503V-ME4215T 15.6" FHD Gaming Laptop&nbsp;<br></li><li>1 x Power Adapter&nbsp;<br></li><li>1 x Manual&nbsp;<br></li><li>1 x Asus Backpack<br></li></ul></div>', 1, 1, 0, 0, '2018-12-15 10:28:40', '2018-12-26 07:32:46'),
	(90, 'ASUS ROG GL553V-EFY517T', 6, 12, 5, '<div><ul><li>Intel Quad-Core i7 7700HQ 2.8GHz up to 3.8GHz<br></li><li>4GB DDR4 Ram<br></li><li>128GB M.2 SSD + 1TB 5400RPM HDD<br></li><li>Nvidia Geforce GTX1050TI 4GB GDDR5<br></li><li>15.6" FHD(1920x1080) Anti-Glare LED Screen<br></li><li>4-area RGP Lightning Chiclet Keyboard<br></li><li>Genuine Windows 10 Home Edition<br></li></ul></div>', '/uploads/wCVePyT5g2.png', 'GL553V-EFY517T', 'New', 4599.00, 700.00, '<div style="text-align: center;"><img src="/uploads/zIgvYUls.png" style="color: inherit; font-family: inherit;"></div>', '<div><ul><li>1 x Asus ROG GL553V-EFY517T Black<br></li><li>1 x Wireless Mouse<br></li><li>1 X ASUS BAG<br></li></ul></div>', 1, 1, 0, 0, '2018-12-15 10:42:26', '2018-12-26 07:34:47'),
	(91, 'ASUS TUF FX504G-DDM894T', 6, 12, 5, '<div><ul><li>Intel® Core™ i5-8300HProcessor<br></li><li>4GB DDR4 2666MHz Ram<br></li><li>SATA 1TB 5400RPM 2.5\' HDD<br></li><li>15.6" FHD//TN Level//90 Viewing Angle//60Hz//8ms//63% sRGB<br></li><li>NVIDIA GeForce GTX 1050 4GB GDDR5<br></li><li>Windows 10 Home<br></li><li>2 Years Asus Global Warranty<br></li></ul></div>', '/uploads/BF2xWEXQgZ.png', 'FX504G-DDM894T', 'New', 3199.00, 160.00, '<div style="text-align: center;"><img src="/uploads/mMpicXs3.jpg" style="color: inherit; font-family: inherit;"></div>', '<div><ul><li>1 xAsus TUF FX504G-DDM894T 15.6" FHD Gaming Laptop&nbsp;<br></li><li>1 x Power Adapter&nbsp;<br></li><li>1 x Manual&nbsp;<br></li><li>1 x Asus Backpack<br></li></ul></div>', 1, 1, 0, 0, '2018-12-15 10:49:41', '2018-12-26 07:35:30'),
	(92, 'ASUS ZenBook UX430U-NGV197T', 6, 12, 5, '<div><ul><li>Intel® Core™ i5-8250U 1.6GHz up to 3.4GHz (4 Core/8 Threads)<br></li><li>8GB LPDDR3L RAM<br></li><li>512GB M.2 Sata3 SSD<br></li><li>NVIDIA® GeForce® MX150 2GB GDDR5<br></li><li>14" FHD(1920x1080) NanoEdge LED Screen<br></li><li>Genuine Windows 10 Home Edition<br></li><li>2 Years Asus Global Warranty<br></li></ul></div>', '/uploads/EACropTBKM.png', 'UX430U-NGV197T', 'New', 4240.00, 241.00, '<div style="text-align: center;"><img src="/uploads/KS1bNr0e.jpg" style="color: inherit; font-family: inherit;"></div>', '<div><ul><li>1x Asus ZenBook UX430U-NGV197T Rose Gold&nbsp;<br></li><li>1x Asus ZenBook Sleeve Case&nbsp;<br></li><li>1x AC Adapter &amp; Power Cord&nbsp;<br></li><li>1x User Guide<br></li></ul></div>', 1, 1, 0, 0, '2018-12-15 11:04:02', '2018-12-26 07:40:23'),
	(93, 'LENOVO MIIX D330-10IGM 81H3003WMJ', 6, 15, 4, '<div><ul><li>New 2 in 1 Model With Detachable Keyboard<br></li><li>FreeLenovo 11.6" Casual Sleeve S200<br></li><li>Intel CeleronN4000 Processor (1.10GHz, 2.60GHz, 2C2T, 4MB cache)<br></li><li>W10 HOME ENTRY<br></li><li>10.1 HD IPS AG 300N TOUCH Screen<br></li><li>4G LPDDR4 2133 ONBOARD<br></li><li>64G EMMC Storage<br></li><li>Integrated graphic<br></li><li>No LAN Port<br></li><li>1 x USB 3.0 Type C, 1 x USB 3.0, Audio Jack<br></li><li>Up to13 hrs*,600g (Tablet), 1.13kg (with keyboard)<br></li><li>1 Yr Carry-in warranty<br></li></ul></div>', '/uploads/cMoNQvxqLA.png', 'D330-10IGM 81H3003WMJ', 'New', 1399.00, 230.00, '<div style="text-align: center;"><img src="/uploads/BM3d7nPY.jpg" style="color: inherit; font-family: inherit;"></div>', '<div><ul><li>1 x lenovo mix detachable notebook with keyboard<br></li><li>1 x power cord&nbsp;<br></li><li>1 x user manual<br></li></ul></div>', 1, 1, 0, 0, '2018-12-16 04:09:42', '2018-12-26 08:00:05'),
	(94, 'LENOVO LEGION Y520-15IKBN 80YY0071MJ', 6, 15, 4, '<div><ul><li>Intel® Core™ i7-7700HQ-2.8GHz - Processor 6M Cache, up to 3.80 GHz<br></li><li>8GB DDR4 RAM<br></li><li>1TB HDD + 128GB M.2 SSD<br></li><li>NVIDIA GeForce GTX 1060 3GB GDDR5<br></li><li>15.6" FHD IPS AG (Slim) Display<br></li><li>Windows 10 Home<br></li><li>2 Years Lenovo Carry-in Warranty<br></li><li>Lenovo Y Gaming Precision Mouse<br></li><li>Lenovo Bag Pack<br></li></ul></div>', '/uploads/OLXakd2TOD.png', '80YY0071MJ', 'New', 4999.00, 1100.00, '<div style="text-align: center;"><img src="/uploads/WCBW7DB6.jpg" style="color: inherit; font-family: inherit;"></div>', '<div><ul><li>1 x Lenovo Legion Y520-15IKBN 80YY0071MJ 15.6" FHD IPS Gaming Laptop<br></li><li>1 x Power Adapter<br></li><li>1 x Manual<br></li><li>1 x Lenovo Backpack<br></li></ul></div>', 1, 1, 0, 0, '2018-12-16 04:41:39', '2018-12-26 08:00:57'),
	(95, 'LENOVO IDEAPD 120s-11IAP 81A400KQMJ', 6, 15, 4, '<div><ul><li>Intel® Celeron® Processor N3350 (2M Cache, up to 2.4 GHz)<br></li><li>4GB DDR4 Ram<br></li><li>500GB HDD<br></li><li>Intel® Integrated Graphics<br></li><li>11.6"HD (1366x768)<br></li><li>Windows 10 Home<br></li><li>1 Year Lenovo Onsite Warranty<br></li></ul></div>', '/uploads/HHZn8TIrFl.png', '11IAP 81A400KQMJ', 'New', 1299.00, 180.00, '<img src="/uploads/GLtEIPI2.jpg">', '<div><ul><li>1 x Lenovo Ideapad 120s-11IAP 81A400KQMJ 11.6" Laptop Grey&nbsp;<br></li><li>1 x Power Adapter&nbsp;<br></li><li>1 x Manual<br></li></ul></div>', 1, 1, 0, 0, '2018-12-16 04:59:32', '2018-12-26 08:36:39'),
	(96, 'LENOVO YOGA 330-11IGM 81A6003AMJ', 6, 15, 4, '<div><ul><li>Intel® Pentium® Silver N5000 Processor (4M Cache, up to 2.70 GHz)<br></li><li>4GB DDR4 Ram<br></li></ul></div><div><ul><li>128GB EMMC<br></li><li>Intel® Integrated Graphics<br></li><li>11.6” HD (1366 x 768) TN anti-glare touchscreen (Slim)<br></li><li>Windows 10 Home<br></li><li>1 Year Lenovo Onsite Premium Warranty<br></li></ul></div>', '/uploads/6xDMLnoEC9.png', '81A6003AMJ', 'New', 1649.00, 70.00, '<div style="text-align: center;"><img src="/uploads/6U7Uxr84.jpg" style="color: inherit; font-family: inherit;"></div>', '<div><ul><li>1 x Lenovo Yoga 330-11IGM 81A6003AMJ 11.6" Touch Laptop Grey&nbsp;<br></li><li>1 x Power Adapter&nbsp;<br></li><li>1 x Manual&nbsp;<br></li><li>1 x Sleeve Case<br></li></ul></div>', 1, 1, 0, 0, '2018-12-16 05:11:26', '2018-12-26 08:37:48'),
	(97, 'LENOVO YOGA 530-14IKB-81EK00XFMJ', 6, 15, 4, '<div><ul><li>INTEL® Core™ i5-8250U Processor&nbsp;<br></li><li>4G(1X4GBDDR4 2400)Up to 16GB DDR4<br></li><li>512GB_M.2_2280_NVME<br></li><li>NVIDIA® MX130 2GB GDDR5<br></li><li>14.0 FHD IPS GL 250N TOUCH N<br></li><li>WINDOWS 10 HOME<br></li><li>Up to 10 hours<br></li><li>1.67kg<br></li><li>2 Yrs on-site Premium Care, 1st year included with Carry-in ADP<br></li></ul></div>', '/uploads/G10IiUbk1u.png,/uploads/ABhLgTmGQG.png,/uploads/9K1Qaf5Ulp.png,/uploads/Qb4bj97roE.png,/uploads/KHRTlxz5G1.png', '81EK00XFMJ', 'New', 3549.00, 0.00, '<div style="text-align: center;"><img src="/uploads/4YuLLqD6.jpg" style="color: inherit; font-family: inherit;"></div>', '<div><ul><li>LENOVO YOGA 530-14IKB-81EK00XFMJ&nbsp;<br></li><li>Lenovo 15.6 Premium Backpack B510-ROW<br></li></ul></div>', 1, 1, 0, 0, '2018-12-28 07:23:16', '2018-12-28 07:23:16'),
	(98, 'LENOVO YOGA 530-14IKB-81EK00XEMJ', 6, 15, 4, '<div><ul><li>INTEL® Core™ i5-8250U Processor&nbsp;<br></li><li>4G(1X4GBDDR4 2400)Up to 16GB DDR4 (remove existing )<br></li><li>512GB_M.2_2280_NVME<br></li><li>NVIDIA® MX130 2GB GDDR5<br></li><li>14.0 FHD IPS GL 250N TOUCH N<br></li><li>WINDOWS 10 HOME<br></li><li>Up to 10 hours<br></li><li>1.67kg<br></li><li>2 Yrs on-site Premium Care, 1st year included with Carry-in ADP (Accidental Damage Protection)<br></li></ul></div>', '/uploads/KLepNnP5lI.png,/uploads/ZkU7l2Smb5.png,/uploads/dsbfqxxrEb.png,/uploads/T0fUOUz0z2.png,/uploads/yWVdrmLgi4.png', '81EK00XEMJ', 'New', 3549.00, 0.00, '<img src="/uploads/zZkiiKES.png">', '<div><ul><li>LENOVO YOGA 530-14IKB-81EK00XEMJ<br></li><li>Lenovo 15.6 Premium Backpack B510-ROW<br></li></ul></div>', 1, 1, 0, 0, '2018-12-28 08:00:21', '2018-12-28 08:00:21'),
	(99, 'LENOVO IDEAPAD YOGA S730-13IWL-81J0005LMJ', 6, 15, 4, '<div><ul><li>Intel® Core™ i5-8265U Processor<br></li><li>8GB LPDDR3 2133 MB<br></li><li>512GB M.2 2280 NVME<br></li><li>Integrated Graphic<br></li><li>13.3FHD IPS GL 300N N GLASS<br></li><li>WINDOWS 10 HOME<br></li><li>Up to 10 hours<br></li><li>starting at 1.2kg<br></li><li>2 Yrs on-site Premium Care, 1st year included with Carry-in ADP (Accidental Damage Protection)<br></li></ul></div>', '/uploads/Hq7LMttaiI.png,/uploads/epgHKkClwI.png,/uploads/LvlJ7Iumd6.png', '81J0005LMJ', 'New', 3859.00, 0.00, '<img src="/uploads/PzrQGSRw.png">', '<div><ul><li>LENOVO IDEAPAD YOGA S730-13IWL-81J0005LM&nbsp;<br></li><li>Lenovo 15.6 Premium Backpack B510-ROW<br></li></ul></div>', 1, 1, 0, 0, '2018-12-28 08:43:47', '2018-12-28 08:43:47'),
	(100, 'LENOVO IDEAPAD 330S-14IKB-81F40192MJ', 6, 15, 4, '<div><ul><li>LENOVO IDEAPAD 330S-14IKB-81F40192MJ - i5-8250U, 4GB, 512GB, AMD 2GB, 14"FHD W10-Midnight Blue<br></li><li>Intel® Core™ i5-8250U Processor<br></li><li>4GB DDR4 2400 ONBOARD - Up to 12 GB DDR4<br></li><li>512GB M.2 PCIE 2242<br></li><li>AMD RADEON™ 535 GDDR5 2GB<br></li><li>14.0 FHD IPS AG 250N N<br></li><li>WINDOWS 10 HOME<br></li><li>3 CELL<br></li><li>1.6kg<br></li><li>2 Yrs on-site Premium Care warranty<br></li></ul></div>', '/uploads/iS0cktWeq0.png,/uploads/UgplcVUjnX.png,/uploads/zTRfiDW4Ql.png', '81F40192MJ', 'New', 2959.00, 0.00, '<div style="text-align: center;"><img src="/uploads/wBoa40bf.jpg" style="color: inherit; font-family: inherit;"></div>', '<div><ul><li>LENOVO IDEAPAD 330S-14IKB-81F40192MJ&nbsp;<br></li><li>Lenovo 15.6 Premium Backpack B510-ROW<br></li></ul></div>', 1, 1, 0, 0, '2018-12-28 08:51:15', '2018-12-28 08:51:15'),
	(101, 'LENOVO IDEAPAD 330-14IKB 81G20035MJ', 6, 15, 4, '<div><ul><li>Intel® Core™ i5-8250U Processor (6M Cache, up to 3.40 GHz)<br></li><li>4 GB DDR4 Ram<br></li><li>1TB HDD<br></li><li>AMD M530 2GB<br></li><li>14” FHD (1920 x 1080)&nbsp;<br></li><li>Windows 10 Home<br></li><li>2 Years Lenovo onsite warranty<br></li></ul></div>', '/uploads/RFtprP0GFr.png,/uploads/Xgh29ZKrm5.png,/uploads/BKhJKsXu80.png,/uploads/Iea4obzDa1.png', '81G20035MJ', 'New', 2235.00, 0.00, '<div style="text-align: center;"><img src="/uploads/GLDw5iBi.png" style="color: inherit; font-family: inherit;"></div>', '<div><ul><li>1 x Lenovo Ideapad 330-14IKB 81G20035MJ 14" FHD Laptop Grey&nbsp;<br></li><li>1 x Power Adapter&nbsp;<br></li><li>1 x Manual&nbsp;<br></li><li>1 x Lenovo Backpack<br></li></ul></div>', 1, 1, 0, 0, '2018-12-28 08:57:13', '2018-12-28 08:57:13');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table shopping.product_wise_specifications
CREATE TABLE IF NOT EXISTS `product_wise_specifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `specification_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=823 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopping.product_wise_specifications: ~426 rows (approximately)
DELETE FROM `product_wise_specifications`;
/*!40000 ALTER TABLE `product_wise_specifications` DISABLE KEYS */;
INSERT INTO `product_wise_specifications` (`id`, `product_id`, `specification_id`, `description`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(15, 43, 1, 'erer', 0, 0, '2018-12-11 08:32:55', '2018-12-11 08:32:55'),
	(16, 43, 2, '23', 0, 0, '2018-12-11 08:32:55', '2018-12-11 08:32:55'),
	(17, 43, 3, '343', 0, 0, '2018-12-11 08:32:55', '2018-12-11 08:32:55'),
	(18, 43, 4, '34343', 0, 0, '2018-12-11 08:32:55', '2018-12-11 08:32:55'),
	(19, 43, 5, '3434', 0, 0, '2018-12-11 08:32:55', '2018-12-11 08:32:55'),
	(20, 43, 6, '34', 0, 0, '2018-12-11 08:32:55', '2018-12-11 08:32:55'),
	(21, 43, 7, '3434', 0, 0, '2018-12-11 08:32:55', '2018-12-11 08:32:55'),
	(22, 44, 1, 'erer', 0, 0, '2018-12-11 08:34:18', '2018-12-11 08:34:18'),
	(23, 44, 2, '23', 0, 0, '2018-12-11 08:34:18', '2018-12-11 08:34:18'),
	(24, 44, 3, '343', 0, 0, '2018-12-11 08:34:18', '2018-12-11 08:34:18'),
	(25, 44, 4, '34343', 0, 0, '2018-12-11 08:34:18', '2018-12-11 08:34:18'),
	(26, 44, 5, '3434', 0, 0, '2018-12-11 08:34:18', '2018-12-11 08:34:18'),
	(27, 44, 6, '34', 0, 0, '2018-12-11 08:34:18', '2018-12-11 08:34:18'),
	(28, 44, 7, '3434', 0, 0, '2018-12-11 08:34:18', '2018-12-11 08:34:18'),
	(37, 45, 1, '232', 0, 0, '2018-12-11 09:43:14', '2018-12-11 09:43:14'),
	(38, 45, 2, '34', 0, 0, '2018-12-11 09:43:14', '2018-12-11 09:43:14'),
	(39, 45, 3, '23', 0, 0, '2018-12-11 09:43:14', '2018-12-11 09:43:14'),
	(40, 45, 4, 'ff', 0, 0, '2018-12-11 09:43:14', '2018-12-11 09:43:14'),
	(41, 45, 5, 'dsdsdsds', 0, 0, '2018-12-11 09:43:14', '2018-12-11 09:43:14'),
	(42, 45, 6, 'sds', 0, 0, '2018-12-11 09:43:14', '2018-12-11 09:43:14'),
	(43, 45, 7, 'sd', 0, 0, '2018-12-11 09:43:14', '2018-12-11 09:43:14'),
	(44, 45, 9, 'sds', 0, 0, '2018-12-11 09:43:14', '2018-12-11 09:43:14'),
	(77, 46, 1, 'Intel® Core™ i5-8300H Processor', 0, 0, '2018-12-11 10:05:32', '2018-12-11 10:05:32'),
	(78, 46, 2, '4GB DDR4 RAM + 16GB Optane Memory', 0, 0, '2018-12-11 10:05:32', '2018-12-11 10:05:32'),
	(79, 46, 3, '1TB 2.5" SATA HDD', 0, 0, '2018-12-11 10:05:32', '2018-12-11 10:05:32'),
	(80, 46, 4, 'Nvidia GeForce® GTX 1050 with 4GB GDDR5', 0, 0, '2018-12-11 10:05:32', '2018-12-11 10:05:32'),
	(81, 46, 5, '2x 2W Speaker', 0, 0, '2018-12-11 10:05:32', '2018-12-11 10:05:32'),
	(82, 46, 6, '1 year', 0, 0, '2018-12-11 10:05:32', '2018-12-11 10:05:32'),
	(83, 46, 7, '2e', 0, 0, '2018-12-11 10:05:32', '2018-12-11 10:05:32'),
	(84, 46, 9, 'we', 0, 0, '2018-12-11 10:05:32', '2018-12-11 10:05:32'),
	(93, 47, 1, 'Intel® Core™ i5-8300H Processor', 0, 0, '2018-12-11 10:35:03', '2018-12-11 10:35:03'),
	(94, 47, 2, '4GB DDR4 Ram', 0, 0, '2018-12-11 10:35:03', '2018-12-11 10:35:03'),
	(95, 47, 3, '1TB (SATA) 7200rpm 2.5" HDD', 0, 0, '2018-12-11 10:35:03', '2018-12-11 10:35:03'),
	(96, 47, 4, '15.6" FHD (1920*1080), wideview 94%NTSC color Anti-glare', 0, 0, '2018-12-11 10:35:03', '2018-12-11 10:35:03'),
	(97, 47, 5, 'yes', 0, 0, '2018-12-11 10:35:03', '2018-12-11 10:35:03'),
	(98, 47, 6, '1 year', 0, 0, '2018-12-11 10:35:03', '2018-12-11 10:35:03'),
	(99, 47, 7, '11', 0, 0, '2018-12-11 10:35:03', '2018-12-11 10:35:03'),
	(100, 47, 9, 'wre', 0, 0, '2018-12-11 10:35:03', '2018-12-11 10:35:03'),
	(101, 18, 1, '232', 0, 0, '2018-12-11 11:05:05', '2018-12-11 11:05:05'),
	(102, 18, 2, '23', 0, 0, '2018-12-11 11:05:05', '2018-12-11 11:05:05'),
	(103, 18, 3, '33', 0, 0, '2018-12-11 11:05:05', '2018-12-11 11:05:05'),
	(104, 18, 4, 'weewe', 0, 0, '2018-12-11 11:05:05', '2018-12-11 11:05:05'),
	(105, 18, 5, 'wewe', 0, 0, '2018-12-11 11:05:05', '2018-12-11 11:05:05'),
	(106, 18, 6, 'wee', 0, 0, '2018-12-11 11:05:05', '2018-12-11 11:05:05'),
	(107, 18, 7, 'wewe', 0, 0, '2018-12-11 11:05:05', '2018-12-11 11:05:05'),
	(108, 18, 9, 'eee', 0, 0, '2018-12-11 11:05:05', '2018-12-11 11:05:05'),
	(109, 48, 1, 'Intel® Core™ i5-8300H Processor', 0, 0, '2018-12-11 11:10:10', '2018-12-11 11:10:10'),
	(110, 48, 2, '4GB DDR4 RAM + 16GB Optane Memory', 0, 0, '2018-12-11 11:10:10', '2018-12-11 11:10:10'),
	(111, 48, 3, '1TB 2.5" SATA HDD', 0, 0, '2018-12-11 11:10:10', '2018-12-11 11:10:10'),
	(112, 48, 4, 'Nvidia GeForce® GTX 1050, 4GB GDDR5', 0, 0, '2018-12-11 11:10:10', '2018-12-11 11:10:10'),
	(113, 48, 5, 'yes', 0, 0, '2018-12-11 11:10:10', '2018-12-11 11:10:10'),
	(114, 48, 6, '1', 0, 0, '2018-12-11 11:10:10', '2018-12-11 11:10:10'),
	(115, 48, 7, 'wee', 0, 0, '2018-12-11 11:10:10', '2018-12-11 11:10:10'),
	(116, 48, 9, 'sdsd', 0, 0, '2018-12-11 11:10:10', '2018-12-11 11:10:10'),
	(117, 49, 1, 'Intel® Core™ i7-8550U Processor', 0, 0, '2018-12-11 11:29:18', '2018-12-11 11:29:18'),
	(118, 49, 2, '16GB DDR4 2400Mhz Ram', 0, 0, '2018-12-11 11:29:18', '2018-12-11 11:29:18'),
	(119, 49, 3, '256GB M.2 NVMe PCIe SSD', 0, 0, '2018-12-11 11:29:18', '2018-12-11 11:29:18'),
	(120, 49, 4, 'Nvidia Geforce® MX150 with 2GB GDDR5', 0, 0, '2018-12-11 11:29:18', '2018-12-11 11:29:18'),
	(121, 49, 5, '2x 2W Speaker', 0, 0, '2018-12-11 11:29:18', '2018-12-11 11:29:18'),
	(122, 49, 6, '2 Years MSI Warranty', 0, 0, '2018-12-11 11:29:18', '2018-12-11 11:29:18'),
	(123, 50, 1, 'i7-8750H', 0, 0, '2018-12-12 07:40:18', '2018-12-12 07:40:18'),
	(124, 50, 2, '8GB', 0, 0, '2018-12-12 07:40:18', '2018-12-12 07:40:18'),
	(125, 50, 3, '1TB+256GB GTX', 0, 0, '2018-12-12 07:40:18', '2018-12-12 07:40:18'),
	(126, 50, 4, '4GB', 0, 0, '2018-12-12 07:40:18', '2018-12-12 07:40:18'),
	(127, 50, 5, 'Dolby', 0, 0, '2018-12-12 07:40:18', '2018-12-12 07:40:18'),
	(128, 50, 6, '1 Year', 0, 0, '2018-12-12 07:40:18', '2018-12-12 07:40:18'),
	(161, 51, 1, 'I7-8750H', 0, 0, '2018-12-13 15:52:36', '2018-12-13 15:52:36'),
	(162, 51, 2, '8GB', 0, 0, '2018-12-13 15:52:36', '2018-12-13 15:52:36'),
	(163, 51, 3, '1TB+256GB', 0, 0, '2018-12-13 15:52:36', '2018-12-13 15:52:36'),
	(164, 51, 4, 'GTX1060 6GB', 0, 0, '2018-12-13 15:52:36', '2018-12-13 15:52:36'),
	(165, 51, 5, 'DOllby', 0, 0, '2018-12-13 15:52:36', '2018-12-13 15:52:36'),
	(166, 51, 6, '2 Years', 0, 0, '2018-12-13 15:52:36', '2018-12-13 15:52:36'),
	(167, 51, 8, 'Yes', 0, 0, '2018-12-13 15:52:36', '2018-12-13 15:52:36'),
	(168, 51, 10, 'HD', 0, 0, '2018-12-13 15:52:36', '2018-12-13 15:52:36'),
	(177, 52, 1, 'Intel® Core™ i5-8300H Processor', 0, 0, '2018-12-14 02:56:13', '2018-12-14 02:56:13'),
	(178, 52, 2, '4GB DDR4 Ram', 0, 0, '2018-12-14 02:56:13', '2018-12-14 02:56:13'),
	(179, 52, 3, '1TB (SATA) 7200rpm 2.5" HDD', 0, 0, '2018-12-14 02:56:13', '2018-12-14 02:56:13'),
	(180, 52, 4, 'GeForce® GTX 1050 with 4GB GDDR5', 0, 0, '2018-12-14 02:56:13', '2018-12-14 02:56:13'),
	(181, 52, 5, 'Yes', 0, 0, '2018-12-14 02:56:13', '2018-12-14 02:56:13'),
	(182, 52, 6, '2 Years MSI Warranty', 0, 0, '2018-12-14 02:56:13', '2018-12-14 02:56:13'),
	(183, 52, 8, 'YES', 0, 0, '2018-12-14 02:56:13', '2018-12-14 02:56:13'),
	(184, 52, 10, '15.6" FHD (1920*1080), wideview 94%NTSC color Anti-glare', 0, 0, '2018-12-14 02:56:13', '2018-12-14 02:56:13'),
	(192, 53, 1, 'Intel® Core™ i5-8250U Processor', 0, 0, '2018-12-14 07:49:42', '2018-12-14 07:49:42'),
	(193, 53, 2, '4GB DDR4 Onboard Ram', 0, 0, '2018-12-14 07:49:42', '2018-12-14 07:49:42'),
	(194, 53, 3, '1TB 5400RPM 2.5" SATA HDD', 0, 0, '2018-12-14 07:49:42', '2018-12-14 07:49:42'),
	(195, 53, 4, 'NVIDIA GeForce MX130 , with 2GB GDDR5 VRAM', 0, 0, '2018-12-14 07:49:42', '2018-12-14 07:49:42'),
	(196, 53, 6, '2 Years Asus Global Warranty', 0, 0, '2018-12-14 07:49:42', '2018-12-14 07:49:42'),
	(197, 53, 8, '6 Hours', 0, 0, '2018-12-14 07:49:42', '2018-12-14 07:49:42'),
	(198, 53, 10, '14.0" (16:9) LED backlit FHD (1920x1080) 60Hz Anti-Glare Panel with 45% NTSC with 178˚ wide-viewing angle display', 0, 0, '2018-12-14 07:49:42', '2018-12-14 07:49:42'),
	(199, 53, 11, 'Windows 10 Home', 0, 0, '2018-12-14 07:49:42', '2018-12-14 07:49:42'),
	(200, 54, 1, 'Intel® Core™ i7-8550U Processor', 0, 0, '2018-12-14 08:07:21', '2018-12-14 08:07:21'),
	(201, 54, 2, 'DDR4 4G', 0, 0, '2018-12-14 08:07:21', '2018-12-14 08:07:21'),
	(202, 54, 3, 'SATA 1TB', 0, 0, '2018-12-14 08:07:21', '2018-12-14 08:07:21'),
	(203, 54, 4, 'NVIDIA® GeForce® MX130 GDDR5 2GB', 0, 0, '2018-12-14 08:07:21', '2018-12-14 08:07:21'),
	(204, 54, 6, '2 Years Asus', 0, 0, '2018-12-14 08:07:21', '2018-12-14 08:07:21'),
	(205, 54, 10, '15.6\' FHD 1920x1080 16:9//Anti-Glare//WV', 0, 0, '2018-12-14 08:07:21', '2018-12-14 08:07:21'),
	(206, 54, 11, 'Windows 10 (64bit)', 0, 0, '2018-12-14 08:07:21', '2018-12-14 08:07:21'),
	(207, 55, 1, 'Intel® Core™ i7-8750H Processor', 0, 0, '2018-12-14 08:13:25', '2018-12-14 08:13:25'),
	(208, 55, 2, '4GB DDR4 2666MHz Ram', 0, 0, '2018-12-14 08:13:25', '2018-12-14 08:13:25'),
	(209, 55, 3, '1TB SATA FireCuda Hybrid SSHD', 0, 0, '2018-12-14 08:13:25', '2018-12-14 08:13:25'),
	(210, 55, 4, 'NVIDIA GeForce GTX 1050 4GB GDDR5', 0, 0, '2018-12-14 08:13:25', '2018-12-14 08:13:25'),
	(211, 55, 6, '2 Years Asus Global Warranty', 0, 0, '2018-12-14 08:13:25', '2018-12-14 08:13:25'),
	(212, 55, 10, '15.6" (16:9) IPS LED backlit FHD (1920x1080) 60Hz Anti-Glare Panel with 45% NTSC 250nits', 0, 0, '2018-12-14 08:13:25', '2018-12-14 08:13:25'),
	(213, 55, 11, 'Windows 10 64bit', 0, 0, '2018-12-14 08:13:25', '2018-12-14 08:13:25'),
	(214, 56, 1, 'Intel® Celeron® N4000 Processor (4M Cache, up to 2.60 GHz)', 0, 0, '2018-12-14 08:21:46', '2018-12-14 08:21:46'),
	(215, 56, 2, '4GB DDR4 RAM', 0, 0, '2018-12-14 08:21:46', '2018-12-14 08:21:46'),
	(216, 56, 3, 'SATA 500GB 5400RPM 2.5\' HDD', 0, 0, '2018-12-14 08:21:46', '2018-12-14 08:21:46'),
	(217, 56, 4, 'Intel Integrated Graphic', 0, 0, '2018-12-14 08:21:46', '2018-12-14 08:21:46'),
	(218, 56, 6, '1 Year Asus Warranty', 0, 0, '2018-12-14 08:21:46', '2018-12-14 08:21:46'),
	(219, 56, 10, '14.0" (16:9) LED backlit HD (1366x768)', 0, 0, '2018-12-14 08:21:46', '2018-12-14 08:21:46'),
	(220, 56, 11, 'Windows 10 Home 64', 0, 0, '2018-12-14 08:21:46', '2018-12-14 08:21:46'),
	(249, 61, 1, 'Intel® Celeron® dual-core processor N4000 (4 MB L2 cache, 1.10 GHz, up to 2.6 GHz)', 0, 0, '2018-12-14 09:40:07', '2018-12-14 09:40:07'),
	(250, 61, 2, '4GB Onboard DDR4 RAM', 0, 0, '2018-12-14 09:40:07', '2018-12-14 09:40:07'),
	(251, 61, 3, '500GB SATA HDD', 0, 0, '2018-12-14 09:40:07', '2018-12-14 09:40:07'),
	(252, 61, 4, 'Intel® UHD Graphics 600', 0, 0, '2018-12-14 09:40:07', '2018-12-14 09:40:07'),
	(253, 61, 6, '1-Year International Traveller Warranty', 0, 0, '2018-12-14 09:40:07', '2018-12-14 09:40:07'),
	(254, 61, 10, '14" HD 1366 x 768 resolution, high-brightness Acer ComfyViewLED backlit display', 0, 0, '2018-12-14 09:40:07', '2018-12-14 09:40:07'),
	(255, 61, 11, 'Windows 10 Home 64-bit', 0, 0, '2018-12-14 09:40:07', '2018-12-14 09:40:07'),
	(256, 62, 1, 'Intel® Atom™ x5-Z8350 processor', 0, 0, '2018-12-14 09:57:57', '2018-12-14 09:57:57'),
	(257, 62, 2, '2GB DDR3L RAM', 0, 0, '2018-12-14 09:57:57', '2018-12-14 09:57:57'),
	(258, 62, 3, '64 GB eMMC HDD', 0, 0, '2018-12-14 09:57:57', '2018-12-14 09:57:57'),
	(259, 62, 4, 'Intel© HD Graphics with 3D graphics hardware acceleration', 0, 0, '2018-12-14 09:57:57', '2018-12-14 09:57:57'),
	(260, 62, 6, '1 year International Traveller Warranty', 0, 0, '2018-12-14 09:57:57', '2018-12-14 09:57:57'),
	(261, 62, 10, '10.1" IPS HD Multi Touch', 0, 0, '2018-12-14 09:57:57', '2018-12-14 09:57:57'),
	(262, 62, 11, 'Windows 10 Home + Office Mobile', 0, 0, '2018-12-14 09:57:57', '2018-12-14 09:57:57'),
	(263, 63, 1, 'Intel® Core™ i5-8300H processor (8 MB Smart Cache, 2.3 GHz with Turbo Boost up to 4.0 GHz, DDR4, 45 W)', 0, 0, '2018-12-14 10:06:03', '2018-12-14 10:06:03'),
	(264, 63, 2, '4GB DDR4 RAM (4GB x 1, upgradable to 16GB DDR4 x 2)', 0, 0, '2018-12-14 10:06:03', '2018-12-14 10:06:03'),
	(265, 63, 3, '1TB HDD', 0, 0, '2018-12-14 10:06:03', '2018-12-14 10:06:03'),
	(266, 63, 4, 'NVIDIA® GeForce® GTX 1050 with 4 GB of dedicated GDDR5 VRAM', 0, 0, '2018-12-14 10:06:04', '2018-12-14 10:06:04'),
	(267, 63, 6, '2 Years Acer Local Warranty', 0, 0, '2018-12-14 10:06:04', '2018-12-14 10:06:04'),
	(268, 63, 10, '15.6" display with IPS (In-Plane Switching) technology, Full HD 1920 x 1080', 0, 0, '2018-12-14 10:06:04', '2018-12-14 10:06:04'),
	(269, 63, 11, 'Windows 10 Home 64-bit', 0, 0, '2018-12-14 10:06:04', '2018-12-14 10:06:04'),
	(270, 64, 1, 'Intel CoreTM i7-8750H processor (9 MB Smart Cache, 2.2 GHz with Turbo Boost up to 4.1 GHz)', 0, 0, '2018-12-14 10:10:59', '2018-12-14 10:10:59'),
	(271, 64, 2, '16GB DDR4 RAM', 0, 0, '2018-12-14 10:10:59', '2018-12-14 10:10:59'),
	(272, 64, 3, '256GB PCIe Gen3, 8GB/s NVMe SSD + 1TB HDD', 0, 0, '2018-12-14 10:10:59', '2018-12-14 10:10:59'),
	(273, 64, 4, 'NVIDIA® GeForce® GTX 1070 with 8 GB of dedicated GDDR5 VRAM', 0, 0, '2018-12-14 10:10:59', '2018-12-14 10:10:59'),
	(274, 64, 6, '2 years Accidental Damage & Theft warranty with 1st year ITW', 0, 0, '2018-12-14 10:10:59', '2018-12-14 10:10:59'),
	(275, 64, 10, '17.3" display with IPS (In-Plane Switching) technology, Full HD', 0, 0, '2018-12-14 10:10:59', '2018-12-14 10:10:59'),
	(276, 64, 11, 'Windows 10 Home 64-bit', 0, 0, '2018-12-14 10:10:59', '2018-12-14 10:10:59'),
	(277, 65, 1, 'Intel® Core™ i5-8250U Processor', 0, 0, '2018-12-14 10:18:51', '2018-12-14 10:18:51'),
	(278, 65, 2, '4GB (1 x 4GB DDR4 2400 MHz) Ram', 0, 0, '2018-12-14 10:18:51', '2018-12-14 10:18:51'),
	(279, 65, 3, '1TB HDD', 0, 0, '2018-12-14 10:18:51', '2018-12-14 10:18:51'),
	(280, 65, 4, 'NVIDIA® MX110 2G GDDR5', 0, 0, '2018-12-14 10:18:51', '2018-12-14 10:18:51'),
	(281, 65, 6, '2 Years Lenovo on-site warranty', 0, 0, '2018-12-14 10:18:51', '2018-12-14 10:18:51'),
	(282, 65, 10, '14.0 FHD IPS AG(SLIM)', 0, 0, '2018-12-14 10:18:51', '2018-12-14 10:18:51'),
	(283, 65, 11, 'Windows 10 Home', 0, 0, '2018-12-14 10:18:51', '2018-12-14 10:18:51'),
	(284, 66, 1, 'Intel® Core™ i5-8250U Processor (6M Cache, up to 3.40 GHz)', 0, 0, '2018-12-14 10:23:17', '2018-12-14 10:23:17'),
	(285, 66, 2, '4 GB DDR4 Ram', 0, 0, '2018-12-14 10:23:17', '2018-12-14 10:23:17'),
	(286, 66, 3, '1TB HDD', 0, 0, '2018-12-14 10:23:17', '2018-12-14 10:23:17'),
	(287, 66, 4, 'AMD M530 2GB', 0, 0, '2018-12-14 10:23:17', '2018-12-14 10:23:17'),
	(288, 66, 6, '2 Years Lenovo onsite warranty', 0, 0, '2018-12-14 10:23:17', '2018-12-14 10:23:17'),
	(289, 66, 10, '14” FHD (1920 x 1080)', 0, 0, '2018-12-14 10:23:17', '2018-12-14 10:23:17'),
	(290, 66, 11, 'Windows 10 Home', 0, 0, '2018-12-14 10:23:17', '2018-12-14 10:23:17'),
	(291, 67, 1, 'Intel® Core™ i3-7130U Processor', 0, 0, '2018-12-14 10:40:44', '2018-12-14 10:40:44'),
	(292, 67, 2, '4GB DDR4 2133Mhz', 0, 0, '2018-12-14 10:40:44', '2018-12-14 10:40:44'),
	(293, 67, 3, '128GB PCIE SSD', 0, 0, '2018-12-14 10:40:44', '2018-12-14 10:40:44'),
	(294, 67, 4, 'NVIDIA® 940MX 2GB GDDR5', 0, 0, '2018-12-14 10:40:44', '2018-12-14 10:40:44'),
	(295, 67, 6, '2 Yrs On-Site Lenovo Warranty', 0, 0, '2018-12-14 10:40:44', '2018-12-14 10:40:44'),
	(296, 67, 10, '14.0 HD TN AG TOUCH(SLIM)', 0, 0, '2018-12-14 10:40:44', '2018-12-14 10:40:44'),
	(297, 67, 11, 'Windows 10 Home', 0, 0, '2018-12-14 10:40:44', '2018-12-14 10:40:44'),
	(298, 68, 1, 'Intel® Core™ i3-7130U Processor', 0, 0, '2018-12-14 10:45:49', '2018-12-14 10:45:49'),
	(299, 68, 2, '4GB DDR4 ONBOARD Ram', 0, 0, '2018-12-14 10:45:49', '2018-12-14 10:45:49'),
	(300, 68, 3, '128GB SSD PCIE', 0, 0, '2018-12-14 10:45:49', '2018-12-14 10:45:49'),
	(301, 68, 4, 'Intel Integrated Graphic', 0, 0, '2018-12-14 10:45:49', '2018-12-14 10:45:49'),
	(302, 68, 6, '1 Year Lenovo Carry-in Warranty', 0, 0, '2018-12-14 10:45:49', '2018-12-14 10:45:49'),
	(303, 68, 10, '12.2" FHD (1920 x 1080) Multi-touch', 0, 0, '2018-12-14 10:45:49', '2018-12-14 10:45:49'),
	(304, 68, 11, 'Windows 10 Home', 0, 0, '2018-12-14 10:45:49', '2018-12-14 10:45:49'),
	(305, 69, 1, 'AMD A6-9225 Dual-Core (2.6 GHz base frequency, up to 3 GHz burst frequency, 1 MB cache)', 0, 0, '2018-12-14 10:53:17', '2018-12-14 10:53:17'),
	(306, 69, 2, '4 GB DDR4-1866 SDRAM (1 x 4 GB) Ram', 0, 0, '2018-12-14 10:53:17', '2018-12-14 10:53:17'),
	(307, 69, 3, '500 GB 5400 rpm SATA HDD', 0, 0, '2018-12-14 10:53:17', '2018-12-14 10:53:17'),
	(308, 69, 4, 'AMD Radeon™ R4 Graphics', 0, 0, '2018-12-14 10:53:17', '2018-12-14 10:53:17'),
	(309, 69, 6, '1 Year HP onsite warranty', 0, 0, '2018-12-14 10:53:17', '2018-12-14 10:53:17'),
	(310, 69, 10, '14" diagonal HD SVA BrightView micro-edge WLED-backlit (1366 x 768)', 0, 0, '2018-12-14 10:53:17', '2018-12-14 10:53:17'),
	(311, 69, 11, 'Windows 10 Home Single Language 64bit', 0, 0, '2018-12-14 10:53:17', '2018-12-14 10:53:17'),
	(312, 70, 1, 'Intel® Core™ i3-7020U (2.3 GHz(2b), 3 MB cache, 2 cores)', 0, 0, '2018-12-14 11:00:42', '2018-12-14 11:00:42'),
	(313, 70, 2, '4 GB DDR4-2133 SDRAM (1 x 4 GB)', 0, 0, '2018-12-14 11:00:42', '2018-12-14 11:00:42'),
	(314, 70, 3, '1TB (5400RPM) hard drive', 0, 0, '2018-12-14 11:00:42', '2018-12-14 11:00:42'),
	(315, 70, 4, 'Intel® HD Graphics 620', 0, 0, '2018-12-14 11:00:42', '2018-12-14 11:00:42'),
	(316, 70, 6, '1 year local onsite warranty inclusive of 1 year limited International Warranty (part/labor/carry-in)', 0, 0, '2018-12-14 11:00:42', '2018-12-14 11:00:42'),
	(317, 70, 10, '14" diagonal HD SVA BrightView WLED-backlit (1366 x 768)', 0, 0, '2018-12-14 11:00:42', '2018-12-14 11:00:42'),
	(318, 70, 11, 'Windows 10 (64bit)', 0, 0, '2018-12-14 11:00:42', '2018-12-14 11:00:42'),
	(319, 71, 1, 'Intel® Celeron® N4000 (1.1 GHz, up to 2.6 GHz, 4 MB cache, 2 cores)', 0, 0, '2018-12-14 11:06:43', '2018-12-14 11:06:43'),
	(320, 71, 2, '4 GB DDR4-2400 SDRAM (1 x 4 GB)', 0, 0, '2018-12-14 11:06:43', '2018-12-14 11:06:43'),
	(321, 71, 3, '500GB (5400RPM) Hard drive', 0, 0, '2018-12-14 11:06:43', '2018-12-14 11:06:43'),
	(322, 71, 4, 'Intel UHD Graphics 600', 0, 0, '2018-12-14 11:06:43', '2018-12-14 11:06:43'),
	(323, 71, 6, '1 year local onsite warranty inclusive of 1 year limited International Warranty (part/labor/carry-in)', 0, 0, '2018-12-14 11:06:43', '2018-12-14 11:06:43'),
	(324, 71, 10, '14" diagonal HD SVA BrightView WLED-backlit (1366 x 768)', 0, 0, '2018-12-14 11:06:43', '2018-12-14 11:06:43'),
	(325, 71, 11, 'Windows 10 Home Single Language 64', 0, 0, '2018-12-14 11:06:43', '2018-12-14 11:06:43'),
	(340, 72, 1, 'AMD A12-9720P Quad-Core APU (2.7GHz, up to 3.6GHz), 2 MB L2, Quad 15W', 0, 0, '2018-12-14 14:57:42', '2018-12-14 14:57:42'),
	(341, 72, 2, '4 GB DDR4-1866 SDRAM (1 x 4 GB)', 0, 0, '2018-12-14 14:57:42', '2018-12-14 14:57:42'),
	(342, 72, 3, '1TB (5400RPM) hard drive', 0, 0, '2018-12-14 14:57:42', '2018-12-14 14:57:42'),
	(343, 72, 4, 'AMD Radeon™ 530 Graphics (4 GB DDR3 dedicated)', 0, 0, '2018-12-14 14:57:42', '2018-12-14 14:57:42'),
	(344, 72, 6, '1 year local onsite warranty inclusive of 1 year limited International Warranty (part/labor/carry-in)', 0, 0, '2018-12-14 14:57:42', '2018-12-14 14:57:42'),
	(345, 72, 10, '15.6" diagonal HD BrightView WLED-backlit (1366 x 768)', 0, 0, '2018-12-14 14:57:42', '2018-12-14 14:57:42'),
	(346, 72, 11, 'Windows 10 Home 64-Bit', 0, 0, '2018-12-14 14:57:42', '2018-12-14 14:57:42'),
	(578, 59, 1, 'Intel® Core™ i7-8550U Processor', 0, 0, '2018-12-26 04:16:32', '2018-12-26 04:16:32'),
	(579, 59, 2, '16GB DDR4 2400Mhz Ram', 0, 0, '2018-12-26 04:16:32', '2018-12-26 04:16:32'),
	(580, 59, 3, '256GB M.2 NVMe PCIe SSD', 0, 0, '2018-12-26 04:16:32', '2018-12-26 04:16:32'),
	(581, 59, 4, 'Nvidia Geforce® MX150 with 2GB GDDR5', 0, 0, '2018-12-26 04:16:32', '2018-12-26 04:16:32'),
	(582, 59, 6, '2 Years MSI Warranty', 0, 0, '2018-12-26 04:16:32', '2018-12-26 04:16:32'),
	(583, 59, 10, '14.0" FHD (1920x1080), IPS-Level', 0, 0, '2018-12-26 04:16:32', '2018-12-26 04:16:32'),
	(584, 59, 11, 'Windows 10 Home', 0, 0, '2018-12-26 04:16:32', '2018-12-26 04:16:32'),
	(585, 60, 1, 'Intel® Core™ i7-8750H Processor', 0, 0, '2018-12-26 04:17:38', '2018-12-26 04:17:38'),
	(586, 60, 2, '8GB DDR4 Ram', 0, 0, '2018-12-26 04:17:38', '2018-12-26 04:17:38'),
	(587, 60, 3, '1TB2.5" SATA HDD + 128GB M.2 SSD', 0, 0, '2018-12-26 04:17:38', '2018-12-26 04:17:38'),
	(588, 60, 4, 'Nvidia GeForce® GTX 1050 Ti with 4GB GDDR5', 0, 0, '2018-12-26 04:17:38', '2018-12-26 04:17:38'),
	(589, 60, 6, '2 Years MSI Warranty', 0, 0, '2018-12-26 04:17:38', '2018-12-26 04:17:38'),
	(590, 60, 10, '15.6" FHD (1920x1080), Wide-View', 0, 0, '2018-12-26 04:17:38', '2018-12-26 04:17:38'),
	(591, 60, 11, 'Windows 10 Home', 0, 0, '2018-12-26 04:17:38', '2018-12-26 04:17:38'),
	(592, 58, 1, 'Intel® Core™ i7-8750H Processor', 0, 0, '2018-12-26 04:18:18', '2018-12-26 04:18:18'),
	(593, 58, 2, '8GB DDR4 Ram', 0, 0, '2018-12-26 04:18:18', '2018-12-26 04:18:18'),
	(594, 58, 3, '1TB2.5" SATA HDD + 128GB M.2 SSD', 0, 0, '2018-12-26 04:18:18', '2018-12-26 04:18:18'),
	(595, 58, 4, 'Nvidia GeForce® GTX 1050 Ti with 4GB GDDR5', 0, 0, '2018-12-26 04:18:18', '2018-12-26 04:18:18'),
	(596, 58, 6, '2 Years MSI Warranty', 0, 0, '2018-12-26 04:18:18', '2018-12-26 04:18:18'),
	(597, 58, 10, '15.6" FHD (1920x1080), Wide-View', 0, 0, '2018-12-26 04:18:18', '2018-12-26 04:18:18'),
	(598, 58, 11, 'Windows 10 Home', 0, 0, '2018-12-26 04:18:18', '2018-12-26 04:18:18'),
	(599, 57, 1, 'Intel® Core™ i5-8300H Processor', 0, 0, '2018-12-26 04:19:11', '2018-12-26 04:19:11'),
	(600, 57, 2, '4GB DDR4 2400Mhz Ram', 0, 0, '2018-12-26 04:19:11', '2018-12-26 04:19:11'),
	(601, 57, 3, '1TB 2.5" SATA HDD', 0, 0, '2018-12-26 04:19:11', '2018-12-26 04:19:11'),
	(602, 57, 4, 'GeForce® GTX 1050 with 4GB GDDR5', 0, 0, '2018-12-26 04:19:11', '2018-12-26 04:19:11'),
	(603, 57, 6, '2 Years MSI Warranty', 0, 0, '2018-12-26 04:19:11', '2018-12-26 04:19:11'),
	(604, 57, 10, '15.6" FHD (1920x1080), Wide-View', 0, 0, '2018-12-26 04:19:11', '2018-12-26 04:19:11'),
	(605, 57, 11, 'Windows 10 Home', 0, 0, '2018-12-26 04:19:11', '2018-12-26 04:19:11'),
	(606, 73, 1, 'ProcessorIntel(R) Core(TM) i9-8950HK (6-Core, 12MB Cache, Overclocking up to 5.0GHz', 0, 0, '2018-12-26 04:57:45', '2018-12-26 04:57:45'),
	(607, 73, 2, 'Memory16GB, 1x16GB, DDR4, 2666MHzMemory SlotTotal 2 ram slots', 0, 0, '2018-12-26 04:57:45', '2018-12-26 04:57:45'),
	(608, 73, 3, 'Maz up to 32GBStorage512GB PCIe M.2 SSD + 1TB 7200RPM', 0, 0, '2018-12-26 04:57:45', '2018-12-26 04:57:45'),
	(609, 73, 4, 'NVIDIA® GeForce® GTX 1080 OC with 8GB GDDR5', 0, 0, '2018-12-26 04:57:45', '2018-12-26 04:57:45'),
	(610, 73, 6, '1Yr Premium Support Plus:Onsite Service-Retail', 0, 0, '2018-12-26 04:57:45', '2018-12-26 04:57:45'),
	(611, 73, 10, 'Screen / Design / Resolution17.3 inch QHD (2560 x 1440) 120Hz TN+WVA Anti-Glare 400-nits NVIDIA G-SYNC', 0, 0, '2018-12-26 04:57:45', '2018-12-26 04:57:45'),
	(612, 73, 11, 'Operation SystemWindows 10 Home (64bit)', 0, 0, '2018-12-26 04:57:45', '2018-12-26 04:57:45'),
	(613, 74, 1, 'Intel(R) Core(TM) i7-8750H (6-Core, 9MB Cache, up to 4.1GHz w/ Turbo Boost)', 0, 0, '2018-12-26 04:58:30', '2018-12-26 04:58:30'),
	(614, 74, 2, '8GB, DDR4, 2400MHz Memory Slot Total 2 ram slots, Maz 32GB', 0, 0, '2018-12-26 04:58:30', '2018-12-26 04:58:30'),
	(615, 74, 3, '1TB 5400 rpm Hybrid Hard Drive 8GB Cache', 0, 0, '2018-12-26 04:58:30', '2018-12-26 04:58:30'),
	(616, 74, 4, 'NVIDIA GeForce GTX 1060 with 6GB GDDR5', 0, 0, '2018-12-26 04:58:30', '2018-12-26 04:58:30'),
	(617, 74, 6, 'Local Manufacturer Warranty', 0, 0, '2018-12-26 04:58:30', '2018-12-26 04:58:30'),
	(618, 74, 10, '15.6 inch FHD (1920 x 1080) 60Hz IPS Display', 0, 0, '2018-12-26 04:58:30', '2018-12-26 04:58:30'),
	(619, 74, 11, 'Windows 10 Home Single Language', 0, 0, '2018-12-26 04:58:30', '2018-12-26 04:58:30'),
	(620, 75, 1, 'Intel(R) Core(TM) i7-8750H (6-Core, 9MB Cache, up to 4.1GHz w/ Turbo Boost)', 0, 0, '2018-12-26 04:59:50', '2018-12-26 04:59:50'),
	(621, 75, 2, '8GB DDR4 at 2400MHz (1x8GB) Memory Slot Total 2 ram slots, Maz 32GB', 0, 0, '2018-12-26 04:59:50', '2018-12-26 04:59:50'),
	(622, 75, 3, '1TB 5400 rpm Hybrid Hard Drive', 0, 0, '2018-12-26 04:59:50', '2018-12-26 04:59:50'),
	(623, 75, 4, '8GB CacheGraphic Card NVIDIA GeForce GTX 1060 with 6GB GDDR5 graphics memory', 0, 0, '2018-12-26 04:59:50', '2018-12-26 04:59:50'),
	(624, 75, 6, 'Local Manufacturer Warranty', 0, 0, '2018-12-26 04:59:50', '2018-12-26 04:59:50'),
	(625, 75, 10, '17.3 inch FHD (1920 x 1080) 60Hz IPS Anti-Glare', 0, 0, '2018-12-26 04:59:50', '2018-12-26 04:59:50'),
	(626, 75, 11, 'Windows 10 Home Single Language, English, 64-bit', 0, 0, '2018-12-26 04:59:50', '2018-12-26 04:59:50'),
	(634, 85, 1, 'Intel® Core™ i7-8750H (9MB Cache, Up to 4.1GHz)', 0, 0, '2018-12-26 07:04:56', '2018-12-26 07:04:56'),
	(635, 85, 2, '8GB DDR4 Memory (2x4GB) 2133 MHz', 0, 0, '2018-12-26 07:04:56', '2018-12-26 07:04:56'),
	(636, 85, 3, '256GB PCIE SSD + 1TB HDD 5400 RPM', 0, 0, '2018-12-26 07:04:56', '2018-12-26 07:04:56'),
	(637, 85, 4, 'NVIDIA® GeForce® GTX 1060 6GB GDDR5', 0, 0, '2018-12-26 07:04:56', '2018-12-26 07:04:56'),
	(638, 85, 6, '2 Year Acer On-Site Warranty IncludedAccidental and Theft Warranty', 0, 0, '2018-12-26 07:04:56', '2018-12-26 07:04:56'),
	(639, 85, 10, '17.3" FHD IPS Display', 0, 0, '2018-12-26 07:04:56', '2018-12-26 07:04:56'),
	(640, 85, 11, 'Windows 10 Home Single Language 64bit English', 0, 0, '2018-12-26 07:04:56', '2018-12-26 07:04:56'),
	(641, 86, 1, 'Intel® Core i5-8250U processor (6 MB Smart Cache, 1.6 GHz with Turbo Boost up to 3.4 GHz)', 0, 0, '2018-12-26 07:05:48', '2018-12-26 07:05:48'),
	(642, 86, 2, '8GB DDR3L RAM(not upgradable)', 0, 0, '2018-12-26 07:05:48', '2018-12-26 07:05:48'),
	(643, 86, 3, '256GB PCIe SSD', 0, 0, '2018-12-26 07:05:48', '2018-12-26 07:05:48'),
	(644, 86, 4, 'Intel® UHD Graphics 620', 0, 0, '2018-12-26 07:05:48', '2018-12-26 07:05:48'),
	(645, 86, 6, '2 Year Acer Local Warranty', 0, 0, '2018-12-26 07:05:48', '2018-12-26 07:05:48'),
	(646, 86, 10, '14" IPS FHD 1920 x 1080, LED-backlit TFT LCD with Multi Touch', 0, 0, '2018-12-26 07:05:48', '2018-12-26 07:05:48'),
	(647, 86, 11, 'Windows 10 Home 64-bit', 0, 0, '2018-12-26 07:05:48', '2018-12-26 07:05:48'),
	(648, 87, 1, 'Intel® Core i5-8250U processor (1.6 GHz with Turbo Boost up to 3.4 GHz)', 0, 0, '2018-12-26 07:06:50', '2018-12-26 07:06:50'),
	(649, 87, 2, '4GB DDR4 RAM(1 x upgradable slot)', 0, 0, '2018-12-26 07:06:50', '2018-12-26 07:06:50'),
	(650, 87, 3, '128GB SSD + 1TB HDD', 0, 0, '2018-12-26 07:06:50', '2018-12-26 07:06:50'),
	(651, 87, 4, 'Intel® UHD Graphics 620', 0, 0, '2018-12-26 07:06:50', '2018-12-26 07:06:50'),
	(652, 87, 6, '2-Year Local Warranty', 0, 0, '2018-12-26 07:06:50', '2018-12-26 07:06:50'),
	(653, 87, 10, '14" IPS Full HD 1920 x 1080, LED-backlit TFT LCD', 0, 0, '2018-12-26 07:06:50', '2018-12-26 07:06:50'),
	(654, 87, 11, 'Windows 10 Home 64-bit', 0, 0, '2018-12-26 07:06:50', '2018-12-26 07:06:50'),
	(655, 88, 1, 'Intel® Core i5-8250U processor (1.6 GHz with Turbo Boost up to 3.4 GHz)', 0, 0, '2018-12-26 07:07:48', '2018-12-26 07:07:48'),
	(656, 88, 2, '4GB DDR4 RAM(1 x upgradable slot)', 0, 0, '2018-12-26 07:07:48', '2018-12-26 07:07:48'),
	(657, 88, 3, '128GB SSD + 1TB HDD', 0, 0, '2018-12-26 07:07:48', '2018-12-26 07:07:48'),
	(658, 88, 4, 'Intel® UHD Graphics 620', 0, 0, '2018-12-26 07:07:48', '2018-12-26 07:07:48'),
	(659, 88, 6, '2-Year Local Warranty', 0, 0, '2018-12-26 07:07:48', '2018-12-26 07:07:48'),
	(660, 88, 10, '14" IPS Full HD 1920 x 1080, LED-backlit TFT LCD', 0, 0, '2018-12-26 07:07:48', '2018-12-26 07:07:48'),
	(661, 88, 11, 'Windows 10 Home 64-bit', 0, 0, '2018-12-26 07:07:48', '2018-12-26 07:07:48'),
	(662, 89, 1, 'Intel® Core™ i5-7300HQ Processor 2.5 GHz (6M Cache, up to 3.5 GHz)', 0, 0, '2018-12-26 07:32:46', '2018-12-26 07:32:46'),
	(663, 89, 2, 'DRAM DDR4 4GB 2400', 0, 0, '2018-12-26 07:32:46', '2018-12-26 07:32:46'),
	(664, 89, 3, 'SATA 1TB 5400RPM 2.5\' HDD + 128GB M.2 SATA SSD', 0, 0, '2018-12-26 07:32:46', '2018-12-26 07:32:46'),
	(665, 89, 4, 'NVIDIA GeForce GTX 1060 3GB GDDR5', 0, 0, '2018-12-26 07:32:46', '2018-12-26 07:32:46'),
	(666, 89, 6, '2 Years Asus Global Warranty', 0, 0, '2018-12-26 07:32:46', '2018-12-26 07:32:46'),
	(667, 89, 10, '15.6" FHD//60Hz/IPS level//250nits//Anti-glare', 0, 0, '2018-12-26 07:32:46', '2018-12-26 07:32:46'),
	(668, 89, 11, 'Windows 10 (64bit)', 0, 0, '2018-12-26 07:32:46', '2018-12-26 07:32:46'),
	(669, 90, 1, 'Intel Quad-Core i7 7700HQ 2.8GHz up to 3.8GHz', 0, 0, '2018-12-26 07:34:47', '2018-12-26 07:34:47'),
	(670, 90, 2, '4GB DDR4 Ram', 0, 0, '2018-12-26 07:34:47', '2018-12-26 07:34:47'),
	(671, 90, 3, '128GB M.2 SSD + 1TB 5400RPM HDD', 0, 0, '2018-12-26 07:34:47', '2018-12-26 07:34:47'),
	(672, 90, 4, 'Nvidia Geforce GTX1050TI 4GB GDDR5', 0, 0, '2018-12-26 07:34:47', '2018-12-26 07:34:47'),
	(673, 90, 6, '2 Years local manufacturer warranty', 0, 0, '2018-12-26 07:34:47', '2018-12-26 07:34:47'),
	(674, 90, 10, '15.6" FHD(1920x1080) Anti-Glare LED Screen', 0, 0, '2018-12-26 07:34:47', '2018-12-26 07:34:47'),
	(675, 90, 11, 'Genuine Windows 10 Home Edition', 0, 0, '2018-12-26 07:34:47', '2018-12-26 07:34:47'),
	(676, 91, 1, 'Intel® Core™ i5-8300HProcessor', 0, 0, '2018-12-26 07:35:30', '2018-12-26 07:35:30'),
	(677, 91, 2, '4GB DDR4 2666MHz Ram', 0, 0, '2018-12-26 07:35:30', '2018-12-26 07:35:30'),
	(678, 91, 3, 'SATA 1TB 5400RPM 2.5\' HDD', 0, 0, '2018-12-26 07:35:30', '2018-12-26 07:35:30'),
	(679, 91, 4, 'NVIDIA GeForce GTX 1050 4GB GDDR5', 0, 0, '2018-12-26 07:35:30', '2018-12-26 07:35:30'),
	(680, 91, 6, '2 Years Asus Global Warranty', 0, 0, '2018-12-26 07:35:30', '2018-12-26 07:35:30'),
	(681, 91, 10, '15.6" FHD//TN Level//90 Viewing Angle//60Hz//8ms//63% sRGB', 0, 0, '2018-12-26 07:35:30', '2018-12-26 07:35:30'),
	(682, 91, 11, 'Windows 10 Home', 0, 0, '2018-12-26 07:35:30', '2018-12-26 07:35:30'),
	(690, 92, 1, 'Intel® Core™ i5-8250U 1.6GHz up to 3.4GHz (4 Core/8 Threads)', 0, 0, '2018-12-26 07:40:23', '2018-12-26 07:40:23'),
	(691, 92, 2, '8GB LPDDR3L RAM', 0, 0, '2018-12-26 07:40:23', '2018-12-26 07:40:23'),
	(692, 92, 3, '512GB M.2 Sata3 SSD', 0, 0, '2018-12-26 07:40:23', '2018-12-26 07:40:23'),
	(693, 92, 4, 'NVIDIA® GeForce® MX150 2GB GDDR5', 0, 0, '2018-12-26 07:40:23', '2018-12-26 07:40:23'),
	(694, 92, 6, '2 Years Asus Global Warranty', 0, 0, '2018-12-26 07:40:23', '2018-12-26 07:40:23'),
	(695, 92, 10, '14" FHD(1920x1080) NanoEdge LED Screen', 0, 0, '2018-12-26 07:40:23', '2018-12-26 07:40:23'),
	(696, 92, 11, 'Genuine Windows 10 Home Edition', 0, 0, '2018-12-26 07:40:23', '2018-12-26 07:40:23'),
	(697, 93, 1, 'Intel CeleronN4000 Processor (1.10GHz, 2.60GHz, 2C2T, 4MB cache)', 0, 0, '2018-12-26 08:00:05', '2018-12-26 08:00:05'),
	(698, 93, 2, '4GB LPDDR4 2133 ONBOARD Ram', 0, 0, '2018-12-26 08:00:05', '2018-12-26 08:00:05'),
	(699, 93, 3, '64G EMMC Storage', 0, 0, '2018-12-26 08:00:05', '2018-12-26 08:00:05'),
	(700, 93, 4, 'Integrated graphic', 0, 0, '2018-12-26 08:00:05', '2018-12-26 08:00:05'),
	(701, 93, 6, '1 Year Carry-in warranty', 0, 0, '2018-12-26 08:00:05', '2018-12-26 08:00:05'),
	(702, 93, 10, '10.1 HD IPS AG 300N TOUCH Screen', 0, 0, '2018-12-26 08:00:05', '2018-12-26 08:00:05'),
	(703, 93, 11, 'Windows 10 Home', 0, 0, '2018-12-26 08:00:05', '2018-12-26 08:00:05'),
	(704, 94, 1, 'Intel® Core™ i7-7700HQ-2.8GHz - Processor 6M Cache, up to 3.80 GHz', 0, 0, '2018-12-26 08:00:57', '2018-12-26 08:00:57'),
	(705, 94, 2, '8GB DDR4 RAM', 0, 0, '2018-12-26 08:00:57', '2018-12-26 08:00:57'),
	(706, 94, 3, '1TB HDD + 128GB M.2 SSD', 0, 0, '2018-12-26 08:00:57', '2018-12-26 08:00:57'),
	(707, 94, 4, 'NVIDIA GeForce GTX 1060 3GB GDDR5', 0, 0, '2018-12-26 08:00:57', '2018-12-26 08:00:57'),
	(708, 94, 6, '2 Years Lenovo Carry-in Warranty', 0, 0, '2018-12-26 08:00:57', '2018-12-26 08:00:57'),
	(709, 94, 10, '15.6" FHD IPS AG (Slim) Display', 0, 0, '2018-12-26 08:00:57', '2018-12-26 08:00:57'),
	(710, 94, 11, 'Windows 10 Home', 0, 0, '2018-12-26 08:00:57', '2018-12-26 08:00:57'),
	(711, 95, 1, 'Intel® Celeron® Processor N3350 (2M Cache, up to 2.4 GHz)', 0, 0, '2018-12-26 08:36:39', '2018-12-26 08:36:39'),
	(712, 95, 2, '4GB DDR4 Ram', 0, 0, '2018-12-26 08:36:39', '2018-12-26 08:36:39'),
	(713, 95, 3, '500GB HDD', 0, 0, '2018-12-26 08:36:39', '2018-12-26 08:36:39'),
	(714, 95, 4, 'Intel® Integrated Graphics', 0, 0, '2018-12-26 08:36:39', '2018-12-26 08:36:39'),
	(715, 95, 6, '1 Year Lenovo Onsite Warranty', 0, 0, '2018-12-26 08:36:39', '2018-12-26 08:36:39'),
	(716, 95, 10, '11.6"HD (1366x768)', 0, 0, '2018-12-26 08:36:39', '2018-12-26 08:36:39'),
	(717, 95, 11, 'Windows 10 Home', 0, 0, '2018-12-26 08:36:39', '2018-12-26 08:36:39'),
	(718, 96, 1, 'Intel® Pentium® Silver N5000 Processor (4M Cache, up to 2.70 GHz)', 0, 0, '2018-12-26 08:37:48', '2018-12-26 08:37:48'),
	(719, 96, 2, '4GB DDR4 Ram', 0, 0, '2018-12-26 08:37:48', '2018-12-26 08:37:48'),
	(720, 96, 3, '128GB EMMC', 0, 0, '2018-12-26 08:37:48', '2018-12-26 08:37:48'),
	(721, 96, 4, 'Intel® Integrated Graphics', 0, 0, '2018-12-26 08:37:48', '2018-12-26 08:37:48'),
	(722, 96, 6, '1 Year Lenovo Onsite Premium Warranty', 0, 0, '2018-12-26 08:37:48', '2018-12-26 08:37:48'),
	(723, 96, 10, '11.6” HD (1366 x 768) TN anti-glare touchscreen (Slim)', 0, 0, '2018-12-26 08:37:48', '2018-12-26 08:37:48'),
	(724, 96, 11, 'Windows 10 Home', 0, 0, '2018-12-26 08:37:48', '2018-12-26 08:37:48'),
	(725, 81, 1, 'Intel® Core™ i5-8250U (1.6 GHz base frequency, up to 3.4 GHz with Intel® Turbo Boost Technology)', 0, 0, '2018-12-26 08:51:10', '2018-12-26 08:51:10'),
	(726, 81, 2, '4 GB DDR4-2400 SDRAM (1 x 4 GB)', 0, 0, '2018-12-26 08:51:10', '2018-12-26 08:51:10'),
	(727, 81, 3, '256 GB PCIe® NVMe™ M.2 SSD', 0, 0, '2018-12-26 08:51:10', '2018-12-26 08:51:10'),
	(728, 81, 4, 'AMD Radeon™ 530 Graphics (2 GB GDDR5 Dedicated)', 0, 0, '2018-12-26 08:51:10', '2018-12-26 08:51:10'),
	(729, 81, 6, '2 years Local Onsite Warranty inclusive of 1 year limited International Warranty', 0, 0, '2018-12-26 08:51:10', '2018-12-26 08:51:10'),
	(730, 81, 10, '14" diagonal FHD IPS BrightView micro-edge WLED-backlit (1920 x 1080)', 0, 0, '2018-12-26 08:51:10', '2018-12-26 08:51:10'),
	(731, 81, 11, 'Windows 10 Home 64', 0, 0, '2018-12-26 08:51:10', '2018-12-26 08:51:10'),
	(732, 82, 1, 'Intel® Core™ i3-8130U (2.2 GHz base frequency, up to 4 GHz with Intel® Turbo Boost Technology, 4 MB cache, 2 cores)', 0, 0, '2018-12-26 08:52:41', '2018-12-26 08:52:41'),
	(733, 82, 2, '4 GB DDR4-2400 SDRAM (1 x 4 GB)', 0, 0, '2018-12-26 08:52:41', '2018-12-26 08:52:41'),
	(734, 82, 3, '500 GB 5400 rpm SATA HDD', 0, 0, '2018-12-26 08:52:41', '2018-12-26 08:52:41'),
	(735, 82, 4, 'NVIDIA GeForce MX130 2GB', 0, 0, '2018-12-26 08:52:41', '2018-12-26 08:52:41'),
	(736, 82, 6, '2 Years HP onsite Warranty', 0, 0, '2018-12-26 08:52:41', '2018-12-26 08:52:41'),
	(737, 82, 10, '14" diagonal HD SVA micro-edge WLED-backlit multitouch-enabled edge-to-edge glass (1366 x 768)', 0, 0, '2018-12-26 08:52:41', '2018-12-26 08:52:41'),
	(738, 82, 11, 'Windows 10 Home', 0, 0, '2018-12-26 08:52:41', '2018-12-26 08:52:41'),
	(739, 83, 1, 'Intel® Core™ i3-7020U (2.3 GHz(2b), 3 MB cache, 2 cores)', 0, 0, '2018-12-26 08:53:28', '2018-12-26 08:53:28'),
	(740, 83, 2, '4 GB DDR4-2133 SDRAM (1 x 4 GB)', 0, 0, '2018-12-26 08:53:28', '2018-12-26 08:53:28'),
	(741, 83, 3, '1TB (5400RPM) hard drive', 0, 0, '2018-12-26 08:53:28', '2018-12-26 08:53:28'),
	(742, 83, 4, 'Intel® HD Graphics 620', 0, 0, '2018-12-26 08:53:28', '2018-12-26 08:53:28'),
	(743, 83, 6, '1 year local onsite warranty inclusive of 1 year limited International Warranty (part/labor/carry-in)', 0, 0, '2018-12-26 08:53:28', '2018-12-26 08:53:28'),
	(744, 83, 10, '14" diagonal HD SVA BrightView WLED-backlit (1366 x 768)', 0, 0, '2018-12-26 08:53:28', '2018-12-26 08:53:28'),
	(745, 83, 11, 'Windows 10 (64bit)', 0, 0, '2018-12-26 08:53:28', '2018-12-26 08:53:28'),
	(746, 84, 1, 'Intel® Core™ i7-8550U (1.8 GHz base frequency, up to 4 GHz)', 0, 0, '2018-12-26 08:53:56', '2018-12-26 08:53:56'),
	(747, 84, 2, '4 GB DDR4-2400 SDRAM (1 x 4 GB)', 0, 0, '2018-12-26 08:53:56', '2018-12-26 08:53:56'),
	(748, 84, 3, '1 TB 5400 rpm SATA', 0, 0, '2018-12-26 08:53:56', '2018-12-26 08:53:56'),
	(749, 84, 4, 'AMD Radeon™ 530 Graphics (2 GB GDDR5 dedicated)', 0, 0, '2018-12-26 08:53:56', '2018-12-26 08:53:56'),
	(750, 84, 6, '2 year local onsite warranty inclusive of 1 year limited International Warranty (part/labor/carry-in) HP Warranty', 0, 0, '2018-12-26 08:53:56', '2018-12-26 08:53:56'),
	(751, 84, 10, '14" diagonal FHD IPS BrightView micro-edge WLED-backlit (1920 x 1080)', 0, 0, '2018-12-26 08:53:56', '2018-12-26 08:53:56'),
	(752, 84, 11, 'Windows 10 Home 64', 0, 0, '2018-12-26 08:53:56', '2018-12-26 08:53:56'),
	(753, 76, 1, 'Intel(R) Core(TM) i7-8750H Processor (6-Core, 9MB Cache, up to 3.9GHz w/ Turbo Boost)', 0, 0, '2018-12-26 09:05:35', '2018-12-26 09:05:35'),
	(754, 76, 2, '16GB DDR4, 2666MHz', 0, 0, '2018-12-26 09:05:35', '2018-12-26 09:05:35'),
	(755, 76, 3, '256GB SSD (Boot) + 1TB 5400RPM HDD (Storage)', 0, 0, '2018-12-26 09:05:35', '2018-12-26 09:05:35'),
	(756, 76, 4, 'NVIDIA(R) GeForce(R) GTX 1060 NVIDIA(R) Max Q, 6GB GDDR5', 0, 0, '2018-12-26 09:05:35', '2018-12-26 09:05:35'),
	(757, 76, 6, '2 Year Premium Support: Onsite Service W/Accidental Damage-Retail', 0, 0, '2018-12-26 09:05:35', '2018-12-26 09:05:35'),
	(758, 76, 10, '15.6-inch FHD (1920 x 1080) IPS AG LED-Backlit Display', 0, 0, '2018-12-26 09:05:35', '2018-12-26 09:05:35'),
	(759, 76, 11, 'Windows 10 Home Single Language (64bit)', 0, 0, '2018-12-26 09:05:35', '2018-12-26 09:05:35'),
	(760, 77, 1, 'Intel® Core™ i5-8250U Processor (6MB Cache, up to 3.4 GHz)', 0, 0, '2018-12-26 09:06:52', '2018-12-26 09:06:52'),
	(761, 77, 2, '4GB DDR4 Memory (1x4GB) 2400MHz', 0, 0, '2018-12-26 09:06:52', '2018-12-26 09:06:52'),
	(762, 77, 3, '1TB 5400 rpm SATA Hard Drive', 0, 0, '2018-12-26 09:06:52', '2018-12-26 09:06:52'),
	(763, 77, 4, 'AMD Radeon® 530 Graphics with 2G GDDR5', 0, 0, '2018-12-26 09:06:52', '2018-12-26 09:06:52'),
	(764, 77, 6, '1 Yearr Pro Support: Next Business Day Onsite Service-Retail', 0, 0, '2018-12-26 09:06:52', '2018-12-26 09:06:52'),
	(765, 77, 10, '14.0-inch FHD (1920 x 1080) Anti-Glare LED-Backlit Display', 0, 0, '2018-12-26 09:06:52', '2018-12-26 09:06:52'),
	(766, 77, 11, 'Windows 10 Home Single Language 64bit English', 0, 0, '2018-12-26 09:06:52', '2018-12-26 09:06:52'),
	(767, 78, 1, 'Intel(R) Core(TM) i5-8300H Processor (Quad-Core, 8MB Cache, up to 3.9GHz w/ Turbo Boost)', 0, 0, '2018-12-26 09:07:36', '2018-12-26 09:07:36'),
	(768, 78, 2, '4GB, 1x4GB, DDR4, 2666MHz', 0, 0, '2018-12-26 09:07:36', '2018-12-26 09:07:36'),
	(769, 78, 3, '1TB 5400RPM Hard Drive', 0, 0, '2018-12-26 09:07:36', '2018-12-26 09:07:36'),
	(770, 78, 4, 'NVIDIA(R) GeForce(R) GTX 1050 with 4GB GDDR5 Graphics Memory', 0, 0, '2018-12-26 09:07:36', '2018-12-26 09:07:36'),
	(771, 78, 6, '2 Year Premium Support: Onsite Service-Retail', 0, 0, '2018-12-26 09:07:36', '2018-12-26 09:07:36'),
	(772, 78, 10, '15.6-inch FHD (1920 x 1080) IPS Anti-Glare LED-Backlit Display', 0, 0, '2018-12-26 09:07:36', '2018-12-26 09:07:36'),
	(773, 78, 11, 'Windows 10 Home (64bit) Single Language', 0, 0, '2018-12-26 09:07:36', '2018-12-26 09:07:36'),
	(774, 79, 1, 'Intel® Core™ i5-8300H Processor (Quad-Core, 8MB Cache, up to 3.9GHz w/ Turbo Boost)', 0, 0, '2018-12-26 09:09:00', '2018-12-26 09:09:00'),
	(775, 79, 2, '8GB DDR4, 2666MHz', 0, 0, '2018-12-26 09:09:00', '2018-12-26 09:09:00'),
	(776, 79, 3, '1TB 5400 rpm Hybrid Hard Drive with 8GB Cache', 0, 0, '2018-12-26 09:09:00', '2018-12-26 09:09:00'),
	(777, 79, 4, 'NVIDIA® GeForce® GTX 1050 with 4GB GDDR5 Graphics Memory', 0, 0, '2018-12-26 09:09:00', '2018-12-26 09:09:00'),
	(778, 79, 6, '2 Year Premium Support:Onsite Service W/Accidental Damage-Retail', 0, 0, '2018-12-26 09:09:00', '2018-12-26 09:09:00'),
	(779, 79, 10, '15.6-inch FHD (1920 x 1080) IPS Anti-Glare LED-Backlit', 0, 0, '2018-12-26 09:09:00', '2018-12-26 09:09:00'),
	(780, 79, 11, 'Windows 10 Home Single Language (64bit)', 0, 0, '2018-12-26 09:09:00', '2018-12-26 09:09:00'),
	(781, 80, 1, 'Intel(R) Core(TM) i5-8250U Processor (6MB Cache, up to 3.4 GHz)', 0, 0, '2018-12-26 09:09:41', '2018-12-26 09:09:41'),
	(782, 80, 2, '4GB, DDR4, 2400MHz', 0, 0, '2018-12-26 09:09:41', '2018-12-26 09:09:41'),
	(783, 80, 3, '256GB Solid State Drive', 0, 0, '2018-12-26 09:09:41', '2018-12-26 09:09:41'),
	(784, 80, 4, 'AMD Radeon(R) 530 Graphics with 2G GDDR5 Graphics Memory', 0, 0, '2018-12-26 09:09:41', '2018-12-26 09:09:41'),
	(785, 80, 6, '2 Year Premium Support: Onsite Service-Retail', 0, 0, '2018-12-26 09:09:41', '2018-12-26 09:09:41'),
	(786, 80, 10, '13.3-inch FHD (1920 x 1080) Anti-glare LED-Backlit Display', 0, 0, '2018-12-26 09:09:41', '2018-12-26 09:09:41'),
	(787, 80, 11, 'Windows 10 Home (64bit) Single Language English', 0, 0, '2018-12-26 09:09:41', '2018-12-26 09:09:41'),
	(788, 97, 1, 'INTEL® Core™ i5-8250U Processor', 0, 0, '2018-12-28 07:23:16', '2018-12-28 07:23:16'),
	(789, 97, 2, '4G(1X4GBDDR4 2400)Up to 16GB DDR4', 0, 0, '2018-12-28 07:23:16', '2018-12-28 07:23:16'),
	(790, 97, 3, '512GB_M.2_2280_NVME', 0, 0, '2018-12-28 07:23:16', '2018-12-28 07:23:16'),
	(791, 97, 4, 'NVIDIA® MX130 2GB GDDR5', 0, 0, '2018-12-28 07:23:16', '2018-12-28 07:23:16'),
	(792, 97, 6, '2 Yrs on-site Premium Care, 1st year included with Carry-in ADP', 0, 0, '2018-12-28 07:23:16', '2018-12-28 07:23:16'),
	(793, 97, 10, '14.0 FHD IPS GL 250N TOUCH N', 0, 0, '2018-12-28 07:23:16', '2018-12-28 07:23:16'),
	(794, 97, 11, 'WINDOWS 10 HOME', 0, 0, '2018-12-28 07:23:16', '2018-12-28 07:23:16'),
	(795, 98, 1, 'INTEL® Core™ i5-8250U Processor', 0, 0, '2018-12-28 08:00:21', '2018-12-28 08:00:21'),
	(796, 98, 2, '4G(1X4GBDDR4 2400)Up to 16GB DDR4', 0, 0, '2018-12-28 08:00:21', '2018-12-28 08:00:21'),
	(797, 98, 3, '512GB_M.2_2280_NVME', 0, 0, '2018-12-28 08:00:21', '2018-12-28 08:00:21'),
	(798, 98, 4, 'NVIDIA® MX130 2GB GDDR5', 0, 0, '2018-12-28 08:00:21', '2018-12-28 08:00:21'),
	(799, 98, 6, '2 Yrs on-site Premium Care, 1st year included with Carry-in ADP (Accidental Damage Protection)', 0, 0, '2018-12-28 08:00:21', '2018-12-28 08:00:21'),
	(800, 98, 10, '14.0 FHD IPS GL 250N TOUCH N', 0, 0, '2018-12-28 08:00:21', '2018-12-28 08:00:21'),
	(801, 98, 11, 'WINDOWS 10 HOME', 0, 0, '2018-12-28 08:00:21', '2018-12-28 08:00:21'),
	(802, 99, 1, 'Intel® Core™ i5-8265U Processor', 0, 0, '2018-12-28 08:43:47', '2018-12-28 08:43:47'),
	(803, 99, 2, '8GB LPDDR3 2133 MB', 0, 0, '2018-12-28 08:43:47', '2018-12-28 08:43:47'),
	(804, 99, 3, '512GB M.2 2280 NVME', 0, 0, '2018-12-28 08:43:47', '2018-12-28 08:43:47'),
	(805, 99, 4, 'Integrated Graphic', 0, 0, '2018-12-28 08:43:47', '2018-12-28 08:43:47'),
	(806, 99, 6, '2 Yrs on-site Premium Care, 1st year included with Carry-in ADP (Accidental Damage Protection)', 0, 0, '2018-12-28 08:43:47', '2018-12-28 08:43:47'),
	(807, 99, 10, '13.3FHD IPS GL 300N N GLASS', 0, 0, '2018-12-28 08:43:47', '2018-12-28 08:43:47'),
	(808, 99, 11, 'WINDOWS 10 HOME', 0, 0, '2018-12-28 08:43:47', '2018-12-28 08:43:47'),
	(809, 100, 1, 'Intel® Core™ i5-8250U Processor', 0, 0, '2018-12-28 08:51:15', '2018-12-28 08:51:15'),
	(810, 100, 2, '4GB DDR4 2400 ONBOARD - Up to 12 GB DDR4', 0, 0, '2018-12-28 08:51:15', '2018-12-28 08:51:15'),
	(811, 100, 3, '512GB M.2 PCIE 2242', 0, 0, '2018-12-28 08:51:15', '2018-12-28 08:51:15'),
	(812, 100, 4, 'AMD RADEON™ 535 GDDR5 2GB', 0, 0, '2018-12-28 08:51:15', '2018-12-28 08:51:15'),
	(813, 100, 6, '2 Yrs on-site Premium Care warranty', 0, 0, '2018-12-28 08:51:15', '2018-12-28 08:51:15'),
	(814, 100, 10, '14.0 FHD IPS AG 250N N', 0, 0, '2018-12-28 08:51:15', '2018-12-28 08:51:15'),
	(815, 100, 11, 'WINDOWS 10 HOME', 0, 0, '2018-12-28 08:51:15', '2018-12-28 08:51:15'),
	(816, 101, 1, 'Intel® Core™ i5-8250U Processor (6M Cache, up to 3.40 GHz)', 0, 0, '2018-12-28 08:57:13', '2018-12-28 08:57:13'),
	(817, 101, 2, '4 GB DDR4 Ram', 0, 0, '2018-12-28 08:57:13', '2018-12-28 08:57:13'),
	(818, 101, 3, '1TB HDD', 0, 0, '2018-12-28 08:57:13', '2018-12-28 08:57:13'),
	(819, 101, 4, 'AMD M530 2GB', 0, 0, '2018-12-28 08:57:13', '2018-12-28 08:57:13'),
	(820, 101, 6, '2 Years Lenovo onsite warranty', 0, 0, '2018-12-28 08:57:13', '2018-12-28 08:57:13'),
	(821, 101, 10, '14” FHD (1920 x 1080)', 0, 0, '2018-12-28 08:57:13', '2018-12-28 08:57:13'),
	(822, 101, 11, 'Windows 10 Home', 0, 0, '2018-12-28 08:57:13', '2018-12-28 08:57:13');
/*!40000 ALTER TABLE `product_wise_specifications` ENABLE KEYS */;

-- Dumping structure for table shopping.purchases
CREATE TABLE IF NOT EXISTS `purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `cost_price` decimal(5,2) NOT NULL,
  `selling_price` decimal(5,2) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopping.purchases: ~0 rows (approximately)
DELETE FROM `purchases`;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;

-- Dumping structure for table shopping.quote_requests
CREATE TABLE IF NOT EXISTS `quote_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_reg_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_message` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopping.quote_requests: ~0 rows (approximately)
DELETE FROM `quote_requests`;
/*!40000 ALTER TABLE `quote_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote_requests` ENABLE KEYS */;

-- Dumping structure for table shopping.sellers
CREATE TABLE IF NOT EXISTS `sellers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopping.sellers: ~3 rows (approximately)
DELETE FROM `sellers`;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` (`id`, `name`, `email`, `company`, `contact`, `active`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Bata Bangladesh', 'info@bata.com', 'Bata Bangladesh', 'Bata Bazar, Joyourhat, Bangladesh', 1, 0, 0, '2019-02-17 01:00:18', '2019-02-17 01:00:18'),
	(2, 'Amazon Japan', 'info@amazon.jp', 'Amazon japan', 'Amazon HQ, Tokyo, Japan', 1, 1, 1, '2019-02-18 12:42:24', '2019-02-18 12:42:24'),
	(3, 'Mitsubishi', 'info@mitsuboshi.jp', 'Mitsubishi', 'Mitsuboshi HQ, Fukuoka, Japan', 1, 1, 1, '2019-02-18 12:44:59', '2019-02-18 12:44:59');
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;

-- Dumping structure for table shopping.specifications
CREATE TABLE IF NOT EXISTS `specifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopping.specifications: ~11 rows (approximately)
DELETE FROM `specifications`;
/*!40000 ALTER TABLE `specifications` DISABLE KEYS */;
INSERT INTO `specifications` (`id`, `name`, `description`, `active`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Processor', NULL, 1, 0, 0, '2018-10-15 01:15:50', '2018-10-15 01:15:50'),
	(2, 'Ram', NULL, 1, 0, 0, '2018-10-15 01:15:54', '2018-10-15 01:15:54'),
	(3, 'Storage', NULL, 1, 0, 0, '2018-10-15 01:16:02', '2018-10-15 01:16:02'),
	(4, 'Graphics', NULL, 1, 0, 0, '2018-10-15 01:16:13', '2018-10-15 01:16:13'),
	(5, 'Audio', NULL, 1, 0, 0, '2018-10-15 01:16:19', '2018-10-15 01:16:19'),
	(6, 'Warranty', NULL, 1, 0, 0, '2018-10-15 01:16:34', '2018-10-15 01:16:34'),
	(7, 'Range', 'Signal Range', 1, 0, 0, '2018-11-02 12:31:03', '2018-11-02 12:31:03'),
	(8, 'Power', 'Power consumption of the Product', 1, 0, 0, '2018-11-02 12:32:50', '2018-11-02 12:32:50'),
	(9, 'Head Phone', NULL, 1, 0, 0, '2018-12-11 08:37:42', '2018-12-11 08:37:42'),
	(10, 'Display', 'Brand new', 1, 0, 0, '2018-12-12 07:47:17', '2018-12-12 07:47:17'),
	(11, 'Windows', NULL, 1, 0, 0, '2018-12-14 07:48:28', '2018-12-14 07:48:28');
/*!40000 ALTER TABLE `specifications` ENABLE KEYS */;

-- Dumping structure for table shopping.stocks
CREATE TABLE IF NOT EXISTS `stocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `batch` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller_id` int(11) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopping.stocks: ~3 rows (approximately)
DELETE FROM `stocks`;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` (`id`, `product_id`, `quantity`, `batch`, `seller_id`, `expiry_date`, `active`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 101, 334, '4kbzv', 1, '2019-02-23', 1, 1, 1, '2019-02-18 12:40:17', '2019-02-18 12:40:17'),
	(2, 74, 332, '05c8y', 3, '2019-02-23', 1, 1, 1, '2019-02-18 12:46:08', '2019-02-18 12:46:08'),
	(3, 58, 332, '5q04vq', 2, '2019-02-28', 1, 1, 1, '2019-02-18 12:46:40', '2019-02-18 12:46:40');
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;

-- Dumping structure for table shopping.sub_categories
CREATE TABLE IF NOT EXISTS `sub_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopping.sub_categories: ~14 rows (approximately)
DELETE FROM `sub_categories`;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;

-- Dumping structure for table shopping.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopping.users: ~0 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Golam Mahmud Rafi', 'rafi.aust@live.com', '$2y$10$JPrQhDVFr/qitys7CLuqquXzY38d3vobrqXc2sPDPn3DxXfolZHku', NULL, '2019-02-17 09:58:06', '2019-02-17 09:58:06');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
