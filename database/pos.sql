-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2025 at 08:32 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `adjustments`
--

CREATE TABLE `adjustments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference_code` varchar(255) DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `total_products` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adjustment_items`
--

CREATE TABLE `adjustment_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `adjustment_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` double DEFAULT NULL,
  `method_type` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base_units`
--

CREATE TABLE `base_units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `base_units`
--

INSERT INTO `base_units` (`id`, `name`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'piece', 1, '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(2, 'meter', 1, '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(3, 'kilogram', 1, '2023-11-03 23:52:45', '2023-11-03 23:52:45');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Common', NULL, '2025-05-08 20:15:13', '2025-05-08 20:22:56');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(170) NOT NULL,
  `short_code` varchar(170) DEFAULT NULL,
  `phone_code` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `short_code`, `phone_code`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'AF', 93, NULL, NULL),
(2, 'Albania', 'AL', 355, NULL, NULL),
(3, 'Algeria', 'DZ', 213, NULL, NULL),
(4, 'American Samoa', 'AS', 1684, NULL, NULL),
(5, 'Andorra', 'AD', 376, NULL, NULL),
(6, 'Angola', 'AO', 244, NULL, NULL),
(7, 'Anguilla', 'AI', 1264, NULL, NULL),
(8, 'Antarctica', 'AQ', 0, NULL, NULL),
(9, 'Antigua And Barbuda', 'AG', 1268, NULL, NULL),
(10, 'Argentina', 'AR', 54, NULL, NULL),
(11, 'Armenia', 'AM', 374, NULL, NULL),
(12, 'Aruba', 'AW', 297, NULL, NULL),
(13, 'Australia', 'AU', 61, NULL, NULL),
(14, 'Austria', 'AT', 43, NULL, NULL),
(15, 'Azerbaijan', 'AZ', 994, NULL, NULL),
(16, 'Bahamas The', 'BS', 1242, NULL, NULL),
(17, 'Bahrain', 'BH', 973, NULL, NULL),
(18, 'Bangladesh', 'BD', 880, NULL, NULL),
(19, 'Barbados', 'BB', 1246, NULL, NULL),
(20, 'Belarus', 'BY', 375, NULL, NULL),
(21, 'Belgium', 'BE', 32, NULL, NULL),
(22, 'Belize', 'BZ', 501, NULL, NULL),
(23, 'Benin', 'BJ', 229, NULL, NULL),
(24, 'Bermuda', 'BM', 1441, NULL, NULL),
(25, 'Bhutan', 'BT', 975, NULL, NULL),
(26, 'Bolivia', 'BO', 591, NULL, NULL),
(27, 'Bosnia and Herzegovina', 'BA', 387, NULL, NULL),
(28, 'Botswana', 'BW', 267, NULL, NULL),
(29, 'Bouvet Island', 'BV', 0, NULL, NULL),
(30, 'Brazil', 'BR', 55, NULL, NULL),
(31, 'British Indian Ocean Territory', 'IO', 246, NULL, NULL),
(32, 'Brunei', 'BN', 673, NULL, NULL),
(33, 'Bulgaria', 'BG', 359, NULL, NULL),
(34, 'Burkina Faso', 'BF', 226, NULL, NULL),
(35, 'Burundi', 'BI', 257, NULL, NULL),
(36, 'Cambodia', 'KH', 855, NULL, NULL),
(37, 'Cameroon', 'CM', 237, NULL, NULL),
(38, 'Canada', 'CA', 1, NULL, NULL),
(39, 'Cape Verde', 'CV', 238, NULL, NULL),
(40, 'Cayman Islands', 'KY', 1345, NULL, NULL),
(41, 'Central African Republic', 'CF', 236, NULL, NULL),
(42, 'Chad', 'TD', 235, NULL, NULL),
(43, 'Chile', 'CL', 56, NULL, NULL),
(44, 'China', 'CN', 86, NULL, NULL),
(45, 'Christmas Island', 'CX', 61, NULL, NULL),
(46, 'Cocos (Keeling) Islands', 'CC', 672, NULL, NULL),
(47, 'Colombia', 'CO', 57, NULL, NULL),
(48, 'Comoros', 'KM', 269, NULL, NULL),
(49, 'Republic Of The Congo', 'CG', 242, NULL, NULL),
(50, 'Democratic Republic Of The Congo', 'CD', 242, NULL, NULL),
(51, 'Cook Islands', 'CK', 682, NULL, NULL),
(52, 'Costa Rica', 'CR', 506, NULL, NULL),
(53, 'Cote D\'\'Ivoire (Ivory Coast)', 'CI', 225, NULL, NULL),
(54, 'Croatia (Hrvatska)', 'HR', 385, NULL, NULL),
(55, 'Cuba', 'CU', 53, NULL, NULL),
(56, 'Cyprus', 'CY', 357, NULL, NULL),
(57, 'Czech Republic', 'CZ', 420, NULL, NULL),
(58, 'Denmark', 'DK', 45, NULL, NULL),
(59, 'Djibouti', 'DJ', 253, NULL, NULL),
(60, 'Dominica', 'DM', 1767, NULL, NULL),
(61, 'Dominican Republic', 'DO', 1809, NULL, NULL),
(62, 'East Timor', 'TP', 670, NULL, NULL),
(63, 'Ecuador', 'EC', 593, NULL, NULL),
(64, 'Egypt', 'EG', 20, NULL, NULL),
(65, 'El Salvador', 'SV', 503, NULL, NULL),
(66, 'Equatorial Guinea', 'GQ', 240, NULL, NULL),
(67, 'Eritrea', 'ER', 291, NULL, NULL),
(68, 'Estonia', 'EE', 372, NULL, NULL),
(69, 'Ethiopia', 'ET', 251, NULL, NULL),
(70, 'External Territories of Australia', 'XA', 61, NULL, NULL),
(71, 'Falkland Islands', 'FK', 500, NULL, NULL),
(72, 'Faroe Islands', 'FO', 298, NULL, NULL),
(73, 'Fiji Islands', 'FJ', 679, NULL, NULL),
(74, 'Finland', 'FI', 358, NULL, NULL),
(75, 'France', 'FR', 33, NULL, NULL),
(76, 'French Guiana', 'GF', 594, NULL, NULL),
(77, 'French Polynesia', 'PF', 689, NULL, NULL),
(78, 'French Southern Territories', 'TF', 0, NULL, NULL),
(79, 'Gabon', 'GA', 241, NULL, NULL),
(80, 'Gambia The', 'GM', 220, NULL, NULL),
(81, 'Georgia', 'GE', 995, NULL, NULL),
(82, 'Germany', 'DE', 49, NULL, NULL),
(83, 'Ghana', 'GH', 233, NULL, NULL),
(84, 'Gibraltar', 'GI', 350, NULL, NULL),
(85, 'Greece', 'GR', 30, NULL, NULL),
(86, 'Greenland', 'GL', 299, NULL, NULL),
(87, 'Grenada', 'GD', 1473, NULL, NULL),
(88, 'Guadeloupe', 'GP', 590, NULL, NULL),
(89, 'Guam', 'GU', 1671, NULL, NULL),
(90, 'Guatemala', 'GT', 502, NULL, NULL),
(91, 'Guernsey and Alderney', 'XU', 44, NULL, NULL),
(92, 'Guinea', 'GN', 224, NULL, NULL),
(93, 'Guinea-Bissau', 'GW', 245, NULL, NULL),
(94, 'Guyana', 'GY', 592, NULL, NULL),
(95, 'Haiti', 'HT', 509, NULL, NULL),
(96, 'Heard and McDonald Islands', 'HM', 0, NULL, NULL),
(97, 'Honduras', 'HN', 504, NULL, NULL),
(98, 'Hong Kong S.A.R.', 'HK', 852, NULL, NULL),
(99, 'Hungary', 'HU', 36, NULL, NULL),
(100, 'Iceland', 'IS', 354, NULL, NULL),
(101, 'India', 'IN', 91, NULL, NULL),
(102, 'Indonesia', 'ID', 62, NULL, NULL),
(103, 'Iran', 'IR', 98, NULL, NULL),
(104, 'Iraq', 'IQ', 964, NULL, NULL),
(105, 'Ireland', 'IE', 353, NULL, NULL),
(106, 'Israel', 'IL', 972, NULL, NULL),
(107, 'Italy', 'IT', 39, NULL, NULL),
(108, 'Jamaica', 'JM', 1876, NULL, NULL),
(109, 'Japan', 'JP', 81, NULL, NULL),
(110, 'Jersey', 'XJ', 44, NULL, NULL),
(111, 'Jordan', 'JO', 962, NULL, NULL),
(112, 'Kazakhstan', 'KZ', 7, NULL, NULL),
(113, 'Kenya', 'KE', 254, NULL, NULL),
(114, 'Kiribati', 'KI', 686, NULL, NULL),
(115, 'Korea North', 'KP', 850, NULL, NULL),
(116, 'Korea South', 'KR', 82, NULL, NULL),
(117, 'Kuwait', 'KW', 965, NULL, NULL),
(118, 'Kyrgyzstan', 'KG', 996, NULL, NULL),
(119, 'Laos', 'LA', 856, NULL, NULL),
(120, 'Latvia', 'LV', 371, NULL, NULL),
(121, 'Lebanon', 'LB', 961, NULL, NULL),
(122, 'Lesotho', 'LS', 266, NULL, NULL),
(123, 'Liberia', 'LR', 231, NULL, NULL),
(124, 'Libya', 'LY', 218, NULL, NULL),
(125, 'Liechtenstein', 'LI', 423, NULL, NULL),
(126, 'Lithuania', 'LT', 370, NULL, NULL),
(127, 'Luxembourg', 'LU', 352, NULL, NULL),
(128, 'Macau S.A.R.', 'MO', 853, NULL, NULL),
(129, 'Macedonia', 'MK', 389, NULL, NULL),
(130, 'Madagascar', 'MG', 261, NULL, NULL),
(131, 'Malawi', 'MW', 265, NULL, NULL),
(132, 'Malaysia', 'MY', 60, NULL, NULL),
(133, 'Maldives', 'MV', 960, NULL, NULL),
(134, 'Mali', 'ML', 223, NULL, NULL),
(135, 'Malta', 'MT', 356, NULL, NULL),
(136, 'Man (Isle of)', 'XM', 44, NULL, NULL),
(137, 'Marshall Islands', 'MH', 692, NULL, NULL),
(138, 'Martinique', 'MQ', 596, NULL, NULL),
(139, 'Mauritania', 'MR', 222, NULL, NULL),
(140, 'Mauritius', 'MU', 230, NULL, NULL),
(141, 'Mayotte', 'YT', 269, NULL, NULL),
(142, 'Mexico', 'MX', 52, NULL, NULL),
(143, 'Micronesia', 'FM', 691, NULL, NULL),
(144, 'Moldova', 'MD', 373, NULL, NULL),
(145, 'Monaco', 'MC', 377, NULL, NULL),
(146, 'Mongolia', 'MN', 976, NULL, NULL),
(147, 'Montserrat', 'MS', 1664, NULL, NULL),
(148, 'Morocco', 'MA', 212, NULL, NULL),
(149, 'Mozambique', 'MZ', 258, NULL, NULL),
(150, 'Myanmar', 'MM', 95, NULL, NULL),
(151, 'Namibia', 'NA', 264, NULL, NULL),
(152, 'Nauru', 'NR', 674, NULL, NULL),
(153, 'Nepal', 'NP', 977, NULL, NULL),
(154, 'Netherlands Antilles', 'AN', 599, NULL, NULL),
(155, 'Netherlands The', 'NL', 31, NULL, NULL),
(156, 'New Caledonia', 'NC', 687, NULL, NULL),
(157, 'New Zealand', 'NZ', 64, NULL, NULL),
(158, 'Nicaragua', 'NI', 505, NULL, NULL),
(159, 'Niger', 'NE', 227, NULL, NULL),
(160, 'Nigeria', 'NG', 234, NULL, NULL),
(161, 'Niue', 'NU', 683, NULL, NULL),
(162, 'Norfolk Island', 'NF', 672, NULL, NULL),
(163, 'Northern Mariana Islands', 'MP', 1670, NULL, NULL),
(164, 'Norway', 'NO', 47, NULL, NULL),
(165, 'Oman', 'OM', 968, NULL, NULL),
(166, 'Pakistan', 'PK', 92, NULL, NULL),
(167, 'Palau', 'PW', 680, NULL, NULL),
(168, 'Palestinian Territory Occupied', 'PS', 970, NULL, NULL),
(169, 'Panama', 'PA', 507, NULL, NULL),
(170, 'Papua new Guinea', 'PG', 675, NULL, NULL),
(171, 'Paraguay', 'PY', 595, NULL, NULL),
(172, 'Peru', 'PE', 51, NULL, NULL),
(173, 'Philippines', 'PH', 63, NULL, NULL),
(174, 'Pitcairn Island', 'PN', 0, NULL, NULL),
(175, 'Poland', 'PL', 48, NULL, NULL),
(176, 'Portugal', 'PT', 351, NULL, NULL),
(177, 'Puerto Rico', 'PR', 1787, NULL, NULL),
(178, 'Qatar', 'QA', 974, NULL, NULL),
(179, 'Reunion', 'RE', 262, NULL, NULL),
(180, 'Romania', 'RO', 40, NULL, NULL),
(181, 'Russia', 'RU', 70, NULL, NULL),
(182, 'Rwanda', 'RW', 250, NULL, NULL),
(183, 'Saint Helena', 'SH', 290, NULL, NULL),
(184, 'Saint Kitts And Nevis', 'KN', 1869, NULL, NULL),
(185, 'Saint Lucia', 'LC', 1758, NULL, NULL),
(186, 'Saint Pierre and Miquelon', 'PM', 508, NULL, NULL),
(187, 'Saint Vincent And The Grenadines', 'VC', 1784, NULL, NULL),
(188, 'Samoa', 'WS', 684, NULL, NULL),
(189, 'San Marino', 'SM', 378, NULL, NULL),
(190, 'Sao Tome and Principe', 'ST', 239, NULL, NULL),
(191, 'Saudi Arabia', 'SA', 966, NULL, NULL),
(192, 'Senegal', 'SN', 221, NULL, NULL),
(193, 'Serbia', 'RS', 381, NULL, NULL),
(194, 'Seychelles', 'SC', 248, NULL, NULL),
(195, 'Sierra Leone', 'SL', 232, NULL, NULL),
(196, 'Singapore', 'SG', 65, NULL, NULL),
(197, 'Slovakia', 'SK', 421, NULL, NULL),
(198, 'Slovenia', 'SI', 386, NULL, NULL),
(199, 'Smaller Territories of the UK', 'XG', 44, NULL, NULL),
(200, 'Solomon Islands', 'SB', 677, NULL, NULL),
(201, 'Somalia', 'SO', 252, NULL, NULL),
(202, 'South Africa', 'ZA', 27, NULL, NULL),
(203, 'South Georgia', 'GS', 0, NULL, NULL),
(204, 'South Sudan', 'SS', 211, NULL, NULL),
(205, 'Spain', 'ES', 34, NULL, NULL),
(206, 'Sri Lanka', 'LK', 94, NULL, NULL),
(207, 'Sudan', 'SD', 249, NULL, NULL),
(208, 'Suriname', 'SR', 597, NULL, NULL),
(209, 'Svalbard And Jan Mayen Islands', 'SJ', 47, NULL, NULL),
(210, 'Swaziland', 'SZ', 268, NULL, NULL),
(211, 'Sweden', 'SE', 46, NULL, NULL),
(212, 'Switzerland', 'CH', 41, NULL, NULL),
(213, 'Syria', 'SY', 963, NULL, NULL),
(214, 'Taiwan', 'TW', 886, NULL, NULL),
(215, 'Tajikistan', 'TJ', 992, NULL, NULL),
(216, 'Tanzania', 'TZ', 255, NULL, NULL),
(217, 'Thailand', 'TH', 66, NULL, NULL),
(218, 'Togo', 'TG', 228, NULL, NULL),
(219, 'Tokelau', 'TK', 690, NULL, NULL),
(220, 'Tonga', 'TO', 676, NULL, NULL),
(221, 'Trinidad And Tobago', 'TT', 1868, NULL, NULL),
(222, 'Tunisia', 'TN', 216, NULL, NULL),
(223, 'Turkey', 'TR', 90, NULL, NULL),
(224, 'Turkmenistan', 'TM', 7370, NULL, NULL),
(225, 'Turks And Caicos Islands', 'TC', 1649, NULL, NULL),
(226, 'Tuvalu', 'TV', 688, NULL, NULL),
(227, 'Uganda', 'UG', 256, NULL, NULL),
(228, 'Ukraine', 'UA', 380, NULL, NULL),
(229, 'United Arab Emirates', 'AE', 971, NULL, NULL),
(230, 'United Kingdom', 'GB', 44, NULL, NULL),
(231, 'United States', 'US', 1, NULL, NULL),
(232, 'United States Minor Outlying Islands', 'UM', 1, NULL, NULL),
(233, 'Uruguay', 'UY', 598, NULL, NULL),
(234, 'Uzbekistan', 'UZ', 998, NULL, NULL),
(235, 'Vanuatu', 'VU', 678, NULL, NULL),
(236, 'Vatican City State (Holy See)', 'VA', 39, NULL, NULL),
(237, 'Venezuela', 'VE', 58, NULL, NULL),
(238, 'Vietnam', 'VN', 84, NULL, NULL),
(239, 'Virgin Islands (British)', 'VG', 1284, NULL, NULL),
(240, 'Virgin Islands (US)', 'VI', 1340, NULL, NULL),
(241, 'Wallis And Futuna Islands', 'WF', 681, NULL, NULL),
(242, 'Western Sahara', 'EH', 212, NULL, NULL),
(243, 'Yemen', 'YE', 967, NULL, NULL),
(244, 'Yugoslavia', 'YU', 38, NULL, NULL),
(245, 'Zambia', 'ZM', 260, NULL, NULL),
(246, 'Zimbabwe', 'ZW', 26, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_codes`
--

CREATE TABLE `coupon_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `how_many_time_can_use` int(11) NOT NULL,
  `discount_type` int(11) NOT NULL,
  `discount` double NOT NULL,
  `how_many_time_used` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_product`
--

CREATE TABLE `coupon_product` (
  `coupon_code_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `created_at`, `updated_at`) VALUES
(1, 'Sri Lanka', 'Rs.', 'Rs.', '2023-11-03 23:52:46', '2023-11-03 23:52:46');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `dob` date DEFAULT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `dob`, `country`, `city`, `address`, `created_at`, `updated_at`) VALUES
(1, 'walk-in-customer', 'customer@infypos.com', '123456789', NULL, 'india', 'mumbai', 'Dr Deshmukh Marg , mumbai', '2023-11-03 23:52:46', '2023-11-03 23:52:46');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `expense_category_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `reference_code` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holds`
--

CREATE TABLE `holds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_code` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate` double DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `shipping` double DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `received_amount` double DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hold_items`
--

