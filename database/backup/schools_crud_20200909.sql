-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 09-09-2020 a las 08:08:03
-- Versión del servidor: 5.6.37
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jwt_vue`
--
CREATE DATABASE IF NOT EXISTS `jwt_vue` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `jwt_vue`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_09_01_081337_add_role_to_users_table', 2),
(5, '2020_09_02_111737_create_schools_table', 3),
(6, '2020_09_02_111810_create_students_table', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schools`
--

CREATE TABLE IF NOT EXISTS `schools` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `schools`
--

INSERT INTO `schools` (`id`, `name`, `address`, `logo`, `email`, `phone`, `website`, `created_at`, `updated_at`) VALUES
(1, 'Hickle-Thompson', '3898 Josiah Pine\nNorth Anthony, OH 45161', 'b970762a7073246f97b6e7339cb6c10f.jpg', 'xhahn@kreiger.net', '+13453028967', 'http://dietrich.com/dolores-accusantium-ullam-ut-quas-esse.html', '2020-09-09 06:03:50', '2020-09-09 06:03:50'),
(2, 'Rath-Abshire', '222 Hilpert Gardens\nJoesphberg, WY 23574-9617', 'da40f8abc2c7bb72533ff8fcd94dbf77.jpg', 'walsh.litzy@gmail.com', '427.275.0091', 'http://schmitt.com/sed-officia-est-voluptas-consequatur-quaerat-enim', '2020-09-09 06:03:50', '2020-09-09 06:03:50'),
(3, 'Huel Group', '57989 Zoey View\nLake Matteomouth, VT 51922', '1e03433af8221618777551a29e229c94.jpg', 'walter.hardy@sawayn.biz', '858.912.5536 x577', 'http://www.collier.org/nisi-fuga-magnam-ut-omnis-ut', '2020-09-09 06:03:50', '2020-09-09 06:03:50'),
(4, 'Waters PLC', '9553 Kaya Mountains Apt. 716\nWest Mariettaland, CT 26328-4698', 'e70738852709f8258903be230ad94df9.jpg', 'labadie.dulce@schumm.com', '248.493.1860', 'http://www.smitham.com/', '2020-09-09 06:03:50', '2020-09-09 06:03:50'),
(5, 'Leuschke-Shanahan', '454 DuBuque Street\nEberttown, NJ 52981', 'd36ca1b169565600c78d6d02704d1734.jpg', 'sandy.bartoletti@mosciski.info', '+15599502321', 'http://wunsch.com/neque-at-expedita-nulla-ducimus-atque', '2020-09-09 06:03:50', '2020-09-09 06:03:50'),
(6, 'Mraz, Oberbrunner and Feeney', '77015 Freddy Prairie\nGrantborough, CT 72343-2153', 'fa487c14074679130df4c35a51b1568e.jpg', 'jacobs.cordie@gmail.com', '825.488.1083 x8366', 'http://ryan.com/beatae-ea-est-omnis-voluptatem-et-rerum-qui-eius', '2020-09-09 06:03:50', '2020-09-09 06:03:50'),
(7, 'Abshire-Nolan', '78129 O''Reilly Mission\nNorth Lonstad, KS 92199-3254', '51a9c05bb277967af826d531aa7a83b7.jpg', 'harold.mohr@hotmail.com', '737-771-7915 x015', 'http://hermann.com/est-cum-rerum-corrupti-laboriosam-hic-consequatur-ut', '2020-09-09 06:03:50', '2020-09-09 06:03:50'),
(8, 'Parisian PLC', '105 Rudy Walks\nPort Lester, CA 06142', '3e259efe2b7e88d62a903df9c5c0d00a.jpg', 'montana.von@dubuque.com', '834.212.4065 x2978', 'https://www.block.com/magnam-enim-maxime-illum-asperiores-deleniti-vel', '2020-09-09 06:03:50', '2020-09-09 06:03:50'),
(9, 'Hodkiewicz LLC', '48504 Candice Track Apt. 049\nSengerport, AK 28220', 'fcf70c04f8803b72d2432352bb261335.jpg', 'qbeatty@yahoo.com', '(871) 355-9031', 'http://buckridge.com/error-totam-dignissimos-aut-accusamus-impedit', '2020-09-09 06:03:50', '2020-09-09 06:03:50'),
(10, 'Wiegand PLC', '45107 Jodie Rest\nNorth Biankashire, MT 40284', 'aecc843be4d993d5ec5ee6703749c0f1.jpg', 'johnston.javon@mueller.biz', '1-536-885-4843', 'http://little.com/et-sed-modi-et-animi-voluptatum-dicta', '2020-09-09 06:03:50', '2020-09-09 06:03:50'),
(11, 'Sawayn Group', '68018 Grimes Streets Apt. 556\nPort Fae, DC 32858-9239', '029dabb9a50b3965aee2ed1cd69996eb.jpg', 'penelope.kreiger@gmail.com', '687-700-4789 x73612', 'https://www.ritchie.info/itaque-qui-cupiditate-pariatur-suscipit', '2020-09-09 06:03:50', '2020-09-09 06:03:50'),
(12, 'Dach-Howe', '85626 Roob Tunnel\nJeraldfurt, NM 59268', 'd25c384adb2785438cd5787e89250f37.jpg', 'colleen54@yahoo.com', '330.861.8070', 'http://www.rempel.com/id-aliquam-quia-est-libero-iste-modi', '2020-09-09 06:03:50', '2020-09-09 06:03:50'),
(13, 'Veum, Koch and Walsh', '348 Morar Springs\nSouth Woodrowfurt, NC 25146-3611', '5a8130e8754f4221192e1ee8497ec18d.jpg', 'nolan.judson@oconner.com', '597-366-4500 x681', 'http://balistreri.net/nihil-repellat-voluptatem-amet-praesentium-quis.html', '2020-09-09 06:03:50', '2020-09-09 06:03:50'),
(14, 'Murazik-Aufderhar', '7829 Hane Center Apt. 979\nPort Edgar, SC 18132', 'eb165fd208cb7789ebd3ee498ebea775.jpg', 'turner.dewitt@shields.biz', '834.927.4093 x29596', 'http://damore.biz/perspiciatis-voluptatem-veniam-ea-tempora', '2020-09-09 06:03:50', '2020-09-09 06:03:50'),
(15, 'Connelly Inc', '4670 Winona Neck\nMillieville, AK 47192-0895', '3ef11a8878ff91f4e8682f7bb697e1f8.jpg', 'rippin.chase@gmail.com', '(837) 395-2685', 'https://www.botsford.info/vel-sint-cum-harum-sunt-quibusdam-autem', '2020-09-09 06:03:50', '2020-09-09 06:03:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `students`
--

INSERT INTO `students` (`id`, `name`, `surname`, `birthdate`, `city`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 'Katarina', 'Berge', '1991-06-01', 'Westleystad', 2, '2020-09-09 06:03:50', '2020-09-09 06:03:50'),
(2, 'Alysha', 'Wolf', '2019-10-15', 'Haleyview', 9, '2020-09-09 06:03:50', '2020-09-09 06:03:50'),
(3, 'Pierce', 'Schaden', '1999-05-20', 'Uliseschester', 1, '2020-09-09 06:03:50', '2020-09-09 06:03:50'),
(4, 'Francesco', 'Gerhold', '2014-12-04', 'Lake Tremayneport', 11, '2020-09-09 06:03:50', '2020-09-09 06:03:50'),
(5, 'Brett', 'O''Hara', '1998-08-30', 'Lake Marlee', 6, '2020-09-09 06:03:50', '2020-09-09 06:03:50'),
(6, 'Jamaal', 'Bednar', '2018-08-25', 'South Aditya', 14, '2020-09-09 06:03:50', '2020-09-09 06:03:50'),
(7, 'Eric', 'Rodriguez', '2011-07-11', 'East Ernamouth', 12, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(8, 'Pasquale', 'Dare', '1996-01-30', 'West Geoffrey', 12, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(9, 'Krystel', 'Paucek', '1996-11-05', 'Wolfmouth', 7, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(10, 'Santino', 'West', '2006-07-09', 'Zelmafurt', 10, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(11, 'Allison', 'Mills', '2010-11-26', 'West Elsastad', 13, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(12, 'Thad', 'Dach', '2012-07-12', 'New Maegan', 12, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(13, 'Natalie', 'Goyette', '1992-04-26', 'Mannhaven', 2, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(14, 'Mathias', 'Morissette', '2012-02-07', 'East Lomashire', 1, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(15, 'Cornelius', 'Thiel', '2004-06-11', 'West Branson', 1, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(16, 'Manuela', 'Okuneva', '2018-05-13', 'West Francisco', 13, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(17, 'Carlotta', 'Williamson', '1996-02-23', 'Jerelport', 10, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(18, 'Osbaldo', 'Trantow', '1991-08-13', 'East Deshawn', 11, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(19, 'Mariam', 'Rau', '2010-06-04', 'West Khalid', 7, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(20, 'Therese', 'Stamm', '2006-11-15', 'Aronfort', 4, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(21, 'Ashlee', 'Littel', '2019-11-26', 'Lake Genevieve', 3, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(22, 'Marie', 'Conroy', '2010-05-05', 'Lilianahaven', 13, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(23, 'Janick', 'Christiansen', '1999-10-28', 'Stokesside', 6, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(24, 'Xzavier', 'Haag', '1999-03-26', 'West Jaden', 13, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(25, 'Halie', 'Buckridge', '2013-09-15', 'Jacobsonstad', 2, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(26, 'Golda', 'Schmitt', '2018-02-19', 'East Trevorberg', 8, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(27, 'Wilson', 'Murray', '1997-09-06', 'East Dina', 2, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(28, 'Darrick', 'Weimann', '2005-03-29', 'Larsonborough', 1, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(29, 'Deion', 'Schmidt', '2002-01-27', 'Port Bernie', 13, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(30, 'Mallie', 'Haag', '2020-07-16', 'Lake Dejah', 15, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(31, 'Vivian', 'Stark', '2004-05-08', 'Clemensbury', 11, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(32, 'Skylar', 'Bartoletti', '1995-11-09', 'Stoltenbergtown', 4, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(33, 'Zelma', 'Schmidt', '1993-11-22', 'New Stuart', 13, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(34, 'Jermain', 'Mitchell', '2014-02-26', 'West Justenville', 1, '2020-09-09 06:03:51', '2020-09-09 06:03:51'),
(35, 'Devante', 'Welch', '1996-01-21', 'Bashirianchester', 4, '2020-09-09 06:03:52', '2020-09-09 06:03:52'),
(36, 'Aidan', 'Bednar', '2010-10-13', 'Myleneshire', 10, '2020-09-09 06:03:52', '2020-09-09 06:03:52'),
(37, 'Asa', 'Brekke', '1992-11-13', 'South Hudsontown', 11, '2020-09-09 06:03:52', '2020-09-09 06:03:52'),
(38, 'Anissa', 'Kerluke', '2007-08-28', 'West Javier', 7, '2020-09-09 06:03:52', '2020-09-09 06:03:52'),
(39, 'Alia', 'Friesen', '1994-12-11', 'Port Karlland', 15, '2020-09-09 06:03:52', '2020-09-09 06:03:52'),
(40, 'Donny', 'Douglas', '2013-06-28', 'Ornview', 11, '2020-09-09 06:03:52', '2020-09-09 06:03:52'),
(41, 'Kraig', 'Ratke', '2007-07-01', 'Faheyport', 8, '2020-09-09 06:03:52', '2020-09-09 06:03:52'),
(42, 'Joanny', 'Hodkiewicz', '2010-06-27', 'West Johathanborough', 15, '2020-09-09 06:03:52', '2020-09-09 06:03:52'),
(43, 'Brock', 'Botsford', '2003-12-13', 'Rogahnchester', 5, '2020-09-09 06:03:52', '2020-09-09 06:03:52'),
(44, 'Vern', 'Gibson', '1995-12-14', 'North Vergie', 6, '2020-09-09 06:03:52', '2020-09-09 06:03:52'),
(45, 'Antonietta', 'Hickle', '2017-08-07', 'Vivianemouth', 6, '2020-09-09 06:03:52', '2020-09-09 06:03:52'),
(46, 'Kaylie', 'Langworth', '1994-07-24', 'Labadiechester', 13, '2020-09-09 06:03:52', '2020-09-09 06:03:52'),
(47, 'Annette', 'Mante', '2012-01-01', 'West Kelsiechester', 6, '2020-09-09 06:03:52', '2020-09-09 06:03:52'),
(48, 'Rasheed', 'Jacobson', '1996-09-17', 'South Corenefort', 4, '2020-09-09 06:03:52', '2020-09-09 06:03:52'),
(49, 'Darrin', 'Welch', '2011-04-19', 'Spinkafurt', 13, '2020-09-09 06:03:52', '2020-09-09 06:03:52'),
(50, 'Tate', 'Wiegand', '1993-05-18', 'East Claudiehaven', 8, '2020-09-09 06:03:52', '2020-09-09 06:03:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','user','guest') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(2, 'Admin', 'admin@admin.com', NULL, '$2y$10$3avP.nK7d1AbGsXdocQh3eIDYXsAYRlRAUbji/xnIPDae72CBk7e.', NULL, '2020-09-01 06:49:40', '2020-09-01 06:49:40', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_school_id_foreign` (`school_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `schools`
--
ALTER TABLE `schools`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
