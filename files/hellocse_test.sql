-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 14 jan. 2021 à 15:30
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `hellocse_test`
--

-- --------------------------------------------------------

--
-- Structure de la table `activations`
--

DROP TABLE IF EXISTS `activations`;
CREATE TABLE IF NOT EXISTS `activations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
CREATE TABLE IF NOT EXISTS `email_log` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` text COLLATE utf8mb4_unicode_ci,
  `attachments` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `laravel2step`
--

DROP TABLE IF EXISTS `laravel2step`;
CREATE TABLE IF NOT EXISTS `laravel2step` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `authCode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authCount` int(11) NOT NULL,
  `authStatus` tinyint(1) NOT NULL DEFAULT '0',
  `authDate` datetime DEFAULT NULL,
  `requestDate` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `laravel2step_userid_index` (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `laravel_blocker`
--

DROP TABLE IF EXISTS `laravel_blocker`;
CREATE TABLE IF NOT EXISTS `laravel_blocker` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `typeId` int(10) UNSIGNED NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `userId` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `laravel_blocker_value_unique` (`value`),
  KEY `laravel_blocker_typeid_index` (`typeId`),
  KEY `laravel_blocker_userid_index` (`userId`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `laravel_blocker`
--

INSERT INTO `laravel_blocker` (`id`, `typeId`, `value`, `note`, `userId`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 'test.com', 'Block all domains/emails @test.com', NULL, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(2, 3, 'test.ca', 'Block all domains/emails @test.ca', NULL, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(3, 3, 'fake.com', 'Block all domains/emails @fake.com', NULL, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(4, 3, 'example.com', 'Block all domains/emails @example.com', NULL, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(5, 3, 'mailinator.com', 'Block all domains/emails @mailinator.com', NULL, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `laravel_blocker_types`
--

DROP TABLE IF EXISTS `laravel_blocker_types`;
CREATE TABLE IF NOT EXISTS `laravel_blocker_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `laravel_blocker_types_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `laravel_blocker_types`
--

INSERT INTO `laravel_blocker_types` (`id`, `slug`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'email', 'E-mail', '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(2, 'ipAddress', 'IP Address', '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(3, 'domain', 'Domain Name', '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(4, 'user', 'User', '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(5, 'city', 'City', '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(6, 'state', 'State', '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(7, 'country', 'Country', '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(8, 'countryCode', 'Country Code', '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(9, 'continent', 'Continent', '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(10, 'region', 'Region', '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `laravel_logger_activity`
--

DROP TABLE IF EXISTS `laravel_logger_activity`;
CREATE TABLE IF NOT EXISTS `laravel_logger_activity` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `userType` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `route` longtext COLLATE utf8mb4_unicode_ci,
  `ipAddress` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userAgent` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` longtext COLLATE utf8mb4_unicode_ci,
  `methodType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=460 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `laravel_logger_activity`
--

INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Logged In', 'Registered', 2, 'http://localhost:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'POST', '2021-01-13 11:42:28', '2021-01-13 11:42:28', NULL),
(2, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 11:42:29', '2021-01-13 11:42:29', NULL),
(3, 'Logged In', 'Registered', 2, 'http://localhost:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'POST', '2021-01-13 14:21:48', '2021-01-13 14:21:48', NULL),
(4, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 14:21:49', '2021-01-13 14:21:49', NULL),
(5, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 14:38:17', '2021-01-13 14:38:17', NULL),
(6, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 14:38:30', '2021-01-13 14:38:30', NULL),
(7, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 14:38:45', '2021-01-13 14:38:45', NULL),
(8, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 14:46:45', '2021-01-13 14:46:45', NULL),
(9, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 14:47:12', '2021-01-13 14:47:12', NULL),
(10, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 14:47:58', '2021-01-13 14:47:58', NULL),
(11, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 14:48:19', '2021-01-13 14:48:19', NULL),
(12, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 14:48:43', '2021-01-13 14:48:43', NULL),
(13, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 14:51:21', '2021-01-13 14:51:21', NULL),
(14, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 14:53:52', '2021-01-13 14:53:52', NULL),
(15, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 14:54:42', '2021-01-13 14:54:42', NULL),
(16, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 14:56:59', '2021-01-13 14:56:59', NULL),
(17, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 14:57:28', '2021-01-13 14:57:28', NULL),
(18, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 14:58:21', '2021-01-13 14:58:21', NULL),
(19, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 14:59:31', '2021-01-13 14:59:31', NULL),
(20, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 14:59:31', '2021-01-13 14:59:31', NULL),
(21, 'Logged Out', 'Registered', 2, 'http://localhost:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-13 14:59:39', '2021-01-13 14:59:39', NULL),
(22, 'Logged In', 'Registered', 1, 'http://localhost:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'POST', '2021-01-13 14:59:50', '2021-01-13 14:59:50', NULL),
(23, 'Viewed home', 'Registered', 1, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 14:59:50', '2021-01-13 14:59:50', NULL),
(24, 'Viewed home', 'Registered', 1, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 15:00:14', '2021-01-13 15:00:14', NULL),
(25, 'Viewed home', 'Registered', 1, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 15:00:48', '2021-01-13 15:00:48', NULL),
(26, 'Logged Out', 'Registered', 1, 'http://localhost:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-13 15:00:51', '2021-01-13 15:00:51', NULL),
(27, 'Logged In', 'Registered', 2, 'http://localhost:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'POST', '2021-01-13 15:01:07', '2021-01-13 15:01:07', NULL),
(28, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 15:01:08', '2021-01-13 15:01:08', NULL),
(29, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 15:02:28', '2021-01-13 15:02:28', NULL),
(30, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 15:03:54', '2021-01-13 15:03:54', NULL),
(31, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 15:06:18', '2021-01-13 15:06:18', NULL),
(32, 'Created getAllArchives', 'Registered', 2, 'http://localhost:8000/getAllArchives', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-13 15:06:22', '2021-01-13 15:06:22', NULL),
(33, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 15:06:59', '2021-01-13 15:06:59', NULL),
(34, 'Created getAllArchives', 'Registered', 2, 'http://localhost:8000/getAllArchives', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-13 15:07:04', '2021-01-13 15:07:04', NULL),
(35, 'Logged In', 'Registered', 2, 'http://localhost:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'POST', '2021-01-13 17:45:54', '2021-01-13 17:45:54', NULL),
(36, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 17:45:55', '2021-01-13 17:45:55', NULL),
(37, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 17:47:38', '2021-01-13 17:47:38', NULL),
(38, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 17:47:50', '2021-01-13 17:47:50', NULL),
(39, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 17:49:00', '2021-01-13 17:49:00', NULL),
(40, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 17:49:23', '2021-01-13 17:49:23', NULL),
(41, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 17:51:51', '2021-01-13 17:51:51', NULL),
(42, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 17:51:56', '2021-01-13 17:51:56', NULL),
(43, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-13 17:56:49', '2021-01-13 17:56:49', NULL),
(44, 'Viewed profile/User', 'Registered', 2, 'http://localhost:8000/profile/User', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'GET', '2021-01-13 18:35:40', '2021-01-13 18:35:40', NULL),
(45, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 18:35:49', '2021-01-13 18:35:49', NULL),
(46, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 18:36:41', '2021-01-13 18:36:41', NULL),
(47, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 18:37:53', '2021-01-13 18:37:53', NULL),
(48, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 18:45:39', '2021-01-13 18:45:39', NULL),
(49, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 18:45:44', '2021-01-13 18:45:44', NULL),
(50, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 18:52:19', '2021-01-13 18:52:19', NULL),
(51, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 18:52:50', '2021-01-13 18:52:50', NULL),
(52, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 18:57:18', '2021-01-13 18:57:18', NULL),
(53, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 19:28:14', '2021-01-13 19:28:14', NULL),
(54, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 19:28:36', '2021-01-13 19:28:36', NULL),
(55, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 19:28:48', '2021-01-13 19:28:48', NULL),
(56, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 19:29:01', '2021-01-13 19:29:01', NULL),
(57, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 20:12:55', '2021-01-13 20:12:55', NULL),
(58, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 21:47:49', '2021-01-13 21:47:49', NULL),
(59, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 21:50:15', '2021-01-13 21:50:15', NULL),
(60, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 21:50:58', '2021-01-13 21:50:58', NULL),
(61, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 21:54:15', '2021-01-13 21:54:15', NULL),
(62, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 21:56:55', '2021-01-13 21:56:55', NULL),
(63, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:00:21', '2021-01-13 22:00:21', NULL),
(64, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:01:15', '2021-01-13 22:01:15', NULL),
(65, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:01:25', '2021-01-13 22:01:25', NULL),
(66, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:01:30', '2021-01-13 22:01:30', NULL),
(67, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:02:54', '2021-01-13 22:02:54', NULL),
(68, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:03:26', '2021-01-13 22:03:26', NULL),
(69, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:04:53', '2021-01-13 22:04:53', NULL),
(70, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:05:22', '2021-01-13 22:05:22', NULL),
(71, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:05:57', '2021-01-13 22:05:57', NULL),
(72, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:06:13', '2021-01-13 22:06:13', NULL),
(73, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:07:50', '2021-01-13 22:07:50', NULL),
(74, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:08:49', '2021-01-13 22:08:49', NULL),
(75, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:09:43', '2021-01-13 22:09:43', NULL),
(76, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:10:05', '2021-01-13 22:10:05', NULL),
(77, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:10:32', '2021-01-13 22:10:32', NULL),
(78, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:10:45', '2021-01-13 22:10:45', NULL),
(79, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:12:46', '2021-01-13 22:12:46', NULL),
(80, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:13:47', '2021-01-13 22:13:47', NULL),
(81, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:14:51', '2021-01-13 22:14:51', NULL),
(82, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:15:10', '2021-01-13 22:15:10', NULL),
(83, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:15:16', '2021-01-13 22:15:16', NULL),
(84, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:16:19', '2021-01-13 22:16:19', NULL),
(85, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:16:35', '2021-01-13 22:16:35', NULL),
(86, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:16:50', '2021-01-13 22:16:50', NULL),
(87, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:17:09', '2021-01-13 22:17:09', NULL),
(88, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:17:19', '2021-01-13 22:17:19', NULL),
(89, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:17:31', '2021-01-13 22:17:31', NULL),
(90, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:19:23', '2021-01-13 22:19:23', NULL),
(91, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:19:36', '2021-01-13 22:19:36', NULL),
(92, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:20:00', '2021-01-13 22:20:00', NULL),
(93, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:20:59', '2021-01-13 22:20:59', NULL),
(94, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:21:28', '2021-01-13 22:21:28', NULL),
(95, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:21:37', '2021-01-13 22:21:37', NULL),
(96, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:22:25', '2021-01-13 22:22:25', NULL),
(97, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:22:54', '2021-01-13 22:22:54', NULL),
(98, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:23:07', '2021-01-13 22:23:07', NULL),
(99, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:25:29', '2021-01-13 22:25:29', NULL),
(100, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:26:18', '2021-01-13 22:26:18', NULL),
(101, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:28:02', '2021-01-13 22:28:02', NULL),
(102, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:28:34', '2021-01-13 22:28:34', NULL),
(103, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:30:24', '2021-01-13 22:30:24', NULL),
(104, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:34:38', '2021-01-13 22:34:38', NULL),
(105, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:35:03', '2021-01-13 22:35:03', NULL),
(106, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:35:36', '2021-01-13 22:35:36', NULL),
(107, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:35:52', '2021-01-13 22:35:52', NULL),
(108, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:37:45', '2021-01-13 22:37:45', NULL),
(109, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:38:21', '2021-01-13 22:38:21', NULL),
(110, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:39:14', '2021-01-13 22:39:14', NULL),
(111, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:40:11', '2021-01-13 22:40:11', NULL),
(112, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:42:35', '2021-01-13 22:42:35', NULL),
(113, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:44:02', '2021-01-13 22:44:02', NULL),
(114, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:44:23', '2021-01-13 22:44:23', NULL),
(115, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:45:06', '2021-01-13 22:45:06', NULL),
(116, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:46:19', '2021-01-13 22:46:19', NULL),
(117, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:46:43', '2021-01-13 22:46:43', NULL),
(118, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:47:36', '2021-01-13 22:47:36', NULL),
(119, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:48:32', '2021-01-13 22:48:32', NULL),
(120, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:49:25', '2021-01-13 22:49:25', NULL),
(121, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:52:05', '2021-01-13 22:52:05', NULL),
(122, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:53:03', '2021-01-13 22:53:03', NULL),
(123, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:54:18', '2021-01-13 22:54:18', NULL),
(124, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:55:45', '2021-01-13 22:55:45', NULL),
(125, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:56:09', '2021-01-13 22:56:09', NULL),
(126, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 22:57:07', '2021-01-13 22:57:07', NULL),
(127, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 23:02:01', '2021-01-13 23:02:01', NULL),
(128, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 23:02:41', '2021-01-13 23:02:41', NULL),
(129, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 23:03:18', '2021-01-13 23:03:18', NULL),
(130, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 23:05:11', '2021-01-13 23:05:11', NULL),
(131, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 23:10:29', '2021-01-13 23:10:29', NULL),
(132, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 23:11:53', '2021-01-13 23:11:53', NULL),
(133, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 23:12:18', '2021-01-13 23:12:18', NULL),
(134, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 23:12:47', '2021-01-13 23:12:47', NULL),
(135, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 23:13:06', '2021-01-13 23:13:06', NULL),
(136, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 23:15:15', '2021-01-13 23:15:15', NULL),
(137, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 23:15:56', '2021-01-13 23:15:56', NULL),
(138, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 23:16:13', '2021-01-13 23:16:13', NULL),
(139, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 23:17:31', '2021-01-13 23:17:31', NULL),
(140, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 23:21:15', '2021-01-13 23:21:15', NULL),
(141, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 23:21:54', '2021-01-13 23:21:54', NULL),
(142, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 23:29:39', '2021-01-13 23:29:39', NULL),
(143, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 23:30:23', '2021-01-13 23:30:23', NULL),
(144, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 23:33:00', '2021-01-13 23:33:00', NULL),
(145, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-13 23:33:31', '2021-01-13 23:33:31', NULL),
(146, 'Created starAdd', 'Registered', 2, 'http://localhost:8000/starAdd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-13 23:33:45', '2021-01-13 23:33:45', NULL),
(147, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home?description=BonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjour&firstName=JOhn&lastName=Doe', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'GET', '2021-01-13 23:33:46', '2021-01-13 23:33:46', NULL),
(148, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home?description=BonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjour&firstName=JOhn&lastName=Doe', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'GET', '2021-01-13 23:37:05', '2021-01-13 23:37:05', NULL),
(149, 'Created starAdd', 'Registered', 2, 'http://localhost:8000/starAdd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home?firstName=JOhn&lastName=Doe&description=BonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjour', 'POST', '2021-01-13 23:37:25', '2021-01-13 23:37:25', NULL);
INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(150, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home?description=Mauris%20nisl%20lorem%2C%20scelerisque%20egestas%20vestibulum%20ut%2C%20laoreet%20bibendum%20dui.%20Aliquam%20dignissim%20vulputate%20placerat.%20Nulla%20blandit%20viverra%20nisi%2C%20eget%20dignissim%20arcu%20luctus%20vel.%20Mauris%20dignissim%20volutpat%20urna&firstName=John&lastName=Doe', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home?firstName=JOhn&lastName=Doe&description=BonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjour', 'GET', '2021-01-13 23:37:25', '2021-01-13 23:37:25', NULL),
(151, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home?description=Mauris%20nisl%20lorem%2C%20scelerisque%20egestas%20vestibulum%20ut%2C%20laoreet%20bibendum%20dui.%20Aliquam%20dignissim%20vulputate%20placerat.%20Nulla%20blandit%20viverra%20nisi%2C%20eget%20dignissim%20arcu%20luctus%20vel.%20Mauris%20dignissim%20volutpat%20urna&firstName=John&lastName=Doe', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home?firstName=JOhn&lastName=Doe&description=BonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjour', 'GET', '2021-01-13 23:37:49', '2021-01-13 23:37:49', NULL),
(152, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home?description=Mauris%20nisl%20lorem%2C%20scelerisque%20egestas%20vestibulum%20ut%2C%20laoreet%20bibendum%20dui.%20Aliquam%20dignissim%20vulputate%20placerat.%20Nulla%20blandit%20viverra%20nisi%2C%20eget%20dignissim%20arcu%20luctus%20vel.%20Mauris%20dignissim%20volutpat%20urna&firstName=John&lastName=Doe', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home?firstName=JOhn&lastName=Doe&description=BonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjour', 'GET', '2021-01-13 23:38:40', '2021-01-13 23:38:40', NULL),
(153, 'Created starAdd', 'Registered', 2, 'http://localhost:8000/starAdd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home?firstName=John&lastName=Doe&description=Mauris+nisl+lorem%2C+scelerisque+egestas+vestibulum+ut%2C+laoreet+bibendum+dui.+Aliquam+dignissim+vulputate+placerat.+Nulla+blandit+viverra+nisi%2C+eget+dignissim+arcu+luctus+vel.+Mauris+dignissim+volutpat+urna', 'POST', '2021-01-13 23:38:52', '2021-01-13 23:38:52', NULL),
(154, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home?description=Mauris%20nisl%20lorem%2C%20scelerisque%20egestas%20vestibulum%20ut%2C%20laoreet%20bibendum%20dui.%20Aliquam%20dignissim%20vulputate%20placerat.%20Nulla%20blandit%20viverra%20nisi%2C%20eget%20dignissim%20arcu%20luctus%20vel.%20Mauris%20dignissim%20volutpat%20urna&firstName=John&lastName=Doe', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home?firstName=JOhn&lastName=Doe&description=BonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjour', 'GET', '2021-01-13 23:40:53', '2021-01-13 23:40:53', NULL),
(155, 'Created starAdd', 'Registered', 2, 'http://localhost:8000/starAdd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home?firstName=John&lastName=Doe&description=Mauris+nisl+lorem%2C+scelerisque+egestas+vestibulum+ut%2C+laoreet+bibendum+dui.+Aliquam+dignissim+vulputate+placerat.+Nulla+blandit+viverra+nisi%2C+eget+dignissim+arcu+luctus+vel.+Mauris+dignissim+volutpat+urna', 'POST', '2021-01-13 23:41:03', '2021-01-13 23:41:03', NULL),
(156, 'Created starAdd', 'Registered', 2, 'http://localhost:8000/starAdd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home?firstName=John&lastName=Doe&description=Mauris+nisl+lorem%2C+scelerisque+egestas+vestibulum+ut%2C+laoreet+bibendum+dui.+Aliquam+dignissim+vulputate+placerat.+Nulla+blandit+viverra+nisi%2C+eget+dignissim+arcu+luctus+vel.+Mauris+dignissim+volutpat+urna', 'POST', '2021-01-13 23:41:28', '2021-01-13 23:41:28', NULL),
(157, 'Created starAdd', 'Registered', 2, 'http://localhost:8000/starAdd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home?firstName=John&lastName=Doe&description=Mauris+nisl+lorem%2C+scelerisque+egestas+vestibulum+ut%2C+laoreet+bibendum+dui.+Aliquam+dignissim+vulputate+placerat.+Nulla+blandit+viverra+nisi%2C+eget+dignissim+arcu+luctus+vel.+Mauris+dignissim+volutpat+urna', 'POST', '2021-01-13 23:42:14', '2021-01-13 23:42:14', NULL),
(158, 'Created starAdd', 'Registered', 2, 'http://localhost:8000/starAdd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home?firstName=John&lastName=Doe&description=Mauris+nisl+lorem%2C+scelerisque+egestas+vestibulum+ut%2C+laoreet+bibendum+dui.+Aliquam+dignissim+vulputate+placerat.+Nulla+blandit+viverra+nisi%2C+eget+dignissim+arcu+luctus+vel.+Mauris+dignissim+volutpat+urna', 'POST', '2021-01-13 23:43:42', '2021-01-13 23:43:42', NULL),
(159, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home?description=Mauris%20nisl%20lorem%2C%20scelerisque%20egestas%20vestibulum%20ut%2C%20laoreet%20bibendum%20dui.%20Aliquam%20dignissim%20vulputate%20placerat.%20Nulla%20blandit%20viverra%20nisi%2C%20eget%20dignissim%20arcu%20luctus%20vel.%20Mauris%20dignissim%20volutpat%20urna&firstName=John&lastName=Doe', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home?firstName=JOhn&lastName=Doe&description=BonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjour', 'GET', '2021-01-13 23:48:31', '2021-01-13 23:48:31', NULL),
(160, 'Created starAdd', 'Registered', 2, 'http://localhost:8000/starAdd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home?firstName=John&lastName=Doe&description=Mauris+nisl+lorem%2C+scelerisque+egestas+vestibulum+ut%2C+laoreet+bibendum+dui.+Aliquam+dignissim+vulputate+placerat.+Nulla+blandit+viverra+nisi%2C+eget+dignissim+arcu+luctus+vel.+Mauris+dignissim+volutpat+urna', 'POST', '2021-01-13 23:48:43', '2021-01-13 23:48:43', NULL),
(161, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home?description=Mauris%20nisl%20lorem%2C%20scelerisque%20egestas%20vestibulum%20ut%2C%20laoreet%20bibendum%20dui.%20Aliquam%20dignissim%20vulputate%20placerat.%20Nulla%20blandit%20viverra%20nisi%2C%20eget%20dignissim%20arcu%20luctus%20vel.%20Mauris%20dignissim%20volutpat%20urna&firstName=John&lastName=Doe', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home?firstName=JOhn&lastName=Doe&description=BonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjour', 'GET', '2021-01-13 23:50:59', '2021-01-13 23:50:59', NULL),
(162, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home?description=Mauris%20nisl%20lorem%2C%20scelerisque%20egestas%20vestibulum%20ut%2C%20laoreet%20bibendum%20dui.%20Aliquam%20dignissim%20vulputate%20placerat.%20Nulla%20blandit%20viverra%20nisi%2C%20eget%20dignissim%20arcu%20luctus%20vel.%20Mauris%20dignissim%20volutpat%20urna&firstName=John&lastName=Doe', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home?firstName=JOhn&lastName=Doe&description=BonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjourBonjour', 'GET', '2021-01-13 23:51:19', '2021-01-13 23:51:19', NULL),
(163, 'Created starAdd', 'Registered', 2, 'http://localhost:8000/starAdd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home?firstName=John&lastName=Doe&description=Mauris+nisl+lorem%2C+scelerisque+egestas+vestibulum+ut%2C+laoreet+bibendum+dui.+Aliquam+dignissim+vulputate+placerat.+Nulla+blandit+viverra+nisi%2C+eget+dignissim+arcu+luctus+vel.+Mauris+dignissim+volutpat+urna', 'POST', '2021-01-13 23:51:39', '2021-01-13 23:51:39', NULL),
(164, 'Created starAdd', 'Registered', 2, 'http://localhost:8000/starAdd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home?firstName=John&lastName=Doe&description=Mauris+nisl+lorem%2C+scelerisque+egestas+vestibulum+ut%2C+laoreet+bibendum+dui.+Aliquam+dignissim+vulputate+placerat.+Nulla+blandit+viverra+nisi%2C+eget+dignissim+arcu+luctus+vel.+Mauris+dignissim+volutpat+urna', 'POST', '2021-01-13 23:54:25', '2021-01-13 23:54:25', NULL),
(165, 'Logged In', 'Registered', 2, 'http://localhost:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'POST', '2021-01-14 08:00:32', '2021-01-14 08:00:32', NULL),
(166, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:00:32', '2021-01-14 08:00:32', NULL),
(167, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:08:57', '2021-01-14 08:08:57', NULL),
(168, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:10:29', '2021-01-14 08:10:29', NULL),
(169, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:11:50', '2021-01-14 08:11:50', NULL),
(170, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:14:05', '2021-01-14 08:14:05', NULL),
(171, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:14:24', '2021-01-14 08:14:24', NULL),
(172, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:19:18', '2021-01-14 08:19:18', NULL),
(173, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:19:36', '2021-01-14 08:19:36', NULL),
(174, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:20:29', '2021-01-14 08:20:29', NULL),
(175, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:20:48', '2021-01-14 08:20:48', NULL),
(176, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:22:53', '2021-01-14 08:22:53', NULL),
(177, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:28:13', '2021-01-14 08:28:13', NULL),
(178, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:30:44', '2021-01-14 08:30:44', NULL),
(179, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:30:54', '2021-01-14 08:30:54', NULL),
(180, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:31:25', '2021-01-14 08:31:25', NULL),
(181, 'Created starAdd', 'Registered', 2, 'http://localhost:8000/starAdd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 08:31:40', '2021-01-14 08:31:40', NULL),
(182, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:32:35', '2021-01-14 08:32:35', NULL),
(183, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:34:08', '2021-01-14 08:34:08', NULL),
(184, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:34:17', '2021-01-14 08:34:17', NULL),
(185, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:42:34', '2021-01-14 08:42:34', NULL),
(186, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:43:19', '2021-01-14 08:43:19', NULL),
(187, 'Created starAdd', 'Registered', 2, 'http://localhost:8000/starAdd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 08:43:38', '2021-01-14 08:43:38', NULL),
(188, 'Created starAdd', 'Registered', 2, 'http://localhost:8000/starAdd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 08:43:43', '2021-01-14 08:43:43', NULL),
(189, 'Created starAdd', 'Registered', 2, 'http://localhost:8000/starAdd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 08:43:54', '2021-01-14 08:43:54', NULL),
(190, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:46:14', '2021-01-14 08:46:14', NULL),
(191, 'Created starAdd', 'Registered', 2, 'http://localhost:8000/starAdd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 08:46:28', '2021-01-14 08:46:28', NULL),
(192, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:47:31', '2021-01-14 08:47:31', NULL),
(193, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:55:32', '2021-01-14 08:55:32', NULL),
(194, 'Created starEdit', 'Registered', 2, 'http://localhost:8000/starEdit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 08:55:44', '2021-01-14 08:55:44', NULL),
(195, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:56:17', '2021-01-14 08:56:17', NULL),
(196, 'Created starEdit', 'Registered', 2, 'http://localhost:8000/starEdit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 08:56:26', '2021-01-14 08:56:26', NULL),
(197, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:57:03', '2021-01-14 08:57:03', NULL),
(198, 'Created starEdit', 'Registered', 2, 'http://localhost:8000/starEdit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 08:57:12', '2021-01-14 08:57:12', NULL),
(199, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 08:59:05', '2021-01-14 08:59:05', NULL),
(200, 'Created starEdit', 'Registered', 2, 'http://localhost:8000/starEdit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 08:59:21', '2021-01-14 08:59:21', NULL),
(201, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:00:03', '2021-01-14 09:00:03', NULL),
(202, 'Created starEdit', 'Registered', 2, 'http://localhost:8000/starEdit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 09:00:25', '2021-01-14 09:00:25', NULL),
(203, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:01:13', '2021-01-14 09:01:13', NULL),
(204, 'Created starEdit', 'Registered', 2, 'http://localhost:8000/starEdit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 09:01:22', '2021-01-14 09:01:22', NULL),
(205, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:01:48', '2021-01-14 09:01:48', NULL),
(206, 'Created starEdit', 'Registered', 2, 'http://localhost:8000/starEdit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 09:02:16', '2021-01-14 09:02:16', NULL),
(207, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:03:45', '2021-01-14 09:03:45', NULL),
(208, 'Created starEdit', 'Registered', 2, 'http://localhost:8000/starEdit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 09:04:13', '2021-01-14 09:04:13', NULL),
(209, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:07:02', '2021-01-14 09:07:02', NULL),
(210, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:07:32', '2021-01-14 09:07:32', NULL),
(211, 'Created starAdd', 'Registered', 2, 'http://localhost:8000/starAdd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 09:07:53', '2021-01-14 09:07:53', NULL),
(212, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:08:16', '2021-01-14 09:08:16', NULL),
(213, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:08:33', '2021-01-14 09:08:33', NULL),
(214, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:08:58', '2021-01-14 09:08:58', NULL),
(215, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:09:54', '2021-01-14 09:09:54', NULL),
(216, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:10:03', '2021-01-14 09:10:03', NULL),
(217, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:23:39', '2021-01-14 09:23:39', NULL),
(218, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:23:57', '2021-01-14 09:23:57', NULL),
(219, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:25:16', '2021-01-14 09:25:16', NULL),
(220, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:25:50', '2021-01-14 09:25:50', NULL),
(221, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:29:55', '2021-01-14 09:29:55', NULL),
(222, 'Created starRemove', 'Registered', 2, 'http://localhost:8000/starRemove', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 09:30:03', '2021-01-14 09:30:03', NULL),
(223, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:30:28', '2021-01-14 09:30:28', NULL),
(224, 'Created starRemove', 'Registered', 2, 'http://localhost:8000/starRemove', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 09:30:34', '2021-01-14 09:30:34', NULL),
(225, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:31:14', '2021-01-14 09:31:14', NULL),
(226, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:32:04', '2021-01-14 09:32:04', NULL),
(227, 'Created starRemove', 'Registered', 2, 'http://localhost:8000/starRemove', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 09:32:11', '2021-01-14 09:32:11', NULL),
(228, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:34:22', '2021-01-14 09:34:22', NULL),
(229, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:34:35', '2021-01-14 09:34:35', NULL),
(230, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:35:44', '2021-01-14 09:35:44', NULL),
(231, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:38:58', '2021-01-14 09:38:58', NULL),
(232, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:39:25', '2021-01-14 09:39:25', NULL),
(233, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:39:39', '2021-01-14 09:39:39', NULL),
(234, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:40:18', '2021-01-14 09:40:18', NULL),
(235, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:41:16', '2021-01-14 09:41:16', NULL),
(236, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:45:56', '2021-01-14 09:45:56', NULL),
(237, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:47:56', '2021-01-14 09:47:56', NULL),
(238, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:49:24', '2021-01-14 09:49:24', NULL),
(239, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:50:02', '2021-01-14 09:50:02', NULL),
(240, 'Created starEdit', 'Registered', 2, 'http://localhost:8000/starEdit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 09:50:10', '2021-01-14 09:50:10', NULL),
(241, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:50:38', '2021-01-14 09:50:38', NULL),
(242, 'Created starRemove', 'Registered', 2, 'http://localhost:8000/starRemove', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 09:51:04', '2021-01-14 09:51:04', NULL),
(243, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:51:28', '2021-01-14 09:51:28', NULL),
(244, 'Created starRemove', 'Registered', 2, 'http://localhost:8000/starRemove', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 09:51:37', '2021-01-14 09:51:37', NULL),
(245, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:52:55', '2021-01-14 09:52:55', NULL),
(246, 'Created starRemove', 'Registered', 2, 'http://localhost:8000/starRemove', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 09:53:09', '2021-01-14 09:53:09', NULL),
(247, 'Created starEdit', 'Registered', 2, 'http://localhost:8000/starEdit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 09:53:26', '2021-01-14 09:53:26', NULL),
(248, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 09:53:42', '2021-01-14 09:53:42', NULL),
(249, 'Logged Out', 'Registered', 2, 'http://localhost:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 09:53:53', '2021-01-14 09:53:53', NULL),
(250, 'Logged In', 'Registered', 2, 'http://localhost:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'POST', '2021-01-14 09:56:09', '2021-01-14 09:56:09', NULL),
(251, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-14 09:56:09', '2021-01-14 09:56:09', NULL),
(252, 'Logged Out', 'Registered', 2, 'http://localhost:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'POST', '2021-01-14 09:59:20', '2021-01-14 09:59:20', NULL),
(253, 'Logged In', 'Registered', 2, 'http://localhost:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'POST', '2021-01-14 09:59:29', '2021-01-14 09:59:29', NULL),
(254, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-14 09:59:30', '2021-01-14 09:59:30', NULL),
(255, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-14 10:00:50', '2021-01-14 10:00:50', NULL),
(256, 'Logged Out', 'Registered', 2, 'http://localhost:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 10:00:54', '2021-01-14 10:00:54', NULL),
(257, 'Logged In', 'Registered', 2, 'http://localhost:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'POST', '2021-01-14 10:02:13', '2021-01-14 10:02:13', NULL),
(258, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-14 10:02:13', '2021-01-14 10:02:13', NULL),
(259, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-14 10:02:44', '2021-01-14 10:02:44', NULL),
(260, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'GET', '2021-01-14 10:02:46', '2021-01-14 10:02:46', NULL),
(261, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'GET', '2021-01-14 10:03:03', '2021-01-14 10:03:03', NULL),
(262, 'Logged Out', 'Registered', 2, 'http://localhost:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 10:03:07', '2021-01-14 10:03:07', NULL),
(263, 'Logged In', 'Registered', 2, 'http://localhost:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'POST', '2021-01-14 10:04:04', '2021-01-14 10:04:04', NULL),
(264, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-14 10:04:04', '2021-01-14 10:04:04', NULL),
(265, 'Logged Out', 'Registered', 2, 'http://localhost:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 10:04:07', '2021-01-14 10:04:07', NULL),
(266, 'Logged In', 'Registered', 2, 'http://localhost:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'POST', '2021-01-14 10:19:06', '2021-01-14 10:19:06', NULL),
(267, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-14 10:19:07', '2021-01-14 10:19:07', NULL),
(268, 'Logged Out', 'Registered', 2, 'http://localhost:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 10:19:16', '2021-01-14 10:19:16', NULL),
(269, 'Logged In', 'Registered', 2, 'http://localhost:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'POST', '2021-01-14 10:21:13', '2021-01-14 10:21:13', NULL),
(270, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/login', 'GET', '2021-01-14 10:21:14', '2021-01-14 10:21:14', NULL),
(271, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:21:18', '2021-01-14 10:21:18', NULL),
(272, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:22:25', '2021-01-14 10:22:25', NULL),
(273, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:24:56', '2021-01-14 10:24:56', NULL),
(274, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:25:02', '2021-01-14 10:25:02', NULL),
(275, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:25:07', '2021-01-14 10:25:07', NULL),
(276, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:25:26', '2021-01-14 10:25:26', NULL),
(277, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:25:30', '2021-01-14 10:25:30', NULL),
(278, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:26:29', '2021-01-14 10:26:29', NULL),
(279, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:28:25', '2021-01-14 10:28:25', NULL),
(280, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:28:32', '2021-01-14 10:28:32', NULL),
(281, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:28:47', '2021-01-14 10:28:47', NULL),
(282, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:29:03', '2021-01-14 10:29:03', NULL),
(283, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:29:27', '2021-01-14 10:29:27', NULL),
(284, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:29:43', '2021-01-14 10:29:43', NULL);
INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(285, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:29:51', '2021-01-14 10:29:51', NULL),
(286, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:30:26', '2021-01-14 10:30:26', NULL),
(287, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:31:07', '2021-01-14 10:31:07', NULL),
(288, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:31:23', '2021-01-14 10:31:23', NULL),
(289, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:31:56', '2021-01-14 10:31:56', NULL),
(290, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:32:09', '2021-01-14 10:32:09', NULL),
(291, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:35:17', '2021-01-14 10:35:17', NULL),
(292, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:39:30', '2021-01-14 10:39:30', NULL),
(293, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:40:54', '2021-01-14 10:40:54', NULL),
(294, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:41:07', '2021-01-14 10:41:07', NULL),
(295, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:41:46', '2021-01-14 10:41:46', NULL),
(296, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:42:01', '2021-01-14 10:42:01', NULL),
(297, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:42:28', '2021-01-14 10:42:28', NULL),
(298, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:43:24', '2021-01-14 10:43:24', NULL),
(299, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:43:37', '2021-01-14 10:43:37', NULL),
(300, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:44:14', '2021-01-14 10:44:14', NULL),
(301, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:44:32', '2021-01-14 10:44:32', NULL),
(302, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:45:35', '2021-01-14 10:45:35', NULL),
(303, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:45:49', '2021-01-14 10:45:49', NULL),
(304, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:46:04', '2021-01-14 10:46:04', NULL),
(305, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:48:43', '2021-01-14 10:48:43', NULL),
(306, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:49:42', '2021-01-14 10:49:42', NULL),
(307, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:52:42', '2021-01-14 10:52:42', NULL),
(308, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 10:52:52', '2021-01-14 10:52:52', NULL),
(309, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 11:00:08', '2021-01-14 11:00:08', NULL),
(310, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 11:00:26', '2021-01-14 11:00:26', NULL),
(311, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:12:18', '2021-01-14 12:12:18', NULL),
(312, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:12:30', '2021-01-14 12:12:30', NULL),
(313, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:14:05', '2021-01-14 12:14:05', NULL),
(314, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:14:24', '2021-01-14 12:14:24', NULL),
(315, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:14:34', '2021-01-14 12:14:34', NULL),
(316, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:15:38', '2021-01-14 12:15:38', NULL),
(317, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:17:15', '2021-01-14 12:17:15', NULL),
(318, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:17:33', '2021-01-14 12:17:33', NULL),
(319, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:17:37', '2021-01-14 12:17:37', NULL),
(320, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:17:41', '2021-01-14 12:17:41', NULL),
(321, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:17:46', '2021-01-14 12:17:46', NULL),
(322, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:17:49', '2021-01-14 12:17:49', NULL),
(323, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:18:17', '2021-01-14 12:18:17', NULL),
(324, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:19:15', '2021-01-14 12:19:15', NULL),
(325, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:19:20', '2021-01-14 12:19:20', NULL),
(326, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:19:37', '2021-01-14 12:19:37', NULL),
(327, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:19:49', '2021-01-14 12:19:49', NULL),
(328, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:19:56', '2021-01-14 12:19:56', NULL),
(329, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:20:14', '2021-01-14 12:20:14', NULL),
(330, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:20:30', '2021-01-14 12:20:30', NULL),
(331, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:22:22', '2021-01-14 12:22:22', NULL),
(332, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:23:15', '2021-01-14 12:23:15', NULL),
(333, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:23:18', '2021-01-14 12:23:18', NULL),
(334, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:24:05', '2021-01-14 12:24:05', NULL),
(335, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:25:20', '2021-01-14 12:25:20', NULL),
(336, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:25:50', '2021-01-14 12:25:50', NULL),
(337, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:26:40', '2021-01-14 12:26:40', NULL),
(338, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:26:43', '2021-01-14 12:26:43', NULL),
(339, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:27:07', '2021-01-14 12:27:07', NULL),
(340, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:27:11', '2021-01-14 12:27:11', NULL),
(341, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:27:42', '2021-01-14 12:27:42', NULL),
(342, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:27:57', '2021-01-14 12:27:57', NULL),
(343, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:28:00', '2021-01-14 12:28:00', NULL),
(344, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:28:40', '2021-01-14 12:28:40', NULL),
(345, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:28:43', '2021-01-14 12:28:43', NULL),
(346, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:33:03', '2021-01-14 12:33:03', NULL),
(347, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:33:47', '2021-01-14 12:33:47', NULL),
(348, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:33:53', '2021-01-14 12:33:53', NULL),
(349, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:34:19', '2021-01-14 12:34:19', NULL),
(350, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:34:22', '2021-01-14 12:34:22', NULL),
(351, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:34:44', '2021-01-14 12:34:44', NULL),
(352, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:34:49', '2021-01-14 12:34:49', NULL),
(353, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:34:57', '2021-01-14 12:34:57', NULL),
(354, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:37:01', '2021-01-14 12:37:01', NULL),
(355, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:37:06', '2021-01-14 12:37:06', NULL),
(356, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:39:30', '2021-01-14 12:39:30', NULL),
(357, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:39:34', '2021-01-14 12:39:34', NULL),
(358, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:40:38', '2021-01-14 12:40:38', NULL),
(359, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:40:42', '2021-01-14 12:40:42', NULL),
(360, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:41:11', '2021-01-14 12:41:11', NULL),
(361, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:41:15', '2021-01-14 12:41:15', NULL),
(362, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:41:36', '2021-01-14 12:41:36', NULL),
(363, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:44:12', '2021-01-14 12:44:12', NULL),
(364, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:44:46', '2021-01-14 12:44:46', NULL),
(365, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:45:19', '2021-01-14 12:45:19', NULL),
(366, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:45:43', '2021-01-14 12:45:43', NULL),
(367, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:46:10', '2021-01-14 12:46:10', NULL),
(368, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:48:42', '2021-01-14 12:48:42', NULL),
(369, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:50:17', '2021-01-14 12:50:17', NULL),
(370, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:51:02', '2021-01-14 12:51:02', NULL),
(371, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/stars', 'GET', '2021-01-14 12:51:04', '2021-01-14 12:51:04', NULL),
(372, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:51:58', '2021-01-14 12:51:58', NULL),
(373, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:53:00', '2021-01-14 12:53:00', NULL),
(374, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:55:12', '2021-01-14 12:55:12', NULL),
(375, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:55:27', '2021-01-14 12:55:27', NULL),
(376, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 12:57:01', '2021-01-14 12:57:01', NULL),
(377, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:00:07', '2021-01-14 13:00:07', NULL),
(378, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:00:13', '2021-01-14 13:00:13', NULL),
(379, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:00:26', '2021-01-14 13:00:26', NULL),
(380, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:00:30', '2021-01-14 13:00:30', NULL),
(381, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:00:33', '2021-01-14 13:00:33', NULL),
(382, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:01:28', '2021-01-14 13:01:28', NULL),
(383, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:01:52', '2021-01-14 13:01:52', NULL),
(384, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:02:18', '2021-01-14 13:02:18', NULL),
(385, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:04:36', '2021-01-14 13:04:36', NULL),
(386, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:06:14', '2021-01-14 13:06:14', NULL),
(387, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:08:22', '2021-01-14 13:08:22', NULL),
(388, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:10:06', '2021-01-14 13:10:06', NULL),
(389, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:10:13', '2021-01-14 13:10:13', NULL),
(390, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:12:31', '2021-01-14 13:12:31', NULL),
(391, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:12:38', '2021-01-14 13:12:38', NULL),
(392, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:13:42', '2021-01-14 13:13:42', NULL),
(393, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:15:04', '2021-01-14 13:15:04', NULL),
(394, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:15:34', '2021-01-14 13:15:34', NULL),
(395, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:15:51', '2021-01-14 13:15:51', NULL),
(396, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:16:45', '2021-01-14 13:16:45', NULL),
(397, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:17:26', '2021-01-14 13:17:26', NULL),
(398, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:18:16', '2021-01-14 13:18:16', NULL),
(399, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:18:25', '2021-01-14 13:18:25', NULL),
(400, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:19:50', '2021-01-14 13:19:50', NULL),
(401, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:20:10', '2021-01-14 13:20:10', NULL),
(402, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:20:55', '2021-01-14 13:20:55', NULL),
(403, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:21:15', '2021-01-14 13:21:15', NULL),
(404, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:21:19', '2021-01-14 13:21:19', NULL),
(405, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:22:48', '2021-01-14 13:22:48', NULL),
(406, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:24:16', '2021-01-14 13:24:16', NULL),
(407, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:24:35', '2021-01-14 13:24:35', NULL),
(408, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:24:52', '2021-01-14 13:24:52', NULL),
(409, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:25:23', '2021-01-14 13:25:23', NULL),
(410, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:25:35', '2021-01-14 13:25:35', NULL),
(411, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:25:56', '2021-01-14 13:25:56', NULL),
(412, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:26:43', '2021-01-14 13:26:43', NULL),
(413, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:28:16', '2021-01-14 13:28:16', NULL),
(414, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:28:45', '2021-01-14 13:28:45', NULL),
(415, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:28:49', '2021-01-14 13:28:49', NULL),
(416, 'Logged In', 'Registered', 2, 'http://localhost:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', 'fr,fr-FR;q=0.8,en-US;q=0.5,en;q=0.3', 'http://localhost:8000/login', 'POST', '2021-01-14 13:29:27', '2021-01-14 13:29:27', NULL),
(417, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', 'fr,fr-FR;q=0.8,en-US;q=0.5,en;q=0.3', 'http://localhost:8000/login', 'GET', '2021-01-14 13:29:27', '2021-01-14 13:29:27', NULL),
(418, 'Created starEdit', 'Registered', 2, 'http://localhost:8000/starEdit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', 'fr,fr-FR;q=0.8,en-US;q=0.5,en;q=0.3', 'http://localhost:8000/home', 'POST', '2021-01-14 13:29:41', '2021-01-14 13:29:41', NULL),
(419, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', NULL, 'GET', '2021-01-14 13:30:15', '2021-01-14 13:30:15', NULL),
(420, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/stars', 'GET', '2021-01-14 13:30:19', '2021-01-14 13:30:19', NULL),
(421, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/stars', 'GET', '2021-01-14 13:31:14', '2021-01-14 13:31:14', NULL),
(422, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/stars', 'GET', '2021-01-14 13:31:22', '2021-01-14 13:31:22', NULL),
(423, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'GET', '2021-01-14 13:31:26', '2021-01-14 13:31:26', NULL),
(424, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/stars', 'GET', '2021-01-14 13:31:29', '2021-01-14 13:31:29', NULL),
(425, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'GET', '2021-01-14 13:31:33', '2021-01-14 13:31:33', NULL),
(426, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'GET', '2021-01-14 13:33:41', '2021-01-14 13:33:41', NULL),
(427, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'GET', '2021-01-14 13:34:13', '2021-01-14 13:34:13', NULL),
(428, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/stars', 'GET', '2021-01-14 13:34:49', '2021-01-14 13:34:49', NULL),
(429, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/stars', 'GET', '2021-01-14 13:44:04', '2021-01-14 13:44:04', NULL),
(430, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/stars', 'GET', '2021-01-14 13:44:12', '2021-01-14 13:44:12', NULL),
(431, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/stars', 'GET', '2021-01-14 13:44:49', '2021-01-14 13:44:49', NULL),
(432, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'GET', '2021-01-14 13:44:57', '2021-01-14 13:44:57', NULL),
(433, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'GET', '2021-01-14 13:45:29', '2021-01-14 13:45:29', NULL),
(434, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/stars', 'GET', '2021-01-14 13:45:41', '2021-01-14 13:45:41', NULL),
(435, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/stars', 'GET', '2021-01-14 13:45:58', '2021-01-14 13:45:58', NULL),
(436, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/stars', 'GET', '2021-01-14 13:48:43', '2021-01-14 13:48:43', NULL),
(437, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/stars', 'GET', '2021-01-14 13:49:54', '2021-01-14 13:49:54', NULL),
(438, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/stars', 'GET', '2021-01-14 13:51:04', '2021-01-14 13:51:04', NULL),
(439, 'Logged Out', 'Registered', 2, 'http://localhost:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 14:23:10', '2021-01-14 14:23:10', NULL),
(440, 'Logged In', 'Registered', 2, 'http://localhost:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'POST', '2021-01-14 14:24:01', '2021-01-14 14:24:01', NULL),
(441, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-14 14:24:01', '2021-01-14 14:24:01', NULL),
(442, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-14 14:24:36', '2021-01-14 14:24:36', NULL);
INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(443, 'Logged Out', 'Registered', 2, 'http://localhost:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 14:24:40', '2021-01-14 14:24:40', NULL),
(444, 'Logged In', 'Registered', 2, 'http://localhost:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'POST', '2021-01-14 14:25:03', '2021-01-14 14:25:03', NULL),
(445, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-14 14:25:04', '2021-01-14 14:25:04', NULL),
(446, 'Created starAdd', 'Registered', 2, 'http://localhost:8000/starAdd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 14:25:19', '2021-01-14 14:25:19', NULL),
(447, 'Created starEdit', 'Registered', 2, 'http://localhost:8000/starEdit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 14:25:36', '2021-01-14 14:25:36', NULL),
(448, 'Created starRemove', 'Registered', 2, 'http://localhost:8000/starRemove', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 14:25:44', '2021-01-14 14:25:44', NULL),
(449, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-14 14:25:56', '2021-01-14 14:25:56', NULL),
(450, 'Created starRemove', 'Registered', 2, 'http://localhost:8000/starRemove', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 14:26:12', '2021-01-14 14:26:12', NULL),
(451, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-14 14:26:14', '2021-01-14 14:26:14', NULL),
(452, 'Logged Out', 'Registered', 2, 'http://localhost:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 14:26:40', '2021-01-14 14:26:40', NULL),
(453, 'Logged In', 'Registered', 2, 'http://localhost:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'POST', '2021-01-14 14:27:10', '2021-01-14 14:27:10', NULL),
(454, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/', 'GET', '2021-01-14 14:27:11', '2021-01-14 14:27:11', NULL),
(455, 'Created starAdd', 'Registered', 2, 'http://localhost:8000/starAdd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 14:27:29', '2021-01-14 14:27:29', NULL),
(456, 'Created starEdit', 'Registered', 2, 'http://localhost:8000/starEdit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 14:27:43', '2021-01-14 14:27:43', NULL),
(457, 'Created starRemove', 'Registered', 2, 'http://localhost:8000/starRemove', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'POST', '2021-01-14 14:27:50', '2021-01-14 14:27:50', NULL),
(458, 'Viewed stars', 'Registered', 2, 'http://localhost:8000/stars', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/home', 'GET', '2021-01-14 14:27:56', '2021-01-14 14:27:56', NULL),
(459, 'Viewed home', 'Registered', 2, 'http://localhost:8000/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'http://localhost:8000/stars', 'GET', '2021-01-14 14:28:11', '2021-01-14 14:28:11', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2015_07_31_1_email_log', 1),
(4, '2016_01_15_105324_create_roles_table', 1),
(5, '2016_01_15_114412_create_role_user_table', 1),
(6, '2016_01_26_115212_create_permissions_table', 1),
(7, '2016_01_26_115523_create_permission_role_table', 1),
(8, '2016_02_09_132439_create_permission_user_table', 1),
(9, '2016_09_21_001638_add_bcc_column_email_log', 1),
(10, '2017_03_09_082449_create_social_logins_table', 1),
(11, '2017_03_09_082526_create_activations_table', 1),
(12, '2017_03_20_213554_create_themes_table', 1),
(13, '2017_03_21_042918_create_profiles_table', 1),
(14, '2017_11_04_103444_create_laravel_logger_activity_table', 1),
(15, '2017_11_10_001638_add_more_mail_columns_email_log', 1),
(16, '2017_12_09_070937_create_two_step_auth_table', 1),
(17, '2018_05_11_115355_use_longtext_for_attachments', 1),
(18, '2019_02_19_032636_create_laravel_blocker_types_table', 1),
(19, '2019_02_19_045158_create_laravel_blocker_table', 1),
(20, '2019_08_19_000000_create_failed_jobs_table', 1),
(22, '2021_01_13_215954_create_stars_table', 2);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `description`, `model`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Can View Users', 'view.users', 'Can view users', 'Permission', '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(2, 'Can Create Users', 'create.users', 'Can create new users', 'Permission', '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(3, 'Can Edit Users', 'edit.users', 'Can edit users', 'Permission', '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(4, 'Can Delete Users', 'delete.users', 'Can delete users', 'Permission', '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(2, 2, 1, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(3, 3, 1, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(4, 4, 1, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `permission_user`
--

DROP TABLE IF EXISTS `permission_user`;
CREATE TABLE IF NOT EXISTS `permission_user` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_user_permission_id_index` (`permission_id`),
  KEY `permission_user_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE IF NOT EXISTS `profiles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `theme_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `twitter_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profiles_theme_id_foreign` (`theme_id`),
  KEY `profiles_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `theme_id`, `location`, `bio`, `twitter_username`, `github_username`, `avatar`, `avatar_status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-13 11:38:39', '2021-01-13 11:38:39'),
(2, 2, 1, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-13 11:38:39', '2021-01-13 11:38:39');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `description`, `level`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin', 'Admin Role', 5, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(2, 'User', 'user', 'User Role', 1, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(3, 'Unverified', 'unverified', 'Unverified Role', 0, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2021-01-13 11:38:39', '2021-01-13 11:38:39', NULL),
(2, 2, 2, '2021-01-13 11:38:39', '2021-01-13 11:38:39', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `social_logins`
--

DROP TABLE IF EXISTS `social_logins`;
CREATE TABLE IF NOT EXISTS `social_logins` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `provider` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `social_logins_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `stars`
--

DROP TABLE IF EXISTS `stars`;
CREATE TABLE IF NOT EXISTS `stars` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '/images/default.jpg',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `stars`
--

INSERT INTO `stars` (`id`, `first_name`, `last_name`, `thumbnail`, `description`, `created_at`, `updated_at`) VALUES
(2, 'Justyn', 'Rolfson', '/images/star1.jpg', 'Est et consequatur ut nesciunt. Repellendus est voluptas eos nihil occaecati aliquid. Optio sed enim molestiae. Eum ut ab sit temporibus neque velit quis.', '2021-01-13 21:40:56', NULL),
(3, 'Isaiah', 'Kohler', '/images/star2.jpg', 'Laborum sunt vero commodi iusto rerum consequatur rerum culpa. Sit numquam odio et iste necessitatibus fuga. Voluptas quas ea et sed error debitis. Voluptatibus adipisci autem excepturi quis veritatis modi dolorem.', '2021-01-13 21:40:56', NULL),
(4, 'Rahul', 'Friesen', '/images/star3.jpg', 'Ad odit sint voluptas incidunt voluptas ut. Animi perspiciatis ex debitis voluptate quis dolore beatae. Rerum deserunt deleniti laudantium laboriosam consequatur sint maxime laborum. Sint quia adipisci iure et ut ut.', '2021-01-13 21:40:56', NULL),
(5, 'Kailee', 'Waters', '/images/star4.jpg', 'Sint at laboriosam provident qui et. Reiciendis sunt repudiandae incidunt delectus quisquam. Tenetur a quis rerum saepe beatae et enim autem. Laboriosam nulla sed ipsam minus quibusdam tempore aut.', '2021-01-13 21:40:56', NULL),
(6, 'Amara', 'Boehm', '/images/default.jpg', 'Sit nam dignissimos eius quasi odit qui qui dolorem. Commodi ut dolores facilis nobis architecto ut. Nam aut nam velit quo et.', '2021-01-13 21:40:56', NULL),
(7, 'Ellie', 'Breitenberg', '/images/default.jpg', 'Voluptatem consequatur magni at et rerum. Sunt est id doloremque temporibus praesentium molestiae incidunt. Qui quidem ratione dolorum tempora aspernatur dolor. Dolores ratione non alias itaque sunt.', '2021-01-13 21:40:56', NULL),
(8, 'Kamren', 'Kemmer', '/images/default.jpg', 'Explicabo ea nemo vel expedita dolorum autem sit. Ea eaque voluptatibus animi ullam mollitia delectus.', '2021-01-13 21:40:56', NULL),
(9, 'Lora', 'Ullrich', '/images/default.jpg', 'Aut sint quas numquam totam. Tempore quasi aliquam temporibus. Magni quaerat dolores alias quis quos iste non.', '2021-01-13 21:40:56', NULL),
(10, 'Clifton', 'Robel', '/images/default.jpg', 'Voluptas et sit illo pariatur fugiat adipisci. Reprehenderit aut culpa accusantium tempora. Ex error enim temporibus accusamus enim saepe. Laborum saepe et eum eligendi et aut.', '2021-01-13 21:40:56', NULL),
(13, 'Maxime', 'Ambry', '/images/default.jpg', 'Nauris nisl lorem, scelerisque egestas vestibulum ut, laoreet bibendum dui. Aliquam dignissim vulputate placerat. Nulla blandit viverra nisi, eget dignissim arcu luctus vel. Mauris dignissim volutpat urna', '2021-01-14 00:51:39', '2021-01-14 13:29:41');

-- --------------------------------------------------------

--
-- Structure de la table `themes`
--

DROP TABLE IF EXISTS `themes`;
CREATE TABLE IF NOT EXISTS `themes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `taggable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taggable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `themes_name_unique` (`name`),
  UNIQUE KEY `themes_link_unique` (`link`),
  KEY `themes_taggable_type_taggable_id_index` (`taggable_type`,`taggable_id`),
  KEY `themes_id_index` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `themes`
--

INSERT INTO `themes` (`id`, `name`, `link`, `notes`, `status`, `taggable_type`, `taggable_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Default', 'null', NULL, 1, 'theme', 1, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(2, 'Darkly', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/darkly/bootstrap.min.css', NULL, 1, 'theme', 2, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(3, 'Cyborg', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/cyborg/bootstrap.min.css', NULL, 1, 'theme', 3, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(4, 'Cosmo', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/cosmo/bootstrap.min.css', NULL, 1, 'theme', 4, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(5, 'Cerulean', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/cerulean/bootstrap.min.css', NULL, 1, 'theme', 5, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(6, 'Flatly', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/flatly/bootstrap.min.css', NULL, 1, 'theme', 6, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(7, 'Journal', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/journal/bootstrap.min.css', NULL, 1, 'theme', 7, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(8, 'Lumen', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/lumen/bootstrap.min.css', NULL, 1, 'theme', 8, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(9, 'Paper', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/paper/bootstrap.min.css', NULL, 1, 'theme', 9, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(10, 'Readable', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/readable/bootstrap.min.css', NULL, 1, 'theme', 10, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(11, 'Sandstone', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/sandstone/bootstrap.min.css', NULL, 1, 'theme', 11, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(12, 'Simplex', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/simplex/bootstrap.min.css', NULL, 1, 'theme', 12, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(13, 'Slate', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/slate/bootstrap.min.css', NULL, 1, 'theme', 13, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(14, 'Spacelab', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/spacelab/bootstrap.min.css', NULL, 1, 'theme', 14, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(15, 'Superhero', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/superhero/bootstrap.min.css', NULL, 1, 'theme', 15, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(16, 'United', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/united/bootstrap.min.css', NULL, 1, 'theme', 16, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(17, 'Yeti', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/yeti/bootstrap.min.css', NULL, 1, 'theme', 17, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(18, 'Bootstrap 4.3.1', 'https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css', NULL, 1, 'theme', 18, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(19, 'Materialize', 'https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.css', NULL, 1, 'theme', 19, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(20, 'Material Design for Bootstrap (MDB) 4.8.7', 'https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.7/css/mdb.css', NULL, 1, 'theme', 20, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(21, 'mdbootstrap', 'https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.3.1/css/mdb.min.css', NULL, 1, 'theme', 21, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(22, 'Litera', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/litera/bootstrap.min.css', NULL, 1, 'theme', 22, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(23, 'Lux', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/lux/bootstrap.min.css', NULL, 1, 'theme', 23, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(24, 'Materia', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/materia/bootstrap.min.css', NULL, 1, 'theme', 24, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(25, 'Minty', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/minty/bootstrap.min.css', NULL, 1, 'theme', 25, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(26, 'Pulse', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/pulse/bootstrap.min.css', NULL, 1, 'theme', 26, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(27, 'Sketchy', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/sketchy/bootstrap.min.css', NULL, 1, 'theme', 27, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL),
(28, 'Solar', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/solar/bootstrap.min.css', NULL, 1, 'theme', 28, '2021-01-13 11:38:38', '2021-01-13 11:38:38', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signup_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signup_confirmation_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signup_sm_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `remember_token`, `activated`, `token`, `signup_ip_address`, `signup_confirmation_ip_address`, `signup_sm_ip_address`, `admin_ip_address`, `updated_ip_address`, `deleted_ip_address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'Harry', 'Potter', 'admin@admin.com', NULL, '$2y$10$PxCVh21LYuc.bzZJcptCnOCKXH7bdxTm1oqdPPoppbTQly/1PXWRe', NULL, 1, 'wRKVmpPL9bNS2QrquJ36626Mh2p9ojNnqvnLEglsAv8NAdtYBj1ngwYoZDq4eoLx', NULL, '127.0.0.1', NULL, '127.0.0.1', NULL, NULL, '2021-01-13 11:38:39', '2021-01-13 11:38:39', NULL),
(2, 'User', 'Hermione', 'Granger', 'user@user.com', NULL, '$2y$10$y9okeUfvG1W617iB508Bb.d/fPpKDXhtC4jN3.XH4kw.Ocly/An3i', NULL, 1, 'lmlhQBLf7TeFyGXrlQbGe4owxDD8UNPvi2C7p6v8jTnm1EvlSkJ9TYjhPuCGu1jc', '127.0.0.1', '127.0.0.1', NULL, NULL, NULL, NULL, '2021-01-13 11:38:39', '2021-01-13 11:38:39', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