CREATE TABLE `hold_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hold_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_price` double DEFAULT NULL,
  `net_unit_price` double DEFAULT NULL,
  `tax_type` int(11) NOT NULL,
  `tax_value` double DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `discount_type` int(11) NOT NULL,
  `discount_value` double DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `sale_unit` int(11) NOT NULL,
  `quantity` double DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `iso_code` varchar(191) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `iso_code`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Arabic', 'ar', 0, '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(2, 'Chinese', 'cn', 0, '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(3, 'English', 'en', 1, '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(4, 'French', 'fr', 0, '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(5, 'German', 'gr', 0, '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(6, 'Spanish', 'sp', 0, '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(7, 'Turkish', 'tr', 0, '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(8, 'vietnamese', 'vi', 0, '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(9, 'Sinhala', '63', 0, '2025-05-08 19:49:47', '2025-05-08 19:49:47');

-- --------------------------------------------------------

--
-- Table structure for table `mail_templates`
--

CREATE TABLE `mail_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `template_name` text NOT NULL,
  `content` longtext NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mail_templates`
--

INSERT INTO `mail_templates` (`id`, `template_name`, `content`, `type`, `created_at`, `updated_at`, `status`) VALUES
(1, 'GREETING TO CUSTOMER ON SALES !', '<p>Hi, {customer_name}</p><p>Your sales Id is {sales_id}</p><p>Sales Date: {sales_date}</p><p>Total Amount: {sales_amount}</p><p>You have paid: {paid_amount}</p><p>Due amount: {due_amount}</p><p>Regards,  {app_name}</p>', '1', '2023-11-03 23:52:45', '2023-11-03 23:52:45', 0),
(2, 'GREETING TO CUSTOMER ON SALES RETURN !', '<p>Hi, {customer_name}</p><p>Your sales return Id is {sales_return_id}</p><p>Sales return Date: {sales_return_date}</p><p>Total Amount: {sales_return_amount}</p><p>Regards,  {app_name}</p>', '2', '2023-11-03 23:52:45', '2023-11-03 23:52:45', 0);

-- --------------------------------------------------------

--
-- Table structure for table `main_products`
--

CREATE TABLE `main_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `product_unit` varchar(255) DEFAULT NULL,
  `product_type` tinyint(4) NOT NULL COMMENT '1=Single, 2=Variable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `main_products`
--

INSERT INTO `main_products` (`id`, `name`, `code`, `product_unit`, `product_type`, `created_at`, `updated_at`) VALUES
(7, 'book', '1010116', '1', 1, '2025-05-08 20:29:04', '2025-05-08 20:29:04');

-- --------------------------------------------------------

--
-- Table structure for table `manage_stocks`
--

CREATE TABLE `manage_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `alert` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manage_stocks`
--

INSERT INTO `manage_stocks` (`id`, `warehouse_id`, `product_id`, `quantity`, `created_at`, `updated_at`, `alert`) VALUES
(1, 1, 7, 18, '2025-05-08 20:29:05', '2025-05-08 21:08:10', 0);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Setting', 34, '1f1f3d5f-6aaa-4444-891b-be16fd215d4b', 'settings', '—Pngtree—letter l logo png design_6844876', '—Pngtree—letter-l-logo-png-design_6844876.png', 'image/png', 'public', 'public', 133388, '[]', '[]', '[]', '[]', 1, '2025-05-08 20:11:30', '2025-05-08 20:11:30'),
(2, 'App\\Models\\Setting', 34, '1dc9f638-d338-4bce-8767-c6dcbcef6c98', 'settings', 'infycare-logo', 'infycare-logo.png', 'image/png', 'public', 'public', 112467, '[]', '[]', '[]', '[]', 2, '2025-05-08 20:44:30', '2025-05-08 20:44:30');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_02_18_051026_create_brands', 1),
(6, '2022_02_18_063507_create_media_table', 1),
(7, '2022_02_21_073634_create_permission_tables', 1),
(8, '2022_03_01_045721_add_display_name_into_permissions_and_roles', 1),
(9, '2022_03_02_042109_create_currencies_table', 1),
(10, '2022_03_02_050637_create_product_categories_table', 1),
(11, '2022_03_02_071803_create_units_table', 1),
(12, '2022_03_02_125151_create_warehouse_table', 1),
(13, '2022_03_03_094656_create_product_table', 1),
(14, '2022_03_04_112848_create_customer_table', 1),
(15, '2022_03_05_045741_create_suppliers_table', 1),
(16, '2022_03_05_064104_add_columns_in_users_table', 1),
(17, '2022_03_08_051830_create_sales_table', 1),
(18, '2022_03_08_055549_creat_sale_items_table', 1),
(19, '2022_03_09_095426_create_expense_categories_table', 1),
(20, '2022_03_09_105321_create_expenses_table', 1),
(21, '2022_03_10_101744_create_settings_table', 1),
(22, '2022_03_14_101110_create_purchases_table', 1),
(23, '2022_03_15_072023_create_purchase_items_table', 1),
(24, '2022_03_15_122143_add_column_barcode_symbol_products_table', 1),
(25, '2022_03_16_050519_change_description_filed_type_expense_category_table', 1),
(26, '2022_05_10_104622_add_language_field_in_users', 1),
(27, '2022_05_13_111052_add_title_field_in_expenses', 1),
(28, '2022_05_20_093240_add_new_field_to_sales_table', 1),
(29, '2022_05_23_061225_create_sales_return_table', 1),
(30, '2022_05_23_065104_create_sale_return_items_table', 1),
(31, '2022_05_24_045822_create_purchases_return_table', 1),
(32, '2022_05_24_050431_create_purchases_return_items_table', 1),
(33, '2022_05_31_123143_remove_warehouse_id_field_into_products_table', 1),
(34, '2022_06_01_100610_create_manage_stocks_table', 1),
(35, '2022_07_12_102722_add_new_filed_to_manage_stocks_table', 1),
(36, '2022_07_29_085151_create_sales_payments_table', 1),
(37, '2022_08_04_061313_add_reference_field_to_sales_payments_table', 1),
(38, '2022_08_04_114100_add_received_amount_field_to_sales_payments_table', 1),
(39, '2022_08_05_105849_create_adjustments_table', 1),
(40, '2022_08_05_110241_create_adjustment_items_table', 1),
(41, '2022_08_29_093912_create_transfers_table', 1),
(42, '2022_08_29_094749_create_transfer_items_table', 1),
(43, '2022_09_06_113032_version_1_3_0_seeder', 1),
(44, '2022_09_10_075820_create_mail_templates_table', 1),
(45, '2022_09_12_041933_add_email_template_seeder', 1),
(46, '2022_09_14_050339_create_countries_table', 1),
(47, '2022_09_14_050458_create_states_table', 1),
(48, '2022_09_14_065609_assign_all_permission_seeder', 1),
(49, '2022_09_14_071523_countries_seeder', 1),
(50, '2022_09_15_052207_create_quotations_table', 1),
(51, '2022_09_15_053604_create_quotation_items_table', 1),
(52, '2022_09_15_100204_add_post_code_seeder_migration', 1),
(53, '2022_09_15_104720_add_date_format_seeder_migration', 1),
(54, '2022_09_15_113413_default_email_report_quotation_seeder_migration', 1),
(55, '2022_09_16_062735_add_setting_prefix_code_seeder', 1),
(56, '2022_09_27_103942_add_new_field_in_sales', 1),
(57, '2022_09_27_115534_add_new_field_in_quotations', 1),
(58, '2022_10_03_074141_create_sms_templates_table', 1),
(59, '2022_10_03_090646_add_sms_template_seeder', 1),
(60, '2022_10_03_095418_create_sms_settings_table', 1),
(61, '2022_10_03_102421_add_sms_settings_seeder', 1),
(62, '2022_10_08_074726_add_status_to_mail_templates_table', 1),
(63, '2022_10_08_074912_add_status_to_sms_templates_table', 1),
(64, '2022_10_11_110325_add_default_currency_right_setting_seeder', 1),
(65, '2022_10_14_041746_add_sms_permissions_seeder', 1),
(66, '2022_10_15_044226_add_sale_id_to_sales_return_table', 1),
(67, '2022_10_17_052105_add_is_return_field_to_sales_table', 1),
(68, '2022_10_17_062353_add_sold_quantity_field_to_sale_return_items_table', 1),
(69, '2022_11_08_050601_create_holds_table', 1),
(70, '2022_11_08_051309_create_hold_items_table', 1),
(71, '2022_11_10_105949_add_quantity_limit_to_products_table', 1),
(72, '2022_11_29_070305_create_base_units_table', 1),
(73, '2022_11_30_071556_add_base_units_seeder', 1),
(74, '2022_12_20_044834_add_dob_field_to_customers_table', 1),
(75, '2022_12_22_000000_add_expires_at_to_personal_access_tokens_table', 1),
(76, '2023_01_06_052856_create_languages_table', 1),
(77, '2023_01_06_053950_language_table_seeder', 1),
(78, '2023_01_09_103904_add_is_default_to_base_units_table', 1),
(79, '2023_01_09_104123_add_base_unit_default_seeder', 1),
(80, '2023_01_09_112217_change_datatype_base_unit_field_to_units_table', 1),
(81, '2023_06_13_112717_add_pos_register_table', 1),
(82, '2023_06_16_115153_add_new_field_into_sales_table', 1),
(83, '2023_07_07_064405_create_coupon_codes_table', 1),
(84, '2023_07_07_083655_create_coupon_product_table', 1),
(85, '2023_09_16_000000_rename_password_resets_table', 1),
(86, '2023_11_21_115157_add_manage_variations_permission', 2),
(87, '2023_11_21_123327_create_variations_table', 2),
(88, '2023_11_21_123338_create_variation_types_table', 2),
(89, '2023_12_21_065548_add_product_code_field_in_products_table', 2),
(90, '2023_12_21_090730_add_variation_products_table', 2),
(91, '2023_12_22_064744_create_main_products_table', 2),
(92, '2023_12_22_065109_add_main_product_id_field_in_variation_products_table', 2),
(93, '2023_12_22_065227_fill_up_product_code', 2),
(94, '2023_12_29_064841_add_main_product_id_field_in_products_table', 2),
(95, '2023_12_29_065039_fill_up_main_product_table_data', 2),
(96, '2024_01_12_093843_move_product_images_to_main_product', 2),
(97, '2024_03_01_085230_add_new_field_in_settings_table', 2),
(98, '2024_03_13_103510_add_new_setting_value_in_settings_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `guard_name` varchar(255) NOT NULL DEFAULT 'web',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'manage_adjustments', 'Manage Adjustments', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(2, 'manage_transfers', 'Manage Transfers', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(3, 'manage_roles', 'Manage Roles', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(4, 'manage_brands', 'Manage Brands', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(5, 'manage_currency', 'Manage Currency', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(6, 'manage_warehouses', 'Manage Warehouses', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(7, 'manage_units', 'Manage Units', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(8, 'manage_product_categories', 'Manage Product Categories', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(9, 'manage_products', 'Manage Products ', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(10, 'manage_suppliers', 'Manage Suppliers', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(11, 'manage_customers', 'Manage Customers', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(12, 'manage_users', 'Manage Users', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(13, 'manage_expense_categories', 'Manage Expense Categories', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(14, 'manage_expenses', 'Manage Expenses', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(15, 'manage_setting', 'Manage Setting', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(16, 'manage_dashboard', 'Manage Dashboard', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(17, 'manage_pos_screen', 'Manage Pos Screen', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(18, 'manage_purchase', 'Manage Purchase', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(19, 'manage_sale', 'Manage Sale', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(20, 'manage_purchase_return', 'Manage Purchase Return', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(21, 'manage_sale_return', 'Manage Sale Return', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(22, 'manage_email_templates', 'Manage Email Templates', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(23, 'manage_reports', 'Manage Reports', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(24, 'manage_quotations', 'Manage Quotations', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(25, 'manage_sms_templates', 'Manage Sms Templates', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(26, 'manage_sms_apis', 'Manage Sms Apis', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(27, 'manage_language', 'Manage Language', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(28, 'manage_variations', 'Manage Variations', 'web', '2025-05-08 19:16:23', '2025-05-08 19:16:23');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'token', '6c6ddf8d6da20e785e680fa10405626a974a75d16c42c59598e438612201ceb7', '[\"*\"]', '2025-05-08 21:21:03', NULL, '2025-05-08 19:22:16', '2025-05-08 21:21:03'),
(2, 'App\\Models\\User', 1, 'token', 'd323d5e37aa6653b509cd453aa5d635df4c23571f38461a184507f35d22f558a', '[\"*\"]', '2025-05-09 00:02:19', NULL, '2025-05-08 22:11:23', '2025-05-09 00:02:19'),
(3, 'App\\Models\\User', 1, 'token', '36984874b519c2a246754477eb83810b7ef0a17ebfd10351bea8fe0b9243cc84', '[\"*\"]', '2025-05-09 00:53:09', NULL, '2025-05-09 00:24:00', '2025-05-09 00:53:09');

-- --------------------------------------------------------

--
-- Table structure for table `pos_register`
--

CREATE TABLE `pos_register` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cash_in_hand` double NOT NULL,
  `closed_at` datetime DEFAULT NULL,
  `cash_in_hand_while_closing` double DEFAULT NULL,
  `bank_transfer` double DEFAULT NULL,
  `cheque` double DEFAULT NULL,
  `other` double DEFAULT NULL,
  `total_sale` double DEFAULT NULL,
  `total_return` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `main_product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `barcode_symbol` int(11) NOT NULL DEFAULT 1,
  `product_category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `product_cost` double NOT NULL,
  `product_price` double NOT NULL,
  `product_unit` varchar(255) NOT NULL,
  `sale_unit` varchar(255) DEFAULT NULL,
  `purchase_unit` varchar(255) DEFAULT NULL,
  `stock_alert` varchar(255) DEFAULT NULL,
  `quantity_limit` varchar(255) DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `tax_type` enum('1','2') DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `main_product_id`, `name`, `code`, `product_code`, `barcode_symbol`, `product_category_id`, `brand_id`, `product_cost`, `product_price`, `product_unit`, `sale_unit`, `purchase_unit`, `stock_alert`, `quantity_limit`, `order_tax`, `tax_type`, `notes`, `created_at`, `updated_at`) VALUES
(7, 7, 'book', '1010116', '1010116', 1, 1, 1, 150, 160, '1', '1', '1', '5', NULL, 0, '1', NULL, '2025-05-08 20:29:04', '2025-05-08 20:29:04');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Common', '2025-05-08 20:15:45', '2025-05-08 20:15:45');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate` double DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `shipping` double DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `received_amount` double DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `payment_type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `reference_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `date`, `supplier_id`, `warehouse_id`, `tax_rate`, `tax_amount`, `discount`, `shipping`, `grand_total`, `received_amount`, `paid_amount`, `payment_type`, `status`, `notes`, `reference_code`, `created_at`, `updated_at`) VALUES
(1, '2025-05-09', 1, 1, 0, 0, 0, 0, 3000, NULL, NULL, 0, 1, NULL, 'PU_1111', '2025-05-08 20:29:04', '2025-05-08 20:29:04');

-- --------------------------------------------------------

--
-- Table structure for table `purchases_return`
--

CREATE TABLE `purchases_return` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate` double DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `shipping` double DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `received_amount` double DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `payment_type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `payment_status` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `reference_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases_return_items`
--

CREATE TABLE `purchases_return_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_return_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_cost` double DEFAULT NULL,
  `net_unit_cost` double DEFAULT NULL,
  `tax_type` int(11) NOT NULL,
  `tax_value` double DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `discount_type` int(11) NOT NULL,
  `discount_value` double DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `purchase_unit` int(11) NOT NULL,
  `quantity` double DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

CREATE TABLE `purchase_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_cost` double DEFAULT NULL,
  `net_unit_cost` double DEFAULT NULL,
  `tax_type` int(11) NOT NULL,
  `tax_value` double DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `discount_type` int(11) NOT NULL,
  `discount_value` double DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `purchase_unit` int(11) NOT NULL,
  `quantity` double DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_items`
--

INSERT INTO `purchase_items` (`id`, `purchase_id`, `product_id`, `product_cost`, `net_unit_cost`, `tax_type`, `tax_value`, `tax_amount`, `discount_type`, `discount_value`, `discount_amount`, `purchase_unit`, `quantity`, `sub_total`, `created_at`, `updated_at`) VALUES
(1, 1, 7, 150, 150, 1, 0, 0, 2, 0, 0, 1, 20, 3000, '2025-05-08 20:29:04', '2025-05-08 20:29:04');

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate` double DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `shipping` double DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `received_amount` double DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `is_sale_created` tinyint(1) NOT NULL DEFAULT 0,
  `note` text DEFAULT NULL,
  `reference_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_items`
--

CREATE TABLE `quotation_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_price` double DEFAULT NULL,
  `net_unit_price` double DEFAULT NULL,
  `tax_type` int(11) NOT NULL,
  `tax_value` double DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `discount_type` int(11) NOT NULL,
  `discount_value` double DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `sale_unit` int(11) NOT NULL,
  `quantity` double DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `guard_name` varchar(255) NOT NULL DEFAULT 'web',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', ' Admin', 'web', '2023-11-03 23:52:45', '2023-11-03 23:52:45');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT 0,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate` double DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `shipping` double DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `received_amount` double DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `payment_type` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `reference_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `payment_status` int(11) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `date`, `is_return`, `customer_id`, `warehouse_id`, `tax_rate`, `tax_amount`, `discount`, `shipping`, `grand_total`, `received_amount`, `paid_amount`, `payment_type`, `note`, `reference_code`, `created_at`, `updated_at`, `status`, `payment_status`, `user_id`) VALUES
(1, '2025-05-09', 0, 1, 1, 0, 0, 0, 0, 160, 0, 160, 1, NULL, 'SA_1111', '2025-05-08 20:31:33', '2025-05-08 20:31:33', 1, 1, 1),
(3, '2025-05-09', 0, 1, 1, 0, 0, 0, 0, 160, 0, 160, 1, NULL, 'SA_1113', '2025-05-08 21:08:10', '2025-05-08 21:08:10', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales_payments`
--

CREATE TABLE `sales_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `payment_date` date NOT NULL,
  `payment_type` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `received_amount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_payments`
--

INSERT INTO `sales_payments` (`id`, `sale_id`, `reference`, `payment_date`, `payment_type`, `amount`, `received_amount`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, '2025-05-09', 1, 160, 160, '2025-05-08 20:31:33', '2025-05-08 20:31:33'),
(2, 3, NULL, '2025-05-09', 1, 160, 160, '2025-05-08 21:08:10', '2025-05-08 21:08:10');

-- --------------------------------------------------------

--
-- Table structure for table `sales_return`
--

CREATE TABLE `sales_return` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `sale_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate` double DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `shipping` double DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `payment_type` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `reference_code` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

CREATE TABLE `sale_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_price` double DEFAULT NULL,
  `net_unit_price` double DEFAULT NULL,
  `tax_type` int(11) NOT NULL,
  `tax_value` double DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `discount_type` int(11) NOT NULL,
  `discount_value` double DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `sale_unit` int(11) NOT NULL,
  `quantity` double DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_items`
--

INSERT INTO `sale_items` (`id`, `sale_id`, `product_id`, `product_price`, `net_unit_price`, `tax_type`, `tax_value`, `tax_amount`, `discount_type`, `discount_value`, `discount_amount`, `sale_unit`, `quantity`, `sub_total`, `created_at`, `updated_at`) VALUES
(1, 1, 7, 160, 160, 1, 0, 0, 2, 0, 0, 1, 1, 160, '2025-05-08 20:31:33', '2025-05-08 20:31:33'),
(3, 3, 7, 160, 160, 1, 0, 0, 2, 0, 0, 1, 1, 160, '2025-05-08 21:08:10', '2025-05-08 21:08:10');

-- --------------------------------------------------------

--
-- Table structure for table `sale_return_items`
--

CREATE TABLE `sale_return_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_return_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_price` double DEFAULT NULL,
  `net_unit_price` double DEFAULT NULL,
  `tax_type` int(11) NOT NULL,
  `tax_value` double DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `discount_type` int(11) NOT NULL,
  `discount_value` double DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `sale_unit` int(11) NOT NULL,
  `quantity` double DEFAULT NULL,
  `sold_quantity` double DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'show_version_on_footer', '1', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(2, 'country', 'Sri Lanka', '2023-11-03 23:52:45', '2025-05-08 20:11:30'),
(3, 'state', 'Tirikunamalaya', '2023-11-03 23:52:45', '2025-05-08 20:11:30'),
(4, 'city', 'Kanthale', '2023-11-03 23:52:45', '2025-05-08 20:11:30'),
(5, 'postcode', '31300', '2023-11-03 23:52:45', '2025-05-08 20:11:30'),
(6, 'date_format', 'y-m-d', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(7, 'purchase_code', 'PU', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(8, 'purchase_return_code', 'PR', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(9, 'sale_code', 'SA', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(10, 'sale_return_code', 'SR', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(11, 'expense_code', 'EX', '2023-11-03 23:52:45', '2023-11-03 23:52:45'),
(12, 'is_currency_right', 'false', '2023-11-03 23:52:45', '2025-05-08 19:39:33'),
(13, 'currency', '1', '2023-11-03 23:52:46', '2023-11-03 23:52:46'),
(14, 'email', 'lalithcenter@gmail.com', '2023-11-03 23:52:46', '2025-05-08 21:13:32'),
(15, 'company_name', 'Lalitha Center', '2023-11-03 23:52:46', '2025-05-08 19:39:33'),
(16, 'phone', '0712071066', '2023-11-03 23:52:46', '2025-05-08 20:11:30'),
(17, 'developed', 'TechConnect', '2023-11-03 23:52:46', '2025-05-08 19:39:33'),
(18, 'footer', '2025 Developed by TechConnect Computers All rights reserved', '2023-11-03 23:52:46', '2025-05-08 19:39:33'),
(19, 'default_language', '1', '2023-11-03 23:52:46', '2023-11-03 23:52:46'),
(20, 'default_customer', '1', '2023-11-03 23:52:46', '2023-11-03 23:52:46'),
(21, 'default_warehouse', '1', '2023-11-03 23:52:46', '2023-11-03 23:52:46'),
(22, 'address', '93 Junction, Kanthale', '2023-11-03 23:52:46', '2025-05-08 19:39:33'),
(23, 'stripe_key', 'pu_test_yBzA1qI1PcfRBAVn1vJG2VuS00HcyhQX9LASERTFDDS', '2023-11-03 23:52:46', '2023-11-03 23:52:46'),
(24, 'stripe_secret', 'pu_test_yBzA1qI1PcfRBAVn1vJG2VuS00HcyhQX9LASERTFDDS', '2023-11-03 23:52:46', '2023-11-03 23:52:46'),
(25, 'sms_gateway', '1', '2023-11-03 23:52:46', '2023-11-03 23:52:46'),
(26, 'twillo_sid', 'asd', '2023-11-03 23:52:46', '2023-11-03 23:52:46'),
(27, 'twillo_token', 'asd', '2023-11-03 23:52:46', '2023-11-03 23:52:46'),
(28, 'twillo_from', 'asd', '2023-11-03 23:52:46', '2023-11-03 23:52:46'),
(29, 'smtp_host', 'mailtrap.io', '2023-11-03 23:52:46', '2023-11-03 23:52:46'),
(30, 'smtp_port', '2525', '2023-11-03 23:52:46', '2023-11-03 23:52:46'),
(31, 'smtp_username', 'test', '2023-11-03 23:52:46', '2023-11-03 23:52:46'),
(32, 'smtp_password', 'test', '2023-11-03 23:52:46', '2023-11-03 23:52:46'),
(33, 'smtp_Encryption', 'tls', '2023-11-03 23:52:46', '2023-11-03 23:52:46'),
(34, 'logo', 'http://localhost/uploads/settings\\2\\infycare-logo.png', '2023-11-03 23:52:46', '2025-05-08 20:44:30'),
(35, 'show_logo_in_receipt', '1', '2025-05-08 19:16:24', '2025-05-08 19:16:24'),
(36, 'show_app_name_in_sidebar', '1', '2025-05-08 19:16:24', '2025-05-08 19:16:24');

-- --------------------------------------------------------

--
-- Table structure for table `sms_settings`
--

CREATE TABLE `sms_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_settings`
--

INSERT INTO `sms_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'url', 'https://app.text.lk/api/http/', '2023-11-03 23:52:45', '2025-05-08 21:05:50'),
(2, 'mobile_key', 'to', '2023-11-03 23:52:45', '2025-05-08 21:05:50'),
(3, 'message_key', 'message', '2023-11-03 23:52:45', '2025-05-08 21:05:50'),
(4, 'payload', '{\n  \"data\": {\n    \"from\": \"InfoSMS\",\n    \"destinations\": {\n      \"to\": \"0716560510\"\n    },\n    \"message\": \"Your sale has been completed. Reference: SALE12345, Total: $200.\"\n  }\n}', '2023-11-03 23:52:45', '2025-05-08 21:05:50');

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `template_name` text NOT NULL,
  `content` longtext NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_templates`
--

INSERT INTO `sms_templates` (`id`, `template_name`, `content`, `type`, `created_at`, `updated_at`, `status`) VALUES
(1, 'GREETING TO CUSTOMER ON SALES !', 'Hi {customer_name}, Your sales Id is {sales_id}, Sales Date {sales_date}, Total Amount {sales_amount}, You have paid {paid_amount}, and customer total due amount is {due_amount} Thank you visit again', '1', '2023-11-03 23:52:45', '2025-05-08 21:12:41', 1),
(2, 'GREETING TO CUSTOMER ON SALES RETURN !', 'Hi {customer_name}, Your sales return Id is {sales_return_id}, Sales return Date {sales_return_date}, and Total Amount is {sales_return_amount} Thank you visit again', '2', '2023-11-03 23:52:45', '2023-11-03 23:52:45', 0);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(170) NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `country_id`, `created_at`, `updated_at`) VALUES
(1, 'Kanthale', 101, NULL, NULL),
(2097, 'Naryn', 118, NULL, NULL),
(2098, 'Osh', 118, NULL, NULL),
(2099, 'Talas', 118, NULL, NULL),
(2100, 'Attopu', 119, NULL, NULL),
(2101, 'Bokeo', 119, NULL, NULL),
(2102, 'Bolikhamsay', 119, NULL, NULL),
(2103, 'Champasak', 119, NULL, NULL),
(2104, 'Houaphanh', 119, NULL, NULL),
(2105, 'Khammouane', 119, NULL, NULL),
(2106, 'Luang Nam Tha', 119, NULL, NULL),
(2107, 'Luang Prabang', 119, NULL, NULL),
(2108, 'Oudomxay', 119, NULL, NULL),
(2109, 'Phongsaly', 119, NULL, NULL),
(2110, 'Saravan', 119, NULL, NULL),
(2111, 'Savannakhet', 119, NULL, NULL),
(2112, 'Sekong', 119, NULL, NULL),
(2113, 'Viangchan Prefecture', 119, NULL, NULL),
(2114, 'Viangchan Province', 119, NULL, NULL),
(2115, 'Xaignabury', 119, NULL, NULL),
(2116, 'Xiang Khuang', 119, NULL, NULL),
(2117, 'Aizkraukles', 120, NULL, NULL),
(2118, 'Aluksnes', 120, NULL, NULL),
(2119, 'Balvu', 120, NULL, NULL),
(2120, 'Bauskas', 120, NULL, NULL),
(2121, 'Cesu', 120, NULL, NULL),
(2122, 'Daugavpils', 120, NULL, NULL),
(2123, 'Daugavpils City', 120, NULL, NULL),
(2124, 'Dobeles', 120, NULL, NULL),
(2125, 'Gulbenes', 120, NULL, NULL),
(2126, 'Jekabspils', 120, NULL, NULL),
(2127, 'Jelgava', 120, NULL, NULL),
(2128, 'Jelgavas', 120, NULL, NULL),
(2129, 'Jurmala City', 120, NULL, NULL),
(2130, 'Kraslavas', 120, NULL, NULL),
(2131, 'Kuldigas', 120, NULL, NULL),
(2132, 'Liepaja', 120, NULL, NULL),
(2133, 'Liepajas', 120, NULL, NULL),
(2134, 'Limbazhu', 120, NULL, NULL),
(2135, 'Ludzas', 120, NULL, NULL),
(2136, 'Madonas', 120, NULL, NULL),
(2137, 'Ogres', 120, NULL, NULL),
(2138, 'Preilu', 120, NULL, NULL),
(2139, 'Rezekne', 120, NULL, NULL),
(2140, 'Rezeknes', 120, NULL, NULL),
(2141, 'Riga', 120, NULL, NULL),
(2142, 'Rigas', 120, NULL, NULL),
(2143, 'Saldus', 120, NULL, NULL),
(2144, 'Talsu', 120, NULL, NULL),
(2145, 'Tukuma', 120, NULL, NULL),
(2146, 'Valkas', 120, NULL, NULL),
(2147, 'Valmieras', 120, NULL, NULL),
(2148, 'Ventspils', 120, NULL, NULL),
(2149, 'Ventspils City', 120, NULL, NULL),
(2150, 'Beirut', 121, NULL, NULL),
(2151, 'Jabal Lubnan', 121, NULL, NULL),
(2152, 'Mohafazat Liban-Nord', 121, NULL, NULL),
(2153, 'Mohafazat Mont-Liban', 121, NULL, NULL),
(2154, 'Sidon', 121, NULL, NULL),
(2155, 'al-Biqa', 121, NULL, NULL),
(2156, 'al-Janub', 121, NULL, NULL),
(2157, 'an-Nabatiyah', 121, NULL, NULL),
(2158, 'ash-Shamal', 121, NULL, NULL),
(2159, 'Berea', 122, NULL, NULL),
(2160, 'Butha-Buthe', 122, NULL, NULL),
(2161, 'Leribe', 122, NULL, NULL),
(2162, 'Mafeteng', 122, NULL, NULL),
(2163, 'Maseru', 122, NULL, NULL),
(2164, 'Mohale\'\'s Hoek', 122, NULL, NULL),
(2165, 'Mokhotlong', 122, NULL, NULL),
(2166, 'Qacha\'\'s Nek', 122, NULL, NULL),
(2167, 'Quthing', 122, NULL, NULL),
(2168, 'Thaba-Tseka', 122, NULL, NULL),
(2169, 'Bomi', 123, NULL, NULL),
(2170, 'Bong', 123, NULL, NULL),
(2171, 'Grand Bassa', 123, NULL, NULL),
(2172, 'Grand Cape Mount', 123, NULL, NULL),
(2173, 'Grand Gedeh', 123, NULL, NULL),
(2174, 'Loffa', 123, NULL, NULL),
(2175, 'Margibi', 123, NULL, NULL),
(2176, 'Maryland and Grand Kru', 123, NULL, NULL),
(2177, 'Montserrado', 123, NULL, NULL),
(2178, 'Nimba', 123, NULL, NULL),
(2179, 'Rivercess', 123, NULL, NULL),
(2180, 'Sinoe', 123, NULL, NULL),
(2181, 'Ajdabiya', 124, NULL, NULL),
(2182, 'Fezzan', 124, NULL, NULL),
(2183, 'Banghazi', 124, NULL, NULL),
(2184, 'Darnah', 124, NULL, NULL),
(2185, 'Ghadamis', 124, NULL, NULL),
(2186, 'Gharyan', 124, NULL, NULL),
(2187, 'Misratah', 124, NULL, NULL),
(2188, 'Murzuq', 124, NULL, NULL),
(2189, 'Sabha', 124, NULL, NULL),
(2190, 'Sawfajjin', 124, NULL, NULL),
(2191, 'Surt', 124, NULL, NULL),
(2192, 'Tarabulus', 124, NULL, NULL),
(2193, 'Tarhunah', 124, NULL, NULL),
(2194, 'Tripolitania', 124, NULL, NULL),
(2195, 'Tubruq', 124, NULL, NULL),
(2196, 'Yafran', 124, NULL, NULL),
(2197, 'Zlitan', 124, NULL, NULL),
(2198, 'al-\'\'Aziziyah', 124, NULL, NULL),
(2199, 'al-Fatih', 124, NULL, NULL),
(2200, 'al-Jabal al Akhdar', 124, NULL, NULL),
(2201, 'al-Jufrah', 124, NULL, NULL),
(2202, 'al-Khums', 124, NULL, NULL),
(2203, 'al-Kufrah', 124, NULL, NULL),
(2204, 'an-Nuqat al-Khams', 124, NULL, NULL),
(2205, 'ash-Shati', 124, NULL, NULL),
(2206, 'az-Zawiyah', 124, NULL, NULL),
(2207, 'Balzers', 125, NULL, NULL),
(2208, 'Eschen', 125, NULL, NULL),
(2209, 'Gamprin', 125, NULL, NULL),
(2210, 'Mauren', 125, NULL, NULL),
(2211, 'Planken', 125, NULL, NULL),
(2212, 'Ruggell', 125, NULL, NULL),
(2213, 'Schaan', 125, NULL, NULL),
(2214, 'Schellenberg', 125, NULL, NULL),
(2215, 'Triesen', 125, NULL, NULL),
(2216, 'Triesenberg', 125, NULL, NULL),
(2217, 'Vaduz', 125, NULL, NULL),
(2218, 'Alytaus', 126, NULL, NULL),
(2219, 'Anyksciai', 126, NULL, NULL),
(2220, 'Kauno', 126, NULL, NULL),
(2221, 'Klaipedos', 126, NULL, NULL),
(2222, 'Marijampoles', 126, NULL, NULL),
(2223, 'Panevezhio', 126, NULL, NULL),
(2224, 'Panevezys', 126, NULL, NULL),
(2225, 'Shiauliu', 126, NULL, NULL),
(2226, 'Taurages', 126, NULL, NULL),
(2227, 'Telshiu', 126, NULL, NULL),
(2228, 'Telsiai', 126, NULL, NULL),
(2229, 'Utenos', 126, NULL, NULL),
(2230, 'Vilniaus', 126, NULL, NULL),
(2231, 'Capellen', 127, NULL, NULL),
(2232, 'Clervaux', 127, NULL, NULL),
(2233, 'Diekirch', 127, NULL, NULL),
(2234, 'Echternach', 127, NULL, NULL),
(2235, 'Esch-sur-Alzette', 127, NULL, NULL),
(2236, 'Grevenmacher', 127, NULL, NULL),
(2237, 'Luxembourg', 127, NULL, NULL),
(2238, 'Mersch', 127, NULL, NULL),
(2239, 'Redange', 127, NULL, NULL),
(2240, 'Remich', 127, NULL, NULL),
(2241, 'Vianden', 127, NULL, NULL),
(2242, 'Wiltz', 127, NULL, NULL),
(2243, 'Macau', 128, NULL, NULL),
(2244, 'Berovo', 129, NULL, NULL),
(2245, 'Bitola', 129, NULL, NULL),
(2246, 'Brod', 129, NULL, NULL),
(2247, 'Debar', 129, NULL, NULL),
(2248, 'Delchevo', 129, NULL, NULL),
(2249, 'Demir Hisar', 129, NULL, NULL),
(2250, 'Gevgelija', 129, NULL, NULL),
(2251, 'Gostivar', 129, NULL, NULL),
(2252, 'Kavadarci', 129, NULL, NULL),
(2253, 'Kichevo', 129, NULL, NULL),
(2254, 'Kochani', 129, NULL, NULL),
(2255, 'Kratovo', 129, NULL, NULL),
(2256, 'Kriva Palanka', 129, NULL, NULL),
(2257, 'Krushevo', 129, NULL, NULL),
(2258, 'Kumanovo', 129, NULL, NULL),
(2259, 'Negotino', 129, NULL, NULL),
(2260, 'Ohrid', 129, NULL, NULL),
(2261, 'Prilep', 129, NULL, NULL),
(2262, 'Probishtip', 129, NULL, NULL),
(2263, 'Radovish', 129, NULL, NULL),
(2264, 'Resen', 129, NULL, NULL),
(2265, 'Shtip', 129, NULL, NULL),
(2266, 'Skopje', 129, NULL, NULL),
(2267, 'Struga', 129, NULL, NULL),
(2268, 'Strumica', 129, NULL, NULL),
(2269, 'Sveti Nikole', 129, NULL, NULL),
(2270, 'Tetovo', 129, NULL, NULL),
(2271, 'Valandovo', 129, NULL, NULL),
(2272, 'Veles', 129, NULL, NULL),
(2273, 'Vinica', 129, NULL, NULL),
(2274, 'Antananarivo', 130, NULL, NULL),
(2275, 'Antsiranana', 130, NULL, NULL),
(2276, 'Fianarantsoa', 130, NULL, NULL),
(2277, 'Mahajanga', 130, NULL, NULL),
(2278, 'Toamasina', 130, NULL, NULL),
(2279, 'Toliary', 130, NULL, NULL),
(2280, 'Balaka', 131, NULL, NULL),
(2281, 'Blantyre City', 131, NULL, NULL),
(2282, 'Chikwawa', 131, NULL, NULL),
(2283, 'Chiradzulu', 131, NULL, NULL),
(2284, 'Chitipa', 131, NULL, NULL),
(2285, 'Dedza', 131, NULL, NULL),
(2286, 'Dowa', 131, NULL, NULL),
(2287, 'Karonga', 131, NULL, NULL),
(2288, 'Kasungu', 131, NULL, NULL),
(2289, 'Lilongwe City', 131, NULL, NULL),
(2290, 'Machinga', 131, NULL, NULL),
(2291, 'Mangochi', 131, NULL, NULL),
(2292, 'Mchinji', 131, NULL, NULL),
(2293, 'Mulanje', 131, NULL, NULL),
(2294, 'Mwanza', 131, NULL, NULL),
(2295, 'Mzimba', 131, NULL, NULL),
(2296, 'Mzuzu City', 131, NULL, NULL),
(2297, 'Nkhata Bay', 131, NULL, NULL),
(2298, 'Nkhotakota', 131, NULL, NULL),
(2299, 'Nsanje', 131, NULL, NULL),
(2300, 'Ntcheu', 131, NULL, NULL),
(2301, 'Ntchisi', 131, NULL, NULL),
(2302, 'Phalombe', 131, NULL, NULL),
(2303, 'Rumphi', 131, NULL, NULL),
(2304, 'Salima', 131, NULL, NULL),
(2305, 'Thyolo', 131, NULL, NULL),
(2306, 'Zomba Municipality', 131, NULL, NULL),
(2307, 'Johor', 132, NULL, NULL),
(2308, 'Kedah', 132, NULL, NULL),
(2309, 'Kelantan', 132, NULL, NULL),
(2310, 'Kuala Lumpur', 132, NULL, NULL),
(2311, 'Labuan', 132, NULL, NULL),
(2312, 'Melaka', 132, NULL, NULL),
(2313, 'Negeri Johor', 132, NULL, NULL),
(2314, 'Negeri Sembilan', 132, NULL, NULL),
(2315, 'Pahang', 132, NULL, NULL),
(2316, 'Penang', 132, NULL, NULL),
(2317, 'Perak', 132, NULL, NULL),
(2318, 'Perlis', 132, NULL, NULL),
(2319, 'Pulau Pinang', 132, NULL, NULL),
(2320, 'Sabah', 132, NULL, NULL),
(2321, 'Sarawak', 132, NULL, NULL),
(2322, 'Selangor', 132, NULL, NULL),
(2323, 'Sembilan', 132, NULL, NULL),
(2324, 'Terengganu', 132, NULL, NULL),
(2325, 'Alif Alif', 133, NULL, NULL),
(2326, 'Alif Dhaal', 133, NULL, NULL),
(2327, 'Baa', 133, NULL, NULL),
(2328, 'Dhaal', 133, NULL, NULL),
(2329, 'Faaf', 133, NULL, NULL),
(2330, 'Gaaf Alif', 133, NULL, NULL),
(2331, 'Gaaf Dhaal', 133, NULL, NULL),
(2332, 'Ghaviyani', 133, NULL, NULL),
(2333, 'Haa Alif', 133, NULL, NULL),
(2334, 'Haa Dhaal', 133, NULL, NULL),
(2335, 'Kaaf', 133, NULL, NULL),
(2336, 'Laam', 133, NULL, NULL),
(2337, 'Lhaviyani', 133, NULL, NULL),
(2338, 'Male', 133, NULL, NULL),
(2339, 'Miim', 133, NULL, NULL),
(2340, 'Nuun', 133, NULL, NULL),
(2341, 'Raa', 133, NULL, NULL),
(2342, 'Shaviyani', 133, NULL, NULL),
(2343, 'Siin', 133, NULL, NULL),
(2344, 'Thaa', 133, NULL, NULL),
(2345, 'Vaav', 133, NULL, NULL),
(2346, 'Bamako', 134, NULL, NULL),
(2347, 'Gao', 134, NULL, NULL),
(2348, 'Kayes', 134, NULL, NULL),
(2349, 'Kidal', 134, NULL, NULL),
(2350, 'Koulikoro', 134, NULL, NULL),
(2351, 'Mopti', 134, NULL, NULL),
(2352, 'Segou', 134, NULL, NULL),
(2353, 'Sikasso', 134, NULL, NULL),
(2354, 'Tombouctou', 134, NULL, NULL),
(2355, 'Gozo and Comino', 135, NULL, NULL),
(2356, 'Inner Harbour', 135, NULL, NULL),
(2357, 'Northern', 135, NULL, NULL),
(2358, 'Outer Harbour', 135, NULL, NULL),
(2359, 'South Eastern', 135, NULL, NULL),
(2360, 'Valletta', 135, NULL, NULL),
(2361, 'Western', 135, NULL, NULL),
(2362, 'Castletown', 136, NULL, NULL),
(2363, 'Douglas', 136, NULL, NULL),
(2364, 'Laxey', 136, NULL, NULL),
(2365, 'Onchan', 136, NULL, NULL),
(2366, 'Peel', 136, NULL, NULL),
(2367, 'Port Erin', 136, NULL, NULL),
(2368, 'Port Saint Mary', 136, NULL, NULL),
(2369, 'Ramsey', 136, NULL, NULL),
(2370, 'Ailinlaplap', 137, NULL, NULL),
(2371, 'Ailuk', 137, NULL, NULL),
(2372, 'Arno', 137, NULL, NULL),
(2373, 'Aur', 137, NULL, NULL),
(2374, 'Bikini', 137, NULL, NULL),
(2375, 'Ebon', 137, NULL, NULL),
(2376, 'Enewetak', 137, NULL, NULL),
(2377, 'Jabat', 137, NULL, NULL),
(2378, 'Jaluit', 137, NULL, NULL),
(2379, 'Kili', 137, NULL, NULL),
(2380, 'Kwajalein', 137, NULL, NULL),
(2381, 'Lae', 137, NULL, NULL),
(2382, 'Lib', 137, NULL, NULL),
(2383, 'Likiep', 137, NULL, NULL),
(2384, 'Majuro', 137, NULL, NULL),
(2385, 'Maloelap', 137, NULL, NULL),
(2386, 'Mejit', 137, NULL, NULL),
(2387, 'Mili', 137, NULL, NULL),
(2388, 'Namorik', 137, NULL, NULL),
(2389, 'Namu', 137, NULL, NULL),
(2390, 'Rongelap', 137, NULL, NULL),
(2391, 'Ujae', 137, NULL, NULL),
(2392, 'Utrik', 137, NULL, NULL),
(2393, 'Wotho', 137, NULL, NULL),
(2394, 'Wotje', 137, NULL, NULL),
(2395, 'Fort-de-France', 138, NULL, NULL),
(2396, 'La Trinite', 138, NULL, NULL),
(2397, 'Le Marin', 138, NULL, NULL),
(2398, 'Saint-Pierre', 138, NULL, NULL),
(2399, 'Adrar', 139, NULL, NULL),
(2400, 'Assaba', 139, NULL, NULL),
(2401, 'Brakna', 139, NULL, NULL),
(2402, 'Dhakhlat Nawadibu', 139, NULL, NULL),
(2403, 'Hudh-al-Gharbi', 139, NULL, NULL),
(2404, 'Hudh-ash-Sharqi', 139, NULL, NULL),
(2405, 'Inshiri', 139, NULL, NULL),
(2406, 'Nawakshut', 139, NULL, NULL),
(2407, 'Qidimagha', 139, NULL, NULL),
(2408, 'Qurqul', 139, NULL, NULL),
(2409, 'Taqant', 139, NULL, NULL),
(2410, 'Tiris Zammur', 139, NULL, NULL),
(2411, 'Trarza', 139, NULL, NULL),
(2412, 'Black River', 140, NULL, NULL),
(2413, 'Eau Coulee', 140, NULL, NULL),
(2414, 'Flacq', 140, NULL, NULL),
(2415, 'Floreal', 140, NULL, NULL),
(2416, 'Grand Port', 140, NULL, NULL),
(2417, 'Moka', 140, NULL, NULL),
(2418, 'Pamplempousses', 140, NULL, NULL),
(2419, 'Plaines Wilhelm', 140, NULL, NULL),
(2420, 'Port Louis', 140, NULL, NULL),
(2421, 'Riviere du Rempart', 140, NULL, NULL),
(2422, 'Rodrigues', 140, NULL, NULL),
(2423, 'Rose Hill', 140, NULL, NULL),
(2424, 'Savanne', 140, NULL, NULL),
(2425, 'Mayotte', 141, NULL, NULL),
(2426, 'Pamanzi', 141, NULL, NULL),
(2427, 'Aguascalientes', 142, NULL, NULL),
(2428, 'Baja California', 142, NULL, NULL),
(2429, 'Baja California Sur', 142, NULL, NULL),
(2430, 'Campeche', 142, NULL, NULL),
(2431, 'Chiapas', 142, NULL, NULL),
(2432, 'Chihuahua', 142, NULL, NULL),
(2433, 'Coahuila', 142, NULL, NULL),
(2434, 'Colima', 142, NULL, NULL),
(2435, 'Distrito Federal', 142, NULL, NULL),
(2436, 'Durango', 142, NULL, NULL),
(2437, 'Estado de Mexico', 142, NULL, NULL),
(2438, 'Guanajuato', 142, NULL, NULL),
(2439, 'Guerrero', 142, NULL, NULL),
(2440, 'Hidalgo', 142, NULL, NULL),
(2441, 'Jalisco', 142, NULL, NULL),
(2442, 'Mexico', 142, NULL, NULL),
(2443, 'Michoacan', 142, NULL, NULL),
(2444, 'Morelos', 142, NULL, NULL),
(2445, 'Nayarit', 142, NULL, NULL),
(2446, 'Nuevo Leon', 142, NULL, NULL),
(2447, 'Oaxaca', 142, NULL, NULL),
(2448, 'Puebla', 142, NULL, NULL),
(2449, 'Queretaro', 142, NULL, NULL),
(2450, 'Quintana Roo', 142, NULL, NULL),
(2451, 'San Luis Potosi', 142, NULL, NULL),
(2452, 'Sinaloa', 142, NULL, NULL),
(2453, 'Sonora', 142, NULL, NULL),
(2454, 'Tabasco', 142, NULL, NULL),
(2455, 'Tamaulipas', 142, NULL, NULL),
(2456, 'Tlaxcala', 142, NULL, NULL),
(2457, 'Veracruz', 142, NULL, NULL),
(2458, 'Yucatan', 142, NULL, NULL),
(2459, 'Zacatecas', 142, NULL, NULL),
(2460, 'Chuuk', 143, NULL, NULL),
(2461, 'Kusaie', 143, NULL, NULL),
(2462, 'Pohnpei', 143, NULL, NULL),
(2463, 'Yap', 143, NULL, NULL),
(2464, 'Balti', 144, NULL, NULL),
(2465, 'Cahul', 144, NULL, NULL),
(2466, 'Chisinau', 144, NULL, NULL),
(2467, 'Chisinau Oras', 144, NULL, NULL),
(2468, 'Edinet', 144, NULL, NULL),
(2469, 'Gagauzia', 144, NULL, NULL),
(2470, 'Lapusna', 144, NULL, NULL),
(2471, 'Orhei', 144, NULL, NULL),
(2472, 'Soroca', 144, NULL, NULL),
(2473, 'Taraclia', 144, NULL, NULL),
(2474, 'Tighina', 144, NULL, NULL),
(2475, 'Transnistria', 144, NULL, NULL),
(2476, 'Ungheni', 144, NULL, NULL),
(2477, 'Fontvieille', 145, NULL, NULL),
(2478, 'La Condamine', 145, NULL, NULL),
(2479, 'Monaco-Ville', 145, NULL, NULL),
(2480, 'Monte Carlo', 145, NULL, NULL),
(2481, 'Arhangaj', 146, NULL, NULL),
(2482, 'Bajan-Olgij', 146, NULL, NULL),
(2483, 'Bajanhongor', 146, NULL, NULL),
(2484, 'Bulgan', 146, NULL, NULL),
(2485, 'Darhan-Uul', 146, NULL, NULL),
(2486, 'Dornod', 146, NULL, NULL),
(2487, 'Dornogovi', 146, NULL, NULL),
(2488, 'Dundgovi', 146, NULL, NULL),
(2489, 'Govi-Altaj', 146, NULL, NULL),
(2490, 'Govisumber', 146, NULL, NULL),
(2491, 'Hentij', 146, NULL, NULL),
(2492, 'Hovd', 146, NULL, NULL),
(2493, 'Hovsgol', 146, NULL, NULL),
(2494, 'Omnogovi', 146, NULL, NULL),
(2495, 'Orhon', 146, NULL, NULL),
(2496, 'Ovorhangaj', 146, NULL, NULL),
(2497, 'Selenge', 146, NULL, NULL),
(2498, 'Suhbaatar', 146, NULL, NULL),
(2499, 'Tov', 146, NULL, NULL),
(2500, 'Ulaanbaatar', 146, NULL, NULL),
(2501, 'Uvs', 146, NULL, NULL),
(2502, 'Zavhan', 146, NULL, NULL),
(2503, 'Montserrat', 147, NULL, NULL),
(2504, 'Agadir', 148, NULL, NULL),
(2505, 'Casablanca', 148, NULL, NULL),
(2506, 'Chaouia-Ouardigha', 148, NULL, NULL),
(2507, 'Doukkala-Abda', 148, NULL, NULL),
(2508, 'Fes-Boulemane', 148, NULL, NULL),
(2509, 'Gharb-Chrarda-Beni Hssen', 148, NULL, NULL),
(2510, 'Guelmim', 148, NULL, NULL),
(2511, 'Kenitra', 148, NULL, NULL),
(2512, 'Marrakech-Tensift-Al Haouz', 148, NULL, NULL),
(2513, 'Meknes-Tafilalet', 148, NULL, NULL),
(2514, 'Oriental', 148, NULL, NULL),
(2515, 'Oujda', 148, NULL, NULL),
(2516, 'Province de Tanger', 148, NULL, NULL),
(2517, 'Rabat-Sale-Zammour-Zaer', 148, NULL, NULL),
(2518, 'Sala Al Jadida', 148, NULL, NULL),
(2519, 'Settat', 148, NULL, NULL),
(2520, 'Souss Massa-Draa', 148, NULL, NULL),
(2521, 'Tadla-Azilal', 148, NULL, NULL),
(2522, 'Tangier-Tetouan', 148, NULL, NULL),
(2523, 'Taza-Al Hoceima-Taounate', 148, NULL, NULL),
(2524, 'Wilaya de Casablanca', 148, NULL, NULL),
(2525, 'Wilaya de Rabat-Sale', 148, NULL, NULL),
(2526, 'Cabo Delgado', 149, NULL, NULL),
(2527, 'Gaza', 149, NULL, NULL),
(2528, 'Inhambane', 149, NULL, NULL),
(2529, 'Manica', 149, NULL, NULL),
(2530, 'Maputo', 149, NULL, NULL),
(2531, 'Maputo Provincia', 149, NULL, NULL),
(2532, 'Nampula', 149, NULL, NULL),
(2533, 'Niassa', 149, NULL, NULL),
(2534, 'Sofala', 149, NULL, NULL),
(2535, 'Tete', 149, NULL, NULL),
(2536, 'Zambezia', 149, NULL, NULL),
(2537, 'Ayeyarwady', 150, NULL, NULL),
(2538, 'Bago', 150, NULL, NULL),
(2539, 'Chin', 150, NULL, NULL),
(2540, 'Kachin', 150, NULL, NULL),
(2541, 'Kayah', 150, NULL, NULL),
(2542, 'Kayin', 150, NULL, NULL),
(2543, 'Magway', 150, NULL, NULL),
(2544, 'Mandalay', 150, NULL, NULL),
(2545, 'Mon', 150, NULL, NULL),
(2546, 'Nay Pyi Taw', 150, NULL, NULL),
(2547, 'Rakhine', 150, NULL, NULL),
(2548, 'Sagaing', 150, NULL, NULL),
(2549, 'Shan', 150, NULL, NULL),
(2550, 'Tanintharyi', 150, NULL, NULL),
(2551, 'Yangon', 150, NULL, NULL),
(2552, 'Caprivi', 151, NULL, NULL),
(2553, 'Erongo', 151, NULL, NULL),
(2554, 'Hardap', 151, NULL, NULL),
(2555, 'Karas', 151, NULL, NULL),
(2556, 'Kavango', 151, NULL, NULL),
(2557, 'Khomas', 151, NULL, NULL),
(2558, 'Kunene', 151, NULL, NULL),
(2559, 'Ohangwena', 151, NULL, NULL),
(2560, 'Omaheke', 151, NULL, NULL),
(2561, 'Omusati', 151, NULL, NULL),
(2562, 'Oshana', 151, NULL, NULL),
(2563, 'Oshikoto', 151, NULL, NULL),
(2564, 'Otjozondjupa', 151, NULL, NULL),
(2565, 'Yaren', 152, NULL, NULL),
(2566, 'Bagmati', 153, NULL, NULL),
(2567, 'Bheri', 153, NULL, NULL),
(2568, 'Dhawalagiri', 153, NULL, NULL),
(2569, 'Gandaki', 153, NULL, NULL),
(2570, 'Janakpur', 153, NULL, NULL),
(2571, 'Karnali', 153, NULL, NULL),
(2572, 'Koshi', 153, NULL, NULL),
(2573, 'Lumbini', 153, NULL, NULL),
(2574, 'Mahakali', 153, NULL, NULL),
(2575, 'Mechi', 153, NULL, NULL),
(2576, 'Narayani', 153, NULL, NULL),
(2577, 'Rapti', 153, NULL, NULL),
(2578, 'Sagarmatha', 153, NULL, NULL),
(2579, 'Seti', 153, NULL, NULL),
(2580, 'Bonaire', 154, NULL, NULL),
(2581, 'Curacao', 154, NULL, NULL),
(2582, 'Saba', 154, NULL, NULL),
(2583, 'Sint Eustatius', 154, NULL, NULL),
(2584, 'Sint Maarten', 154, NULL, NULL),
(2585, 'Amsterdam', 155, NULL, NULL),
(2586, 'Benelux', 155, NULL, NULL),
(2587, 'Drenthe', 155, NULL, NULL),
(2588, 'Flevoland', 155, NULL, NULL),
(2589, 'Friesland', 155, NULL, NULL),
(2590, 'Gelderland', 155, NULL, NULL),
(2591, 'Groningen', 155, NULL, NULL),
(2592, 'Limburg', 155, NULL, NULL),
(2593, 'Noord-Brabant', 155, NULL, NULL),
(2594, 'Noord-Holland', 155, NULL, NULL),
(2595, 'Overijssel', 155, NULL, NULL),
(2596, 'South Holland', 155, NULL, NULL),
(2597, 'Utrecht', 155, NULL, NULL),
(2598, 'Zeeland', 155, NULL, NULL),
(2599, 'Zuid-Holland', 155, NULL, NULL),
(2600, 'Iles', 156, NULL, NULL),
(2601, 'Nord', 156, NULL, NULL),
(2602, 'Sud', 156, NULL, NULL),
(2603, 'Area Outside Region', 157, NULL, NULL),
(2604, 'Auckland', 157, NULL, NULL),
(2605, 'Bay of Plenty', 157, NULL, NULL),
(2606, 'Canterbury', 157, NULL, NULL),
(2607, 'Christchurch', 157, NULL, NULL),
(2608, 'Gisborne', 157, NULL, NULL),
(2609, 'Hawke\'\'s Bay', 157, NULL, NULL),
(2610, 'Manawatu-Wanganui', 157, NULL, NULL),
(2611, 'Marlborough', 157, NULL, NULL),
(2612, 'Nelson', 157, NULL, NULL),
(2613, 'Northland', 157, NULL, NULL),
(2614, 'Otago', 157, NULL, NULL),
(2615, 'Rodney', 157, NULL, NULL),
(2616, 'Southland', 157, NULL, NULL),
(2617, 'Taranaki', 157, NULL, NULL),
(2618, 'Tasman', 157, NULL, NULL),
(2619, 'Waikato', 157, NULL, NULL),
(2620, 'Wellington', 157, NULL, NULL),
(2621, 'West Coast', 157, NULL, NULL),
(2622, 'Atlantico Norte', 158, NULL, NULL),
(2623, 'Atlantico Sur', 158, NULL, NULL),
(2624, 'Boaco', 158, NULL, NULL),
(2625, 'Carazo', 158, NULL, NULL),
(2626, 'Chinandega', 158, NULL, NULL),
(2627, 'Chontales', 158, NULL, NULL),
(2628, 'Esteli', 158, NULL, NULL),
(2629, 'Granada', 158, NULL, NULL),
(2630, 'Jinotega', 158, NULL, NULL),
(2631, 'Leon', 158, NULL, NULL),
(2632, 'Madriz', 158, NULL, NULL),
(2633, 'Managua', 158, NULL, NULL),
(2634, 'Masaya', 158, NULL, NULL),
(2635, 'Matagalpa', 158, NULL, NULL),
(2636, 'Nueva Segovia', 158, NULL, NULL),
(2637, 'Rio San Juan', 158, NULL, NULL),
(2638, 'Rivas', 158, NULL, NULL),
(2639, 'Agadez', 159, NULL, NULL),
(2640, 'Diffa', 159, NULL, NULL),
(2641, 'Dosso', 159, NULL, NULL),
(2642, 'Maradi', 159, NULL, NULL),
(2643, 'Niamey', 159, NULL, NULL),
(2644, 'Tahoua', 159, NULL, NULL),
(2645, 'Tillabery', 159, NULL, NULL),
(2646, 'Zinder', 159, NULL, NULL),
(2647, 'Abia', 160, NULL, NULL),
(2648, 'Abuja Federal Capital Territor', 160, NULL, NULL),
(2649, 'Adamawa', 160, NULL, NULL),
(2650, 'Akwa Ibom', 160, NULL, NULL),
(2651, 'Anambra', 160, NULL, NULL),
(2652, 'Bauchi', 160, NULL, NULL),
(2653, 'Bayelsa', 160, NULL, NULL),
(2654, 'Benue', 160, NULL, NULL),
(2655, 'Borno', 160, NULL, NULL),
(2656, 'Cross River', 160, NULL, NULL),
(2657, 'Delta', 160, NULL, NULL),
(2658, 'Ebonyi', 160, NULL, NULL),
(2659, 'Edo', 160, NULL, NULL),
(2660, 'Ekiti', 160, NULL, NULL),
(2661, 'Enugu', 160, NULL, NULL),
(2662, 'Gombe', 160, NULL, NULL),
(2663, 'Imo', 160, NULL, NULL),
(2664, 'Jigawa', 160, NULL, NULL),
(2665, 'Kaduna', 160, NULL, NULL),
(2666, 'Kano', 160, NULL, NULL),
(2667, 'Katsina', 160, NULL, NULL),
(2668, 'Kebbi', 160, NULL, NULL),
(2669, 'Kogi', 160, NULL, NULL),
(2670, 'Kwara', 160, NULL, NULL),
(2671, 'Lagos', 160, NULL, NULL),
(2672, 'Nassarawa', 160, NULL, NULL),
(2673, 'Niger', 160, NULL, NULL),
(2674, 'Ogun', 160, NULL, NULL),
(2675, 'Ondo', 160, NULL, NULL),
(2676, 'Osun', 160, NULL, NULL),
(2677, 'Oyo', 160, NULL, NULL),
(2678, 'Plateau', 160, NULL, NULL),
(2679, 'Rivers', 160, NULL, NULL),
(2680, 'Sokoto', 160, NULL, NULL),
(2681, 'Taraba', 160, NULL, NULL),
(2682, 'Yobe', 160, NULL, NULL),
(2683, 'Zamfara', 160, NULL, NULL),
(2684, 'Niue', 161, NULL, NULL),
(2685, 'Norfolk Island', 162, NULL, NULL),
(2686, 'Northern Islands', 163, NULL, NULL),
(2687, 'Rota', 163, NULL, NULL),
(2688, 'Saipan', 163, NULL, NULL),
(2689, 'Tinian', 163, NULL, NULL),
(2690, 'Akershus', 164, NULL, NULL),
(2691, 'Aust Agder', 164, NULL, NULL),
(2692, 'Bergen', 164, NULL, NULL),
(2693, 'Buskerud', 164, NULL, NULL),
(2694, 'Finnmark', 164, NULL, NULL),
(2695, 'Hedmark', 164, NULL, NULL),
(2696, 'Hordaland', 164, NULL, NULL),
(2697, 'Moere og Romsdal', 164, NULL, NULL),
(2698, 'Nord Trondelag', 164, NULL, NULL),
(2699, 'Nordland', 164, NULL, NULL),
(2700, 'Oestfold', 164, NULL, NULL),
(2701, 'Oppland', 164, NULL, NULL),
(2702, 'Oslo', 164, NULL, NULL),
(2703, 'Rogaland', 164, NULL, NULL),
(2704, 'Soer Troendelag', 164, NULL, NULL),
(2705, 'Sogn og Fjordane', 164, NULL, NULL),
(2706, 'Stavern', 164, NULL, NULL),
(2707, 'Sykkylven', 164, NULL, NULL),
(2708, 'Telemark', 164, NULL, NULL),
(2709, 'Troms', 164, NULL, NULL),
(2710, 'Vest Agder', 164, NULL, NULL),
(2711, 'Vestfold', 164, NULL, NULL),
(2712, 'ÃƒÂ˜stfold', 164, NULL, NULL),
(2713, 'Al Buraimi', 165, NULL, NULL),
(2714, 'Dhufar', 165, NULL, NULL),
(2715, 'Masqat', 165, NULL, NULL),
(2716, 'Musandam', 165, NULL, NULL),
(2717, 'Rusayl', 165, NULL, NULL),
(2718, 'Wadi Kabir', 165, NULL, NULL),
(2719, 'ad-Dakhiliyah', 165, NULL, NULL),
(2720, 'adh-Dhahirah', 165, NULL, NULL),
(2721, 'al-Batinah', 165, NULL, NULL),
(2722, 'ash-Sharqiyah', 165, NULL, NULL),
(2723, 'Baluchistan', 166, NULL, NULL),
(2724, 'Federal Capital Area', 166, NULL, NULL),
(2725, 'Federally administered Tribal', 166, NULL, NULL),
(2726, 'North-West Frontier', 166, NULL, NULL),
(2727, 'Northern Areas', 166, NULL, NULL),
(2728, 'Punjab', 166, NULL, NULL),
(2729, 'Sind', 166, NULL, NULL),
(2730, 'Aimeliik', 167, NULL, NULL),
(2731, 'Airai', 167, NULL, NULL),
(2732, 'Angaur', 167, NULL, NULL),
(2733, 'Hatobohei', 167, NULL, NULL),
(2734, 'Kayangel', 167, NULL, NULL),
(2735, 'Koror', 167, NULL, NULL),
(2736, 'Melekeok', 167, NULL, NULL),
(2737, 'Ngaraard', 167, NULL, NULL),
(2738, 'Ngardmau', 167, NULL, NULL),
(2739, 'Ngaremlengui', 167, NULL, NULL),
(2740, 'Ngatpang', 167, NULL, NULL),
(2741, 'Ngchesar', 167, NULL, NULL),
(2742, 'Ngerchelong', 167, NULL, NULL),
(2743, 'Ngiwal', 167, NULL, NULL),
(2744, 'Peleliu', 167, NULL, NULL),
(2745, 'Sonsorol', 167, NULL, NULL),
(2746, 'Ariha', 168, NULL, NULL),
(2747, 'Bayt Lahm', 168, NULL, NULL),
(2748, 'Bethlehem', 168, NULL, NULL),
(2749, 'Dayr-al-Balah', 168, NULL, NULL),
(2750, 'Ghazzah', 168, NULL, NULL),
(2751, 'Ghazzah ash-Shamaliyah', 168, NULL, NULL),
(2752, 'Janin', 168, NULL, NULL),
(2753, 'Khan Yunis', 168, NULL, NULL),
(2754, 'Nabulus', 168, NULL, NULL),
(2755, 'Qalqilyah', 168, NULL, NULL),
(2756, 'Rafah', 168, NULL, NULL),
(2757, 'Ram Allah wal-Birah', 168, NULL, NULL),
(2758, 'Salfit', 168, NULL, NULL),
(2759, 'Tubas', 168, NULL, NULL),
(2760, 'Tulkarm', 168, NULL, NULL),
(2761, 'al-Khalil', 168, NULL, NULL),
(2762, 'al-Quds', 168, NULL, NULL),
(2763, 'Bocas del Toro', 169, NULL, NULL),
(2764, 'Chiriqui', 169, NULL, NULL),
(2765, 'Cocle', 169, NULL, NULL),
(2766, 'Colon', 169, NULL, NULL),
(2767, 'Darien', 169, NULL, NULL),
(2768, 'Embera', 169, NULL, NULL),
(2769, 'Herrera', 169, NULL, NULL),
(2770, 'Kuna Yala', 169, NULL, NULL),
(2771, 'Los Santos', 169, NULL, NULL),
(2772, 'Ngobe Bugle', 169, NULL, NULL),
(2773, 'Panama', 169, NULL, NULL),
(2774, 'Veraguas', 169, NULL, NULL),
(2775, 'East New Britain', 170, NULL, NULL),
(2776, 'East Sepik', 170, NULL, NULL),
(2777, 'Eastern Highlands', 170, NULL, NULL),
(2778, 'Enga', 170, NULL, NULL),
(2779, 'Fly River', 170, NULL, NULL),
(2780, 'Gulf', 170, NULL, NULL),
(2781, 'Madang', 170, NULL, NULL),
(2782, 'Manus', 170, NULL, NULL),
(2783, 'Milne Bay', 170, NULL, NULL),
(2784, 'Morobe', 170, NULL, NULL),
(2785, 'National Capital District', 170, NULL, NULL),
(2786, 'New Ireland', 170, NULL, NULL),
(2787, 'North Solomons', 170, NULL, NULL),
(2788, 'Oro', 170, NULL, NULL),
(2789, 'Sandaun', 170, NULL, NULL),
(2790, 'Simbu', 170, NULL, NULL),
(2791, 'Southern Highlands', 170, NULL, NULL),
(2792, 'West New Britain', 170, NULL, NULL),
(2793, 'Western Highlands', 170, NULL, NULL),
(2794, 'Alto Paraguay', 171, NULL, NULL),
(2795, 'Alto Parana', 171, NULL, NULL),
(2796, 'Amambay', 171, NULL, NULL),
(2797, 'Asuncion', 171, NULL, NULL),
(2798, 'Boqueron', 171, NULL, NULL),
(2799, 'Caaguazu', 171, NULL, NULL),
(2800, 'Caazapa', 171, NULL, NULL),
(2801, 'Canendiyu', 171, NULL, NULL),
(2802, 'Central', 171, NULL, NULL),
(2803, 'Concepcion', 171, NULL, NULL),
(2804, 'Cordillera', 171, NULL, NULL),
(2805, 'Guaira', 171, NULL, NULL),
(2806, 'Itapua', 171, NULL, NULL),
(2807, 'Misiones', 171, NULL, NULL),
(2808, 'Neembucu', 171, NULL, NULL),
(2809, 'Paraguari', 171, NULL, NULL),
(2810, 'Presidente Hayes', 171, NULL, NULL),
(2811, 'San Pedro', 171, NULL, NULL),
(2812, 'Amazonas', 172, NULL, NULL),
(2813, 'Ancash', 172, NULL, NULL),
(2814, 'Apurimac', 172, NULL, NULL),
(2815, 'Arequipa', 172, NULL, NULL),
(2816, 'Ayacucho', 172, NULL, NULL),
(2817, 'Cajamarca', 172, NULL, NULL),
(2818, 'Cusco', 172, NULL, NULL),
(2819, 'Huancavelica', 172, NULL, NULL),
(2820, 'Huanuco', 172, NULL, NULL),
(2821, 'Ica', 172, NULL, NULL),
(2822, 'Junin', 172, NULL, NULL),
(2823, 'La Libertad', 172, NULL, NULL),
(2824, 'Lambayeque', 172, NULL, NULL),
(2825, 'Lima y Callao', 172, NULL, NULL),
(2826, 'Loreto', 172, NULL, NULL),
(2827, 'Madre de Dios', 172, NULL, NULL),
(2828, 'Moquegua', 172, NULL, NULL),
(2829, 'Pasco', 172, NULL, NULL),
(2830, 'Piura', 172, NULL, NULL),
(2831, 'Puno', 172, NULL, NULL),
(2832, 'San Martin', 172, NULL, NULL),
(2833, 'Tacna', 172, NULL, NULL),
(2834, 'Tumbes', 172, NULL, NULL),
(2835, 'Ucayali', 172, NULL, NULL),
(2836, 'Batangas', 173, NULL, NULL),
(2837, 'Bicol', 173, NULL, NULL),
(2838, 'Bulacan', 173, NULL, NULL),
(2839, 'Cagayan', 173, NULL, NULL),
(2840, 'Caraga', 173, NULL, NULL),
(2841, 'Central Luzon', 173, NULL, NULL),
(2842, 'Central Mindanao', 173, NULL, NULL),
(2843, 'Central Visayas', 173, NULL, NULL),
(2844, 'Cordillera', 173, NULL, NULL),
(2845, 'Davao', 173, NULL, NULL),
(2846, 'Eastern Visayas', 173, NULL, NULL),
(2847, 'Greater Metropolitan Area', 173, NULL, NULL),
(2848, 'Ilocos', 173, NULL, NULL),
(2849, 'Laguna', 173, NULL, NULL),
(2850, 'Luzon', 173, NULL, NULL),
(2851, 'Mactan', 173, NULL, NULL),
(2852, 'Metropolitan Manila Area', 173, NULL, NULL),
(2853, 'Muslim Mindanao', 173, NULL, NULL),
(2854, 'Northern Mindanao', 173, NULL, NULL),
(2855, 'Southern Mindanao', 173, NULL, NULL),
(2856, 'Southern Tagalog', 173, NULL, NULL),
(2857, 'Western Mindanao', 173, NULL, NULL),
(2858, 'Western Visayas', 173, NULL, NULL),
(2859, 'Pitcairn Island', 174, NULL, NULL),
(2860, 'Biale Blota', 175, NULL, NULL),
(2861, 'Dobroszyce', 175, NULL, NULL),
(2862, 'Dolnoslaskie', 175, NULL, NULL),
(2863, 'Dziekanow Lesny', 175, NULL, NULL),
(2864, 'Hopowo', 175, NULL, NULL),
(2865, 'Kartuzy', 175, NULL, NULL),
(2866, 'Koscian', 175, NULL, NULL),
(2867, 'Krakow', 175, NULL, NULL),
(2868, 'Kujawsko-Pomorskie', 175, NULL, NULL),
(2869, 'Lodzkie', 175, NULL, NULL),
(2870, 'Lubelskie', 175, NULL, NULL),
(2871, 'Lubuskie', 175, NULL, NULL),
(2872, 'Malomice', 175, NULL, NULL),
(2873, 'Malopolskie', 175, NULL, NULL),
(2874, 'Mazowieckie', 175, NULL, NULL),
(2875, 'Mirkow', 175, NULL, NULL),
(2876, 'Opolskie', 175, NULL, NULL),
(2877, 'Ostrowiec', 175, NULL, NULL),
(2878, 'Podkarpackie', 175, NULL, NULL),
(2879, 'Podlaskie', 175, NULL, NULL),
(2880, 'Polska', 175, NULL, NULL),
(2881, 'Pomorskie', 175, NULL, NULL),
(2882, 'Poznan', 175, NULL, NULL),
(2883, 'Pruszkow', 175, NULL, NULL),
(2884, 'Rymanowska', 175, NULL, NULL),
(2885, 'Rzeszow', 175, NULL, NULL),
(2886, 'Slaskie', 175, NULL, NULL),
(2887, 'Stare Pole', 175, NULL, NULL),
(2888, 'Swietokrzyskie', 175, NULL, NULL),
(2889, 'Warminsko-Mazurskie', 175, NULL, NULL),
(2890, 'Warsaw', 175, NULL, NULL),
(2891, 'Wejherowo', 175, NULL, NULL),
(2892, 'Wielkopolskie', 175, NULL, NULL),
(2893, 'Wroclaw', 175, NULL, NULL),
(2894, 'Zachodnio-Pomorskie', 175, NULL, NULL),
(2895, 'Zukowo', 175, NULL, NULL),
(2896, 'Abrantes', 176, NULL, NULL),
(2897, 'Acores', 176, NULL, NULL),
(2898, 'Alentejo', 176, NULL, NULL),
(2899, 'Algarve', 176, NULL, NULL),
(2900, 'Braga', 176, NULL, NULL),
(2901, 'Centro', 176, NULL, NULL),
(2902, 'Distrito de Leiria', 176, NULL, NULL),
(2903, 'Distrito de Viana do Castelo', 176, NULL, NULL),
(2904, 'Distrito de Vila Real', 176, NULL, NULL),
(2905, 'Distrito do Porto', 176, NULL, NULL),
(2906, 'Lisboa e Vale do Tejo', 176, NULL, NULL),
(2907, 'Madeira', 176, NULL, NULL),
(2908, 'Norte', 176, NULL, NULL),
(2909, 'Paivas', 176, NULL, NULL),
(2910, 'Arecibo', 177, NULL, NULL),
(2911, 'Bayamon', 177, NULL, NULL),
(2912, 'Carolina', 177, NULL, NULL),
(2913, 'Florida', 177, NULL, NULL),
(2914, 'Guayama', 177, NULL, NULL),
(2915, 'Humacao', 177, NULL, NULL),
(2916, 'Mayaguez-Aguadilla', 177, NULL, NULL),
(2917, 'Ponce', 177, NULL, NULL),
(2918, 'Salinas', 177, NULL, NULL),
(2919, 'San Juan', 177, NULL, NULL),
(2920, 'Doha', 178, NULL, NULL),
(2921, 'Jarian-al-Batnah', 178, NULL, NULL),
(2922, 'Umm Salal', 178, NULL, NULL),
(2923, 'ad-Dawhah', 178, NULL, NULL),
(2924, 'al-Ghuwayriyah', 178, NULL, NULL),
(2925, 'al-Jumayliyah', 178, NULL, NULL),
(2926, 'al-Khawr', 178, NULL, NULL),
(2927, 'al-Wakrah', 178, NULL, NULL),
(2928, 'ar-Rayyan', 178, NULL, NULL),
(2929, 'ash-Shamal', 178, NULL, NULL),
(2930, 'Saint-Benoit', 179, NULL, NULL),
(2931, 'Saint-Denis', 179, NULL, NULL),
(2932, 'Saint-Paul', 179, NULL, NULL),
(2933, 'Saint-Pierre', 179, NULL, NULL),
(2934, 'Alba', 180, NULL, NULL),
(2935, 'Arad', 180, NULL, NULL),
(2936, 'Arges', 180, NULL, NULL),
(2937, 'Bacau', 180, NULL, NULL),
(2938, 'Bihor', 180, NULL, NULL),
(2939, 'Bistrita-Nasaud', 180, NULL, NULL),
(2940, 'Botosani', 180, NULL, NULL),
(2941, 'Braila', 180, NULL, NULL),
(2942, 'Brasov', 180, NULL, NULL),
(2943, 'Bucuresti', 180, NULL, NULL),
(2944, 'Buzau', 180, NULL, NULL),
(2945, 'Calarasi', 180, NULL, NULL),
(2946, 'Caras-Severin', 180, NULL, NULL),
(2947, 'Cluj', 180, NULL, NULL),
(2948, 'Constanta', 180, NULL, NULL),
(2949, 'Covasna', 180, NULL, NULL),
(2950, 'Dambovita', 180, NULL, NULL),
(2951, 'Dolj', 180, NULL, NULL),
(2952, 'Galati', 180, NULL, NULL),
(2953, 'Giurgiu', 180, NULL, NULL),
(2954, 'Gorj', 180, NULL, NULL),
(2955, 'Harghita', 180, NULL, NULL),
(2956, 'Hunedoara', 180, NULL, NULL),
(2957, 'Ialomita', 180, NULL, NULL),
(2958, 'Iasi', 180, NULL, NULL),
(2959, 'Ilfov', 180, NULL, NULL),
(2960, 'Maramures', 180, NULL, NULL),
(2961, 'Mehedinti', 180, NULL, NULL),
(2962, 'Mures', 180, NULL, NULL),
(2963, 'Neamt', 180, NULL, NULL),
(2964, 'Olt', 180, NULL, NULL),
(2965, 'Prahova', 180, NULL, NULL),
(2966, 'Salaj', 180, NULL, NULL),
(2967, 'Satu Mare', 180, NULL, NULL),
(2968, 'Sibiu', 180, NULL, NULL),
(2969, 'Sondelor', 180, NULL, NULL),
(2970, 'Suceava', 180, NULL, NULL),
(2971, 'Teleorman', 180, NULL, NULL),
(2972, 'Timis', 180, NULL, NULL),
(2973, 'Tulcea', 180, NULL, NULL),
(2974, 'Valcea', 180, NULL, NULL),
(2975, 'Vaslui', 180, NULL, NULL),
(2976, 'Vrancea', 180, NULL, NULL),
(2977, 'Adygeja', 181, NULL, NULL),
(2978, 'Aga', 181, NULL, NULL),
(2979, 'Alanija', 181, NULL, NULL),
(2980, 'Altaj', 181, NULL, NULL),
(2981, 'Amur', 181, NULL, NULL),
(2982, 'Arhangelsk', 181, NULL, NULL),
(2983, 'Astrahan', 181, NULL, NULL),
(2984, 'Bashkortostan', 181, NULL, NULL),
(2985, 'Belgorod', 181, NULL, NULL),
(2986, 'Brjansk', 181, NULL, NULL),
(2987, 'Burjatija', 181, NULL, NULL),
(2988, 'Chechenija', 181, NULL, NULL),
(2989, 'Cheljabinsk', 181, NULL, NULL),
(2990, 'Chita', 181, NULL, NULL),
(2991, 'Chukotka', 181, NULL, NULL),
(2992, 'Chuvashija', 181, NULL, NULL),
(2993, 'Dagestan', 181, NULL, NULL),
(2994, 'Evenkija', 181, NULL, NULL),
(2995, 'Gorno-Altaj', 181, NULL, NULL),
(2996, 'Habarovsk', 181, NULL, NULL),
(2997, 'Hakasija', 181, NULL, NULL),
(2998, 'Hanty-Mansija', 181, NULL, NULL),
(2999, 'Ingusetija', 181, NULL, NULL),
(3000, 'Irkutsk', 181, NULL, NULL),
(3001, 'Ivanovo', 181, NULL, NULL),
(3002, 'Jamalo-Nenets', 181, NULL, NULL),
(3003, 'Jaroslavl', 181, NULL, NULL),
(3004, 'Jevrej', 181, NULL, NULL),
(3005, 'Kabardino-Balkarija', 181, NULL, NULL),
(3006, 'Kaliningrad', 181, NULL, NULL),
(3007, 'Kalmykija', 181, NULL, NULL),
(3008, 'Kaluga', 181, NULL, NULL),
(3009, 'Kamchatka', 181, NULL, NULL),
(3010, 'Karachaj-Cherkessija', 181, NULL, NULL),
(3011, 'Karelija', 181, NULL, NULL),
(3012, 'Kemerovo', 181, NULL, NULL),
(3013, 'Khabarovskiy Kray', 181, NULL, NULL),
(3014, 'Kirov', 181, NULL, NULL),
(3015, 'Komi', 181, NULL, NULL),
(3016, 'Komi-Permjakija', 181, NULL, NULL),
(3017, 'Korjakija', 181, NULL, NULL),
(3018, 'Kostroma', 181, NULL, NULL),
(3019, 'Krasnodar', 181, NULL, NULL),
(3020, 'Krasnojarsk', 181, NULL, NULL),
(3021, 'Krasnoyarskiy Kray', 181, NULL, NULL),
(3022, 'Kurgan', 181, NULL, NULL),
(3023, 'Kursk', 181, NULL, NULL),
(3024, 'Leningrad', 181, NULL, NULL),
(3025, 'Lipeck', 181, NULL, NULL),
(3026, 'Magadan', 181, NULL, NULL),
(3027, 'Marij El', 181, NULL, NULL),
(3028, 'Mordovija', 181, NULL, NULL),
(3029, 'Moscow', 181, NULL, NULL),
(3030, 'Moskovskaja Oblast', 181, NULL, NULL),
(3031, 'Moskovskaya Oblast', 181, NULL, NULL),
(3032, 'Moskva', 181, NULL, NULL),
(3033, 'Murmansk', 181, NULL, NULL),
(3034, 'Nenets', 181, NULL, NULL),
(3035, 'Nizhnij Novgorod', 181, NULL, NULL),
(3036, 'Novgorod', 181, NULL, NULL),
(3037, 'Novokusnezk', 181, NULL, NULL),
(3038, 'Novosibirsk', 181, NULL, NULL),
(3039, 'Omsk', 181, NULL, NULL),
(3040, 'Orenburg', 181, NULL, NULL),
(3041, 'Orjol', 181, NULL, NULL),
(3042, 'Penza', 181, NULL, NULL),
(3043, 'Perm', 181, NULL, NULL),
(3044, 'Primorje', 181, NULL, NULL),
(3045, 'Pskov', 181, NULL, NULL),
(3046, 'Pskovskaya Oblast', 181, NULL, NULL),
(3047, 'Rjazan', 181, NULL, NULL),
(3048, 'Rostov', 181, NULL, NULL),
(3049, 'Saha', 181, NULL, NULL),
(3050, 'Sahalin', 181, NULL, NULL),
(3051, 'Samara', 181, NULL, NULL),
(3052, 'Samarskaya', 181, NULL, NULL),
(3053, 'Sankt-Peterburg', 181, NULL, NULL),
(3054, 'Saratov', 181, NULL, NULL),
(3055, 'Smolensk', 181, NULL, NULL),
(3056, 'Stavropol', 181, NULL, NULL),
(3057, 'Sverdlovsk', 181, NULL, NULL),
(3058, 'Tajmyrija', 181, NULL, NULL),
(3059, 'Tambov', 181, NULL, NULL),
(3060, 'Tatarstan', 181, NULL, NULL),
(3061, 'Tjumen', 181, NULL, NULL),
(3062, 'Tomsk', 181, NULL, NULL),
(3063, 'Tula', 181, NULL, NULL),
(3064, 'Tver', 181, NULL, NULL),
(3065, 'Tyva', 181, NULL, NULL),
(3066, 'Udmurtija', 181, NULL, NULL),
(3067, 'Uljanovsk', 181, NULL, NULL),
(3068, 'Ulyanovskaya Oblast', 181, NULL, NULL),
(3069, 'Ust-Orda', 181, NULL, NULL),
(3070, 'Vladimir', 181, NULL, NULL),
(3071, 'Volgograd', 181, NULL, NULL),
(3072, 'Vologda', 181, NULL, NULL),
(3073, 'Voronezh', 181, NULL, NULL),
(3074, 'Butare', 182, NULL, NULL),
(3075, 'Byumba', 182, NULL, NULL),
(3076, 'Cyangugu', 182, NULL, NULL),
(3077, 'Gikongoro', 182, NULL, NULL),
(3078, 'Gisenyi', 182, NULL, NULL),
(3079, 'Gitarama', 182, NULL, NULL),
(3080, 'Kibungo', 182, NULL, NULL),
(3081, 'Kibuye', 182, NULL, NULL),
(3082, 'Kigali-ngali', 182, NULL, NULL),
(3083, 'Ruhengeri', 182, NULL, NULL),
(3084, 'Ascension', 183, NULL, NULL),
(3085, 'Gough Island', 183, NULL, NULL),
(3086, 'Saint Helena', 183, NULL, NULL),
(3087, 'Tristan da Cunha', 183, NULL, NULL),
(3088, 'Christ Church Nichola Town', 184, NULL, NULL),
(3089, 'Saint Anne Sandy Point', 184, NULL, NULL),
(3090, 'Saint George Basseterre', 184, NULL, NULL),
(3091, 'Saint George Gingerland', 184, NULL, NULL),
(3092, 'Saint James Windward', 184, NULL, NULL),
(3093, 'Saint John Capesterre', 184, NULL, NULL),
(3094, 'Saint John Figtree', 184, NULL, NULL),
(3095, 'Saint Mary Cayon', 184, NULL, NULL),
(3096, 'Saint Paul Capesterre', 184, NULL, NULL),
(3097, 'Saint Paul Charlestown', 184, NULL, NULL),
(3098, 'Saint Peter Basseterre', 184, NULL, NULL),
(3099, 'Saint Thomas Lowland', 184, NULL, NULL),
(3100, 'Saint Thomas Middle Island', 184, NULL, NULL),
(3101, 'Trinity Palmetto Point', 184, NULL, NULL),
(3102, 'Anse-la-Raye', 185, NULL, NULL),
(3103, 'Canaries', 185, NULL, NULL),
(3104, 'Castries', 185, NULL, NULL),
(3105, 'Choiseul', 185, NULL, NULL),
(3106, 'Dennery', 185, NULL, NULL),
(3107, 'Gros Inlet', 185, NULL, NULL),
(3108, 'Laborie', 185, NULL, NULL),
(3109, 'Micoud', 185, NULL, NULL),
(3110, 'Soufriere', 185, NULL, NULL),
(3111, 'Vieux Fort', 185, NULL, NULL),
(3112, 'Miquelon-Langlade', 186, NULL, NULL),
(3113, 'Saint-Pierre', 186, NULL, NULL),
(3114, 'Charlotte', 187, NULL, NULL),
(3115, 'Grenadines', 187, NULL, NULL),
(3116, 'Saint Andrew', 187, NULL, NULL),
(3117, 'Saint David', 187, NULL, NULL),
(3118, 'Saint George', 187, NULL, NULL),
(3119, 'Saint Patrick', 187, NULL, NULL),
(3120, 'A\'\'ana', 188, NULL, NULL),
(3121, 'Aiga-i-le-Tai', 188, NULL, NULL),
(3122, 'Atua', 188, NULL, NULL),
(3123, 'Fa\'\'asaleleaga', 188, NULL, NULL),
(3124, 'Gaga\'\'emauga', 188, NULL, NULL),
(3125, 'Gagaifomauga', 188, NULL, NULL),
(3126, 'Palauli', 188, NULL, NULL),
(3127, 'Satupa\'\'itea', 188, NULL, NULL),
(3128, 'Tuamasaga', 188, NULL, NULL),
(3129, 'Va\'\'a-o-Fonoti', 188, NULL, NULL),
(3130, 'Vaisigano', 188, NULL, NULL),
(3131, 'Acquaviva', 189, NULL, NULL),
(3132, 'Borgo Maggiore', 189, NULL, NULL),
(3133, 'Chiesanuova', 189, NULL, NULL),
(3134, 'Domagnano', 189, NULL, NULL),
(3135, 'Faetano', 189, NULL, NULL),
(3136, 'Fiorentino', 189, NULL, NULL),
(3137, 'Montegiardino', 189, NULL, NULL),
(3138, 'San Marino', 189, NULL, NULL),
(3139, 'Serravalle', 189, NULL, NULL),
(3140, 'Agua Grande', 190, NULL, NULL),
(3141, 'Cantagalo', 190, NULL, NULL),
(3142, 'Lemba', 190, NULL, NULL),
(3143, 'Lobata', 190, NULL, NULL),
(3144, 'Me-Zochi', 190, NULL, NULL),
(3145, 'Pague', 190, NULL, NULL),
(3146, 'Al Khobar', 191, NULL, NULL),
(3147, 'Aseer', 191, NULL, NULL),
(3148, 'Ash Sharqiyah', 191, NULL, NULL),
(3149, 'Asir', 191, NULL, NULL),
(3150, 'Central Province', 191, NULL, NULL),
(3151, 'Eastern Province', 191, NULL, NULL),
(3152, 'Ha\'\'il', 191, NULL, NULL),
(3153, 'Jawf', 191, NULL, NULL),
(3154, 'Jizan', 191, NULL, NULL),
(3155, 'Makkah', 191, NULL, NULL),
(3156, 'Najran', 191, NULL, NULL),
(3157, 'Qasim', 191, NULL, NULL),
(3158, 'Tabuk', 191, NULL, NULL),
(3159, 'Western Province', 191, NULL, NULL),
(3160, 'al-Bahah', 191, NULL, NULL),
(3161, 'al-Hudud-ash-Shamaliyah', 191, NULL, NULL),
(3162, 'al-Madinah', 191, NULL, NULL),
(3163, 'ar-Riyad', 191, NULL, NULL),
(3164, 'Dakar', 192, NULL, NULL),
(3165, 'Diourbel', 192, NULL, NULL),
(3166, 'Fatick', 192, NULL, NULL),
(3167, 'Kaolack', 192, NULL, NULL),
(3168, 'Kolda', 192, NULL, NULL),
(3169, 'Louga', 192, NULL, NULL),
(3170, 'Saint-Louis', 192, NULL, NULL),
(3171, 'Tambacounda', 192, NULL, NULL),
(3172, 'Thies', 192, NULL, NULL),
(3173, 'Ziguinchor', 192, NULL, NULL),
(3174, 'Central Serbia', 193, NULL, NULL),
(3175, 'Kosovo and Metohija', 193, NULL, NULL),
(3176, 'Vojvodina', 193, NULL, NULL),
(3177, 'Anse Boileau', 194, NULL, NULL),
(3178, 'Anse Royale', 194, NULL, NULL),
(3179, 'Cascade', 194, NULL, NULL),
(3180, 'Takamaka', 194, NULL, NULL),
(3181, 'Victoria', 194, NULL, NULL),
(3182, 'Eastern', 195, NULL, NULL),
(3183, 'Northern', 195, NULL, NULL),
(3184, 'Southern', 195, NULL, NULL),
(3185, 'Western', 195, NULL, NULL),
(3186, 'Singapore', 196, NULL, NULL),
(3187, 'Banskobystricky', 197, NULL, NULL),
(3188, 'Bratislavsky', 197, NULL, NULL),
(3189, 'Kosicky', 197, NULL, NULL),
(3190, 'Nitriansky', 197, NULL, NULL),
(3191, 'Presovsky', 197, NULL, NULL),
(3192, 'Trenciansky', 197, NULL, NULL),
(3193, 'Trnavsky', 197, NULL, NULL),
(3194, 'Zilinsky', 197, NULL, NULL),
(3195, 'Benedikt', 198, NULL, NULL),
(3196, 'Gorenjska', 198, NULL, NULL),
(3197, 'Gorishka', 198, NULL, NULL),
(3198, 'Jugovzhodna Slovenija', 198, NULL, NULL),
(3199, 'Koroshka', 198, NULL, NULL),
(3200, 'Notranjsko-krashka', 198, NULL, NULL),
(3201, 'Obalno-krashka', 198, NULL, NULL),
(3202, 'Obcina Domzale', 198, NULL, NULL),
(3203, 'Obcina Vitanje', 198, NULL, NULL),
(3204, 'Osrednjeslovenska', 198, NULL, NULL),
(3205, 'Podravska', 198, NULL, NULL),
(3206, 'Pomurska', 198, NULL, NULL),
(3207, 'Savinjska', 198, NULL, NULL),
(3208, 'Slovenian Littoral', 198, NULL, NULL),
(3209, 'Spodnjeposavska', 198, NULL, NULL),
(3210, 'Zasavska', 198, NULL, NULL),
(3211, 'Pitcairn', 199, NULL, NULL),
(3212, 'Central', 200, NULL, NULL),
(3213, 'Choiseul', 200, NULL, NULL),
(3214, 'Guadalcanal', 200, NULL, NULL),
(3215, 'Isabel', 200, NULL, NULL),
(3216, 'Makira and Ulawa', 200, NULL, NULL),
(3217, 'Malaita', 200, NULL, NULL),
(3218, 'Rennell and Bellona', 200, NULL, NULL),
(3219, 'Temotu', 200, NULL, NULL),
(3220, 'Western', 200, NULL, NULL),
(3221, 'Awdal', 201, NULL, NULL),
(3222, 'Bakol', 201, NULL, NULL),
(3223, 'Banadir', 201, NULL, NULL),
(3224, 'Bari', 201, NULL, NULL),
(3225, 'Bay', 201, NULL, NULL),
(3226, 'Galgudug', 201, NULL, NULL),
(3227, 'Gedo', 201, NULL, NULL),
(3228, 'Hiran', 201, NULL, NULL),
(3229, 'Jubbada Hose', 201, NULL, NULL),
(3230, 'Jubbadha Dexe', 201, NULL, NULL),
(3231, 'Mudug', 201, NULL, NULL),
(3232, 'Nugal', 201, NULL, NULL),
(3233, 'Sanag', 201, NULL, NULL),
(3234, 'Shabellaha Dhexe', 201, NULL, NULL),
(3235, 'Shabellaha Hose', 201, NULL, NULL),
(3236, 'Togdher', 201, NULL, NULL),
(3237, 'Woqoyi Galbed', 201, NULL, NULL),
(3238, 'Eastern Cape', 202, NULL, NULL),
(3239, 'Free State', 202, NULL, NULL),
(3240, 'Gauteng', 202, NULL, NULL),
(3241, 'Kempton Park', 202, NULL, NULL),
(3242, 'Kramerville', 202, NULL, NULL),
(3243, 'KwaZulu Natal', 202, NULL, NULL),
(3244, 'Limpopo', 202, NULL, NULL),
(3245, 'Mpumalanga', 202, NULL, NULL),
(3246, 'North West', 202, NULL, NULL),
(3247, 'Northern Cape', 202, NULL, NULL),
(3248, 'Parow', 202, NULL, NULL),
(3249, 'Table View', 202, NULL, NULL),
(3250, 'Umtentweni', 202, NULL, NULL),
(3251, 'Western Cape', 202, NULL, NULL),
(3252, 'South Georgia', 203, NULL, NULL),
(3253, 'Central Equatoria', 204, NULL, NULL),
(3254, 'A Coruna', 205, NULL, NULL),
(3255, 'Alacant', 205, NULL, NULL),
(3256, 'Alava', 205, NULL, NULL),
(3257, 'Albacete', 205, NULL, NULL),
(3258, 'Almeria', 205, NULL, NULL),
(3259, 'Andalucia', 205, NULL, NULL),
(3260, 'Asturias', 205, NULL, NULL),
(3261, 'Avila', 205, NULL, NULL),
(3262, 'Badajoz', 205, NULL, NULL),
(3263, 'Balears', 205, NULL, NULL),
(3264, 'Barcelona', 205, NULL, NULL),
(3265, 'Bertamirans', 205, NULL, NULL),
(3266, 'Biscay', 205, NULL, NULL),
(3267, 'Burgos', 205, NULL, NULL),
(3268, 'Caceres', 205, NULL, NULL),
(3269, 'Cadiz', 205, NULL, NULL),
(3270, 'Cantabria', 205, NULL, NULL),
(3271, 'Castello', 205, NULL, NULL),
(3272, 'Catalunya', 205, NULL, NULL),
(3273, 'Ceuta', 205, NULL, NULL),
(3274, 'Ciudad Real', 205, NULL, NULL),
(3275, 'Comunidad Autonoma de Canarias', 205, NULL, NULL),
(3276, 'Comunidad Autonoma de Cataluna', 205, NULL, NULL),
(3277, 'Comunidad Autonoma de Galicia', 205, NULL, NULL),
(3278, 'Comunidad Autonoma de las Isla', 205, NULL, NULL),
(3279, 'Comunidad Autonoma del Princip', 205, NULL, NULL),
(3280, 'Comunidad Valenciana', 205, NULL, NULL),
(3281, 'Cordoba', 205, NULL, NULL),
(3282, 'Cuenca', 205, NULL, NULL),
(3283, 'Gipuzkoa', 205, NULL, NULL),
(3284, 'Girona', 205, NULL, NULL),
(3285, 'Granada', 205, NULL, NULL),
(3286, 'Guadalajara', 205, NULL, NULL),
(3287, 'Guipuzcoa', 205, NULL, NULL),
(3288, 'Huelva', 205, NULL, NULL),
(3289, 'Huesca', 205, NULL, NULL),
(3290, 'Jaen', 205, NULL, NULL),
(3291, 'La Rioja', 205, NULL, NULL),
(3292, 'Las Palmas', 205, NULL, NULL),
(3293, 'Leon', 205, NULL, NULL),
(3294, 'Lerida', 205, NULL, NULL),
(3295, 'Lleida', 205, NULL, NULL),
(3296, 'Lugo', 205, NULL, NULL),
(3297, 'Madrid', 205, NULL, NULL),
(3298, 'Malaga', 205, NULL, NULL),
(3299, 'Melilla', 205, NULL, NULL),
(3300, 'Murcia', 205, NULL, NULL),
(3301, 'Navarra', 205, NULL, NULL),
(3302, 'Ourense', 205, NULL, NULL),
(3303, 'Pais Vasco', 205, NULL, NULL),
(3304, 'Palencia', 205, NULL, NULL),
(3305, 'Pontevedra', 205, NULL, NULL),
(3306, 'Salamanca', 205, NULL, NULL),
(3307, 'Santa Cruz de Tenerife', 205, NULL, NULL),
(3308, 'Segovia', 205, NULL, NULL),
(3309, 'Sevilla', 205, NULL, NULL),
(3310, 'Soria', 205, NULL, NULL),
(3311, 'Tarragona', 205, NULL, NULL),
(3312, 'Tenerife', 205, NULL, NULL),
(3313, 'Teruel', 205, NULL, NULL),
(3314, 'Toledo', 205, NULL, NULL),
(3315, 'Valencia', 205, NULL, NULL),
(3316, 'Valladolid', 205, NULL, NULL),
(3317, 'Vizcaya', 205, NULL, NULL),
(3318, 'Zamora', 205, NULL, NULL),
(3319, 'Zaragoza', 205, NULL, NULL),
(3320, 'Amparai', 206, NULL, NULL),
(3321, 'Anuradhapuraya', 206, NULL, NULL),
(3322, 'Badulla', 206, NULL, NULL),
(3323, 'Boralesgamuwa', 206, NULL, NULL),
(3324, 'Colombo', 206, NULL, NULL),
(3325, 'Galla', 206, NULL, NULL),
(3326, 'Gampaha', 206, NULL, NULL),
(3327, 'Hambantota', 206, NULL, NULL),
(3328, 'Kalatura', 206, NULL, NULL),
(3329, 'Kegalla', 206, NULL, NULL),
(3330, 'Kilinochchi', 206, NULL, NULL),
(3331, 'Kurunegala', 206, NULL, NULL),
(3332, 'Madakalpuwa', 206, NULL, NULL),
(3333, 'Maha Nuwara', 206, NULL, NULL),
(3334, 'Malwana', 206, NULL, NULL),
(3335, 'Mannarama', 206, NULL, NULL),
(3336, 'Matale', 206, NULL, NULL),
(3337, 'Matara', 206, NULL, NULL),
(3338, 'Monaragala', 206, NULL, NULL),
(3339, 'Mullaitivu', 206, NULL, NULL),
(3340, 'North Eastern Province', 206, NULL, NULL),
(3341, 'North Western Province', 206, NULL, NULL),
(3342, 'Nuwara Eliya', 206, NULL, NULL),
(3343, 'Polonnaruwa', 206, NULL, NULL),
(3344, 'Puttalama', 206, NULL, NULL),
(3345, 'Ratnapuraya', 206, NULL, NULL),
(3346, 'Southern Province', 206, NULL, NULL),
(3347, 'Tirikunamalaya', 206, NULL, NULL),
(3348, 'Tuscany', 206, NULL, NULL),
(3349, 'Vavuniyawa', 206, NULL, NULL),
(3350, 'Western Province', 206, NULL, NULL),
(3351, 'Yapanaya', 206, NULL, NULL),
(3352, 'kadawatha', 206, NULL, NULL),
(3353, 'A\'\'ali-an-Nil', 207, NULL, NULL),
(3354, 'Bahr-al-Jabal', 207, NULL, NULL),
(3355, 'Central Equatoria', 207, NULL, NULL),
(3356, 'Gharb Bahr-al-Ghazal', 207, NULL, NULL),
(3357, 'Gharb Darfur', 207, NULL, NULL),
(3358, 'Gharb Kurdufan', 207, NULL, NULL),
(3359, 'Gharb-al-Istiwa\'\'iyah', 207, NULL, NULL),
(3360, 'Janub Darfur', 207, NULL, NULL),
(3361, 'Janub Kurdufan', 207, NULL, NULL),
(3362, 'Junqali', 207, NULL, NULL),
(3363, 'Kassala', 207, NULL, NULL),
(3364, 'Nahr-an-Nil', 207, NULL, NULL),
(3365, 'Shamal Bahr-al-Ghazal', 207, NULL, NULL),
(3366, 'Shamal Darfur', 207, NULL, NULL),
(3367, 'Shamal Kurdufan', 207, NULL, NULL),
(3368, 'Sharq-al-Istiwa\'\'iyah', 207, NULL, NULL),
(3369, 'Sinnar', 207, NULL, NULL),
(3370, 'Warab', 207, NULL, NULL),
(3371, 'Wilayat al Khartum', 207, NULL, NULL),
(3372, 'al-Bahr-al-Ahmar', 207, NULL, NULL),
(3373, 'al-Buhayrat', 207, NULL, NULL),
(3374, 'al-Jazirah', 207, NULL, NULL),
(3375, 'al-Khartum', 207, NULL, NULL),
(3376, 'al-Qadarif', 207, NULL, NULL),
(3377, 'al-Wahdah', 207, NULL, NULL),
(3378, 'an-Nil-al-Abyad', 207, NULL, NULL),
(3379, 'an-Nil-al-Azraq', 207, NULL, NULL),
(3380, 'ash-Shamaliyah', 207, NULL, NULL),
(3381, 'Brokopondo', 208, NULL, NULL),
(3382, 'Commewijne', 208, NULL, NULL),
(3383, 'Coronie', 208, NULL, NULL),
(3384, 'Marowijne', 208, NULL, NULL),
(3385, 'Nickerie', 208, NULL, NULL),
(3386, 'Para', 208, NULL, NULL),
(3387, 'Paramaribo', 208, NULL, NULL),
(3388, 'Saramacca', 208, NULL, NULL),
(3389, 'Wanica', 208, NULL, NULL),
(3390, 'Svalbard', 209, NULL, NULL),
(3391, 'Hhohho', 210, NULL, NULL),
(3392, 'Lubombo', 210, NULL, NULL),
(3393, 'Manzini', 210, NULL, NULL),
(3394, 'Shiselweni', 210, NULL, NULL),
(3395, 'Alvsborgs Lan', 211, NULL, NULL),
(3396, 'Angermanland', 211, NULL, NULL),
(3397, 'Blekinge', 211, NULL, NULL),
(3398, 'Bohuslan', 211, NULL, NULL),
(3399, 'Dalarna', 211, NULL, NULL),
(3400, 'Gavleborg', 211, NULL, NULL),
(3401, 'Gaza', 211, NULL, NULL),
(3402, 'Gotland', 211, NULL, NULL),
(3403, 'Halland', 211, NULL, NULL),
(3404, 'Jamtland', 211, NULL, NULL),
(3405, 'Jonkoping', 211, NULL, NULL),
(3406, 'Kalmar', 211, NULL, NULL),
(3407, 'Kristianstads', 211, NULL, NULL),
(3408, 'Kronoberg', 211, NULL, NULL),
(3409, 'Norrbotten', 211, NULL, NULL),
(3410, 'Orebro', 211, NULL, NULL),
(3411, 'Ostergotland', 211, NULL, NULL),
(3412, 'Saltsjo-Boo', 211, NULL, NULL),
(3413, 'Skane', 211, NULL, NULL),
(3414, 'Smaland', 211, NULL, NULL),
(3415, 'Sodermanland', 211, NULL, NULL),
(3416, 'Stockholm', 211, NULL, NULL),
(3417, 'Uppsala', 211, NULL, NULL),
(3418, 'Varmland', 211, NULL, NULL),
(3419, 'Vasterbotten', 211, NULL, NULL),
(3420, 'Vastergotland', 211, NULL, NULL),
(3421, 'Vasternorrland', 211, NULL, NULL),
(3422, 'Vastmanland', 211, NULL, NULL),
(3423, 'Vastra Gotaland', 211, NULL, NULL),
(3424, 'Aargau', 212, NULL, NULL),
(3425, 'Appenzell Inner-Rhoden', 212, NULL, NULL),
(3426, 'Appenzell-Ausser Rhoden', 212, NULL, NULL),
(3427, 'Basel-Landschaft', 212, NULL, NULL),
(3428, 'Basel-Stadt', 212, NULL, NULL),
(3429, 'Bern', 212, NULL, NULL),
(3430, 'Canton Ticino', 212, NULL, NULL),
(3431, 'Fribourg', 212, NULL, NULL),
(3432, 'Geneve', 212, NULL, NULL),
(3433, 'Glarus', 212, NULL, NULL),
(3434, 'Graubunden', 212, NULL, NULL),
(3435, 'Heerbrugg', 212, NULL, NULL),
(3436, 'Jura', 212, NULL, NULL),
(3437, 'Kanton Aargau', 212, NULL, NULL),
(3438, 'Luzern', 212, NULL, NULL),
(3439, 'Morbio Inferiore', 212, NULL, NULL),
(3440, 'Muhen', 212, NULL, NULL),
(3441, 'Neuchatel', 212, NULL, NULL),
(3442, 'Nidwalden', 212, NULL, NULL),
(3443, 'Obwalden', 212, NULL, NULL),
(3444, 'Sankt Gallen', 212, NULL, NULL),
(3445, 'Schaffhausen', 212, NULL, NULL),
(3446, 'Schwyz', 212, NULL, NULL),
(3447, 'Solothurn', 212, NULL, NULL),
(3448, 'Thurgau', 212, NULL, NULL),
(3449, 'Ticino', 212, NULL, NULL),
(3450, 'Uri', 212, NULL, NULL),
(3451, 'Valais', 212, NULL, NULL),
(3452, 'Vaud', 212, NULL, NULL),
(3453, 'Vauffelin', 212, NULL, NULL),
(3454, 'Zug', 212, NULL, NULL),
(3455, 'Zurich', 212, NULL, NULL),
(3456, 'Aleppo', 213, NULL, NULL),
(3457, 'Dar\'\'a', 213, NULL, NULL),
(3458, 'Dayr-az-Zawr', 213, NULL, NULL),
(3459, 'Dimashq', 213, NULL, NULL),
(3460, 'Halab', 213, NULL, NULL),
(3461, 'Hamah', 213, NULL, NULL),
(3462, 'Hims', 213, NULL, NULL),
(3463, 'Idlib', 213, NULL, NULL),
(3464, 'Madinat Dimashq', 213, NULL, NULL),
(3465, 'Tartus', 213, NULL, NULL),
(3466, 'al-Hasakah', 213, NULL, NULL),
(3467, 'al-Ladhiqiyah', 213, NULL, NULL),
(3468, 'al-Qunaytirah', 213, NULL, NULL),
(3469, 'ar-Raqqah', 213, NULL, NULL),
(3470, 'as-Suwayda', 213, NULL, NULL),
(3471, 'Changhua County', 214, NULL, NULL),
(3472, 'Chiayi County', 214, NULL, NULL),
(3473, 'Chiayi City', 214, NULL, NULL),
(3474, 'Taipei City', 214, NULL, NULL),
(3475, 'Hsinchu County', 214, NULL, NULL),
(3476, 'Hsinchu City', 214, NULL, NULL),
(3477, 'Hualien County', 214, NULL, NULL),
(3480, 'Kaohsiung City', 214, NULL, NULL),
(3481, 'Keelung City', 214, NULL, NULL);
INSERT INTO `states` (`id`, `name`, `country_id`, `created_at`, `updated_at`) VALUES
(3482, 'Kinmen County', 214, NULL, NULL),
(3483, 'Miaoli County', 214, NULL, NULL),
(3484, 'Nantou County', 214, NULL, NULL),
(3486, 'Penghu County', 214, NULL, NULL),
(3487, 'Pingtung County', 214, NULL, NULL),
(3488, 'Taichung City', 214, NULL, NULL),
(3492, 'Tainan City', 214, NULL, NULL),
(3493, 'New Taipei City', 214, NULL, NULL),
(3495, 'Taitung County', 214, NULL, NULL),
(3496, 'Taoyuan City', 214, NULL, NULL),
(3497, 'Yilan County', 214, NULL, NULL),
(3498, 'YunLin County', 214, NULL, NULL),
(3500, 'Dushanbe', 215, NULL, NULL),
(3501, 'Gorno-Badakhshan', 215, NULL, NULL),
(3502, 'Karotegin', 215, NULL, NULL),
(3503, 'Khatlon', 215, NULL, NULL),
(3504, 'Sughd', 215, NULL, NULL),
(3505, 'Arusha', 216, NULL, NULL),
(3506, 'Dar es Salaam', 216, NULL, NULL),
(3507, 'Dodoma', 216, NULL, NULL),
(3508, 'Iringa', 216, NULL, NULL),
(3509, 'Kagera', 216, NULL, NULL),
(3510, 'Kigoma', 216, NULL, NULL),
(3511, 'Kilimanjaro', 216, NULL, NULL),
(3512, 'Lindi', 216, NULL, NULL),
(3513, 'Mara', 216, NULL, NULL),
(3514, 'Mbeya', 216, NULL, NULL),
(3515, 'Morogoro', 216, NULL, NULL),
(3516, 'Mtwara', 216, NULL, NULL),
(3517, 'Mwanza', 216, NULL, NULL),
(3518, 'Pwani', 216, NULL, NULL),
(3519, 'Rukwa', 216, NULL, NULL),
(3520, 'Ruvuma', 216, NULL, NULL),
(3521, 'Shinyanga', 216, NULL, NULL),
(3522, 'Singida', 216, NULL, NULL),
(3523, 'Tabora', 216, NULL, NULL),
(3524, 'Tanga', 216, NULL, NULL),
(3525, 'Zanzibar and Pemba', 216, NULL, NULL),
(3526, 'Amnat Charoen', 217, NULL, NULL),
(3527, 'Ang Thong', 217, NULL, NULL),
(3528, 'Bangkok', 217, NULL, NULL),
(3529, 'Buri Ram', 217, NULL, NULL),
(3530, 'Chachoengsao', 217, NULL, NULL),
(3531, 'Chai Nat', 217, NULL, NULL),
(3532, 'Chaiyaphum', 217, NULL, NULL),
(3533, 'Changwat Chaiyaphum', 217, NULL, NULL),
(3534, 'Chanthaburi', 217, NULL, NULL),
(3535, 'Chiang Mai', 217, NULL, NULL),
(3536, 'Chiang Rai', 217, NULL, NULL),
(3537, 'Chon Buri', 217, NULL, NULL),
(3538, 'Chumphon', 217, NULL, NULL),
(3539, 'Kalasin', 217, NULL, NULL),
(3540, 'Kamphaeng Phet', 217, NULL, NULL),
(3541, 'Kanchanaburi', 217, NULL, NULL),
(3542, 'Khon Kaen', 217, NULL, NULL),
(3543, 'Krabi', 217, NULL, NULL),
(3544, 'Krung Thep', 217, NULL, NULL),
(3545, 'Lampang', 217, NULL, NULL),
(3546, 'Lamphun', 217, NULL, NULL),
(3547, 'Loei', 217, NULL, NULL),
(3548, 'Lop Buri', 217, NULL, NULL),
(3549, 'Mae Hong Son', 217, NULL, NULL),
(3550, 'Maha Sarakham', 217, NULL, NULL),
(3551, 'Mukdahan', 217, NULL, NULL),
(3552, 'Nakhon Nayok', 217, NULL, NULL),
(3553, 'Nakhon Pathom', 217, NULL, NULL),
(3554, 'Nakhon Phanom', 217, NULL, NULL),
(3555, 'Nakhon Ratchasima', 217, NULL, NULL),
(3556, 'Nakhon Sawan', 217, NULL, NULL),
(3557, 'Nakhon Si Thammarat', 217, NULL, NULL),
(3558, 'Nan', 217, NULL, NULL),
(3559, 'Narathiwat', 217, NULL, NULL),
(3560, 'Nong Bua Lam Phu', 217, NULL, NULL),
(3561, 'Nong Khai', 217, NULL, NULL),
(3562, 'Nonthaburi', 217, NULL, NULL),
(3563, 'Pathum Thani', 217, NULL, NULL),
(3564, 'Pattani', 217, NULL, NULL),
(3565, 'Phangnga', 217, NULL, NULL),
(3566, 'Phatthalung', 217, NULL, NULL),
(3567, 'Phayao', 217, NULL, NULL),
(3568, 'Phetchabun', 217, NULL, NULL),
(3569, 'Phetchaburi', 217, NULL, NULL),
(3570, 'Phichit', 217, NULL, NULL),
(3571, 'Phitsanulok', 217, NULL, NULL),
(3572, 'Phra Nakhon Si Ayutthaya', 217, NULL, NULL),
(3573, 'Phrae', 217, NULL, NULL),
(3574, 'Phuket', 217, NULL, NULL),
(3575, 'Prachin Buri', 217, NULL, NULL),
(3576, 'Prachuap Khiri Khan', 217, NULL, NULL),
(3577, 'Ranong', 217, NULL, NULL),
(3578, 'Ratchaburi', 217, NULL, NULL),
(3579, 'Rayong', 217, NULL, NULL),
(3580, 'Roi Et', 217, NULL, NULL),
(3581, 'Sa Kaeo', 217, NULL, NULL),
(3582, 'Sakon Nakhon', 217, NULL, NULL),
(3583, 'Samut Prakan', 217, NULL, NULL),
(3584, 'Samut Sakhon', 217, NULL, NULL),
(3585, 'Samut Songkhran', 217, NULL, NULL),
(3586, 'Saraburi', 217, NULL, NULL),
(3587, 'Satun', 217, NULL, NULL),
(3588, 'Si Sa Ket', 217, NULL, NULL),
(3589, 'Sing Buri', 217, NULL, NULL),
(3590, 'Songkhla', 217, NULL, NULL),
(3591, 'Sukhothai', 217, NULL, NULL),
(3592, 'Suphan Buri', 217, NULL, NULL),
(3593, 'Surat Thani', 217, NULL, NULL),
(3594, 'Surin', 217, NULL, NULL),
(3595, 'Tak', 217, NULL, NULL),
(3596, 'Trang', 217, NULL, NULL),
(3597, 'Trat', 217, NULL, NULL),
(3598, 'Ubon Ratchathani', 217, NULL, NULL),
(3599, 'Udon Thani', 217, NULL, NULL),
(3600, 'Uthai Thani', 217, NULL, NULL),
(3601, 'Uttaradit', 217, NULL, NULL),
(3602, 'Yala', 217, NULL, NULL),
(3603, 'Yasothon', 217, NULL, NULL),
(3604, 'Centre', 218, NULL, NULL),
(3605, 'Kara', 218, NULL, NULL),
(3606, 'Maritime', 218, NULL, NULL),
(3607, 'Plateaux', 218, NULL, NULL),
(3608, 'Savanes', 218, NULL, NULL),
(3609, 'Atafu', 219, NULL, NULL),
(3610, 'Fakaofo', 219, NULL, NULL),
(3611, 'Nukunonu', 219, NULL, NULL),
(3612, 'Eua', 220, NULL, NULL),
(3613, 'Ha\'\'apai', 220, NULL, NULL),
(3614, 'Niuas', 220, NULL, NULL),
(3615, 'Tongatapu', 220, NULL, NULL),
(3616, 'Vava\'\'u', 220, NULL, NULL),
(3617, 'Arima-Tunapuna-Piarco', 221, NULL, NULL),
(3618, 'Caroni', 221, NULL, NULL),
(3619, 'Chaguanas', 221, NULL, NULL),
(3620, 'Couva-Tabaquite-Talparo', 221, NULL, NULL),
(3621, 'Diego Martin', 221, NULL, NULL),
(3622, 'Glencoe', 221, NULL, NULL),
(3623, 'Penal Debe', 221, NULL, NULL),
(3624, 'Point Fortin', 221, NULL, NULL),
(3625, 'Port of Spain', 221, NULL, NULL),
(3626, 'Princes Town', 221, NULL, NULL),
(3627, 'Saint George', 221, NULL, NULL),
(3628, 'San Fernando', 221, NULL, NULL),
(3629, 'San Juan', 221, NULL, NULL),
(3630, 'Sangre Grande', 221, NULL, NULL),
(3631, 'Siparia', 221, NULL, NULL),
(3632, 'Tobago', 221, NULL, NULL),
(3633, 'Aryanah', 222, NULL, NULL),
(3634, 'Bajah', 222, NULL, NULL),
(3635, 'Bin \'\'Arus', 222, NULL, NULL),
(3636, 'Binzart', 222, NULL, NULL),
(3637, 'Gouvernorat de Ariana', 222, NULL, NULL),
(3638, 'Gouvernorat de Nabeul', 222, NULL, NULL),
(3639, 'Gouvernorat de Sousse', 222, NULL, NULL),
(3640, 'Hammamet Yasmine', 222, NULL, NULL),
(3641, 'Jundubah', 222, NULL, NULL),
(3642, 'Madaniyin', 222, NULL, NULL),
(3643, 'Manubah', 222, NULL, NULL),
(3644, 'Monastir', 222, NULL, NULL),
(3645, 'Nabul', 222, NULL, NULL),
(3646, 'Qabis', 222, NULL, NULL),
(3647, 'Qafsah', 222, NULL, NULL),
(3648, 'Qibili', 222, NULL, NULL),
(3649, 'Safaqis', 222, NULL, NULL),
(3650, 'Sfax', 222, NULL, NULL),
(3651, 'Sidi Bu Zayd', 222, NULL, NULL),
(3652, 'Silyanah', 222, NULL, NULL),
(3653, 'Susah', 222, NULL, NULL),
(3654, 'Tatawin', 222, NULL, NULL),
(3655, 'Tawzar', 222, NULL, NULL),
(3656, 'Tunis', 222, NULL, NULL),
(3657, 'Zaghwan', 222, NULL, NULL),
(3658, 'al-Kaf', 222, NULL, NULL),
(3659, 'al-Mahdiyah', 222, NULL, NULL),
(3660, 'al-Munastir', 222, NULL, NULL),
(3661, 'al-Qasrayn', 222, NULL, NULL),
(3662, 'al-Qayrawan', 222, NULL, NULL),
(3663, 'Adana', 223, NULL, NULL),
(3664, 'Adiyaman', 223, NULL, NULL),
(3665, 'Afyon', 223, NULL, NULL),
(3666, 'Agri', 223, NULL, NULL),
(3667, 'Aksaray', 223, NULL, NULL),
(3668, 'Amasya', 223, NULL, NULL),
(3669, 'Ankara', 223, NULL, NULL),
(3670, 'Antalya', 223, NULL, NULL),
(3671, 'Ardahan', 223, NULL, NULL),
(3672, 'Artvin', 223, NULL, NULL),
(3673, 'Aydin', 223, NULL, NULL),
(3674, 'Balikesir', 223, NULL, NULL),
(3675, 'Bartin', 223, NULL, NULL),
(3676, 'Batman', 223, NULL, NULL),
(3677, 'Bayburt', 223, NULL, NULL),
(3678, 'Bilecik', 223, NULL, NULL),
(3679, 'Bingol', 223, NULL, NULL),
(3680, 'Bitlis', 223, NULL, NULL),
(3681, 'Bolu', 223, NULL, NULL),
(3682, 'Burdur', 223, NULL, NULL),
(3683, 'Bursa', 223, NULL, NULL),
(3684, 'Canakkale', 223, NULL, NULL),
(3685, 'Cankiri', 223, NULL, NULL),
(3686, 'Corum', 223, NULL, NULL),
(3687, 'Denizli', 223, NULL, NULL),
(3688, 'Diyarbakir', 223, NULL, NULL),
(3689, 'Duzce', 223, NULL, NULL),
(3690, 'Edirne', 223, NULL, NULL),
(3691, 'Elazig', 223, NULL, NULL),
(3692, 'Erzincan', 223, NULL, NULL),
(3693, 'Erzurum', 223, NULL, NULL),
(3694, 'Eskisehir', 223, NULL, NULL),
(3695, 'Gaziantep', 223, NULL, NULL),
(3696, 'Giresun', 223, NULL, NULL),
(3697, 'Gumushane', 223, NULL, NULL),
(3698, 'Hakkari', 223, NULL, NULL),
(3699, 'Hatay', 223, NULL, NULL),
(3700, 'Icel', 223, NULL, NULL),
(3701, 'Igdir', 223, NULL, NULL),
(3702, 'Isparta', 223, NULL, NULL),
(3703, 'Istanbul', 223, NULL, NULL),
(3704, 'Izmir', 223, NULL, NULL),
(3705, 'Kahramanmaras', 223, NULL, NULL),
(3706, 'Karabuk', 223, NULL, NULL),
(3707, 'Karaman', 223, NULL, NULL),
(3708, 'Kars', 223, NULL, NULL),
(3709, 'Karsiyaka', 223, NULL, NULL),
(3710, 'Kastamonu', 223, NULL, NULL),
(3711, 'Kayseri', 223, NULL, NULL),
(3712, 'Kilis', 223, NULL, NULL),
(3713, 'Kirikkale', 223, NULL, NULL),
(3714, 'Kirklareli', 223, NULL, NULL),
(3715, 'Kirsehir', 223, NULL, NULL),
(3716, 'Kocaeli', 223, NULL, NULL),
(3717, 'Konya', 223, NULL, NULL),
(3718, 'Kutahya', 223, NULL, NULL),
(3719, 'Lefkosa', 223, NULL, NULL),
(3720, 'Malatya', 223, NULL, NULL),
(3721, 'Manisa', 223, NULL, NULL),
(3722, 'Mardin', 223, NULL, NULL),
(3723, 'Mugla', 223, NULL, NULL),
(3724, 'Mus', 223, NULL, NULL),
(3725, 'Nevsehir', 223, NULL, NULL),
(3726, 'Nigde', 223, NULL, NULL),
(3727, 'Ordu', 223, NULL, NULL),
(3728, 'Osmaniye', 223, NULL, NULL),
(3729, 'Rize', 223, NULL, NULL),
(3730, 'Sakarya', 223, NULL, NULL),
(3731, 'Samsun', 223, NULL, NULL),
(3732, 'Sanliurfa', 223, NULL, NULL),
(3733, 'Siirt', 223, NULL, NULL),
(3734, 'Sinop', 223, NULL, NULL),
(3735, 'Sirnak', 223, NULL, NULL),
(3736, 'Sivas', 223, NULL, NULL),
(3737, 'Tekirdag', 223, NULL, NULL),
(3738, 'Tokat', 223, NULL, NULL),
(3739, 'Trabzon', 223, NULL, NULL),
(3740, 'Tunceli', 223, NULL, NULL),
(3741, 'Usak', 223, NULL, NULL),
(3742, 'Van', 223, NULL, NULL),
(3743, 'Yalova', 223, NULL, NULL),
(3744, 'Yozgat', 223, NULL, NULL),
(3745, 'Zonguldak', 223, NULL, NULL),
(3746, 'Ahal', 224, NULL, NULL),
(3747, 'Asgabat', 224, NULL, NULL),
(3748, 'Balkan', 224, NULL, NULL),
(3749, 'Dasoguz', 224, NULL, NULL),
(3750, 'Lebap', 224, NULL, NULL),
(3751, 'Mari', 224, NULL, NULL),
(3752, 'Grand Turk', 225, NULL, NULL),
(3753, 'South Caicos and East Caicos', 225, NULL, NULL),
(3754, 'Funafuti', 226, NULL, NULL),
(3755, 'Nanumanga', 226, NULL, NULL),
(3756, 'Nanumea', 226, NULL, NULL),
(3757, 'Niutao', 226, NULL, NULL),
(3758, 'Nui', 226, NULL, NULL),
(3759, 'Nukufetau', 226, NULL, NULL),
(3760, 'Nukulaelae', 226, NULL, NULL),
(3761, 'Vaitupu', 226, NULL, NULL),
(3762, 'Central', 227, NULL, NULL),
(3763, 'Eastern', 227, NULL, NULL),
(3764, 'Northern', 227, NULL, NULL),
(3765, 'Western', 227, NULL, NULL),
(3766, 'Cherkas\'\'ka', 228, NULL, NULL),
(3767, 'Chernihivs\'\'ka', 228, NULL, NULL),
(3768, 'Chernivets\'\'ka', 228, NULL, NULL),
(3769, 'Crimea', 228, NULL, NULL),
(3770, 'Dnipropetrovska', 228, NULL, NULL),
(3771, 'Donets\'\'ka', 228, NULL, NULL),
(3772, 'Ivano-Frankivs\'\'ka', 228, NULL, NULL),
(3773, 'Kharkiv', 228, NULL, NULL),
(3774, 'Kharkov', 228, NULL, NULL),
(3775, 'Khersonska', 228, NULL, NULL),
(3776, 'Khmel\'\'nyts\'\'ka', 228, NULL, NULL),
(3777, 'Kirovohrad', 228, NULL, NULL),
(3778, 'Krym', 228, NULL, NULL),
(3779, 'Kyyiv', 228, NULL, NULL),
(3780, 'Kyyivs\'\'ka', 228, NULL, NULL),
(3781, 'L\'\'vivs\'\'ka', 228, NULL, NULL),
(3782, 'Luhans\'\'ka', 228, NULL, NULL),
(3783, 'Mykolayivs\'\'ka', 228, NULL, NULL),
(3784, 'Odes\'\'ka', 228, NULL, NULL),
(3785, 'Odessa', 228, NULL, NULL),
(3786, 'Poltavs\'\'ka', 228, NULL, NULL),
(3787, 'Rivnens\'\'ka', 228, NULL, NULL),
(3788, 'Sevastopol', 228, NULL, NULL),
(3789, 'Sums\'\'ka', 228, NULL, NULL),
(3790, 'Ternopil\'\'s\'\'ka', 228, NULL, NULL),
(3791, 'Volyns\'\'ka', 228, NULL, NULL),
(3792, 'Vynnyts\'\'ka', 228, NULL, NULL),
(3793, 'Zakarpats\'\'ka', 228, NULL, NULL),
(3794, 'Zaporizhia', 228, NULL, NULL),
(3795, 'Zhytomyrs\'\'ka', 228, NULL, NULL),
(3796, 'Abu Zabi', 229, NULL, NULL),
(3797, 'Ajman', 229, NULL, NULL),
(3798, 'Dubai', 229, NULL, NULL),
(3799, 'Ras al-Khaymah', 229, NULL, NULL),
(3800, 'Sharjah', 229, NULL, NULL),
(3801, 'Sharjha', 229, NULL, NULL),
(3802, 'Umm al Qaywayn', 229, NULL, NULL),
(3803, 'al-Fujayrah', 229, NULL, NULL),
(3804, 'ash-Shariqah', 229, NULL, NULL),
(3805, 'Aberdeen', 230, NULL, NULL),
(3806, 'Aberdeenshire', 230, NULL, NULL),
(3807, 'Argyll', 230, NULL, NULL),
(3808, 'Armagh', 230, NULL, NULL),
(3809, 'Bedfordshire', 230, NULL, NULL),
(3810, 'Belfast', 230, NULL, NULL),
(3811, 'Berkshire', 230, NULL, NULL),
(3812, 'Birmingham', 230, NULL, NULL),
(3813, 'Brechin', 230, NULL, NULL),
(3814, 'Bridgnorth', 230, NULL, NULL),
(3815, 'Bristol', 230, NULL, NULL),
(3816, 'Buckinghamshire', 230, NULL, NULL),
(3817, 'Cambridge', 230, NULL, NULL),
(3818, 'Cambridgeshire', 230, NULL, NULL),
(3819, 'Channel Islands', 230, NULL, NULL),
(3820, 'Cheshire', 230, NULL, NULL),
(3821, 'Cleveland', 230, NULL, NULL),
(3822, 'Co Fermanagh', 230, NULL, NULL),
(3823, 'Conwy', 230, NULL, NULL),
(3824, 'Cornwall', 230, NULL, NULL),
(3825, 'Coventry', 230, NULL, NULL),
(3826, 'Craven Arms', 230, NULL, NULL),
(3827, 'Cumbria', 230, NULL, NULL),
(3828, 'Denbighshire', 230, NULL, NULL),
(3829, 'Derby', 230, NULL, NULL),
(3830, 'Derbyshire', 230, NULL, NULL),
(3831, 'Devon', 230, NULL, NULL),
(3832, 'Dial Code Dungannon', 230, NULL, NULL),
(3833, 'Didcot', 230, NULL, NULL),
(3834, 'Dorset', 230, NULL, NULL),
(3835, 'Dunbartonshire', 230, NULL, NULL),
(3836, 'Durham', 230, NULL, NULL),
(3837, 'East Dunbartonshire', 230, NULL, NULL),
(3838, 'East Lothian', 230, NULL, NULL),
(3839, 'East Midlands', 230, NULL, NULL),
(3840, 'East Sussex', 230, NULL, NULL),
(3841, 'East Yorkshire', 230, NULL, NULL),
(3842, 'England', 230, NULL, NULL),
(3843, 'Essex', 230, NULL, NULL),
(3844, 'Fermanagh', 230, NULL, NULL),
(3845, 'Fife', 230, NULL, NULL),
(3846, 'Flintshire', 230, NULL, NULL),
(3847, 'Fulham', 230, NULL, NULL),
(3848, 'Gainsborough', 230, NULL, NULL),
(3849, 'Glocestershire', 230, NULL, NULL),
(3850, 'Gwent', 230, NULL, NULL),
(3851, 'Hampshire', 230, NULL, NULL),
(3852, 'Hants', 230, NULL, NULL),
(3853, 'Herefordshire', 230, NULL, NULL),
(3854, 'Hertfordshire', 230, NULL, NULL),
(3855, 'Ireland', 230, NULL, NULL),
(3856, 'Isle Of Man', 230, NULL, NULL),
(3857, 'Isle of Wight', 230, NULL, NULL),
(3858, 'Kenford', 230, NULL, NULL),
(3859, 'Kent', 230, NULL, NULL),
(3860, 'Kilmarnock', 230, NULL, NULL),
(3861, 'Lanarkshire', 230, NULL, NULL),
(3862, 'Lancashire', 230, NULL, NULL),
(3863, 'Leicestershire', 230, NULL, NULL),
(3864, 'Lincolnshire', 230, NULL, NULL),
(3865, 'Llanymynech', 230, NULL, NULL),
(3866, 'London', 230, NULL, NULL),
(3867, 'Ludlow', 230, NULL, NULL),
(3868, 'Manchester', 230, NULL, NULL),
(3869, 'Mayfair', 230, NULL, NULL),
(3870, 'Merseyside', 230, NULL, NULL),
(3871, 'Mid Glamorgan', 230, NULL, NULL),
(3872, 'Middlesex', 230, NULL, NULL),
(3873, 'Mildenhall', 230, NULL, NULL),
(3874, 'Monmouthshire', 230, NULL, NULL),
(3875, 'Newton Stewart', 230, NULL, NULL),
(3876, 'Norfolk', 230, NULL, NULL),
(3877, 'North Humberside', 230, NULL, NULL),
(3878, 'North Yorkshire', 230, NULL, NULL),
(3879, 'Northamptonshire', 230, NULL, NULL),
(3880, 'Northants', 230, NULL, NULL),
(3881, 'Northern Ireland', 230, NULL, NULL),
(3882, 'Northumberland', 230, NULL, NULL),
(3883, 'Nottinghamshire', 230, NULL, NULL),
(3884, 'Oxford', 230, NULL, NULL),
(3885, 'Powys', 230, NULL, NULL),
(3886, 'Roos-shire', 230, NULL, NULL),
(3887, 'SUSSEX', 230, NULL, NULL),
(3888, 'Sark', 230, NULL, NULL),
(3889, 'Scotland', 230, NULL, NULL),
(3890, 'Scottish Borders', 230, NULL, NULL),
(3891, 'Shropshire', 230, NULL, NULL),
(3892, 'Somerset', 230, NULL, NULL),
(3893, 'South Glamorgan', 230, NULL, NULL),
(3894, 'South Wales', 230, NULL, NULL),
(3895, 'South Yorkshire', 230, NULL, NULL),
(3896, 'Southwell', 230, NULL, NULL),
(3897, 'Staffordshire', 230, NULL, NULL),
(3898, 'Strabane', 230, NULL, NULL),
(3899, 'Suffolk', 230, NULL, NULL),
(3900, 'Surrey', 230, NULL, NULL),
(3901, 'Sussex', 230, NULL, NULL),
(3902, 'Twickenham', 230, NULL, NULL),
(3903, 'Tyne and Wear', 230, NULL, NULL),
(3904, 'Tyrone', 230, NULL, NULL),
(3905, 'Utah', 230, NULL, NULL),
(3906, 'Wales', 230, NULL, NULL),
(3907, 'Warwickshire', 230, NULL, NULL),
(3908, 'West Lothian', 230, NULL, NULL),
(3909, 'West Midlands', 230, NULL, NULL),
(3910, 'West Sussex', 230, NULL, NULL),
(3911, 'West Yorkshire', 230, NULL, NULL),
(3912, 'Whissendine', 230, NULL, NULL),
(3913, 'Wiltshire', 230, NULL, NULL),
(3914, 'Wokingham', 230, NULL, NULL),
(3915, 'Worcestershire', 230, NULL, NULL),
(3916, 'Wrexham', 230, NULL, NULL),
(3917, 'Wurttemberg', 230, NULL, NULL),
(3918, 'Yorkshire', 230, NULL, NULL),
(3919, 'Alabama', 231, NULL, NULL),
(3920, 'Alaska', 231, NULL, NULL),
(3921, 'Arizona', 231, NULL, NULL),
(3922, 'Arkansas', 231, NULL, NULL),
(3923, 'Byram', 231, NULL, NULL),
(3924, 'California', 231, NULL, NULL),
(3925, 'Cokato', 231, NULL, NULL),
(3926, 'Colorado', 231, NULL, NULL),
(3927, 'Connecticut', 231, NULL, NULL),
(3928, 'Delaware', 231, NULL, NULL),
(3929, 'District of Columbia', 231, NULL, NULL),
(3930, 'Florida', 231, NULL, NULL),
(3931, 'Georgia', 231, NULL, NULL),
(3932, 'Hawaii', 231, NULL, NULL),
(3933, 'Idaho', 231, NULL, NULL),
(3934, 'Illinois', 231, NULL, NULL),
(3935, 'Indiana', 231, NULL, NULL),
(3936, 'Iowa', 231, NULL, NULL),
(3937, 'Kansas', 231, NULL, NULL),
(3938, 'Kentucky', 231, NULL, NULL),
(3939, 'Louisiana', 231, NULL, NULL),
(3940, 'Lowa', 231, NULL, NULL),
(3941, 'Maine', 231, NULL, NULL),
(3942, 'Maryland', 231, NULL, NULL),
(3943, 'Massachusetts', 231, NULL, NULL),
(3944, 'Medfield', 231, NULL, NULL),
(3945, 'Michigan', 231, NULL, NULL),
(3946, 'Minnesota', 231, NULL, NULL),
(3947, 'Mississippi', 231, NULL, NULL),
(3948, 'Missouri', 231, NULL, NULL),
(3949, 'Montana', 231, NULL, NULL),
(3950, 'Nebraska', 231, NULL, NULL),
(3951, 'Nevada', 231, NULL, NULL),
(3952, 'New Hampshire', 231, NULL, NULL),
(3953, 'New Jersey', 231, NULL, NULL),
(3954, 'New Jersy', 231, NULL, NULL),
(3955, 'New Mexico', 231, NULL, NULL),
(3956, 'New York', 231, NULL, NULL),
(3957, 'North Carolina', 231, NULL, NULL),
(3958, 'North Dakota', 231, NULL, NULL),
(3959, 'Ohio', 231, NULL, NULL),
(3960, 'Oklahoma', 231, NULL, NULL),
(3961, 'Ontario', 231, NULL, NULL),
(3962, 'Oregon', 231, NULL, NULL),
(3963, 'Pennsylvania', 231, NULL, NULL),
(3964, 'Ramey', 231, NULL, NULL),
(3965, 'Rhode Island', 231, NULL, NULL),
(3966, 'South Carolina', 231, NULL, NULL),
(3967, 'South Dakota', 231, NULL, NULL),
(3968, 'Sublimity', 231, NULL, NULL),
(3969, 'Tennessee', 231, NULL, NULL),
(3970, 'Texas', 231, NULL, NULL),
(3971, 'Trimble', 231, NULL, NULL),
(3972, 'Utah', 231, NULL, NULL),
(3973, 'Vermont', 231, NULL, NULL),
(3974, 'Virginia', 231, NULL, NULL),
(3975, 'Washington', 231, NULL, NULL),
(3976, 'West Virginia', 231, NULL, NULL),
(3977, 'Wisconsin', 231, NULL, NULL),
(3978, 'Wyoming', 231, NULL, NULL),
(3979, 'United States Minor Outlying I', 232, NULL, NULL),
(3980, 'Artigas', 233, NULL, NULL),
(3981, 'Canelones', 233, NULL, NULL),
(3982, 'Cerro Largo', 233, NULL, NULL),
(3983, 'Colonia', 233, NULL, NULL),
(3984, 'Durazno', 233, NULL, NULL),
(3985, 'FLorida', 233, NULL, NULL),
(3986, 'Flores', 233, NULL, NULL),
(3987, 'Lavalleja', 233, NULL, NULL),
(3988, 'Maldonado', 233, NULL, NULL),
(3989, 'Montevideo', 233, NULL, NULL),
(3990, 'Paysandu', 233, NULL, NULL),
(3991, 'Rio Negro', 233, NULL, NULL),
(3992, 'Rivera', 233, NULL, NULL),
(3993, 'Rocha', 233, NULL, NULL),
(3994, 'Salto', 233, NULL, NULL),
(3995, 'San Jose', 233, NULL, NULL),
(3996, 'Soriano', 233, NULL, NULL),
(3997, 'Tacuarembo', 233, NULL, NULL),
(3998, 'Treinta y Tres', 233, NULL, NULL),
(3999, 'Andijon', 234, NULL, NULL),
(4000, 'Buhoro', 234, NULL, NULL),
(4001, 'Buxoro Viloyati', 234, NULL, NULL),
(4002, 'Cizah', 234, NULL, NULL),
(4003, 'Fargona', 234, NULL, NULL),
(4004, 'Horazm', 234, NULL, NULL),
(4005, 'Kaskadar', 234, NULL, NULL),
(4006, 'Korakalpogiston', 234, NULL, NULL),
(4007, 'Namangan', 234, NULL, NULL),
(4008, 'Navoi', 234, NULL, NULL),
(4009, 'Samarkand', 234, NULL, NULL),
(4010, 'Sirdare', 234, NULL, NULL),
(4011, 'Surhondar', 234, NULL, NULL),
(4012, 'Toskent', 234, NULL, NULL),
(4013, 'Malampa', 235, NULL, NULL),
(4014, 'Penama', 235, NULL, NULL),
(4015, 'Sanma', 235, NULL, NULL),
(4016, 'Shefa', 235, NULL, NULL),
(4017, 'Tafea', 235, NULL, NULL),
(4018, 'Torba', 235, NULL, NULL),
(4019, 'Vatican City State (Holy See)', 236, NULL, NULL),
(4020, 'Amazonas', 237, NULL, NULL),
(4021, 'Anzoategui', 237, NULL, NULL),
(4022, 'Apure', 237, NULL, NULL),
(4023, 'Aragua', 237, NULL, NULL),
(4024, 'Barinas', 237, NULL, NULL),
(4025, 'Bolivar', 237, NULL, NULL),
(4026, 'Carabobo', 237, NULL, NULL),
(4027, 'Cojedes', 237, NULL, NULL),
(4028, 'Delta Amacuro', 237, NULL, NULL),
(4029, 'Distrito Federal', 237, NULL, NULL),
(4030, 'Falcon', 237, NULL, NULL),
(4031, 'Guarico', 237, NULL, NULL),
(4032, 'Lara', 237, NULL, NULL),
(4033, 'Merida', 237, NULL, NULL),
(4034, 'Miranda', 237, NULL, NULL),
(4035, 'Monagas', 237, NULL, NULL),
(4036, 'Nueva Esparta', 237, NULL, NULL),
(4037, 'Portuguesa', 237, NULL, NULL),
(4038, 'Sucre', 237, NULL, NULL),
(4039, 'Tachira', 237, NULL, NULL),
(4040, 'Trujillo', 237, NULL, NULL),
(4041, 'Vargas', 237, NULL, NULL),
(4042, 'Yaracuy', 237, NULL, NULL),
(4043, 'Zulia', 237, NULL, NULL),
(4044, 'Bac Giang', 238, NULL, NULL),
(4045, 'Binh Dinh', 238, NULL, NULL),
(4046, 'Binh Duong', 238, NULL, NULL),
(4047, 'Da Nang', 238, NULL, NULL),
(4048, 'Dong Bang Song Cuu Long', 238, NULL, NULL),
(4049, 'Dong Bang Song Hong', 238, NULL, NULL),
(4050, 'Dong Nai', 238, NULL, NULL),
(4051, 'Dong Nam Bo', 238, NULL, NULL),
(4052, 'Duyen Hai Mien Trung', 238, NULL, NULL),
(4053, 'Hanoi', 238, NULL, NULL),
(4054, 'Hung Yen', 238, NULL, NULL),
(4055, 'Khu Bon Cu', 238, NULL, NULL),
(4056, 'Long An', 238, NULL, NULL),
(4057, 'Mien Nui Va Trung Du', 238, NULL, NULL),
(4058, 'Thai Nguyen', 238, NULL, NULL),
(4059, 'Thanh Pho Ho Chi Minh', 238, NULL, NULL),
(4060, 'Thu Do Ha Noi', 238, NULL, NULL),
(4061, 'Tinh Can Tho', 238, NULL, NULL),
(4062, 'Tinh Da Nang', 238, NULL, NULL),
(4063, 'Tinh Gia Lai', 238, NULL, NULL),
(4064, 'Anegada', 239, NULL, NULL),
(4065, 'Jost van Dyke', 239, NULL, NULL),
(4066, 'Tortola', 239, NULL, NULL),
(4067, 'Saint Croix', 240, NULL, NULL),
(4068, 'Saint John', 240, NULL, NULL),
(4069, 'Saint Thomas', 240, NULL, NULL),
(4070, 'Alo', 241, NULL, NULL),
(4071, 'Singave', 241, NULL, NULL),
(4072, 'Wallis', 241, NULL, NULL),
(4073, 'Bu Jaydur', 242, NULL, NULL),
(4074, 'Wad-adh-Dhahab', 242, NULL, NULL),
(4075, 'al-\'\'Ayun', 242, NULL, NULL),
(4076, 'as-Samarah', 242, NULL, NULL),
(4077, 'Adan', 243, NULL, NULL),
(4078, 'Abyan', 243, NULL, NULL),
(4079, 'Dhamar', 243, NULL, NULL),
(4080, 'Hadramaut', 243, NULL, NULL),
(4081, 'Hajjah', 243, NULL, NULL),
(4082, 'Hudaydah', 243, NULL, NULL),
(4083, 'Ibb', 243, NULL, NULL),
(4084, 'Lahij', 243, NULL, NULL),
(4085, 'Ma\'\'rib', 243, NULL, NULL),
(4086, 'Madinat San\'\'a', 243, NULL, NULL),
(4087, 'Sa\'\'dah', 243, NULL, NULL),
(4088, 'Sana', 243, NULL, NULL),
(4089, 'Shabwah', 243, NULL, NULL),
(4090, 'Ta\'\'izz', 243, NULL, NULL),
(4091, 'al-Bayda', 243, NULL, NULL),
(4092, 'al-Hudaydah', 243, NULL, NULL),
(4093, 'al-Jawf', 243, NULL, NULL),
(4094, 'al-Mahrah', 243, NULL, NULL),
(4095, 'al-Mahwit', 243, NULL, NULL),
(4096, 'Central Serbia', 244, NULL, NULL),
(4097, 'Kosovo and Metohija', 244, NULL, NULL),
(4098, 'Montenegro', 244, NULL, NULL),
(4099, 'Republic of Serbia', 244, NULL, NULL),
(4100, 'Serbia', 244, NULL, NULL),
(4101, 'Vojvodina', 244, NULL, NULL),
(4102, 'Central', 245, NULL, NULL),
(4103, 'Copperbelt', 245, NULL, NULL),
(4104, 'Eastern', 245, NULL, NULL),
(4105, 'Luapala', 245, NULL, NULL),
(4106, 'Lusaka', 245, NULL, NULL),
(4107, 'North-Western', 245, NULL, NULL),
(4108, 'Northern', 245, NULL, NULL),
(4109, 'Southern', 245, NULL, NULL),
(4110, 'Western', 245, NULL, NULL),
(4111, 'Bulawayo', 246, NULL, NULL),
(4112, 'Harare', 246, NULL, NULL),
(4113, 'Manicaland', 246, NULL, NULL),
(4114, 'Mashonaland Central', 246, NULL, NULL),
(4115, 'Mashonaland East', 246, NULL, NULL),
(4116, 'Mashonaland West', 246, NULL, NULL),
(4117, 'Masvingo', 246, NULL, NULL),
(4118, 'Matabeleland North', 246, NULL, NULL),
(4119, 'Matabeleland South', 246, NULL, NULL),
(4120, 'Midlands', 246, NULL, NULL),
(4121, 'Lienchiang County', 214, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `email`, `phone`, `country`, `city`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Common', 'suplier@gmail.com', '0711111111', 'sri lanka', 'no city', 'No add', '2025-05-08 20:23:57', '2025-05-08 20:23:57');

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `from_warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `to_warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate` double DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `shipping` double DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `reference_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_items`
--

CREATE TABLE `transfer_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transfer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_price` double DEFAULT NULL,
  `net_unit_price` double DEFAULT NULL,
  `tax_type` int(11) NOT NULL,
  `tax_value` double DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `discount_type` int(11) NOT NULL,
  `discount_value` double DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `base_unit` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `short_name`, `base_unit`, `created_at`, `updated_at`) VALUES
(1, 'count', 'count', 1, '2025-05-08 20:15:02', '2025-05-08 20:15:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `language` varchar(255) NOT NULL DEFAULT 'en'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`, `language`) VALUES
(1, 'Lalith', 'center', 'lalith@gmail.com', '0712071066', '2023-11-03 23:52:45', '$2y$10$7wFp3nL4Uml7s8OIEfYQjOcxfsr7fJe2Rzl9cwg6X8EI1C3e/MbCG', NULL, '2023-11-03 23:52:45', '2025-05-08 21:11:50', 1, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_products`
--

CREATE TABLE `variation_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `main_product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` bigint(20) UNSIGNED NOT NULL,
  `variation_type_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_types`
--

CREATE TABLE `variation_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `phone`, `country`, `city`, `email`, `zip_code`, `created_at`, `updated_at`) VALUES
(1, 'warehouse', '123456789', 'sri lanka', 'Kanthale', 'warehouse@gmail.com', '12345', '2023-11-03 23:52:46', '2025-05-08 23:39:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustments_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `adjustment_items`
--
ALTER TABLE `adjustment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustment_items_adjustment_id_foreign` (`adjustment_id`),
  ADD KEY `adjustment_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `base_units`
--
ALTER TABLE `base_units`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `base_units_name_unique` (`name`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_name_unique` (`name`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `countries_name_unique` (`name`),
  ADD UNIQUE KEY `countries_short_code_unique` (`short_code`);

--
-- Indexes for table `coupon_codes`
--
ALTER TABLE `coupon_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupon_codes_code_unique` (`code`);

--
-- Indexes for table `coupon_product`
--
ALTER TABLE `coupon_product`
  ADD KEY `coupon_product_coupon_code_id_foreign` (`coupon_code_id`),
  ADD KEY `coupon_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currencies_name_unique` (`name`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `expenses_expense_category_id_foreign` (`expense_category_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `holds`
--
ALTER TABLE `holds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `holds_customer_id_foreign` (`customer_id`),
  ADD KEY `holds_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `hold_items`
--
ALTER TABLE `hold_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hold_items_hold_id_foreign` (`hold_id`),
  ADD KEY `hold_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_iso_code_unique` (`iso_code`);

--
-- Indexes for table `mail_templates`
--
ALTER TABLE `mail_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_products`
--
ALTER TABLE `main_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manage_stocks`
--
ALTER TABLE `manage_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manage_stocks_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `manage_stocks_product_id_foreign` (`product_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pos_register`
--
ALTER TABLE `pos_register`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pos_register_user_id_foreign` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_code_unique` (`code`),
  ADD KEY `products_product_category_id_foreign` (`product_category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_main_product_id_foreign` (`main_product_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_categories_name_unique` (`name`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_supplier_id_foreign` (`supplier_id`),
  ADD KEY `purchases_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `purchases_return`
--
ALTER TABLE `purchases_return`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_return_supplier_id_foreign` (`supplier_id`),
  ADD KEY `purchases_return_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `purchases_return_items`
--
ALTER TABLE `purchases_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_return_items_purchase_return_id_foreign` (`purchase_return_id`),
  ADD KEY `purchases_return_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_items_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotations_customer_id_foreign` (`customer_id`),
  ADD KEY `quotations_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `quotation_items`
--
ALTER TABLE `quotation_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_items_quotation_id_foreign` (`quotation_id`),
  ADD KEY `quotation_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_customer_id_foreign` (`customer_id`),
  ADD KEY `sales_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `sales_user_id_foreign` (`user_id`);

--
-- Indexes for table `sales_payments`
--
ALTER TABLE `sales_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_payments_sale_id_foreign` (`sale_id`);

--
-- Indexes for table `sales_return`
--
ALTER TABLE `sales_return`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_return_customer_id_foreign` (`customer_id`),
  ADD KEY `sales_return_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `sales_return_sale_id_foreign` (`sale_id`);

--
-- Indexes for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_items_sale_id_foreign` (`sale_id`),
  ADD KEY `sale_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `sale_return_items`
--
ALTER TABLE `sale_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_return_items_sale_return_id_foreign` (`sale_return_id`),
  ADD KEY `sale_return_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_settings`
--
ALTER TABLE `sms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `states_country_id_foreign` (`country_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suppliers_email_unique` (`email`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfers_from_warehouse_id_foreign` (`from_warehouse_id`),
  ADD KEY `transfers_to_warehouse_id_foreign` (`to_warehouse_id`);

--
-- Indexes for table `transfer_items`
--
ALTER TABLE `transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_items_transfer_id_foreign` (`transfer_id`),
  ADD KEY `transfer_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `units_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `variations_name_unique` (`name`);

--
-- Indexes for table `variation_products`
--
ALTER TABLE `variation_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_products_product_id_foreign` (`product_id`),
  ADD KEY `variation_products_variation_id_foreign` (`variation_id`),
  ADD KEY `variation_products_variation_type_id_foreign` (`variation_type_id`),
  ADD KEY `variation_products_main_product_id_foreign` (`main_product_id`);

--
-- Indexes for table `variation_types`
--
ALTER TABLE `variation_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_types_variation_id_foreign` (`variation_id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `warehouses_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adjustment_items`
--
ALTER TABLE `adjustment_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_units`
--
ALTER TABLE `base_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `coupon_codes`
--
ALTER TABLE `coupon_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holds`
--
ALTER TABLE `holds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hold_items`
--
ALTER TABLE `hold_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `mail_templates`
--
ALTER TABLE `mail_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `main_products`
--
ALTER TABLE `main_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `manage_stocks`
--
ALTER TABLE `manage_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pos_register`
--
ALTER TABLE `pos_register`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchases_return`
--
ALTER TABLE `purchases_return`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases_return_items`
--
ALTER TABLE `purchases_return_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_items`
--
ALTER TABLE `quotation_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales_payments`
--
ALTER TABLE `sales_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales_return`
--
ALTER TABLE `sales_return`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sale_return_items`
--
ALTER TABLE `sale_return_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `sms_settings`
--
ALTER TABLE `sms_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4122;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfer_items`
--
ALTER TABLE `transfer_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_products`
--
ALTER TABLE `variation_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_types`
--
ALTER TABLE `variation_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD CONSTRAINT `adjustments_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `adjustment_items`
--
ALTER TABLE `adjustment_items`
  ADD CONSTRAINT `adjustment_items_adjustment_id_foreign` FOREIGN KEY (`adjustment_id`) REFERENCES `adjustments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `adjustment_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coupon_product`
--
ALTER TABLE `coupon_product`
  ADD CONSTRAINT `coupon_product_coupon_code_id_foreign` FOREIGN KEY (`coupon_code_id`) REFERENCES `coupon_codes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `coupon_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `holds`
--
ALTER TABLE `holds`
  ADD CONSTRAINT `holds_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `holds_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hold_items`
--
ALTER TABLE `hold_items`
  ADD CONSTRAINT `hold_items_hold_id_foreign` FOREIGN KEY (`hold_id`) REFERENCES `holds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hold_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `manage_stocks`
--
ALTER TABLE `manage_stocks`
  ADD CONSTRAINT `manage_stocks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `manage_stocks_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pos_register`
--
ALTER TABLE `pos_register`
  ADD CONSTRAINT `pos_register_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_main_product_id_foreign` FOREIGN KEY (`main_product_id`) REFERENCES `main_products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_product_category_id_foreign` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchases_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchases_return`
--
ALTER TABLE `purchases_return`
  ADD CONSTRAINT `purchases_return_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchases_return_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchases_return_items`
--
ALTER TABLE `purchases_return_items`
  ADD CONSTRAINT `purchases_return_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchases_return_items_purchase_return_id_foreign` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchases_return` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD CONSTRAINT `purchase_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_items_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quotations`
--
ALTER TABLE `quotations`
  ADD CONSTRAINT `quotations_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quotations_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quotation_items`
--
ALTER TABLE `quotation_items`
  ADD CONSTRAINT `quotation_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quotation_items_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_payments`
--
ALTER TABLE `sales_payments`
  ADD CONSTRAINT `sales_payments_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_return`
--
ALTER TABLE `sales_return`
  ADD CONSTRAINT `sales_return_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_return_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_return_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD CONSTRAINT `sale_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sale_items_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sale_return_items`
--
ALTER TABLE `sale_return_items`
  ADD CONSTRAINT `sale_return_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sale_return_items_sale_return_id_foreign` FOREIGN KEY (`sale_return_id`) REFERENCES `sales_return` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `transfers_from_warehouse_id_foreign` FOREIGN KEY (`from_warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transfers_to_warehouse_id_foreign` FOREIGN KEY (`to_warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transfer_items`
--
ALTER TABLE `transfer_items`
  ADD CONSTRAINT `transfer_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transfer_items_transfer_id_foreign` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `variation_products`
--
ALTER TABLE `variation_products`
  ADD CONSTRAINT `variation_products_main_product_id_foreign` FOREIGN KEY (`main_product_id`) REFERENCES `main_products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variation_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variation_products_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variation_products_variation_type_id_foreign` FOREIGN KEY (`variation_type_id`) REFERENCES `variation_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_types`
--
ALTER TABLE `variation_types`
  ADD CONSTRAINT `variation_types_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
