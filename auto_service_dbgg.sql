-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2025 at 04:24 PM
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
-- Database: `auto_service_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `scheduled_date` date DEFAULT NULL,
  `scheduled_time` time DEFAULT NULL,
  `status` enum('pending','confirmed','in_progress','completed','cancelled','declined') DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `bay_id` int(11) DEFAULT NULL,
  `mechanic_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `user_id`, `vehicle_id`, `service_id`, `scheduled_date`, `scheduled_time`, `status`, `notes`, `created_at`, `bay_id`, `mechanic_id`) VALUES
(4, 12, 4, 1, '2025-05-14', '13:39:00', 'in_progress', 'Can you accept this? and call me back', '2025-05-08 12:39:38', NULL, NULL),
(7, 11, 7, 1, '2025-05-10', '13:29:00', 'in_progress', 'call me!', '2025-05-08 14:29:27', 1, 10),
(9, 13, 9, 2, '2025-05-21', '10:19:00', 'in_progress', 'Call if Available', '2025-05-09 08:20:12', 1, 10),
(10, 13, 10, 1, '2025-05-22', '13:17:00', 'in_progress', '', '2025-05-09 09:17:12', 3, 10),
(11, 13, 11, 1, '2025-05-12', '13:24:00', 'in_progress', 'Blue', '2025-05-09 09:24:29', 4, 10),
(12, 13, 11, 1, '2025-05-12', '13:24:00', 'declined', 'Blue', '2025-05-09 09:25:15', NULL, NULL),
(13, 13, 12, 1, '2025-05-26', '10:25:00', 'in_progress', '', '2025-05-09 09:25:45', 5, 10),
(14, 13, 13, 1, '2025-05-14', '11:11:00', 'declined', 'RED', '2025-05-09 10:11:07', NULL, NULL),
(15, 14, 14, 1, '2025-05-26', '11:11:00', 'in_progress', '', '2025-05-11 12:12:00', 6, 10),
(16, 15, 15, 1, '2025-05-19', '10:56:00', 'completed', '', '2025-05-12 09:56:24', 7, 10),
(17, 15, 16, 2, '2025-05-13', '16:59:00', 'in_progress', '', '2025-05-12 09:59:52', 8, 10),
(18, 15, 17, 1, '2025-05-22', '14:00:00', 'completed', '', '2025-05-12 10:00:10', 15, 10),
(19, 15, 18, 1, '2025-05-13', '09:46:00', '', '', '2025-05-12 11:46:17', 15, 10),
(20, 15, 19, 3, '2025-05-16', '13:21:00', '', 'change rubber also ', '2025-05-12 12:21:27', 14, 10),
(21, 15, 20, 3, '2025-05-28', '14:07:00', '', 'with small rubber ', '2025-05-13 13:07:42', 9, 10),
(22, 15, 21, 1, '2025-05-19', '10:32:00', 'completed', 'RED with rubber', '2025-05-18 11:32:24', 9, 10),
(23, 15, 22, 1, '2025-05-28', '11:32:00', 'completed', '', '2025-05-18 11:32:46', 11, 10),
(24, 15, 23, 1, '2025-05-28', '13:41:00', 'in_progress', '', '2025-05-18 12:41:06', 10, 10),
(25, 15, 23, 1, '2025-05-21', '14:20:00', 'completed', '', '2025-05-18 13:20:11', 12, 10),
(26, 15, 23, 1, '2025-05-21', '14:20:00', '', '', '2025-05-18 13:20:57', 13, 10),
(29, 17, 26, 2, '2025-07-04', '10:36:00', 'completed', 'paayos', '2025-07-03 07:34:59', 14, 10),
(30, 17, 27, 2, '2025-07-10', '09:54:00', 'pending', 'MAAGA?', '2025-07-03 08:53:51', NULL, NULL),
(31, 18, 28, 1, '2025-07-04', '10:56:00', 'pending', '1056AM - car', '2025-07-03 08:55:25', NULL, NULL),
(32, 35, 29, 5, '2025-08-14', '12:11:00', 'completed', '2026 BMW 4er-Reihe M440i xDrive Gran Coupé A', '2025-08-13 03:10:53', 14, 10),
(33, 35, 30, 3, '2025-08-14', '14:01:00', 'completed', 'test for lock', '2025-08-13 03:59:56', 14, 10),
(34, 35, 31, NULL, '2025-08-15', '15:40:00', 'cancelled', 'booking', '2025-08-13 06:41:07', NULL, NULL),
(35, 35, 32, NULL, '2025-08-14', '10:44:00', 'cancelled', 'booker', '2025-08-13 06:45:16', NULL, NULL),
(36, 35, 33, NULL, '2025-08-21', '14:48:00', 'cancelled', 'test if working', '2025-08-13 06:48:44', NULL, NULL),
(37, 35, 34, NULL, '2025-08-13', '14:49:00', 'cancelled', 'eeerr', '2025-08-13 06:49:13', NULL, NULL),
(38, 35, 35, NULL, '2025-08-13', '14:51:00', 'cancelled', 'rerer', '2025-08-13 06:51:12', NULL, NULL),
(39, 35, 32, NULL, '2025-08-14', '15:01:00', 'cancelled', 'dffd', '2025-08-13 07:01:46', NULL, NULL),
(40, 35, 29, NULL, '2025-08-14', '15:03:00', 'pending', '', '2025-08-13 07:03:43', NULL, NULL),
(41, 35, 29, NULL, '2025-08-13', '15:09:00', 'pending', 'hello', '2025-08-13 07:09:20', NULL, NULL),
(42, 35, 30, 1, '2025-08-13', '15:12:00', 'pending', 'fggff', '2025-08-13 07:12:43', NULL, NULL),
(43, 35, 30, 1, '2025-08-14', '15:18:00', 'pending', '5656', '2025-08-13 07:17:46', NULL, NULL),
(44, 35, 36, 1, '2025-08-14', '10:25:00', 'pending', 'TEST OLD CODE', '2025-08-13 07:25:54', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `appointments_availability`
--

CREATE TABLE `appointments_availability` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `is_available` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointment_availability`
--

CREATE TABLE `appointment_availability` (
  `id` int(11) NOT NULL,
  `available_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointment_services`
--

CREATE TABLE `appointment_services` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment_services`
--

INSERT INTO `appointment_services` (`id`, `appointment_id`, `service_id`) VALUES
(0, 34, 1),
(1, 42, 1),
(2, 42, 2),
(3, 49, 1),
(4, 49, 2),
(5, 50, 1),
(6, 50, 2),
(7, 51, 3),
(8, 51, 4),
(9, 52, 1),
(10, 52, 5),
(11, 53, 1),
(12, 53, 2),
(13, 53, 3),
(14, 53, 4),
(15, 53, 5),
(16, 54, 1),
(17, 54, 2),
(18, 54, 3),
(19, 54, 4),
(20, 54, 5),
(21, 55, 1),
(22, 55, 2),
(23, 55, 3),
(24, 55, 4),
(25, 55, 5),
(26, 56, 1),
(27, 56, 2),
(28, 56, 3),
(29, 56, 4),
(30, 56, 5),
(31, 57, 1),
(32, 57, 2),
(33, 57, 3),
(34, 57, 4),
(35, 58, 1),
(36, 58, 3),
(37, 58, 4),
(38, 58, 5),
(39, 59, 1),
(40, 59, 3),
(41, 59, 4),
(42, 59, 5),
(43, 60, 1),
(44, 60, 3),
(45, 60, 4),
(46, 60, 5),
(47, 61, 1),
(48, 61, 2),
(49, 61, 3),
(50, 61, 5),
(51, 62, 1),
(52, 62, 2),
(53, 62, 3),
(54, 62, 5),
(55, 63, 1),
(56, 63, 2),
(57, 64, 1),
(58, 64, 2),
(59, 65, 1),
(60, 65, 2),
(61, 65, 3),
(62, 65, 4),
(63, 65, 5),
(64, 66, 1),
(65, 66, 2),
(66, 66, 3),
(67, 66, 4),
(68, 66, 5),
(69, 67, 1),
(70, 67, 2),
(71, 67, 3),
(72, 67, 4),
(73, 67, 5),
(74, 68, 1),
(75, 68, 2),
(76, 68, 3),
(77, 68, 4),
(78, 68, 5),
(79, 69, 4),
(80, 69, 5),
(81, 70, 1),
(82, 70, 5),
(83, 71, 1),
(84, 71, 2),
(85, 71, 3),
(86, 71, 5),
(87, 72, 1),
(88, 73, 2);

-- --------------------------------------------------------

--
-- Table structure for table `bays`
--

CREATE TABLE `bays` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bays`
--

INSERT INTO `bays` (`id`, `name`, `status`) VALUES
(1, 'Bay 1', 'Under Maintenance'),
(2, 'Bay 2', 'Not Available'),
(3, 'Bay 3', 'Not Available'),
(4, 'Bay 4', 'Not Available'),
(5, 'Bay 5', 'Not Available'),
(6, 'Bay 6', 'Not Available'),
(7, 'Bay 7', 'available'),
(8, 'Bay 8', 'Not Available'),
(9, 'Bay 9', 'available'),
(10, 'Bay 10', 'Not Available'),
(11, 'Bay 11', 'available'),
(12, 'Bay 12', 'Available'),
(13, 'Bay 13', 'Not Available'),
(14, 'Bay 14', 'Available'),
(15, 'Bay 15', 'available');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `category` enum('non-moving','slow-moving','fast-moving') DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `reorder_threshold` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `item_name`, `category`, `quantity`, `reorder_threshold`, `price`) VALUES
(1, 'Coolant', NULL, 180, NULL, 250.00),
(2, 'Rubber (Small)', NULL, 84, NULL, 50.00),
(3, 'Rubber (Big)', NULL, 99, NULL, 80.00),
(4, 'Radiator Cooler', NULL, 99, NULL, 300.00),
(5, 'Tire Sealer', NULL, 99, NULL, 250.00),
(6, 'Mitasu MJ212 CI-4 5W-40 Ultra Diesel Oil', NULL, 44, NULL, 818.94),
(7, 'Auto Paintless Dent Repair Kits Car Dent Puller Car Body Dent Removal Tool', NULL, 25, NULL, 1787.00);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_log`
--

CREATE TABLE `inventory_log` (
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `job_order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `quantity_used` int(11) DEFAULT NULL,
  `action` enum('add','withdraw') DEFAULT NULL,
  `log_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_orders`
--

CREATE TABLE `job_orders` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `mechanic_id` int(11) DEFAULT NULL,
  `diagnosis` text DEFAULT NULL,
  `status` enum('assigned','in_progress','completed') DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_orders`
--

INSERT INTO `job_orders` (`id`, `appointment_id`, `mechanic_id`, `diagnosis`, `status`, `image_path`) VALUES
(1, 4, 9, 'Checked', 'completed', 'uploads/1746710426_download.jfif'),
(2, 4, 9, 'Done Car Wash', '', 'uploads/1746711168_download.jfif'),
(3, 4, 9, 'Done Car Wash', '', 'uploads/1746711361_download.jfif'),
(4, 4, 9, 'Done Car Wash', '', 'uploads/1746714489_download.jfif'),
(5, 7, 9, 'Car wash only', '', NULL),
(6, 9, 9, 'Car Wash only', 'completed', NULL),
(7, 10, 9, 'Car Wash Done', '', NULL),
(8, 11, 9, 'Carwash Done!', 'completed', NULL),
(9, 15, 5, 'Car Wash', 'completed', NULL),
(10, 16, 9, 'CarWash Only', 'completed', NULL),
(11, 17, 9, 'Car wash only', '', NULL),
(12, 19, 9, 'Car Wash', '', NULL),
(13, 18, 9, '4 Wheels will need  to change', 'completed', NULL),
(14, 20, 9, 'Tire change add coolant also and rubber 4 big', '', NULL),
(15, 21, 9, 'tire change 2 front', '', NULL),
(16, 22, 9, 'Car wash with Rubber', 'completed', NULL),
(17, 13, 9, 'testing', '', NULL),
(18, 24, 9, 'Car wash', '', NULL),
(19, 23, 9, 'check', 'completed', NULL),
(20, 25, 9, 'chck', 'completed', NULL),
(21, 26, 9, 'p', '', NULL),
(22, 29, 9, 'tumutunog yung aircon HAHA', 'completed', 'uploads/1751528186_Labrador_Retriever_portrait.jpg'),
(23, 32, 9, 'Need to fix tires too.', 'completed', NULL),
(24, 33, 9, 'earl test JO', 'completed', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` text DEFAULT NULL,
  `log_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `action`, `log_time`, `ip_address`, `user_agent`) VALUES
(1, 9, 'User \'staff4\' logged out.', '2025-07-06 02:31:12', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36'),
(2, 9, 'User \'staff4\' logged in.', '2025-07-06 02:31:14', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36'),
(3, 9, 'User \'staff4\' logged in.', '2025-07-06 02:35:26', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36'),
(4, 9, 'User \'staff4\' logged out.', '2025-07-06 02:37:14', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36'),
(5, 2, 'User \'admin1\' logged in.', '2025-07-06 02:39:18', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36'),
(6, 2, 'User \'admin1\' logged out.', '2025-07-06 02:39:58', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36'),
(7, NULL, 'Failed login attempt for username \'gilbert0703\'.', '2025-07-06 02:40:23', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36'),
(8, NULL, 'Failed login attempt for username \'zz123\'.', '2025-07-06 02:55:48', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36'),
(9, NULL, 'Failed login attempt for username \'zx123\'.', '2025-07-06 02:55:54', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36'),
(10, NULL, 'Failed login attempt for username \'xzx123\'.', '2025-07-06 02:56:17', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36'),
(11, NULL, 'Failed login attempt for username \'xzx123\'.', '2025-07-06 02:56:26', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36'),
(12, NULL, 'Failed login attempt for username \'gilbert0703\'.', '2025-07-06 02:56:38', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36'),
(13, 9, 'User \'staff4\' logged in.', '2025-07-06 03:06:45', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36'),
(14, NULL, 'Failed login attempt for username \'earlG\'.', '2025-07-11 13:48:47', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(15, 9, 'User \'staff4\' logged in.', '2025-07-11 13:48:57', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(16, 9, 'User \'staff4\' logged out.', '2025-07-11 13:50:22', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(17, 25, 'User \'david\' logged in.', '2025-07-11 14:26:55', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(18, 25, 'User \'david\' logged out.', '2025-07-11 14:27:01', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(19, 26, 'User \'leb23\' logged in.', '2025-07-11 14:30:09', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(20, 27, 'User \'rq17\' logged in.', '2025-07-11 14:34:56', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(21, 27, 'User \'rq17\' logged out.', '2025-07-11 14:35:03', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(22, 2, 'Login blocked - unverified email for \'admin1\'.', '2025-07-12 04:43:20', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(23, 2, 'Login blocked - unverified email for \'admin1\'.', '2025-07-12 04:45:08', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(24, NULL, 'Failed login attempt for username \'rq17\'.', '2025-07-12 04:45:31', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(25, 26, 'User \'leb23\' logged in.', '2025-07-12 04:46:50', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(26, 26, 'User \'leb23\' logged out.', '2025-07-12 05:03:23', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(27, 26, 'User \'leb23\' logged in.', '2025-07-12 05:03:44', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(28, 26, 'User \'leb23\' logged out.', '2025-07-12 05:04:37', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(29, 26, 'User \'leb23\' logged in.', '2025-07-12 05:23:56', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(30, 26, 'User \'leb23\' logged out.', '2025-07-12 05:36:15', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(31, 26, 'User \'leb23\' logged in.', '2025-07-12 05:36:29', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(32, 26, 'User \'leb23\' logged in.', '2025-07-12 06:17:29', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(33, 26, 'User \'leb23\' logged out.', '2025-07-12 06:17:32', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(34, 26, 'User \'leb23\' logged in.', '2025-07-12 06:18:58', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(35, 26, 'User \'leb23\' logged in.', '2025-07-21 01:27:17', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(36, 26, 'User \'leb23\' logged out.', '2025-07-21 01:27:25', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(40, 26, 'User \'leb23\' logged in.', '2025-07-21 02:01:33', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(41, 26, 'User \'leb23\' logged out.', '2025-07-21 02:06:55', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(42, 9, 'User \'staff4\' logged in.', '2025-07-21 02:07:40', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(55, 9, 'User \'staff4\' logged out.', '2025-07-21 02:27:03', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(56, 9, 'User \'staff4\' logged in.', '2025-07-21 02:27:53', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(57, 9, 'User \'staff4\' logged out.', '2025-07-21 02:28:01', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(58, 26, 'User \'leb23\' logged in.', '2025-07-21 02:28:06', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(59, NULL, 'Failed login attempt for username \'neilKCS\'.', '2025-07-21 02:29:46', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(60, NULL, 'Failed login attempt for username \'acuna.neil22@gmail.com\'.', '2025-07-21 02:32:59', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(61, 29, 'User \'nj44\' logged in.', '2025-07-21 02:33:20', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(62, 29, 'User \'nj44\' logged out.', '2025-07-21 02:34:21', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(63, NULL, 'Failed login attempt for username \'nj44\'.', '2025-07-21 02:34:23', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(64, 29, 'User \'nj44\' logged in.', '2025-07-21 02:34:27', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(65, 29, 'User \'nj44\' logged out.', '2025-07-21 02:36:50', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(66, NULL, 'Failed login attempt for username \'nj44\'.', '2025-07-21 02:37:29', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(67, 29, 'User \'nj44\' logged in.', '2025-07-21 02:37:38', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(68, 26, 'User \'leb23\' logged out.', '2025-07-21 02:39:21', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(69, 9, 'User \'staff4\' logged in.', '2025-07-21 02:39:26', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(70, 29, 'User \'nj44\' logged out.', '2025-07-21 02:41:38', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(71, 29, 'User \'nj44\' logged in.', '2025-07-21 02:41:42', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(72, 29, 'User \'nj44\' logged out.', '2025-07-21 02:42:42', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(73, NULL, 'Failed login attempt for username \'acuna.neil22@gmail.com\'.', '2025-07-21 02:42:44', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(74, 29, 'User \'nj44\' logged in.', '2025-07-21 02:42:53', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(75, 2, 'User \'admin1\' logged in.', '2025-07-21 05:33:06', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(76, 2, 'User \'admin1\' logged in.', '2025-07-21 05:34:20', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(77, 2, 'User \'admin1\' logged in.', '2025-07-21 05:37:11', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(78, 2, 'User \'admin1\' logged in.', '2025-07-21 05:40:20', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(79, 2, 'User \'admin1\' logged out.', '2025-07-21 05:51:26', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(80, 2, 'User \'admin1\' logged in.', '2025-07-21 05:51:33', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(81, 2, 'User \'admin1\' logged out.', '2025-07-21 06:01:22', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(82, 2, 'User \'admin1\' logged in.', '2025-07-21 06:01:29', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(83, 2, 'User \'admin1\' logged in.', '2025-07-21 06:02:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0'),
(84, 2, 'User \'admin1\' logged in.', '2025-07-21 06:04:06', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(85, 9, 'User \'staff4\' logged in.', '2025-07-21 06:09:36', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(86, 9, 'User \'staff4\' logged out.', '2025-07-21 06:10:29', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(87, 16, 'User \'inventory\' logged in.', '2025-07-21 06:10:35', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(88, 16, 'User \'inventory\' logged out.', '2025-07-21 06:10:48', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(89, 2, 'User \'admin1\' logged in.', '2025-07-21 06:10:55', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(90, 2, 'User \'admin1\' logged out.', '2025-07-21 06:11:08', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(91, 9, 'User \'staff4\' logged in.', '2025-07-21 06:11:14', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(92, 9, 'User \'staff4\' logged out.', '2025-07-21 06:15:22', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(93, 2, 'User \'admin1\' logged in.', '2025-07-21 06:15:29', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(94, 2, 'User \'admin1\' logged out.', '2025-07-21 06:15:41', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(95, 16, 'User \'inventory\' logged in.', '2025-07-21 06:15:47', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(96, 16, 'User \'inventory\' logged out.', '2025-07-21 06:16:17', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(101, 2, 'User \'admin1\' logged in.', '2025-07-21 06:19:45', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(102, 2, 'User \'admin1\' logged out.', '2025-07-21 06:33:21', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(103, 17, 'Login blocked - unverified email for \'gilbert0703\'.', '2025-07-21 09:08:30', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(104, NULL, 'Failed login attempt for username \'jest\'.', '2025-07-21 15:40:13', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(105, NULL, 'Failed login attempt for username \'jest\'.', '2025-07-21 15:40:26', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(108, 9, 'User \'staff4\' logged in.', '2025-07-23 07:22:45', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(109, NULL, 'Failed login attempt for username \'admin\'.', '2025-07-23 07:22:55', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(110, 2, 'User \'admin1\' logged in.', '2025-07-23 07:23:05', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(111, 2, 'User \'admin1\' logged in.', '2025-07-23 07:23:35', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(112, 2, 'User \'admin1\' logged in.', '2025-07-23 07:50:52', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(113, 2, 'User \'admin1\' logged out.', '2025-07-23 07:50:59', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(114, 2, 'Failed OTP verification attempt.', '2025-07-23 08:01:59', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(115, 2, 'User \'admin1\' completed OTP verification.', '2025-07-23 08:40:48', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(116, 2, 'User \'admin1\' logged out.', '2025-07-23 08:40:52', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(117, 2, 'User \'admin1\' completed OTP verification.', '2025-07-23 08:43:06', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(118, 2, 'User \'admin1\' logged out.', '2025-07-23 08:43:10', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(119, 35, 'User \'mm\' logged in.', '2025-07-23 08:55:59', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(120, 2, 'User \'admin1\' logged in.', '2025-07-25 02:02:57', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(121, 2, 'User \'admin1\' logged out.', '2025-07-25 02:03:13', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(122, 9, 'User \'staff4\' logged in.', '2025-07-25 02:05:26', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(123, 9, 'User \'staff4\' logged out.', '2025-07-25 02:09:50', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(124, NULL, 'Failed login attempt for username \'MM\'.', '2025-07-25 02:10:25', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(125, 35, 'User \'MM\' logged in.', '2025-07-25 02:10:34', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(126, 35, 'User \'MM\' logged out.', '2025-07-25 02:37:36', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(127, 35, 'User \'MM\' logged in.', '2025-07-25 02:37:46', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(128, NULL, 'Failed login attempt for username \'MM\'.', '2025-07-25 02:47:59', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(129, 35, 'User \'MM\' logged in.', '2025-07-25 02:48:11', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(130, 35, 'User \'MM\' logged out.', '2025-07-25 02:50:26', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(131, 9, 'User \'staff4\' logged in.', '2025-07-25 02:51:36', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(132, 9, 'User \'staff4\' logged out.', '2025-07-25 02:51:55', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(133, 35, 'User \'MM\' logged in.', '2025-07-25 02:52:05', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(134, NULL, 'Failed login attempt for username \'MM\'.', '2025-08-05 14:26:36', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(135, 35, 'User \'MM\' logged in.', '2025-08-05 14:27:01', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(136, 35, 'User \'MM\' logged out.', '2025-08-05 14:27:40', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(137, 2, 'User \'admin1\' completed OTP verification.', '2025-08-05 14:29:06', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'),
(138, 2, 'User \'admin1\' completed OTP verification.', '2025-08-13 00:46:38', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(139, 2, 'User \'admin1\' logged out.', '2025-08-13 00:47:30', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(140, 9, 'User \'staff4\' completed OTP verification.', '2025-08-13 00:47:49', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(141, 9, 'User \'staff4\' completed OTP verification.', '2025-08-13 01:37:38', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(142, 35, 'User \'MM\' logged in.', '2025-08-13 03:06:58', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(143, 35, 'User \'MM\' logged out.', '2025-08-13 03:21:59', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(144, 35, 'User \'MM\' logged in.', '2025-08-13 03:51:04', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(145, 35, 'User \'MM\' logged out.', '2025-08-13 04:30:25', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(146, 9, 'User \'staff4\' logged out.', '2025-08-13 04:53:50', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(147, 35, 'User \'MM\' logged in.', '2025-08-13 04:57:29', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(148, 35, 'User \'MM\' logged out.', '2025-08-13 04:57:34', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(149, 35, 'User \'MM\' logged in.', '2025-08-13 04:57:53', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(150, 35, 'User \'MM\' logged out.', '2025-08-13 04:58:19', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(151, 35, 'User \'MM\' logged in.', '2025-08-13 04:59:14', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(152, 35, 'User \'MM\' logged out.', '2025-08-13 05:07:40', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(153, 35, 'User \'MM\' logged in.', '2025-08-13 05:08:14', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(154, 35, 'User \'MM\' logged in.', '2025-08-13 05:08:38', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(155, 35, 'User \'MM\' logged out.', '2025-08-13 05:09:26', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(156, 35, 'User \'MM\' logged in.', '2025-08-13 05:09:46', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(157, 35, 'User \'MM\' logged out.', '2025-08-13 05:09:52', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(158, 35, 'User \'MM\' logged in.', '2025-08-13 05:10:07', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(159, 35, 'User \'MM\' logged out.', '2025-08-13 05:11:06', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(160, 35, 'User \'MM\' logged in.', '2025-08-13 05:11:23', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(161, 35, 'User \'MM\' logged in.', '2025-08-13 05:12:55', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(162, 35, 'User \'MM\' logged out.', '2025-08-13 05:13:28', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(163, 35, 'User \'MM\' logged in.', '2025-08-13 05:13:41', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(164, 35, 'User \'MM\' logged out.', '2025-08-13 05:40:25', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(165, 35, 'User \'MM\' logged in.', '2025-08-13 05:40:27', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(166, 35, 'User \'MM\' logged in.', '2025-08-13 05:41:17', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(167, 35, 'User \'MM\' logged out.', '2025-08-13 06:13:23', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(168, 9, 'User \'staff4\' completed OTP verification.', '2025-08-13 06:14:01', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(169, 9, 'User \'staff4\' logged out.', '2025-08-13 06:16:19', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(170, 35, 'User \'MM\' logged in.', '2025-08-13 06:16:23', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(171, 35, 'User \'MM\' logged out.', '2025-08-13 06:23:15', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(172, 35, 'User \'MM\' logged in.', '2025-08-13 06:23:18', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(173, 35, 'User \'MM\' logged out.', '2025-08-13 06:31:41', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(174, 35, 'User \'MM\' logged in.', '2025-08-13 06:31:52', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(175, 35, 'User \'MM\' logged out.', '2025-08-13 06:32:01', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(176, 35, 'User \'MM\' logged in.', '2025-08-13 06:34:13', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(177, 35, 'User \'MM\' logged out.', '2025-08-13 06:35:58', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(178, 35, 'User \'MM\' logged in.', '2025-08-13 06:36:00', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(179, 35, 'User \'MM\' logged out.', '2025-08-13 06:37:14', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(180, 35, 'User \'MM\' logged in.', '2025-08-13 06:37:16', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(181, 35, 'User \'MM\' logged out.', '2025-08-13 06:38:37', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(182, 35, 'User \'MM\' logged in.', '2025-08-13 06:38:39', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(183, 35, 'User \'MM\' logged out.', '2025-08-13 07:01:05', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(184, 35, 'User \'MM\' logged in.', '2025-08-13 07:01:07', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(185, 35, 'User \'MM\' logged out.', '2025-08-13 07:02:23', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(186, 35, 'User \'MM\' logged out.', '2025-08-13 07:02:42', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(187, 9, 'Failed OTP verification attempt.', '2025-08-13 07:02:53', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(188, 9, 'User \'staff4\' completed OTP verification.', '2025-08-13 07:03:07', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(189, 35, 'User \'MM\' logged in.', '2025-08-13 07:03:29', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(190, 9, 'User \'staff4\' logged out.', '2025-08-13 07:05:13', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(191, 9, 'User \'staff4\' completed OTP verification.', '2025-08-13 07:08:05', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(192, 35, 'User \'MM\' logged out.', '2025-08-13 07:08:49', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(193, 35, 'User \'MM\' logged in.', '2025-08-13 07:08:50', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(194, 35, 'User \'MM\' logged in.', '2025-08-13 07:12:29', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(195, 35, 'User \'MM\' logged in.', '2025-08-13 07:14:43', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(196, 9, 'User \'staff4\' logged out.', '2025-08-13 07:21:50', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(197, 35, 'User \'MM\' logged out.', '2025-08-13 07:21:55', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(198, 9, 'User \'staff4\' completed OTP verification.', '2025-08-13 07:22:48', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(199, 35, 'User \'MM\' logged in.', '2025-08-13 07:24:43', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(200, 35, 'User \'MM\' logged in.', '2025-08-14 01:08:36', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(201, 35, 'User \'MM\' logged out.', '2025-08-14 01:11:20', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(202, 2, 'User \'admin1\' completed OTP verification.', '2025-08-14 01:15:36', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(203, 2, 'User \'admin1\' logged out.', '2025-08-14 01:21:44', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(204, 35, 'User \'MM\' logged in.', '2025-08-14 01:22:38', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(205, 35, 'User \'MM\' logged out.', '2025-08-14 01:25:43', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(206, 35, 'User \'MM\' logged in.', '2025-08-14 01:25:45', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(207, 35, 'User \'MM\' logged out.', '2025-08-14 01:26:01', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(208, 35, 'User \'MM\' logged in.', '2025-08-14 01:36:27', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` enum('unread','read') DEFAULT 'unread',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `quotation_id` int(11) DEFAULT NULL,
  `reference_number` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` enum('paid','unverified') DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `receipt_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `quotation_id`, `reference_number`, `amount`, `status`, `payment_date`, `receipt_path`) VALUES
(1, 17, 34, 'GCASH01234567890', 2200.00, 'paid', '2025-07-03', 'uploads/1751531150_68663e8e01924_file1-2025.jpg'),
(2, 35, 35, '0943132132444', 2480.00, 'paid', '2025-08-13', 'uploads/1755055125_689c0415e93a8_ddda.JPG'),
(3, 15, 19, '', 500.00, 'paid', '2025-08-13', NULL),
(4, 15, 23, '', 950.00, 'paid', '2025-08-13', NULL),
(5, 35, 36, '', 1700.00, 'paid', '2025-08-13', NULL),
(6, 15, 27, '', 1150.00, 'paid', '2025-08-13', NULL),
(7, 15, 31, '', 1300.00, 'paid', '2025-08-13', NULL),
(8, 15, 32, '454646763343', 3600.00, 'paid', '2025-08-13', 'uploads/689c0fcf0fd4c_ddda.JPG');

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` int(11) NOT NULL,
  `job_order_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','accepted','declined') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `quote_details` longtext DEFAULT NULL,
  `decline_note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quotations`
--

INSERT INTO `quotations` (`id`, `job_order_id`, `amount`, `status`, `created_at`, `quote_details`, `decline_note`) VALUES
(1, 8, 500.00, 'declined', '2025-05-09 11:54:33', '\n        <h3>Quotation Preview</h3>\n        <p id=\"preview-customer\">Dear Angelo Lancee,<br><br>Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services you requested:</p>\n        <table border=\"1\" cellpadding=\"10\" style=\"width: 100%;\">\n            <thead>\n                <tr>\n                    <th>Service Description</th>\n                    <th>Cost (PHP)</th>\n                </tr>\n            </thead>\n            <tbody id=\"preview-services\"><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr></tbody>\n            <tfoot>\n                <tr>\n                    <td><strong>Total Estimated Cost</strong></td>\n                    <td id=\"preview-total\">1000.00</td>\n                </tr>\n            </tfoot>\n        </table>\n        <p id=\"preview-notes\">\n        <strong>Additional Notes:</strong><br>\n        This quotation is based on the current diagnosis.<br><br>\n        If any additional repairs or parts are required after a full inspection, you will be informed beforehand, and an updated quotation will be provided.<br><br>\n        Additional charges may apply depending on the condition of parts or if extra labor is needed.<br><br>\n        Please confirm your agreement with the above quotation by replying with “AGREE”, or feel free to contact us for any questions or clarifications.\n    </p>\n    ', NULL),
(2, 9, 500.00, 'declined', '2025-05-11 12:13:20', '\r\n        <h3>Quotation Preview</h3>\r\n        <p id=\"preview-customer\">Dear Gilbert Dayalo,<br><br>Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services you requested:</p>\r\n        <table border=\"1\" cellpadding=\"10\" style=\"width: 100%;\">\r\n            <thead>\r\n                <tr>\r\n                    <th>Service Description</th>\r\n                    <th>Cost (PHP)</th>\r\n                </tr>\r\n            </thead>\r\n            <tbody id=\"preview-services\"><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr><tr><td>Car Wash (Pickup)</td><td>800.00</td></tr></tbody>\r\n            <tfoot>\r\n                <tr>\r\n                    <td><strong>Total Estimated Cost</strong></td>\r\n                    <td id=\"preview-total\">1300.00</td>\r\n                </tr>\r\n            </tfoot>\r\n        </table>\r\n        <p id=\"preview-notes\">\r\n        <strong>Additional Notes:</strong><br>\r\n        This quotation is based on the current diagnosis.<br><br>\r\n        If any additional repairs or parts are required after a full inspection, you will be informed beforehand, and an updated quotation will be provided.<br><br>\r\n        Additional charges may apply depending on the condition of parts or if extra labor is needed.<br><br>\r\n        Please confirm your agreement with the above quotation by replying with “AGREE”, or feel free to contact us for any questions or clarifications.\r\n    </p>\r\n    ', NULL),
(3, 9, 500.00, 'declined', '2025-05-11 12:16:00', '\r\n        <h3>Quotation Preview</h3>\r\n        <p id=\"preview-customer\">Dear Gilbert Dayalo,<br><br>Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services you requested:</p>\r\n        <table border=\"1\" cellpadding=\"10\" style=\"width: 100%;\">\r\n            <thead>\r\n                <tr>\r\n                    <th>Service Description</th>\r\n                    <th>Cost (PHP)</th>\r\n                </tr>\r\n            </thead>\r\n            <tbody id=\"preview-services\"><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr><tr><td>Car Wash (Pickup)</td><td>800.00</td></tr></tbody>\r\n            <tfoot>\r\n                <tr>\r\n                    <td><strong>Total Estimated Cost</strong></td>\r\n                    <td id=\"preview-total\">1300.00</td>\r\n                </tr>\r\n            </tfoot>\r\n        </table>\r\n        <p id=\"preview-notes\">\r\n        <strong>Additional Notes:</strong><br>\r\n        This quotation is based on the current diagnosis.<br><br>\r\n        If any additional repairs or parts are required after a full inspection, you will be informed beforehand, and an updated quotation will be provided.<br><br>\r\n        Additional charges may apply depending on the condition of parts or if extra labor is needed.<br><br>\r\n        Please confirm your agreement with the above quotation by replying with “AGREE”, or feel free to contact us for any questions or clarifications.\r\n    </p>\r\n    ', NULL),
(4, 9, 500.00, 'declined', '2025-05-11 12:16:14', '\r\n        <h3>Quotation Preview</h3>\r\n        <p id=\"preview-customer\">Dear Gilbert Dayalo,<br><br>Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services you requested:</p>\r\n        <table border=\"1\" cellpadding=\"10\" style=\"width: 100%;\">\r\n            <thead>\r\n                <tr>\r\n                    <th>Service Description</th>\r\n                    <th>Cost (PHP)</th>\r\n                </tr>\r\n            </thead>\r\n            <tbody id=\"preview-services\"><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr><tr><td>Car Wash (Pickup)</td><td>800.00</td></tr></tbody>\r\n            <tfoot>\r\n                <tr>\r\n                    <td><strong>Total Estimated Cost</strong></td>\r\n                    <td id=\"preview-total\">1300.00</td>\r\n                </tr>\r\n            </tfoot>\r\n        </table>\r\n        <p id=\"preview-notes\">\r\n        <strong>Additional Notes:</strong><br>\r\n        This quotation is based on the current diagnosis.<br><br>\r\n        If any additional repairs or parts are required after a full inspection, you will be informed beforehand, and an updated quotation will be provided.<br><br>\r\n        Additional charges may apply depending on the condition of parts or if extra labor is needed.<br><br>\r\n        Please confirm your agreement with the above quotation by replying with “AGREE”, or feel free to contact us for any questions or clarifications.\r\n    </p>\r\n    ', NULL),
(5, 9, 1300.00, 'declined', '2025-05-12 09:07:57', '\r\n        <h3>Quotation Preview</h3>\r\n        <p id=\"preview-customer\">Dear Gilbert Dayalo,<br><br>Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services you requested:</p>\r\n        <table border=\"1\" cellpadding=\"10\" style=\"width: 100%;\">\r\n            <thead>\r\n                <tr>\r\n                    <th>Service Description</th>\r\n                    <th>Cost (PHP)</th>\r\n                </tr>\r\n            </thead>\r\n            <tbody id=\"preview-services\"><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr><tr><td>Car Wash (Pickup)</td><td>800.00</td></tr></tbody>\r\n            <tfoot>\r\n                <tr>\r\n                    <td><strong>Total Estimated Cost</strong></td>\r\n                    <td id=\"preview-total\">1300.00</td>\r\n                </tr>\r\n            </tfoot>\r\n        </table>\r\n        <p id=\"preview-notes\">\r\n        <strong>Additional Notes:</strong><br>\r\n        This quotation is based on the current diagnosis.<br><br>\r\n        If any additional repairs or parts are required after a full inspection, you will be informed beforehand, and an updated quotation will be provided.<br><br>\r\n        Additional charges may apply depending on the condition of parts or if extra labor is needed.<br><br>\r\n        Please confirm your agreement with the above quotation by replying with “AGREE”, or feel free to contact us for any questions or clarifications.\r\n    </p>\r\n    ', NULL),
(6, 8, 1300.00, 'declined', '2025-05-12 09:11:44', '\r\n        <h3>Quotation Preview</h3>\r\n        <p id=\"preview-customer\">Dear Angelo Lancee,<br><br>Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services you requested:</p>\r\n        <table border=\"1\" cellpadding=\"10\" style=\"width: 100%;\">\r\n            <thead>\r\n                <tr>\r\n                    <th>Service Description</th>\r\n                    <th>Cost (PHP)</th>\r\n                </tr>\r\n            </thead>\r\n            <tbody id=\"preview-services\"><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr><tr><td>Car Wash (Pickup)</td><td>800.00</td></tr></tbody>\r\n            <tfoot>\r\n                <tr>\r\n                    <td><strong>Total Estimated Cost</strong></td>\r\n                    <td id=\"preview-total\">1300.00</td>\r\n                </tr>\r\n            </tfoot>\r\n        </table>\r\n        <p id=\"preview-notes\">\r\n        <strong>Additional Notes:</strong><br>\r\n        This quotation is based on the current diagnosis.<br><br>\r\n        If any additional repairs or parts are required after a full inspection, you will be informed beforehand, and an updated quotation will be provided.<br><br>\r\n        Additional charges may apply depending on the condition of parts or if extra labor is needed.<br><br>\r\n        Please confirm your agreement with the above quotation by replying with “AGREE”, or feel free to contact us for any questions or clarifications.\r\n    </p>\r\n    ', NULL),
(7, 8, 1300.00, 'pending', '2025-05-12 09:18:45', '\r\n        <h3>Quotation Preview</h3>\r\n        <p id=\"preview-customer\">Dear Angelo Lancee,<br><br>Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services you requested:</p>\r\n        <table border=\"1\" cellpadding=\"10\" style=\"width: 100%;\">\r\n            <thead>\r\n                <tr>\r\n                    <th>Service Description</th>\r\n                    <th>Cost (PHP)</th>\r\n                </tr>\r\n            </thead>\r\n            <tbody id=\"preview-services\"><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr><tr><td>Car Wash (Pickup)</td><td>800.00</td></tr></tbody>\r\n            <tfoot>\r\n                <tr>\r\n                    <td><strong>Total Estimated Cost</strong></td>\r\n                    <td id=\"preview-total\">1300.00</td>\r\n                </tr>\r\n            </tfoot>\r\n        </table>\r\n        <p id=\"preview-notes\">\r\n        <strong>Additional Notes:</strong><br>\r\n        This quotation is based on the current diagnosis.<br><br>\r\n        If any additional repairs or parts are required after a full inspection, you will be informed beforehand, and an updated quotation will be provided.<br><br>\r\n        Additional charges may apply depending on the condition of parts or if extra labor is needed.<br><br>\r\n        Please confirm your agreement with the above quotation by replying with “AGREE”, or feel free to contact us for any questions or clarifications.\r\n    </p>\r\n    ', NULL),
(8, 9, 1800.00, 'declined', '2025-05-12 09:19:23', '\r\n        <h3>Quotation Preview</h3>\r\n        <p id=\"preview-customer\">Dear Gilbert Dayalo,<br><br>Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services you requested:</p>\r\n        <table border=\"1\" cellpadding=\"10\" style=\"width: 100%;\">\r\n            <thead>\r\n                <tr>\r\n                    <th>Service Description</th>\r\n                    <th>Cost (PHP)</th>\r\n                </tr>\r\n            </thead>\r\n            <tbody id=\"preview-services\"><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr><tr><td>Car Wash (Pickup)</td><td>800.00</td></tr><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr></tbody>\r\n            <tfoot>\r\n                <tr>\r\n                    <td><strong>Total Estimated Cost</strong></td>\r\n                    <td id=\"preview-total\">1800.00</td>\r\n                </tr>\r\n            </tfoot>\r\n        </table>\r\n        <p id=\"preview-notes\">\r\n        <strong>Additional Notes:</strong><br>\r\n        This quotation is based on the current diagnosis.<br><br>\r\n        If any additional repairs or parts are required after a full inspection, you will be informed beforehand, and an updated quotation will be provided.<br><br>\r\n        Additional charges may apply depending on the condition of parts or if extra labor is needed.<br><br>\r\n        Please confirm your agreement with the above quotation by replying with “AGREE”, or feel free to contact us for any questions or clarifications.\r\n    </p>\r\n    ', NULL),
(9, 9, 1800.00, 'pending', '2025-05-12 09:23:22', '\r\n        <h3>Quotation Preview</h3>\r\n        <p id=\"preview-customer\">Dear Gilbert Dayalo,<br><br>Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services you requested:</p>\r\n        <table border=\"1\" cellpadding=\"10\" style=\"width: 100%;\">\r\n            <thead>\r\n                <tr>\r\n                    <th>Service Description</th>\r\n                    <th>Cost (PHP)</th>\r\n                </tr>\r\n            </thead>\r\n            <tbody id=\"preview-services\"><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr><tr><td>Car Wash (Pickup)</td><td>800.00</td></tr><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr></tbody>\r\n            <tfoot>\r\n                <tr>\r\n                    <td><strong>Total Estimated Cost</strong></td>\r\n                    <td id=\"preview-total\">1800.00</td>\r\n                </tr>\r\n            </tfoot>\r\n        </table>\r\n        <p id=\"preview-notes\">\r\n        <strong>Additional Notes:</strong><br>\r\n        This quotation is based on the current diagnosis.<br><br>\r\n        If any additional repairs or parts are required after a full inspection, you will be informed beforehand, and an updated quotation will be provided.<br><br>\r\n        Additional charges may apply depending on the condition of parts or if extra labor is needed.<br><br>\r\n        Please confirm your agreement with the above quotation by replying with “AGREE”, or feel free to contact us for any questions or clarifications.\r\n    </p>\r\n    ', NULL),
(10, 9, 1800.00, 'pending', '2025-05-12 09:23:37', '\r\n        <h3>Quotation Preview</h3>\r\n        <p id=\"preview-customer\">Dear Gilbert Dayalo,<br><br>Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services you requested:</p>\r\n        <table border=\"1\" cellpadding=\"10\" style=\"width: 100%;\">\r\n            <thead>\r\n                <tr>\r\n                    <th>Service Description</th>\r\n                    <th>Cost (PHP)</th>\r\n                </tr>\r\n            </thead>\r\n            <tbody id=\"preview-services\"><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr><tr><td>Car Wash (Pickup)</td><td>800.00</td></tr><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr></tbody>\r\n            <tfoot>\r\n                <tr>\r\n                    <td><strong>Total Estimated Cost</strong></td>\r\n                    <td id=\"preview-total\">1800.00</td>\r\n                </tr>\r\n            </tfoot>\r\n        </table>\r\n        <p id=\"preview-notes\">\r\n        <strong>Additional Notes:</strong><br>\r\n        This quotation is based on the current diagnosis.<br><br>\r\n        If any additional repairs or parts are required after a full inspection, you will be informed beforehand, and an updated quotation will be provided.<br><br>\r\n        Additional charges may apply depending on the condition of parts or if extra labor is needed.<br><br>\r\n        Please confirm your agreement with the above quotation by replying with “AGREE”, or feel free to contact us for any questions or clarifications.\r\n    </p>\r\n    ', NULL),
(11, 9, 1800.00, 'declined', '2025-05-12 09:25:37', '\r\n        <h3>Quotation Preview</h3>\r\n        <p id=\"preview-customer\">Dear Gilbert Dayalo,<br><br>Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services you requested:</p>\r\n        <table border=\"1\" cellpadding=\"10\" style=\"width: 100%;\">\r\n            <thead>\r\n                <tr>\r\n                    <th>Service Description</th>\r\n                    <th>Cost (PHP)</th>\r\n                </tr>\r\n            </thead>\r\n            <tbody id=\"preview-services\"><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr><tr><td>Car Wash (Pickup)</td><td>800.00</td></tr><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr></tbody>\r\n            <tfoot>\r\n                <tr>\r\n                    <td><strong>Total Estimated Cost</strong></td>\r\n                    <td id=\"preview-total\">1800.00</td>\r\n                </tr>\r\n            </tfoot>\r\n        </table>\r\n        <p id=\"preview-notes\">\r\n        <strong>Additional Notes:</strong><br>\r\n        This quotation is based on the current diagnosis.<br><br>\r\n        If any additional repairs or parts are required after a full inspection, you will be informed beforehand, and an updated quotation will be provided.<br><br>\r\n        Additional charges may apply depending on the condition of parts or if extra labor is needed.<br><br>\r\n        Please confirm your agreement with the above quotation by replying with “AGREE”, or feel free to contact us for any questions or clarifications.\r\n    </p>\r\n    ', 'too pricey'),
(12, 9, 1800.00, 'declined', '2025-05-12 09:25:41', '\r\n        <h3>Quotation Preview</h3>\r\n        <p id=\"preview-customer\">Dear Gilbert Dayalo,<br><br>Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services you requested:</p>\r\n        <table border=\"1\" cellpadding=\"10\" style=\"width: 100%;\">\r\n            <thead>\r\n                <tr>\r\n                    <th>Service Description</th>\r\n                    <th>Cost (PHP)</th>\r\n                </tr>\r\n            </thead>\r\n            <tbody id=\"preview-services\"><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr><tr><td>Car Wash (Pickup)</td><td>800.00</td></tr><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr></tbody>\r\n            <tfoot>\r\n                <tr>\r\n                    <td><strong>Total Estimated Cost</strong></td>\r\n                    <td id=\"preview-total\">1800.00</td>\r\n                </tr>\r\n            </tfoot>\r\n        </table>\r\n        <p id=\"preview-notes\">\r\n        <strong>Additional Notes:</strong><br>\r\n        This quotation is based on the current diagnosis.<br><br>\r\n        If any additional repairs or parts are required after a full inspection, you will be informed beforehand, and an updated quotation will be provided.<br><br>\r\n        Additional charges may apply depending on the condition of parts or if extra labor is needed.<br><br>\r\n        Please confirm your agreement with the above quotation by replying with “AGREE”, or feel free to contact us for any questions or clarifications.\r\n    </p>\r\n    ', ''),
(13, 1, 500.00, 'declined', '2025-05-12 09:25:55', '\n        <h3>Quotation Preview</h3>\n        <p id=\"preview-customer\">Dear Test Customer,<br><br>Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services you requested:</p>\n        <table border=\"1\" cellpadding=\"10\" style=\"width: 100%;\">\n            <thead>\n                <tr>\n                    <th>Service Description</th>\n                    <th>Cost (PHP)</th>\n                </tr>\n            </thead>\n            <tbody id=\"preview-services\"><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr></tbody>\n            <tfoot>\n                <tr>\n                    <td><strong>Total Estimated Cost</strong></td>\n                    <td id=\"preview-total\">500.00</td>\n                </tr>\n            </tfoot>\n        </table>\n        <p id=\"preview-notes\">\n        <strong>Additional Notes:</strong><br>\n        This quotation is based on the current diagnosis.<br><br>\n        If any additional repairs or parts are required after a full inspection, you will be informed beforehand, and an updated quotation will be provided.<br><br>\n        Additional charges may apply depending on the condition of parts or if extra labor is needed.<br><br>\n        Please confirm your agreement with the above quotation by replying with “AGREE”, or feel free to contact us for any questions or clarifications.\n    </p>\n    ', ''),
(14, 1, 500.00, 'declined', '2025-05-12 09:29:03', '\r\n        <h3>Quotation Preview</h3>\r\n        <p id=\"preview-customer\">Dear Test Customer,<br><br>Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services you requested:</p>\r\n        <table border=\"1\" cellpadding=\"10\" style=\"width: 100%;\">\r\n            <thead>\r\n                <tr>\r\n                    <th>Service Description</th>\r\n                    <th>Cost (PHP)</th>\r\n                </tr>\r\n            </thead>\r\n            <tbody id=\"preview-services\"><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr></tbody>\r\n            <tfoot>\r\n                <tr>\r\n                    <td><strong>Total Estimated Cost</strong></td>\r\n                    <td id=\"preview-total\">500.00</td>\r\n                </tr>\r\n            </tfoot>\r\n        </table>\r\n        <p id=\"preview-notes\">\r\n        <strong>Additional Notes:</strong><br>\r\n        This quotation is based on the current diagnosis.<br><br>\r\n        If any additional repairs or parts are required after a full inspection, you will be informed beforehand, and an updated quotation will be provided.<br><br>\r\n        Additional charges may apply depending on the condition of parts or if extra labor is needed.<br><br>\r\n        Please confirm your agreement with the above quotation by replying with “AGREE”, or feel free to contact us for any questions or clarifications.\r\n    </p>\r\n    ', ''),
(15, 1, 500.00, 'declined', '2025-05-12 09:29:05', '\r\n        <h3>Quotation Preview</h3>\r\n        <p id=\"preview-customer\">Dear Test Customer,<br><br>Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services you requested:</p>\r\n        <table border=\"1\" cellpadding=\"10\" style=\"width: 100%;\">\r\n            <thead>\r\n                <tr>\r\n                    <th>Service Description</th>\r\n                    <th>Cost (PHP)</th>\r\n                </tr>\r\n            </thead>\r\n            <tbody id=\"preview-services\"><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr></tbody>\r\n            <tfoot>\r\n                <tr>\r\n                    <td><strong>Total Estimated Cost</strong></td>\r\n                    <td id=\"preview-total\">500.00</td>\r\n                </tr>\r\n            </tfoot>\r\n        </table>\r\n        <p id=\"preview-notes\">\r\n        <strong>Additional Notes:</strong><br>\r\n        This quotation is based on the current diagnosis.<br><br>\r\n        If any additional repairs or parts are required after a full inspection, you will be informed beforehand, and an updated quotation will be provided.<br><br>\r\n        Additional charges may apply depending on the condition of parts or if extra labor is needed.<br><br>\r\n        Please confirm your agreement with the above quotation by replying with “AGREE”, or feel free to contact us for any questions or clarifications.\r\n    </p>\r\n    ', ''),
(16, 2, 1300.00, 'declined', '2025-05-12 09:29:31', '\r\n        <h3>Quotation Preview</h3>\r\n        <p id=\"preview-customer\">Dear Test Customer,<br><br>Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services you requested:</p>\r\n        <table border=\"1\" cellpadding=\"10\" style=\"width: 100%;\">\r\n            <thead>\r\n                <tr>\r\n                    <th>Service Description</th>\r\n                    <th>Cost (PHP)</th>\r\n                </tr>\r\n            </thead>\r\n            <tbody id=\"preview-services\"><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr><tr><td>Car Wash (Pickup)</td><td>800.00</td></tr></tbody>\r\n            <tfoot>\r\n                <tr>\r\n                    <td><strong>Total Estimated Cost</strong></td>\r\n                    <td id=\"preview-total\">1300.00</td>\r\n                </tr>\r\n            </tfoot>\r\n        </table>\r\n        <p id=\"preview-notes\">\r\n        <strong>Additional Notes:</strong><br>\r\n        This quotation is based on the current diagnosis.<br><br>\r\n        If any additional repairs or parts are required after a full inspection, you will be informed beforehand, and an updated quotation will be provided.<br><br>\r\n        Additional charges may apply depending on the condition of parts or if extra labor is needed.<br><br>\r\n        Please confirm your agreement with the above quotation by replying with “AGREE”, or feel free to contact us for any questions or clarifications.\r\n    </p>\r\n    ', 'pass'),
(17, 3, 1800.00, 'declined', '2025-05-12 09:30:17', '\r\n        <h3>Quotation Preview</h3>\r\n        <p id=\"preview-customer\">Dear Test Customer,<br><br>Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services you requested:</p>\r\n        <table border=\"1\" cellpadding=\"10\" style=\"width: 100%;\">\r\n            <thead>\r\n                <tr>\r\n                    <th>Service Description</th>\r\n                    <th>Cost (PHP)</th>\r\n                </tr>\r\n            </thead>\r\n            <tbody id=\"preview-services\"><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr><tr><td>Car Wash (Pickup)</td><td>800.00</td></tr><tr><td>Car Wash (Sedan)</td><td>500.00</td></tr></tbody>\r\n            <tfoot>\r\n                <tr>\r\n                    <td><strong>Total Estimated Cost</strong></td>\r\n                    <td id=\"preview-total\">1800.00</td>\r\n                </tr>\r\n            </tfoot>\r\n        </table>\r\n        <p id=\"preview-notes\">\r\n        <strong>Additional Notes:</strong><br>\r\n        This quotation is based on the current diagnosis.<br><br>\r\n        If any additional repairs or parts are required after a full inspection, you will be informed beforehand, and an updated quotation will be provided.<br><br>\r\n        Additional charges may apply depending on the condition of parts or if extra labor is needed.<br><br>\r\n        Please confirm your agreement with the above quotation by replying with “AGREE”, or feel free to contact us for any questions or clarifications.\r\n    </p>\r\n    ', ''),
(18, 4, 1000.00, 'pending', '2025-05-12 09:54:38', '\r\n        Quotation Preview\r\n        Dear Test Customer,Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services you requested:\r\n        \r\n            \r\n                \r\n                    Service Description\r\n                    Cost (PHP)\r\n                \r\n            \r\n            Car Wash (Sedan)500.00Car Wash (Sedan)500.00\r\n            \r\n                \r\n                    Total Estimated Cost\r\n                    1000.00\r\n                \r\n            \r\n        \r\n        \r\n        Additional Notes:\r\n        This quotation is based on the current diagnosis.\r\n        If any additional repairs or parts are required after a full inspection, you will be informed beforehand, and an updated quotation will be provided.\r\n        Additional charges may apply depending on the condition of parts or if extra labor is needed.\r\n        Please confirm your agreement with the above quotation by replying with “AGREE”, or feel free to contact us for any questions or clarifications.\r\n    \r\n    ', NULL),
(19, 10, 500.00, '', '2025-05-12 09:57:29', '\r\n        Quotation Preview\r\n        Dear Earl Gatchalian,Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services you requested:\r\n        \r\n            \r\n                \r\n                    Service Description\r\n                    Cost (PHP)\r\n                \r\n            \r\n            Car Wash (Sedan)500.00\r\n            \r\n                \r\n                    Total Estimated Cost\r\n                    500.00\r\n                \r\n            \r\n        \r\n        \r\n        Additional Notes:\r\n        This quotation is based on the current diagnosis.\r\n        If any additional repairs or parts are required after a full inspection, you will be informed beforehand, and an updated quotation will be provided.\r\n        Additional charges may apply depending on the condition of parts or if extra labor is needed.\r\n        Please confirm your agreement with the above quotation by replying with “AGREE”, or feel free to contact us for any questions or clarifications.\r\n    \r\n    ', 'Accepted by customer'),
(20, 11, 1300.00, 'declined', '2025-05-12 10:01:43', '\r\n        Quotation Preview\r\n        Dear Earl Gatchalian,Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services you requested:\r\n        \r\n            \r\n                \r\n                    Service Description\r\n                    Cost (PHP)\r\n                \r\n            \r\n            Car Wash (Pickup)800.00Car Wash (Sedan)500.00\r\n            \r\n                \r\n                    Total Estimated Cost\r\n                    1300.00\r\n                \r\n            \r\n        \r\n        \r\n        Additional Notes:\r\n        This quotation is based on the current diagnosis.\r\n        If any additional repairs or parts are required after a full inspection, you will be informed beforehand, and an updated quotation will be provided.\r\n        Additional charges may apply depending on the condition of parts or if extra labor is needed.\r\n        Please confirm your agreement with the above quotation by replying with “AGREE”, or feel free to contact us for any questions or clarifications.\r\n    \r\n    ', ''),
(21, 5, 500.00, 'pending', '2025-05-12 11:36:44', '\r\n        Quotation Preview\r\n        Dear Test Customer,Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services you requested:\r\n        \r\n            \r\n                \r\n                    Service Description\r\n                    Cost (PHP)\r\n                \r\n            \r\n            Car Wash (Sedan)500.00\r\n            \r\n                \r\n                    Total Estimated Cost\r\n                    500.00\r\n                \r\n            \r\n        \r\n        \r\n        Additional Notes:\r\n        This quotation is based on the current diagnosis.\r\n        If any additional repairs or parts are required after a full inspection, you will be informed beforehand, and an updated quotation will be provided.\r\n        Additional charges may apply depending on the condition of parts or if extra labor is needed.\r\n        Please confirm your agreement with the above quotation by replying with “AGREE”, or feel free to contact us for any questions or clarifications.\r\n    \r\n    ', NULL),
(22, 12, 500.00, 'declined', '2025-05-12 11:47:29', '\r\n        Quotation Preview\r\n        Dear Earl Gatchalian,Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services you requested:\r\n        \r\n            \r\n                \r\n                    Service Description\r\n                    Cost (PHP)\r\n                \r\n            \r\n            Car Wash (Sedan)500.00\r\n            \r\n                \r\n                    Total Estimated Cost\r\n                    500.00\r\n                \r\n            \r\n        \r\n        \r\n        Additional Notes:\r\n        This quotation is based on the current diagnosis.\r\n        If any additional repairs or parts are required after a full inspection, you will be informed beforehand, and an updated quotation will be provided.\r\n        Additional charges may apply depending on the condition of parts or if extra labor is needed.\r\n        Please confirm your agreement with the above quotation by replying with “AGREE”, or feel free to contact us for any questions or clarifications.\r\n    \r\n    ', 'Sorry price is too high.'),
(23, 13, 950.00, '', '2025-05-12 12:23:44', '\r\n        Quotation Preview\r\n        Dear Earl Gatchalian,Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services and parts:\r\n        \r\n            \r\n                \r\n                    Description\r\n                    Cost (PHP)\r\n                \r\n            \r\n            Car Wash (Sedan)500.00Coolant x1250.00Rubber (Small) x4200.00\r\n            \r\n                \r\n                    Total Estimated Cost\r\n                    950.00\r\n                \r\n            \r\n        \r\n        \r\n        Additional Notes:\r\n        Quotation includes current findings and parts used. Any changes will be quoted separately.\r\n        Please confirm your agreement by replying with “AGREE” or contact us for questions.\r\n    \r\n    ', 'Accepted by customer'),
(24, 7, 5500.00, 'pending', '2025-05-12 12:27:26', '\r\n        Quotation Preview\r\n        Dear Angelo Lancee,Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services and parts:\r\n        \r\n            \r\n                \r\n                    Description\r\n                    Cost (PHP)\r\n                \r\n            \r\n            Car Wash (Sedan)500.00Coolant x205000.00\r\n            \r\n                \r\n                    Total Estimated Cost\r\n                    5500.00\r\n                \r\n            \r\n        \r\n        \r\n        Additional Notes:\r\n        Quotation includes current findings and parts used. Any changes will be quoted separately.\r\n        Please confirm your agreement by replying with “AGREE” or contact us for questions.\r\n    \r\n    ', NULL),
(25, 14, 1170.00, 'declined', '2025-05-12 12:33:23', '\r\n        Quotation Preview\r\n        Dear Earl Gatchalian,Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services and parts:\r\n        \r\n            \r\n                \r\n                    Description\r\n                    Cost (PHP)\r\n                \r\n            \r\n            Car Tire Change600.00Rubber (Big) x4320.00Coolant x1250.00\r\n            \r\n                \r\n                    Total Estimated Cost\r\n                    1170.00\r\n                \r\n            \r\n        \r\n        \r\n        Additional Notes:\r\n        Quotation includes current findings and parts used. Any changes will be quoted separately.\r\n        Please confirm your agreement by replying with “AGREE” or contact us for questions.\r\n    \r\n    ', ''),
(26, 15, 1400.00, 'declined', '2025-05-13 13:09:11', '\r\n        Quotation Preview\r\n        Dear Earl Gatchalian,Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services and parts:\r\n        \r\n            \r\n                \r\n                    Description\r\n                    Cost (PHP)\r\n                \r\n            \r\n            Car Tire Change600.00Car Wash (Pickup)800.00\r\n            \r\n                \r\n                    Total Estimated Cost\r\n                    1400.00\r\n                \r\n            \r\n        \r\n        \r\n        Additional Notes:\r\n        Quotation includes current findings and parts used. Any changes will be quoted separately.\r\n        Please confirm your agreement by replying with “AGREE” or contact us for questions.\r\n    \r\n    ', 'too pricey'),
(27, 16, 1150.00, '', '2025-05-18 11:34:04', '\r\n        Quotation Preview\r\n        Dear Earl Gatchalian,Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services and parts:\r\n        \r\n            \r\n                \r\n                    Description\r\n                    Cost (PHP)\r\n                \r\n            \r\n            Car Wash (Sedan)500.00Car Tire Change600.00Rubber (Small) x150.00\r\n            \r\n                \r\n                    Total Estimated Cost\r\n                    1150.00\r\n                \r\n            \r\n        \r\n        \r\n        Additional Notes:\r\n        Quotation includes current findings and parts used. Any changes will be quoted separately.\r\n        Please confirm your agreement by replying with “AGREE” or contact us for questions.\r\n    \r\n    ', NULL),
(28, 6, 1400.00, 'pending', '2025-05-18 12:32:09', '\r\n        Quotation Preview\r\n        Dear Angelo Lancee,Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services and parts:\r\n        \r\n            \r\n                \r\n                    Description\r\n                    Cost (PHP)\r\n                \r\n            \r\n            Car Wash (Pickup)800.00Car Wash (Sedan)500.00Rubber (Small) x2100.00\r\n            \r\n                \r\n                    Total Estimated Cost\r\n                    1400.00\r\n                \r\n            \r\n        \r\n        \r\n        Additional Notes:\r\n        Quotation includes current findings and parts used. Any changes will be quoted separately.\r\n        Please confirm your agreement by replying with “AGREE” or contact us for questions.\r\n    \r\n    ', NULL),
(29, 17, 1400.00, 'pending', '2025-05-18 12:39:02', '\r\n        Quotation Preview\r\n        Dear Angelo Lancee,Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services and parts:\r\n        \r\n            \r\n                \r\n                    Description\r\n                    Cost (PHP)\r\n                \r\n            \r\n            Car Wash (Sedan)500.00Car Tire Change600.00Rubber (Small) x6300.00\r\n            \r\n                \r\n                    Total Estimated Cost\r\n                    1400.00\r\n                \r\n            \r\n        \r\n        \r\n        Additional Notes:\r\n        Quotation includes current findings and parts used. Any changes will be quoted separately.\r\n        Please confirm your agreement by replying with “AGREE” or contact us for questions.\r\n    \r\n    ', NULL),
(30, 18, 1750.00, 'accepted', '2025-05-18 12:46:28', '\r\n        Quotation Preview\r\n        Dear Earl Gatchalian,Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services and parts:\r\n        \r\n            \r\n                \r\n                    Description\r\n                    Cost (PHP)\r\n                \r\n            \r\n            Car Wash (Sedan)500.00Coolant x51250.00\r\n            \r\n                \r\n                    Total Estimated Cost\r\n                    1750.00\r\n                \r\n            \r\n        \r\n        \r\n        Additional Notes:\r\n        Quotation includes current findings and parts used. Any changes will be quoted separately.\r\n        Please confirm your agreement by replying with “AGREE” or contact us for questions.\r\n    \r\n    ', NULL),
(31, 19, 1300.00, '', '2025-05-18 13:01:32', '\r\n        Quotation Preview\r\n        Dear Earl Gatchalian,Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services and parts:\r\n        \r\n            \r\n                \r\n                    Description\r\n                    Cost (PHP)\r\n                \r\n            \r\n            Car Wash (Sedan)500.00Car Tire Change600.00Rubber (Small) x4200.00\r\n            \r\n                \r\n                    Total Estimated Cost\r\n                    1300.00\r\n                \r\n            \r\n        \r\n        \r\n        Additional Notes:\r\n        Quotation includes current findings and parts used. Any changes will be quoted separately.\r\n        Please confirm your agreement by replying with “AGREE” or contact us for questions.\r\n    \r\n    ', NULL),
(32, 20, 3600.00, '', '2025-05-18 13:20:53', '\r\n        Quotation Preview\r\n        Dear Earl Gatchalian,Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services and parts:\r\n        \r\n            \r\n                \r\n                    Description\r\n                    Cost (PHP)\r\n                \r\n            \r\n            Car Wash (Sedan)500.00Car Tire Change600.00Coolant x102500.00\r\n            \r\n                \r\n                    Total Estimated Cost\r\n                    3600.00\r\n                \r\n            \r\n        \r\n        \r\n        Additional Notes:\r\n        Quotation includes current findings and parts used. Any changes will be quoted separately.\r\n        Please confirm your agreement by replying with “AGREE” or contact us for questions.\r\n    \r\n    ', NULL),
(33, 21, 800.00, 'declined', '2025-05-18 13:23:26', '\r\n        Quotation Preview\r\n        Dear Earl Gatchalian,Thank you for choosing KCS Auto Repair Shop. Below is the quotation for the services and parts:\r\n        \r\n            \r\n                \r\n                    Description\r\n                    Cost (PHP)\r\n                \r\n            \r\n            Car Wash (Sedan)500.00Radiator Cooler x1300.00\r\n            \r\n                \r\n                    Total Estimated Cost\r\n                    800.00\r\n                \r\n            \r\n        \r\n        \r\n        Additional Notes:\r\n        Quotation includes current findings and parts used. Any changes will be quoted separately.\r\n        Please confirm your agreement by replying with “AGREE” or contact us for questions.\r\n    \r\n    ', 'too pricey'),
(34, 22, 2200.00, '', '2025-07-03 08:09:49', '\r\n                Quotation Preview\r\n                Dear Gil Bert,Thank you for choosing our services. Here is the quotation for your vehicle:\r\n                \r\n                    \r\n                        \r\n                            Description\r\n                            Cost (PHP)\r\n                        \r\n                    \r\n                    Car Wash (Pickup) (Base Service)800.00Car Wash (Pickup)800.00Car Tire Change600.00\r\n                    \r\n                        \r\n                            Total Estimated Cost\r\n                            ₱ 2200.00\r\n                        \r\n                    \r\n                \r\n                Notes: This quotation is valid for 30 days. Prices are subject to change based on final inspection.\r\n            ', 'accept'),
(35, 23, 2480.00, '', '2025-08-13 03:14:55', '\r\n                Quotation Preview\r\n                Dear MM,Thank you for choosing our services. Here is the quotation for your vehicle:\r\n                \r\n                    \r\n                        \r\n                            Description\r\n                            Cost (PHP)\r\n                        \r\n                    \r\n                    Change Oil (Base Service)1250.00Car Tire Change600.00Tire Sealer x1250.00Rubber (Big) x180.00Radiator Cooler x1300.00\r\n                    \r\n                        \r\n                            Total Estimated Cost\r\n                            ₱ 2480.00\r\n                        \r\n                    \r\n                \r\n                Notes: This quotation is valid for 30 days. Prices are subject to change based on final inspection.\r\n            ', NULL),
(36, 24, 1700.00, '', '2025-08-13 04:02:32', '\r\n                Quotation Preview\r\n                Dear MM,Thank you for choosing our services. Here is the quotation for your vehicle:\r\n                \r\n                    \r\n                        \r\n                            Description\r\n                            Cost (PHP)\r\n                        \r\n                    \r\n                    Car Tire Change (Base Service)600.00Car Wash (Sedan)500.00Rubber (Small) x12600.00\r\n                    \r\n                        \r\n                            Total Estimated Cost\r\n                            ₱ 1700.00\r\n                        \r\n                    \r\n                \r\n                Notes: This quotation is valid for 30 days. Prices are subject to change based on final inspection.\r\n            ', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quotation_products`
--

CREATE TABLE `quotation_products` (
  `id` int(11) NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_per_unit` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quotation_products`
--

INSERT INTO `quotation_products` (`id`, `quotation_id`, `product_id`, `quantity`, `price_per_unit`) VALUES
(1, 29, 2, 6, 50.00),
(2, 30, 1, 5, 250.00),
(3, 31, 2, 4, 50.00),
(4, 32, 1, 10, 250.00),
(5, 33, 4, 1, 300.00),
(6, 35, 5, 1, 250.00),
(7, 35, 3, 1, 80.00),
(8, 35, 4, 1, 300.00),
(9, 36, 2, 12, 50.00);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `status` enum('Available','Not Available') NOT NULL DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `cost`, `status`) VALUES
(1, 'Car Wash (Sedan)', ' offers vehicle cleaning services. These can range from basic exterior washes to more comprehensive interior cleaning and detailing. ', 500.00, 'Available'),
(2, 'Car Wash (Pickup)', ' offers vehicle cleaning services. These can range from basic exterior washes to more comprehensive interior cleaning and detailing. ', 800.00, 'Available'),
(3, 'Car Tire Change', 'A car tire change, or tire service, involves disassembling the wheel, removing the old tire, installing a new tire, and then balancing and inflating the wheel.', 600.00, 'Available'),
(4, 'Fluid Replacement', 'The cost to change transmission fluid in the Philippines can vary, but generally ranges from Php 3,000 to Php 7,000 or more. This price range depends on factors like the type of service (fluid change vs. flush), the type of transmission (automatic or manual), the type of vehicle, the specific shop or service center, and whether genuine or aftermarket parts are used. ', 3000.00, 'Available'),
(5, 'Change Oil', 'The cost of an oil change in the Philippines varies depending on the type of oil (synthetic, semi-synthetic, or conventional), the vehicle\'s engine size, and the service provider (dealer, independent shop, or DIY). ', 1250.00, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `unavailable_dates`
--

CREATE TABLE `unavailable_dates` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unavailable_dates`
--

INSERT INTO `unavailable_dates` (`id`, `date`) VALUES
(157, '2025-05-03'),
(152, '2025-05-04'),
(151, '2025-05-08'),
(158, '2025-05-10'),
(153, '2025-05-11'),
(159, '2025-05-17'),
(154, '2025-05-18'),
(160, '2025-05-24'),
(155, '2025-05-25'),
(150, '2025-05-29'),
(149, '2025-05-30'),
(148, '2025-05-31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` enum('admin','staff','inventory_manager','mechanic','customer') DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `home_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','inactive') DEFAULT 'active',
  `email_verified` tinyint(1) DEFAULT 0,
  `verification_token` varchar(255) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `role`, `full_name`, `contact_number`, `home_address`, `created_at`, `status`, `email_verified`, `verification_token`, `profile_picture`) VALUES
(1, 'testCS', '$2y$10$htOuNEVH8E/1Ti2Wt3N73eJ/jixDo9tVRf6NHQm5NfggvxOnlbYhi', 'test@custormer.com', 'staff', 'Test Customer', NULL, NULL, '2025-05-05 07:01:59', 'active', 0, NULL, NULL),
(2, 'admin1', '$2y$10$EuQvj7NXJ4xo6y3s84bCL.w7JYfW0EDs8twTVFIP2nuGjsXW58Oh.', 'kcsadmn20@gmail.com', 'admin', 'admin number1', NULL, NULL, '2025-05-05 07:35:46', 'active', 1, NULL, '2_pic.jpg'),
(3, 'staff1', '$2y$10$6qjYlE/fJswlr4yaHY0Pf.WpSstMMMzkfh8JKC9ItVX.k.9rEQHYW', 'test@staff.com', 'staff', 'staff testing', NULL, NULL, '2025-05-05 12:19:15', 'inactive', 0, NULL, NULL),
(5, 'staff2', '$2y$10$OW8sgw4gErFP/pgtpPn8bOqEo4cApWnZ6J2Bi./mFHAQDwxdMA9Va', 'test@staff2.com', 'staff', 'staff testing', NULL, NULL, '2025-05-05 12:20:05', 'active', 0, NULL, NULL),
(7, 'staff3', '$2y$10$G94KznUdB7DGRPhEtuvyGuF5OXMeylkadMBS0Ex46ga.8/Nozevie', 'test@staff3.com', 'staff', 'staff testing', NULL, NULL, '2025-05-05 12:21:21', 'active', 0, NULL, NULL),
(8, 'customer2', '$2y$10$wpWoxHH.oXRNbDKyDPHS4Othd4kpmuwXak9q2GCuWnxhIaCqyBOPC', 'test@customer2.com', 'customer', 'test customer2', NULL, NULL, '2025-05-05 12:22:06', 'inactive', 0, NULL, NULL),
(9, 'staff4', '$2y$10$m.HaTFhm5ep93CFqGhRGLu9u9TP.lpYjEqcKhEw6nyfuj/AjeklLO', 'kcsautorepair09@gmail.com', 'staff', 'staff4 testing', NULL, NULL, '2025-05-05 12:33:11', 'active', 1, NULL, '9_pic.jpg'),
(10, 'mechanic1', '$2y$10$Wf4.kmNe9srboNdCWGjI1.aC.90i5/vEa3rHevy2SP9ZYlmMlzHCO', 'test@mechanic.com', 'mechanic', 'mechanic testing 1', NULL, NULL, '2025-05-06 17:14:46', 'active', 0, NULL, NULL),
(11, 'customer', '$2y$10$k4.R/.Xca4pTDPAUmsYTRu0c.DCJZC02w4YjgGWff8u/sMMlWWQKW', 'test@customer.com', 'customer', 'Test Customer', NULL, NULL, '2025-05-08 12:06:12', 'active', 0, NULL, NULL),
(12, 'customer_test', '$2y$10$V009uOFyQSJ20IyTT.o38eQTmTxU7H4eeAWuypISTgED4kuD5SujW', 'test@cust.com', 'customer', 'Test Customer', '09947630752', NULL, '2025-05-08 12:38:29', 'active', 0, NULL, NULL),
(13, 'Lance', '$2y$10$Jvcr4UcCOy9oT9w9KTHLKeYDzlPHyKVyjelyaSaVt3ZSsSyKAUIQS', 'banda.angelolance.b@gmail.com', 'customer', 'Angelo Lancee', '0987544321', '423 Mayon ', '2025-05-09 08:12:42', 'active', 0, NULL, NULL),
(14, 'Gilbert', '$2y$10$2El6xDtHViHPMADK3bhE9OvIklQWZNLx90bUW8LiyjkgUG3GxMfzG', 'gilbert123@gmail.com', 'customer', 'Gilbert Dayalo', '09927821292', NULL, '2025-05-11 12:10:40', 'active', 0, NULL, NULL),
(15, 'Earl', '$2y$10$3orEZj98/wuWTud4ERg5Su3lpFmNHWXuY4EN7k1p.iLhok6LVixQO', 'Earl@gmail.com', 'customer', 'Earl Gatchalian', '0984114321', 'Fairmont ', '2025-05-12 09:55:44', 'active', 0, NULL, NULL),
(16, 'inventory', '$2y$10$ZsyzdTgiJB/pB6j0PoiXi.kYhx90zBy.rRFsjC/yEdaWKI2nsfWyu', 'kcsinventory71@gmail.com', 'inventory_manager', 'Bernald Solomon', NULL, NULL, '2025-05-12 11:53:21', 'active', 1, NULL, NULL),
(17, 'gilbert0703', '$2y$10$tv.zwakLtzKJPcVfd0IGnu.faM3uL65BlEYv9cYzB2LleS/mc8k72', 'gb@gmail.com', 'customer', 'Gil Bert', '09875653214', NULL, '2025-07-03 06:13:15', 'active', 0, NULL, NULL),
(18, 'tester0703', '$2y$10$7r1unIbPfZe.TYlTtlDEZuS/rLwsv7Y7DyTHm/lTzh5gOkmL.nZFK', 'awra@gmail.com', 'customer', 'Tester Account', '09875653214', NULL, '2025-07-03 08:54:46', 'inactive', 0, NULL, NULL),
(19, 'xzx', '$2y$10$CaQCVqcrzxjZBPpQLHOPJ.N6Sd31UO0DKW9/amqU9qLAZWc8KK7iC', 'zxxz@gmail.com', 'customer', 'zx123', 'zxzx', NULL, '2025-07-06 02:55:34', 'active', 0, NULL, NULL),
(35, 'MM', '$2y$10$P5hk4w8k42yQ7Ivrtq2twebzSmJbw3GwgZCeWEAhFzurN6SeIWWVi', 'sm.snfs.m.btd.ndn.y@gmail.com', 'customer', 'MM', '09875653214', NULL, '2025-07-23 08:55:14', 'active', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `plate_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `user_id`, `brand`, `model`, `plate_number`) VALUES
(1, 8, 'Toyota Vios', '2012', 'KCS-1994'),
(2, 8, 'Toyota Hilux', '2024', 'ABC-1213'),
(3, 11, 'Honda City ', '2023', 'ABS-1231'),
(4, 12, 'Honda City Hatch', '2020', 'ABC-4213'),
(5, 12, 'Ford Raptor', '2020', 'FOR-1231'),
(6, 12, 'Ford Raptor ', '2020', 'FOR-3124'),
(7, 11, 'Ford Ranger', '2020', 'FOR-3124'),
(8, 11, 'Nissan GTR', '2020', 'NIS-3141'),
(9, 13, 'Ford Everest ', '2024', 'KNS-2311'),
(10, 13, 'Ford Ranger ', '2025', 'KHN-3124'),
(11, 13, 'Ford Everest (blue)', '2025', 'KAD-3134'),
(12, 13, 'Toyota Hilux Max', '2025', 'DAW-3214'),
(13, 13, 'Ford Everest (RED)', '2025', 'FWAF-3121'),
(14, 14, 'Toyota Hilux', '2020', 'DAW-3214'),
(15, 15, 'Mazda 8 Hatch', '2025', 'KNS-2312'),
(16, 15, 'Mazda Rx8', '1998', 'DAW-3214'),
(17, 15, 'Mazda 3', '2020', '123-abc'),
(18, 15, 'Mirage', '2004', 'ADW-2133'),
(19, 15, 'Honda Civic ', '2025', 'BIA-9978'),
(20, 15, 'Ford Everest ', '2025', 'DAW-3211'),
(21, 15, 'Honda Civic ', '2025', 'FWA-9312'),
(22, 15, 'Honda City', '2024', 'DWD-3121'),
(23, 15, 'Honda Civic RED', '2001', 'DWA-9992'),
(24, 17, 'Toyota', 'Hillux', 'HIL-123'),
(25, 17, 'Toyota', 'Hillux', 'dfdfdfd'),
(26, 17, 'Toyota', 'Hillux', 'iu7y6eq'),
(27, 17, 'Toyota', 'Hillux', 'THT6767676'),
(28, 18, 'Ford', 'Ranger', 'RFR454545'),
(29, 35, 'BMW', '2026 BMW 4er-Reihe M440i xDrive Gran Coupé A', 'BMW1235'),
(30, 35, 'BMW', ' BMW X1', ' BMW X1777'),
(31, 35, 'Honda', 'City', 'HON123A'),
(32, 35, 'Honda', 'City', 'HON123B'),
(33, 35, 'Hyundai', 'Palisade', 'PAL8080'),
(34, 35, 'Hyundai', 'City', 'PA23213'),
(35, 35, 'Hyundai', 'Palisade', 'DDD123B'),
(36, 35, 'OLD CODE', 'OLD CODE', 'OLD CODE1212');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `fk_appointments_bay` (`bay_id`),
  ADD KEY `fk_appointments_mechanic` (`mechanic_id`);

--
-- Indexes for table `appointments_availability`
--
ALTER TABLE `appointments_availability`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment_availability`
--
ALTER TABLE `appointment_availability`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `available_date` (`available_date`);

--
-- Indexes for table `appointment_services`
--
ALTER TABLE `appointment_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointment_id` (`appointment_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `bays`
--
ALTER TABLE `bays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_log`
--
ALTER TABLE `inventory_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `job_order_id` (`job_order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `job_orders`
--
ALTER TABLE `job_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointment_id` (`appointment_id`),
  ADD KEY `mechanic_id` (`mechanic_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `quotation_id` (`quotation_id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_order_id` (`job_order_id`);

--
-- Indexes for table `quotation_products`
--
ALTER TABLE `quotation_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_id` (`quotation_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unavailable_dates`
--
ALTER TABLE `unavailable_dates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `date` (`date`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `appointments_availability`
--
ALTER TABLE `appointments_availability`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointment_availability`
--
ALTER TABLE `appointment_availability`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bays`
--
ALTER TABLE `bays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `inventory_log`
--
ALTER TABLE `inventory_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_orders`
--
ALTER TABLE `job_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `quotation_products`
--
ALTER TABLE `quotation_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `unavailable_dates`
--
ALTER TABLE `unavailable_dates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`),
  ADD CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `fk_appointments_bay` FOREIGN KEY (`bay_id`) REFERENCES `bays` (`id`),
  ADD CONSTRAINT `fk_appointments_mechanic` FOREIGN KEY (`mechanic_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `inventory_log`
--
ALTER TABLE `inventory_log`
  ADD CONSTRAINT `inventory_log_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `inventory` (`id`),
  ADD CONSTRAINT `inventory_log_ibfk_2` FOREIGN KEY (`job_order_id`) REFERENCES `job_orders` (`id`),
  ADD CONSTRAINT `inventory_log_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `job_orders`
--
ALTER TABLE `job_orders`
  ADD CONSTRAINT `job_orders_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`),
  ADD CONSTRAINT `job_orders_ibfk_2` FOREIGN KEY (`mechanic_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`);

--
-- Constraints for table `quotations`
--
ALTER TABLE `quotations`
  ADD CONSTRAINT `quotations_ibfk_1` FOREIGN KEY (`job_order_id`) REFERENCES `job_orders` (`id`);

--
-- Constraints for table `quotation_products`
--
ALTER TABLE `quotation_products`
  ADD CONSTRAINT `quotation_products_ibfk_1` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quotation_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `inventory` (`id`);

--
-- Constraints for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
