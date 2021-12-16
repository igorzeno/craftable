-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 16 2021 г., 15:43
-- Версия сервера: 10.4.19-MariaDB
-- Версия PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `craftable`
--

-- --------------------------------------------------------

--
-- Структура таблицы `activations`
--

CREATE TABLE `activations` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `admin_activations`
--

CREATE TABLE `admin_activations` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT 0,
  `forbidden` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `admin_users`
--

INSERT INTO `admin_users` (`id`, `first_name`, `last_name`, `email`, `password`, `remember_token`, `activated`, `forbidden`, `language`, `deleted_at`, `created_at`, `updated_at`, `last_login_at`) VALUES
(1, 'Administrator', 'Administrator', '1@mail.ru', '$2y$10$nTSauUm.1B0B9vyvVZ0Y5uoMcmDkPZzr.Xd3ewYz9tQf.77QGnKlO', 'wZCTrXtTnjVGWKkLCGTrekyl3iXuuFfNNUMCwrVn2GB0IBT0KGiDmzLYyNp9', 1, 0, 'en', NULL, '2021-12-16 02:57:11', '2021-12-16 09:42:46', '2021-12-16 09:42:45'),
(2, 'Igor', 'Starozhuckov', '2@mail.ru', '$2y$10$LVFRI54lLXu.TPAE0BvJ8.oIqtoQKYDbRz6lxaal3i8gWZh29vnaS', 'qYcDjdXIHdcPSSj2TSAJoJkmVw3crsJStt6tR5pwTPcHt4cy9X5i8LP0l16y', 1, 0, 'en', NULL, '2021-12-16 03:39:44', '2021-12-16 09:42:59', '2021-12-16 09:37:31');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Дамп данных таблицы `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'Brackets\\AdminAuth\\Models\\AdminUser', 1, '9be25c5b-c4f0-4798-b29f-0550abdc4a9f', 'avatar', 'avatar', 'avatar.png', 'image/png', 'media', 'media', 23924, '[]', '[]', '{\"thumb_200\":true,\"thumb_75\":true,\"thumb_150\":true}', '[]', 1, '2021-12-16 02:57:11', '2021-12-16 02:57:13'),
(3, 'Brackets\\AdminAuth\\Models\\AdminUser', 2, 'ec038423-38e1-4b16-b43c-037e20630601', 'avatar', 'XCJWXNeBSuPXh1bTukpa694qIjRKJ106CMGyEW8e', 'XCJWXNeBSuPXh1bTukpa694qIjRKJ106CMGyEW8e.jpg', 'image/jpeg', 'media', 'media', 17416, '[]', '{\"name\":\"ya-fot2.jpg\",\"file_name\":\"ya-fot2.jpg\",\"width\":500,\"height\":500}', '{\"thumb_200\":true,\"thumb_75\":true,\"thumb_150\":true}', '[]', 2, '2021-12-16 04:13:33', '2021-12-16 04:13:34');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_08_24_000000_create_activations_table', 1),
(4, '2017_08_24_000000_create_admin_activations_table', 1),
(5, '2017_08_24_000000_create_admin_password_resets_table', 1),
(6, '2017_08_24_000000_create_admin_users_table', 1),
(7, '2018_07_18_000000_create_wysiwyg_media_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2020_10_21_000000_add_last_login_at_timestamp_to_admin_users_table', 1),
(11, '2021_12_16_055607_create_media_table', 1),
(12, '2021_12_16_055607_create_permission_tables', 1),
(13, '2021_12_16_055612_fill_default_admin_user_and_permissions', 1),
(14, '2021_12_16_055708_create_translations_table', 2),
(15, '2021_12_16_062303_create_posts_table', 3),
(16, '2021_12_16_062705_fill_permissions_for_post', 4),
(17, '2021_12_16_064805_create_products_table', 5),
(18, '2021_12_16_065218_fill_permissions_for_product', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'Brackets\\AdminAuth\\Models\\AdminUser', 1),
(2, 'Brackets\\AdminAuth\\Models\\AdminUser', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', '2021-12-16 02:57:11', '2021-12-16 02:57:11'),
(2, 'admin.translation.index', 'admin', '2021-12-16 02:57:11', '2021-12-16 02:57:11'),
(3, 'admin.translation.edit', 'admin', '2021-12-16 02:57:11', '2021-12-16 02:57:11'),
(4, 'admin.translation.rescan', 'admin', '2021-12-16 02:57:11', '2021-12-16 02:57:11'),
(5, 'admin.admin-user.index', 'admin', '2021-12-16 02:57:11', '2021-12-16 02:57:11'),
(6, 'admin.admin-user.create', 'admin', '2021-12-16 02:57:11', '2021-12-16 02:57:11'),
(7, 'admin.admin-user.edit', 'admin', '2021-12-16 02:57:11', '2021-12-16 02:57:11'),
(8, 'admin.admin-user.delete', 'admin', '2021-12-16 02:57:11', '2021-12-16 02:57:11'),
(9, 'admin.upload', 'admin', '2021-12-16 02:57:11', '2021-12-16 02:57:11'),
(10, 'admin.admin-user.impersonal-login', 'admin', '2021-12-16 02:57:11', '2021-12-16 02:57:11'),
(11, 'admin.post', 'admin', '2021-12-16 03:27:31', '2021-12-16 03:27:31'),
(12, 'admin.post.index', 'admin', '2021-12-16 03:27:31', '2021-12-16 03:27:31'),
(13, 'admin.post.create', 'admin', '2021-12-16 03:27:31', '2021-12-16 03:27:31'),
(14, 'admin.post.show', 'admin', '2021-12-16 03:27:31', '2021-12-16 03:27:31'),
(15, 'admin.post.edit', 'admin', '2021-12-16 03:27:31', '2021-12-16 03:27:31'),
(16, 'admin.post.delete', 'admin', '2021-12-16 03:27:31', '2021-12-16 03:27:31'),
(17, 'admin.post.bulk-delete', 'admin', '2021-12-16 03:27:31', '2021-12-16 03:27:31'),
(18, 'admin.product', 'admin', '2021-12-16 03:52:25', '2021-12-16 03:52:25'),
(19, 'admin.product.index', 'admin', '2021-12-16 03:52:25', '2021-12-16 03:52:25'),
(20, 'admin.product.create', 'admin', '2021-12-16 03:52:25', '2021-12-16 03:52:25'),
(21, 'admin.product.show', 'admin', '2021-12-16 03:52:25', '2021-12-16 03:52:25'),
(22, 'admin.product.edit', 'admin', '2021-12-16 03:52:25', '2021-12-16 03:52:25'),
(23, 'admin.product.delete', 'admin', '2021-12-16 03:52:25', '2021-12-16 03:52:25'),
(24, 'admin.product.bulk-delete', 'admin', '2021-12-16 03:52:25', '2021-12-16 03:52:25');

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perex` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published_at` date DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `perex`, `published_at`, `enabled`, `created_at`, `updated_at`) VALUES
(1, 'Post', 'post1', 'text text', '2021-12-16', 0, '2021-12-16 03:34:41', '2021-12-16 03:34:54');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `d_price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `d_price`, `created_at`, `updated_at`) VALUES
(1, 'BMW5', 10.50, 500, '2021-12-16 03:55:38', '2021-12-16 04:04:32');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin', '2021-12-16 02:57:11', '2021-12-16 02:57:11'),
(2, 'Аналитик', 'admin', '2021-12-16 07:36:03', '2021-12-16 07:36:03');

