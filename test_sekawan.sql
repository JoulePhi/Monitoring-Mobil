-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 23, 2023 at 02:56 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_sekawan`
--

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int NOT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `name`, `age`, `gender`, `created_at`, `updated_at`, `is_available`) VALUES
(1, 'Driver 1', 22, 'male', NULL, '2023-11-22 19:20:21', 0),
(2, 'Driver 2', 45, 'male', NULL, '2023-11-22 09:32:26', 1),
(3, 'Driver 3', 45, 'male', NULL, '2023-11-22 09:31:36', 1),
(4, 'Driver 4', 45, 'male', NULL, '2023-11-22 19:21:22', 0),
(5, 'Driver 5', 45, 'male', NULL, '2023-11-22 08:43:19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_11_21_052455_add_roles_to_users_table', 1),
(6, '2023_11_21_063331_create_vehicles_table', 1),
(7, '2023_11_21_064054_create_reservations_table', 1),
(8, '2023_11_21_064333_create_drivers_table', 1),
(9, '2023_11_21_070929_change_roles_to_users_table', 1),
(10, '2023_11_21_130201_add_is_available_column_to_drivers_table', 2),
(11, '2023_11_21_130517_add_is_available_column_to_vehicles_table', 3),
(12, '2023_11_21_133819_add_timestamps_column_to_reservations_table', 4),
(16, '2023_11_22_014148_change_role_to_users_table', 5),
(18, '2023_11_22_053737_change_approval_type_to_reservations_table', 6),
(19, '2023_11_22_064906_add_is_done_to_reservations_table', 7),
(20, '2023_11_22_065035_create_vehicles_usage', 7),
(23, '2023_11_22_115054_change_structure_on_reservations_table', 8),
(24, '2023_11_22_152909_change_date_type_to_vehicles_usage_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `driver_id` bigint NOT NULL,
  `vehicle_id` bigint NOT NULL,
  `aprroval1` enum('aprroved','rejected','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `aprroval2` enum('aprroved','rejected','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `approval1_id` bigint NOT NULL,
  `approval2_id` bigint NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL,
  `reservation_date` datetime DEFAULT NULL,
  `is_done` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `user_id`, `driver_id`, `vehicle_id`, `aprroval1`, `aprroval2`, `approval1_id`, `approval2_id`, `status`, `reservation_date`, `is_done`, `created_at`, `updated_at`) VALUES
(20, 1, 1, 1, 'aprroved', 'aprroved', 4, 5, 'approved', '2023-11-22 16:19:07', '2023-11-22 16:32:21', '2023-11-22 09:19:07', '2023-11-22 09:32:21'),
(21, 8, 2, 2, 'rejected', 'rejected', 6, 12, 'rejected', '2023-11-22 16:24:11', '2023-11-22 16:32:26', '2023-11-22 09:24:11', '2023-11-22 09:32:26'),
(22, 9, 3, 3, 'aprroved', 'rejected', 12, 6, 'rejected', '2023-11-22 16:29:39', '2023-11-22 16:31:36', '2023-11-22 09:29:39', '2023-11-22 09:31:36'),
(23, 8, 1, 3, 'pending', 'aprroved', 5, 4, 'pending', '2023-11-23 02:20:20', NULL, '2023-11-22 19:20:20', '2023-11-22 19:55:39'),
(24, 10, 4, 1, 'pending', 'pending', 12, 6, 'pending', '2023-11-23 02:21:22', NULL, '2023-11-22 19:21:22', '2023-11-22 19:21:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('USER','ADMIN','APPROVAL','OTHER') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'User 1', 'user1@mail.com', NULL, '$2y$10$TAkvcVzoZIXF8SLf/lulOeFFKTZmyXv3Xt7LcpF89OkML1/8I91Xy', NULL, NULL, NULL, 'USER'),
(2, 'Admin', 'admin@mail.com', NULL, '$2y$10$TAkvcVzoZIXF8SLf/lulOeFFKTZmyXv3Xt7LcpF89OkML1/8I91Xy', 'OKL8y2KzsNVcNMKL2r0qmUSfFZaq6JKDGVpGb1DZT6l8GUl5AEIxp1tflq56', NULL, NULL, 'ADMIN'),
(4, 'atasan 1', 'atasan1@mail.com', NULL, '$2y$10$CJy/9jFdVHaXKruQxBJb5e1tZ57VN65.wJAHfueKZHxCEb19FYPTq', NULL, NULL, NULL, 'APPROVAL'),
(5, 'atasan 2', 'atasan2@mail.com', NULL, '$2y$10$CJy/9jFdVHaXKruQxBJb5e1tZ57VN65.wJAHfueKZHxCEb19FYPTq', NULL, NULL, NULL, 'APPROVAL'),
(6, 'atasan 3', 'atasan3@mail.com', NULL, '$2y$10$CJy/9jFdVHaXKruQxBJb5e1tZ57VN65.wJAHfueKZHxCEb19FYPTq', NULL, NULL, NULL, 'APPROVAL'),
(8, 'User 2', 'user2@mail.com', NULL, '$2y$10$TAkvcVzoZIXF8SLf/lulOeFFKTZmyXv3Xt7LcpF89OkML1/8I91Xy', NULL, NULL, NULL, 'USER'),
(9, 'User 3', 'user3@mail.com', NULL, '$2y$10$TAkvcVzoZIXF8SLf/lulOeFFKTZmyXv3Xt7LcpF89OkML1/8I91Xy', NULL, NULL, NULL, 'USER'),
(10, 'User 4', 'user4@mail.com', NULL, '$2y$10$TAkvcVzoZIXF8SLf/lulOeFFKTZmyXv3Xt7LcpF89OkML1/8I91Xy', NULL, NULL, NULL, 'USER'),
(12, 'atasan 4', 'atasan4@mail.com', NULL, '$2y$10$CJy/9jFdVHaXKruQxBJb5e1tZ57VN65.wJAHfueKZHxCEb19FYPTq', NULL, NULL, NULL, 'APPROVAL');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `license_plate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('angkutan_orang','angkutan_barang') COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` enum('perusahaan','penyewaan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `fuel_consumption` double(5,2) NOT NULL,
  `service_schedule` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `name`, `license_plate`, `image`, `type`, `owner`, `fuel_consumption`, `service_schedule`, `created_at`, `updated_at`, `is_available`) VALUES
(1, 'Vehicle 1', 'A 5235 IO', 'https://blog-media.lifepal.co.id/app/uploads/sites/3/2021/10/11135832/harga-mobil-pick-up-bekas.jpg', 'angkutan_barang', 'penyewaan', 76.00, '2023-11-29 19:38:11', NULL, '2023-11-22 19:21:22', 0),
(2, 'Vehicle 2', 'C 7011 UG', 'https://mobility.agungrent.co.id/wp-content/uploads/2023/03/DSC_0094-1200x802.jpg', 'angkutan_orang', 'perusahaan', 55.00, '2023-11-29 19:38:11', NULL, '2023-11-22 09:32:26', 1),
(3, 'Vehicle 3', 'G 1241 AD', 'https://images.autofun.co.id/file1/82cd3941e2b1453d91826adfe69864ac_800.jpg', 'angkutan_barang', 'perusahaan', 95.00, '2023-11-29 19:38:11', NULL, '2023-11-22 19:20:21', 0),
(4, 'Vehicle 4', 'J 7971 CO', 'https://s3.ap-southeast-1.amazonaws.com/moladin.assets/blog/wp-content/uploads/2022/08/12133740/Alphard-Turbo-2023.jpg', 'angkutan_orang', 'perusahaan', 0.00, '2023-11-29 19:38:11', NULL, '2023-11-22 08:43:19', 1),
(5, 'Vehicle 5', 'H 1436 GA', 'https://s.garasi.id/c1200x675/q99/article/fe058486-e15f-410a-9f86-461d719f20b5.jpeg', 'angkutan_orang', 'penyewaan', 0.00, '2023-11-29 19:38:11', NULL, '2023-11-22 08:43:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles_usage`
--

