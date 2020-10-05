-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Sep 22, 2020 at 06:49 PM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `homestead`
--

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int(10) UNSIGNED DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`id`, `name`, `email`, `state_id`, `city`, `zip`, `amount`, `source`, `created_at`, `updated_at`) VALUES
(1, 'jj', 'jay@test.com', 5, 'CA', '234', '3435.00', 'xyz', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meeting`
--

CREATE TABLE `meeting` (
  `id` int(10) UNSIGNED NOT NULL,
  `meetingId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `moderatorAccessCode` varchar(5) COLLATE utf8_unicode_ci DEFAULT '1',
  `attendeeAccessCode` varchar(5) COLLATE utf8_unicode_ci DEFAULT '1',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `welcomeText` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Welcome to this webmeeting.',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(7, '2018_09_29_135814_create_states_table', 2),
(8, '2018_11_10_003037_create_settings_table', 2),
(9, '2018_11_10_042622_create_donations_table', 2),
(10, '2018_11_12_220319_create_notifications_table', 2),
(11, '2019_08_19_000000_create_failed_jobs_table', 3),
(12, '2020_06_23_171825_create_posts_table', 3),
(13, '2015_06_26_145557_create_meeting_table', 4),
(14, '2015_08_14_113317_changePasswordFields', 4),
(15, '2015_08_14_140604_changeAccessCodeStorage', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `like` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(10) UNSIGNED NOT NULL,
  `abbreviation` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `abbreviation`, `name`, `is_visible`, `updated_at`) VALUES
(1, 'AL', 'Alabama', 0, '2020-06-24 14:22:10'),
(2, 'AK', 'Alaska', 0, '2020-06-24 14:22:10'),
(3, 'AZ', 'Arizona', 0, '2020-06-24 14:22:10'),
(4, 'AR', 'Arkansas', 0, '2020-06-24 14:22:10'),
(5, 'CA', 'California', 0, '2020-06-24 10:27:07'),
(6, 'CO', 'Colorado', 0, '2020-06-24 14:22:10'),
(7, 'CT', 'Connecticut', 0, '2020-06-24 14:22:10'),
(8, 'DC', 'Washington D.C.', 0, '2020-06-24 14:22:10'),
(9, 'DE', 'Delaware', 0, '2020-06-24 14:22:10'),
(10, 'FL', 'Florida', 0, '2020-06-24 14:22:10'),
(11, 'GA', 'Georgia', 0, '2020-06-24 14:22:10'),
(12, 'HI', 'Hawaii', 0, '2020-06-24 14:22:10'),
(13, 'ID', 'Idaho', 0, '2020-06-24 14:22:10'),
(14, 'IL', 'Illinois', 0, '2020-06-24 14:22:10'),
(15, 'IN', 'Indiana', 0, '2020-06-24 14:22:10'),
(16, 'IA', 'Iowa', 0, '2020-06-24 14:22:10'),
(17, 'KS', 'Kansas', 0, '2020-06-24 14:22:10'),
(18, 'KY', 'Kentucky', 0, '2020-06-24 14:22:10'),
(19, 'LA', 'Louisiana', 0, '2020-06-24 14:22:10'),
(20, 'ME', 'Maine', 0, '2020-06-24 14:22:10'),
(21, 'MD', 'Maryland', 0, '2020-06-24 14:22:10'),
(22, 'MA', 'Massachusetts', 0, '2020-06-24 14:22:10'),
(23, 'MI', 'Michigan', 0, '2020-06-24 14:22:10'),
(24, 'MN', 'Minnesota', 0, '2020-06-24 14:22:10'),
(25, 'MS', 'Mississippi', 0, '2020-06-24 14:22:10'),
(26, 'MO', 'Missouri', 0, '2020-06-24 14:22:10'),
(27, 'MT', 'Montana', 0, '2020-06-24 14:22:10'),
(28, 'NE', 'Nebraska', 0, '2020-06-24 14:22:10'),
(29, 'NV', 'Nevada', 0, '2020-06-24 14:22:10'),
(30, 'NH', 'New Hampshire', 0, '2020-06-24 14:22:10'),
(31, 'NJ', 'New Jersey', 0, '2020-06-24 14:22:10'),
(32, 'NM', 'New Mexico', 0, '2020-06-24 14:22:10'),
(33, 'NY', 'New York', 0, '2020-06-24 14:22:10'),
(34, 'NC', 'North Carolina', 0, '2020-06-24 14:22:10'),
(35, 'ND', 'North Dakota', 0, '2020-06-24 14:22:10'),
(36, 'OH', 'Ohio', 0, '2020-06-24 14:22:10'),
(37, 'OK', 'Oklahoma', 0, '2020-06-24 14:22:10'),
(38, 'OR', 'Oregon', 0, '2020-06-24 14:22:10'),
(39, 'PA', 'Pennsylvania', 0, '2020-06-24 14:22:10'),
(40, 'RI', 'Rhode Island', 0, '2020-06-24 14:22:10'),
(41, 'SC', 'South Carolina', 0, '2020-06-24 14:22:10'),
(42, 'SD', 'South Dakota', 0, '2020-06-24 14:22:10'),
(43, 'TN', 'Tennessee', 0, '2020-06-24 14:22:10'),
(44, 'TX', 'Texas', 0, '2020-06-24 14:22:10'),
(45, 'UT', 'Utah', 0, '2020-06-24 14:22:10'),
(46, 'VT', 'Vermont', 0, '2020-06-24 14:22:10'),
(47, 'VA', 'Virginia', 0, '2020-06-24 14:22:10'),
(48, 'WA', 'Washington', 0, '2020-06-24 14:22:10'),
(49, 'WV', 'West Virginia', 0, '2020-06-24 14:22:10'),
(50, 'WI', 'Wisconsin', 0, '2020-06-24 14:22:10'),
(51, 'WY', 'Wyoming', 0, '2020-06-24 14:22:10');

-- --------------------------------------------------------

--
-- Table structure for table `training_positions`
--

CREATE TABLE `training_positions` (
  `id` int(11) NOT NULL,
  `pharmacy_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `last_apply_date` date DEFAULT NULL,
  `is_visible` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `training_positions`
--

INSERT INTO `training_positions` (`id`, `pharmacy_id`, `title`, `last_apply_date`, `is_visible`, `created_at`, `updated_at`) VALUES
(1, 5, 'Pharma', '2020-06-27', 1, '2020-06-22 16:44:04', '2020-06-22 18:10:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `number` text COLLATE utf8mb4_unicode_ci,
  `location` text COLLATE utf8mb4_unicode_ci,
  `area` text COLLATE utf8mb4_unicode_ci,
  `city` text COLLATE utf8mb4_unicode_ci,
  `cv_path` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `type`, `number`, `location`, `area`, `city`, `cv_path`) VALUES
(1, 'admin', 'admin@admin.com', NULL, '$2y$10$KMO2/bImJZrHfCWTBPQUL.8WIXZWoLmcdffrF6E8l./cvFmgG7Q/O', 'dNOQO4eMAE75AJFlDZCDFgURNPoCRIlbVL4u7xqZZqIe058WAbmKLJwRuCMF', '2020-06-21 20:39:16', '2020-06-21 20:39:16', 1, NULL, NULL, NULL, NULL, '0'),
(3, 'Test Trainee', 'trainee@test.com', NULL, '$2y$10$rokjleOooLnM0aqKxwRFA.cHdMYprkfbcaOAJqBNRCDNSvbeJ1h1K', '8NBAWs3sSMv76pQr9FbgZSEiprBBXS27nTh4tsFbBgjwqPrP8ICHMe2qVB2Z', '2020-06-22 12:46:34', '2020-06-22 12:46:34', 3, '123456', NULL, NULL, NULL, '0'),
(6, 'Jay jay', 'jay@test.com', NULL, '$2y$10$x0RH2OMdis0ivwiHIgh8VO7xWji8Ws.tduYJkw/g7Gxrkn4nn6rsO', 'le1qTfjP169l3c9JtYvmIj7nMaVhT62cgn51RzBHOfNdhOALBgdwzCZkrZZw', '2020-06-22 20:47:32', '2020-06-22 23:01:40', 3, '78787878', NULL, NULL, NULL, 'cv_78787878_profile.pdf'),
(9, 'test Pharama', 'testpharma2@test.com', NULL, '$2y$10$Ti3affbHgJWndSIvUWikD.BRUMU.qrsxixzm3AWOmzNXXMd7F/H9W', 'JOGJZK6W4fCETyq2ihUBT7Y6TgT0pCt3MPojceeGFNTxvrAkDqOCkXdsE9JX', '2020-06-25 07:33:06', '2020-06-25 07:33:06', 2, '5745657', 'xyz', 'zyx', 'Az-Zarqa', NULL),
(10, 'Test Pharma', 'tt@tt.co,', NULL, '$2y$10$40DAES0EHOgof.Tl8Fxw5OZHDYtZvWIQic7nJFyVXe1U1BRb5OEpK', NULL, '2020-06-25 08:05:57', '2020-06-25 08:05:57', NULL, '546789', NULL, 'zyx', 'Al-Balqa', NULL),
(11, 'Jay jayyy', 'tt@tt.com', NULL, '$2y$10$1ILg2b9plqzIRIBuDUDJ3eUmOGDR0taV839MpvsJKB4tBnlxQ./0C', NULL, '2020-06-25 08:06:53', '2020-06-25 08:06:53', NULL, '54678i989', NULL, 'zyx', 'At-Tafilah', NULL),
(12, 'Jay jayyy', 'jo@jo.com', NULL, '$2y$10$8AoVg9XIyqym6y1cIdIiJ.3UmC8QqLIgCYNMxJqDdR3RpIt6GF9DG', NULL, '2020-06-25 08:15:10', '2020-06-25 08:15:10', 2, '4096096905u096', NULL, NULL, NULL, NULL),
(13, 'hyh', 'anaamnizami@outlook.com', NULL, '$2y$10$pKmvQ2GdGg3u.ytka249p.98r618M4x8F.MFIXglBzq2TWQxvxQLm', NULL, '2020-06-25 08:16:58', '2020-06-25 08:16:58', 2, '65675768688999', NULL, NULL, NULL, NULL),
(14, 'nfnghn', 'tt@ty.com', NULL, '$2y$10$NaQYkw/RUMeIjW.sdeyjR.aEb73qDej1p9K/f9zQaW1lCwWiyQPNy', NULL, '2020-06-25 08:18:32', '2020-06-25 08:18:32', 2, '99999999', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_trainings`
--

CREATE TABLE `user_trainings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `training_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_trainings`
--

INSERT INTO `user_trainings` (`id`, `user_id`, `training_id`, `status`, `created_at`, `updated_at`) VALUES
(2, 6, 1, 0, '2020-06-23 10:13:31', '2020-06-23 00:39:22'),
(3, 3, 1, 0, '2020-06-23 10:15:52', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meeting`
--
ALTER TABLE `meeting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `meeting_meetingid_unique` (`meetingId`),
  ADD KEY `meeting_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `states_abbreviation_unique` (`abbreviation`),
  ADD UNIQUE KEY `states_name_unique` (`name`);

--
-- Indexes for table `training_positions`
--
ALTER TABLE `training_positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_trainings`
--
ALTER TABLE `user_trainings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meeting`
--
ALTER TABLE `meeting`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `training_positions`
--
ALTER TABLE `training_positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_trainings`
--
ALTER TABLE `user_trainings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `meeting`
--
ALTER TABLE `meeting`
  ADD CONSTRAINT `meeting_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