-- --------------------------------------------------------

--
-- Структура таблицы `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
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
(24, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`text`)),
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `translations`
--

INSERT INTO `translations` (`id`, `namespace`, `group`, `key`, `text`, `metadata`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'brackets/admin-ui', 'admin', 'operation.succeeded', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(2, 'brackets/admin-ui', 'admin', 'operation.failed', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(3, 'brackets/admin-ui', 'admin', 'operation.not_allowed', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(4, '*', 'admin', 'admin-user.columns.first_name', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(5, '*', 'admin', 'admin-user.columns.last_name', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(6, '*', 'admin', 'admin-user.columns.email', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(7, '*', 'admin', 'admin-user.columns.password', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(8, '*', 'admin', 'admin-user.columns.password_repeat', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(9, '*', 'admin', 'admin-user.columns.activated', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(10, '*', 'admin', 'admin-user.columns.forbidden', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(11, '*', 'admin', 'admin-user.columns.language', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(12, 'brackets/admin-ui', 'admin', 'forms.select_an_option', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(13, '*', 'admin', 'admin-user.columns.roles', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(14, 'brackets/admin-ui', 'admin', 'forms.select_options', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(15, '*', 'admin', 'admin-user.actions.create', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(16, 'brackets/admin-ui', 'admin', 'btn.save', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(17, '*', 'admin', 'admin-user.actions.edit', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(18, '*', 'admin', 'admin-user.actions.index', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(19, 'brackets/admin-ui', 'admin', 'placeholder.search', '{\"en\":\"Product name\"}', NULL, '2021-12-16 02:57:32', '2021-12-16 04:10:32', NULL),
(20, 'brackets/admin-ui', 'admin', 'btn.search', '{\"en\":\"Product name\"}', NULL, '2021-12-16 02:57:32', '2021-12-16 04:11:09', NULL),
(21, '*', 'admin', 'admin-user.columns.id', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(22, '*', 'admin', 'admin-user.columns.last_login_at', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(23, 'brackets/admin-ui', 'admin', 'btn.edit', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(24, 'brackets/admin-ui', 'admin', 'btn.delete', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(25, 'brackets/admin-ui', 'admin', 'pagination.overview', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(26, 'brackets/admin-ui', 'admin', 'index.no_items', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(27, 'brackets/admin-ui', 'admin', 'index.try_changing_items', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(28, 'brackets/admin-ui', 'admin', 'btn.new', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(29, 'brackets/admin-ui', 'admin', 'profile_dropdown.account', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(30, 'brackets/admin-auth', 'admin', 'profile_dropdown.profile', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(31, 'brackets/admin-auth', 'admin', 'profile_dropdown.password', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(32, 'brackets/admin-auth', 'admin', 'profile_dropdown.logout', '[]', NULL, '2021-12-16 02:57:32', '2021-12-16 03:02:01', NULL),
(33, 'brackets/admin-ui', 'admin', 'sidebar.content', '{\"en\":\"\\u041a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433\"}', NULL, '2021-12-16 02:57:32', '2021-12-16 04:07:41', NULL),
(34, 'brackets/admin-ui', 'admin', 'sidebar.settings', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(35, '*', 'admin', 'admin-user.actions.edit_password', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(36, '*', 'admin', 'admin-user.actions.edit_profile', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(37, 'brackets/admin-auth', 'admin', 'activation_form.title', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(38, 'brackets/admin-auth', 'admin', 'activation_form.note', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(39, 'brackets/admin-auth', 'admin', 'auth_global.email', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(40, 'brackets/admin-auth', 'admin', 'activation_form.button', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(41, 'brackets/admin-auth', 'admin', 'login.title', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(42, 'brackets/admin-auth', 'admin', 'login.sign_in_text', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(43, 'brackets/admin-auth', 'admin', 'auth_global.password', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(44, 'brackets/admin-auth', 'admin', 'login.button', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(45, 'brackets/admin-auth', 'admin', 'login.forgot_password', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(46, 'brackets/admin-auth', 'admin', 'forgot_password.title', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(47, 'brackets/admin-auth', 'admin', 'forgot_password.note', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(48, 'brackets/admin-auth', 'admin', 'forgot_password.button', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(49, 'brackets/admin-auth', 'admin', 'password_reset.title', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(50, 'brackets/admin-auth', 'admin', 'password_reset.note', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(51, 'brackets/admin-auth', 'admin', 'auth_global.password_confirm', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(52, 'brackets/admin-auth', 'admin', 'password_reset.button', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(53, 'brackets/admin-auth', 'activations', 'email.line', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(54, 'brackets/admin-auth', 'activations', 'email.action', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(55, 'brackets/admin-auth', 'activations', 'email.notRequested', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(56, 'brackets/admin-auth', 'admin', 'activations.activated', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(57, 'brackets/admin-auth', 'admin', 'activations.invalid_request', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(58, 'brackets/admin-auth', 'admin', 'activations.disabled', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(59, 'brackets/admin-auth', 'admin', 'activations.sent', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(60, 'brackets/admin-auth', 'admin', 'passwords.sent', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(61, 'brackets/admin-auth', 'admin', 'passwords.reset', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(62, 'brackets/admin-auth', 'admin', 'passwords.invalid_token', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(63, 'brackets/admin-auth', 'admin', 'passwords.invalid_user', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(64, 'brackets/admin-auth', 'admin', 'passwords.invalid_password', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(65, 'brackets/admin-auth', 'resets', 'email.line', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(66, 'brackets/admin-auth', 'resets', 'email.action', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(67, 'brackets/admin-auth', 'resets', 'email.notRequested', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(68, '*', 'auth', 'failed', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(69, '*', 'auth', 'throttle', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(70, '*', '*', 'Manage access', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(71, '*', '*', 'Translations', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(72, '*', '*', 'Configuration', '[]', NULL, '2021-12-16 02:57:33', '2021-12-16 03:02:01', NULL),
(73, 'brackets/admin-translations', 'admin', 'title', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(74, 'brackets/admin-translations', 'admin', 'index.all_groups', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(75, 'brackets/admin-translations', 'admin', 'index.edit', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(76, 'brackets/admin-translations', 'admin', 'index.default_text', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(77, 'brackets/admin-translations', 'admin', 'index.translation', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(78, 'brackets/admin-translations', 'admin', 'index.translation_for_language', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(79, 'brackets/admin-translations', 'admin', 'import.title', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(80, 'brackets/admin-translations', 'admin', 'import.notice', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(81, 'brackets/admin-translations', 'admin', 'import.upload_file', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(82, 'brackets/admin-translations', 'admin', 'import.choose_file', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(83, 'brackets/admin-translations', 'admin', 'import.language_to_import', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(84, 'brackets/admin-translations', 'admin', 'fields.select_language', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(85, 'brackets/admin-translations', 'admin', 'import.do_not_override', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(86, 'brackets/admin-translations', 'admin', 'import.conflict_notice_we_have_found', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(87, 'brackets/admin-translations', 'admin', 'import.conflict_notice_translations_to_be_imported', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(88, 'brackets/admin-translations', 'admin', 'import.conflict_notice_differ', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(89, 'brackets/admin-translations', 'admin', 'fields.group', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(90, 'brackets/admin-translations', 'admin', 'fields.default', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(91, 'brackets/admin-translations', 'admin', 'fields.current_value', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(92, 'brackets/admin-translations', 'admin', 'fields.imported_value', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(93, 'brackets/admin-translations', 'admin', 'import.sucesfully_notice', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(94, 'brackets/admin-translations', 'admin', 'import.sucesfully_notice_update', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(95, 'brackets/admin-translations', 'admin', 'index.export', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(96, 'brackets/admin-translations', 'admin', 'export.notice', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(97, 'brackets/admin-translations', 'admin', 'export.language_to_export', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(98, 'brackets/admin-translations', 'admin', 'btn.export', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(99, 'brackets/admin-translations', 'admin', 'index.title', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(100, 'brackets/admin-translations', 'admin', 'btn.import', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(101, 'brackets/admin-translations', 'admin', 'btn.re_scan', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(102, 'brackets/admin-translations', 'admin', 'fields.created_at', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(103, 'brackets/admin-translations', 'admin', 'index.no_items', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(104, 'brackets/admin-translations', 'admin', 'index.try_changing_items', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(105, 'brackets/admin-ui', 'admin', 'media_uploader.max_number_of_files', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(106, 'brackets/admin-ui', 'admin', 'media_uploader.max_size_pre_file', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(107, 'brackets/admin-ui', 'admin', 'media_uploader.private_title', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(108, 'brackets/admin-ui', 'admin', 'page_title_suffix', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(109, 'brackets/admin-ui', 'admin', 'footer.powered_by', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL),
(110, '*', '*', 'Close', '[]', NULL, '2021-12-16 03:02:01', '2021-12-16 03:02:01', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wysiwyg_media`
--

CREATE TABLE `wysiwyg_media` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wysiwygable_id` int(10) UNSIGNED DEFAULT NULL,
  `wysiwygable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `activations`
--
ALTER TABLE `activations`
  ADD KEY `activations_email_index` (`email`);

--
-- Индексы таблицы `admin_activations`
--
ALTER TABLE `admin_activations`
  ADD KEY `admin_activations_email_index` (`email`);

--
-- Индексы таблицы `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`);

--
-- Индексы таблицы `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_email_deleted_at_unique` (`email`,`deleted_at`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Индексы таблицы `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_namespace_index` (`namespace`),
  ADD KEY `translations_group_index` (`group`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Индексы таблицы `wysiwyg_media`
--
ALTER TABLE `wysiwyg_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wysiwyg_media_wysiwygable_id_index` (`wysiwygable_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `wysiwyg_media`
--
ALTER TABLE `wysiwyg_media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
