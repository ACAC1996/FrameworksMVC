-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para proybd
CREATE DATABASE IF NOT EXISTS `proybd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proybd`;

-- Volcando estructura para tabla proybd.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla proybd.categories: ~3 rows (aproximadamente)
INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Policial', 'Articulos policiales', '2023-03-20 01:40:50', '2023-03-20 01:40:50'),
	(2, 'Thriller', 'Posts de suspenso', '2023-03-20 03:18:48', '2023-03-20 03:18:48'),
	(3, 'Drama', 'Posts de drama', '2023-03-20 03:19:00', '2023-03-20 03:19:00');

-- Volcando estructura para tabla proybd.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla proybd.failed_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla proybd.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla proybd.migrations: ~9 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(76, '2013_03_19_180448_create_rols_table', 1),
	(77, '2014_10_12_000000_create_users_table', 1),
	(78, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(79, '2014_10_12_100000_create_password_resets_table', 1),
	(80, '2019_08_19_000000_create_failed_jobs_table', 1),
	(81, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(82, '2023_03_19_143850_create_categories_table', 1),
	(83, '2023_03_19_153840_create_posts_table', 1),
	(84, '2023_03_19_175200_create_post_images_table', 1);

-- Volcando estructura para tabla proybd.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla proybd.password_resets: ~0 rows (aproximadamente)

-- Volcando estructura para tabla proybd.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla proybd.password_reset_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla proybd.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla proybd.personal_access_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla proybd.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `category_id` bigint unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `state` enum('no_post','post') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_category_id_foreign` (`category_id`),
  CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla proybd.posts: ~3 rows (aproximadamente)
INSERT INTO `posts` (`id`, `name`, `category_id`, `description`, `state`, `created_at`, `updated_at`) VALUES
	(1, 'La venganza', 2, 'Novela de suspenso', 'post', '2023-03-20 03:19:19', '2023-03-20 03:19:19'),
	(2, 'Argentina', 1, 'Crimenes de Argentina', 'no_post', '2023-03-20 03:19:36', '2023-03-20 03:19:36'),
	(3, 'La estrafalaria', 3, 'Post de Amor', 'post', '2023-03-20 03:19:54', '2023-03-20 03:19:54');

-- Volcando estructura para tabla proybd.post_images
CREATE TABLE IF NOT EXISTS `post_images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla proybd.post_images: ~0 rows (aproximadamente)

-- Volcando estructura para tabla proybd.rols
CREATE TABLE IF NOT EXISTS `rols` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla proybd.rols: ~2 rows (aproximadamente)
INSERT INTO `rols` (`id`, `key`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Rol administrador', 'Tiene acceso a todo', NULL, NULL),
	(2, 'invitado', 'Rol Invitado', 'Tiene acceso solo a algunos modulos', NULL, NULL);

-- Volcando estructura para tabla proybd.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol_id` bigint unsigned NOT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_rol_id_foreign` (`rol_id`),
  CONSTRAINT `users_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `rols` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla proybd.users: ~7 rows (aproximadamente)
INSERT INTO `users` (`id`, `name`, `rol_id`, `nickname`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Tester_Rol', 1, 'Rol_Tester', 'tester_rol@gmail.com', NULL, '$2y$10$wqlh1hdx2.x836IYs1pboeBaPDNox8xUI8bu2eL0ECvNeXlBpFjom', NULL, '2023-03-20 00:41:59', '2023-03-20 00:41:59'),
	(2, 'Administrador', 1, 'admin_system', 'admin@admin.com', NULL, '12345678', NULL, '2023-03-20 01:43:24', '2023-03-20 01:43:24'),
	(4, 'Guest', 2, 'guest_system', 'gues@guest.com', NULL, '12345678', NULL, '2023-03-20 02:37:14', '2023-03-20 02:37:14'),
	(5, 'Invitado', 2, 'invitado_system', 'invitado@gmail.com', NULL, '12345678', NULL, '2023-03-20 02:43:48', '2023-03-20 02:43:48'),
	(6, 'Laravel', 1, 'laravel_guest', 'laravel@guest.com', NULL, '$2y$10$uhlhvFTqOTYC39eJQWIuSukAh35MKzAeDa1NFY6K2VmyWfyDI5gY6', NULL, '2023-03-20 02:51:27', '2023-03-20 02:51:27'),
	(7, 'Practivcante', 1, 'pract_guest', 'pract@guest.com', NULL, '$2y$10$P9Zh9.PmKcplPSF/DSgNQuMe3Mb3ntb/2EJMWSpORuLCodJlvjPLS', NULL, '2023-03-20 02:52:30', '2023-03-20 02:52:30'),
	(8, 'Rodolfo', 2, 'rodolf_inv', 'rodolf@guest.com', NULL, '$2y$10$KiU8pk7zzRW4bHsed54AVugD3qNeVamopOLqhvhc..FPmvc6IajnC', NULL, '2023-03-20 02:53:56', '2023-03-20 02:53:56');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