CREATE TABLE `vehicles_usage` (
  `id` bigint UNSIGNED NOT NULL,
  `vehicle_id` bigint NOT NULL,
  `usage_date` date NOT NULL,
  `usage_count` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicles_usage`
--

INSERT INTO `vehicles_usage` (`id`, `vehicle_id`, `usage_date`, `usage_count`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-11-22', 15, '2023-11-22 02:50:08', '2023-11-22 09:29:39'),
(6, 4, '2023-11-20', 9, '2023-11-22 02:50:08', '2023-11-22 02:51:32'),
(7, 4, '2023-11-21', 6, '2023-11-22 02:50:08', '2023-11-22 02:51:32'),
(8, 1, '2023-11-15', 2, '2023-11-22 02:50:08', '2023-11-22 02:51:32'),
(9, 2, '2023-11-14', 6, '2023-11-22 02:50:08', '2023-11-22 02:51:32'),
(10, 3, '2023-11-13', 1, '2023-11-22 02:50:08', '2023-11-22 02:51:32'),
(11, 4, '2023-11-12', 8, '2023-11-22 02:50:08', '2023-11-22 02:51:32'),
(12, 4, '2023-11-11', 5, '2023-11-22 02:50:08', '2023-11-22 02:51:32'),
(13, 4, '2023-11-10', 3, '2023-11-22 02:50:08', '2023-11-22 02:51:32'),
(14, 4, '2023-11-09', 8, '2023-11-22 02:50:08', '2023-11-22 02:51:32'),
(15, 4, '2023-11-16', 9, '2023-11-22 02:50:08', '2023-11-22 02:51:32'),
(16, 4, '2023-11-07', 3, '2023-11-22 02:50:08', '2023-11-22 02:51:32'),
(17, 4, '2023-11-17', 5, '2023-11-22 02:50:08', '2023-11-22 02:51:32'),
(18, 4, '2023-11-18', 2, '2023-11-22 02:50:08', '2023-11-22 02:51:32'),
(19, 4, '2023-11-19', 7, '2023-11-22 02:50:08', '2023-11-22 02:51:32'),
(22, 3, '2023-11-23', 2, '2023-11-22 19:20:21', '2023-11-22 19:21:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles_usage`
--
ALTER TABLE `vehicles_usage`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vehicles_usage`
--
ALTER TABLE `vehicles_usage`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
