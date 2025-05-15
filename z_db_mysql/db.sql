-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 15, 2025 lúc 11:22 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `commercial_floor`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Dior', NULL, '2025-04-09 11:04:44', '2025-04-09 11:04:44'),
(2, 'Nike', NULL, '2025-04-09 11:04:52', '2025-04-09 11:04:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `color` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Giày văn phòng', NULL, '2025-04-09 11:06:40', '2025-04-09 11:06:40'),
(2, 'Giày Lười', NULL, '2025-04-09 11:08:15', '2025-04-09 11:08:15'),
(3, 'Giày công sở', NULL, '2025-04-09 13:21:48', '2025-04-09 13:21:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `colors`
--

INSERT INTO `colors` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Trắng', NULL, '2025-04-09 11:03:31', '2025-04-09 11:03:31'),
(2, 'Hồng', NULL, '2025-04-09 11:03:39', '2025-04-09 11:03:39'),
(3, 'Xanh', NULL, '2025-04-09 11:03:49', '2025-04-09 11:03:49'),
(4, 'Tím', NULL, '2025-04-09 11:04:03', '2025-04-09 11:04:03'),
(5, 'Đỏ', NULL, '2025-04-09 11:04:10', '2025-04-09 11:04:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `count_views`
--

CREATE TABLE `count_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `view_number` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
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
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `feedback`
--

INSERT INTO `feedback` (`id`, `product_id`, `user_id`, `rating`, `comment`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 26, 8, 5, 'giày đẹp', NULL, NULL, NULL),
(2, 26, 9, 4, 'giày đẹp', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `genders`
--

CREATE TABLE `genders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sex` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `genders`
--

INSERT INTO `genders` (`id`, `sex`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'unisex', NULL, NULL, NULL),
(2, 'nam', NULL, NULL, NULL),
(3, 'nữ', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `images`
--

INSERT INTO `images` (`id`, `path`, `product_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(58, 'storage/images/1745674753-Giày Asics Court MZ Kem Đen Đế Nâu REP-z5413468958125_c01f0dfc4fa9040458e4c31dbfb008be-300x300.jpg', 26, NULL, '2025-04-13 07:18:34', '2025-04-26 13:39:13'),
(62, 'storage/images/1745674753-Giày Asics Court MZ Kem Đen Đế Nâu REP-z5427778791526_0260cdd204c029aad88f1daecddc89b2-300x300.jpg', 26, NULL, NULL, '2025-04-26 13:39:13'),
(63, 'storage/images/1745674753-Giày Asics Court MZ Kem Đen Đế Nâu REP-z5452248093192_1d46bd482a682eca3e17d2bfac91b472-300x300.jpg', 26, NULL, NULL, '2025-04-26 13:39:13'),
(67, 'storage/images/1745676417-MLB Chunky Liner Strap Mono NY Quai Dán Xám REP-z5427778791526_0260cdd204c029aad88f1daecddc89b2-300x300.jpg', 29, NULL, '2025-04-26 14:04:31', '2025-04-26 14:06:57'),
(68, 'storage/images/1745676417-MLB Chunky Liner Strap Mono NY Quai Dán Xám REP-z4963909854972_7b458cfb542efb0db6dace82d517bc15-2048x2048.jpg', 29, NULL, '2025-04-26 14:06:57', '2025-04-26 14:06:57'),
(69, 'storage/images/1745676417-MLB Chunky Liner Strap Mono NY Quai Dán Xám REP-z5420047371939_7870d921f15f632232e149e5002f4506.jpg', 29, NULL, '2025-04-26 14:06:57', '2025-04-26 14:06:57'),
(70, 'storage/images/1745676417-MLB Chunky Liner Strap Mono NY Quai Dán Xám REP-z5420047391413_ac3714ebdfeca2937af343db96e2dcb4.jpg', 29, NULL, '2025-04-26 14:06:57', '2025-04-26 14:06:57'),
(71, 'storage/images/1745755219-Giày Nike Killshot 2 Midnight Navy 432997-107-giay_nike_air_jordan_1_low_white_wolf_grey_w_dc0774-10511_d4167782465545ecbdcf7ec4439196c6_grande.webp', 30, NULL, '2025-04-26 14:17:33', '2025-04-27 12:00:19'),
(72, 'storage/images/1745755219-Giày Nike Killshot 2 Midnight Navy 432997-107-giay_nike_air_jordan_1_low_white_wolf_grey_w_dc0774-10510_837b295015c549aaa7a3489174c29dfd_grande.webp', 30, NULL, '2025-04-26 14:17:33', '2025-04-27 12:00:19'),
(73, 'storage/images/1745755219-Giày Nike Killshot 2 Midnight Navy 432997-107-giay_nike_air_jordan_1_low_white_wolf_grey_w_dc0774-1058_9ec04f1e741f4eda944c29fa5fb094ab_grande.webp', 30, NULL, '2025-04-26 14:17:33', '2025-04-27 12:00:19'),
(77, 'storage/images/1745755219-Giày Nike Killshot 2 Midnight Navy 432997-107-giay_nike_air_jordan_1_low_white_wolf_grey_w_dc0774-1057_7cf67dcd7a414be4b61257d061d54ea4_grande.webp', 30, NULL, '2025-04-26 14:19:43', '2025-04-27 12:00:19'),
(83, 'storage/images/1745755332-Giày New Balance Pro Court Beige Navy PROCTCCF-giay_air_jordan_1_low_se_dark_pony_hf3148-10210_1ae0133019624ab78abae45e461e0e09_grande.webp', 33, NULL, '2025-04-26 14:36:15', '2025-04-27 12:02:12'),
(84, 'storage/images/1745755332-Giày New Balance Pro Court Beige Navy PROCTCCF-giay_air_jordan_1_low_se_dark_pony_hf3148-1029_ce8d6b833f694c83ab1e681c40110a6a_grande.webp', 33, NULL, '2025-04-26 14:36:15', '2025-04-27 12:02:12'),
(85, 'storage/images/1745755332-Giày New Balance Pro Court Beige Navy PROCTCCF-giay_air_jordan_1_low_se_dark_pony_hf3148-1028_f03720ad4c2849ddbf4065989efe0443_grande.webp', 33, NULL, '2025-04-26 14:36:15', '2025-04-27 12:02:12'),
(86, 'storage/images/1745755332-Giày New Balance Pro Court Beige Navy PROCTCCF-giay_air_jordan_1_low_se_dark_pony_hf3148-1027_011dd260eb8040499beb866d59e682b4_grande.webp', 33, NULL, '2025-04-26 14:36:15', '2025-04-27 12:02:12'),
(88, 'storage/images/1745755219-Giày Nike Killshot 2 Midnight Navy 432997-107-giay_nike_air_jordan_1_low_white_wolf_grey_w_dc0774-1056_ed56c16ee97a41bab24ffea80221d45c_grande.webp', 30, NULL, '2025-04-26 14:39:10', '2025-04-27 12:00:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_03_25_195413_create_roles_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2025_03_25_215712_create_brands_table', 1),
(7, '2025_03_25_220126_create_origins_table', 1),
(8, '2025_03_25_220827_create_products_table', 1),
(9, '2025_03_25_220829_create_sizes_table', 1),
(10, '2025_03_25_221258_create_colors_table', 1),
(11, '2025_03_25_221727_create_count_views_table', 1),
(12, '2025_03_25_222939_create_carts_table', 1),
(13, '2025_03_28_145240_create_categories_table', 1),
(14, '2025_03_28_145505_create_genders_table', 1),
(15, '2025_03_28_150413_add_column_category_id_and_gender_in_products_table', 1),
(16, '2025_03_28_151246_create_feedback_table', 1),
(17, '2025_03_28_153504_create_orders_table', 1),
(18, '2025_03_28_160303_create_order_details_table', 1),
(19, '2025_03_28_172418_create_user_roles_table', 1),
(20, '2025_03_31_233037_create_size_colors_table', 1),
(21, '2025_04_07_210633_create_images_table', 1),
(22, '2025_04_09_174232_add_coloumn_sale_price_in_sizes_table', 1),
(25, '2025_04_26_195807_add_is_new_in_products_table', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `guest_name` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `note` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `size` int(11) NOT NULL,
  `color` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `is_cancel` int(11) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `origins`
--

CREATE TABLE `origins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `origins`
--

INSERT INTO `origins` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Trung Quốc', NULL, '2025-04-09 11:04:25', '2025-04-09 11:04:25'),
(2, 'Việt Nam', NULL, '2025-04-09 11:04:34', '2025-04-09 11:04:34'),
(3, 'Giày văn phòng', '2025-04-11 14:14:13', '2025-04-11 14:14:01', '2025-04-11 14:14:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `origin_id` bigint(20) UNSIGNED NOT NULL,
  `is_published` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `gender_id` bigint(20) UNSIGNED NOT NULL,
  `is_new` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `brand_id`, `origin_id`, `is_published`, `deleted_at`, `created_at`, `updated_at`, `category_id`, `gender_id`, `is_new`) VALUES
(26, 'Giày Asics Court MZ Kem Đen Đế Nâu REP', 'ok', 1, 1, 1, NULL, '2025-04-13 07:18:34', '2025-05-06 03:39:44', 1, 1, 1),
(29, 'MLB Chunky Liner Strap Mono NY Quai Dán Xám REP', 'Giày sang trọng', 2, 2, 1, NULL, '2025-04-26 14:04:31', '2025-05-06 03:39:52', 1, 2, 1),
(30, 'Giày Nike Killshot 2 Midnight Navy 432997-107', 'a', 2, 1, 1, NULL, '2025-04-26 14:17:33', '2025-04-26 14:39:10', 2, 1, 1),
(33, 'Giày New Balance Pro Court Beige Navy PROCTCCF', 'Giày sang trọng', 2, 1, 1, NULL, '2025-04-26 14:36:15', '2025-04-26 14:36:15', 1, 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'user', NULL, NULL, NULL),
(2, 'admin', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `number_size` int(11) NOT NULL,
  `list_price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sale_price` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sizes`
--

INSERT INTO `sizes` (`id`, `product_id`, `number_size`, `list_price`, `quantity`, `deleted_at`, `created_at`, `updated_at`, `sale_price`) VALUES
(50, 26, 38, 13234, 56, NULL, '2025-04-13 07:27:12', '2025-04-13 07:27:12', 0.00),
(51, 26, 40, 900000, 43, NULL, '2025-04-13 17:38:24', '2025-04-13 17:38:24', 0.00),
(52, 26, 32, 32, 32, NULL, '2025-04-13 17:39:05', '2025-04-13 17:40:11', 0.00),
(57, 29, 38, 900000, 43, NULL, '2025-04-26 14:04:31', '2025-04-26 14:04:31', 0.00),
(58, 29, 40, 56000, 12, NULL, '2025-04-26 14:04:31', '2025-04-26 14:04:31', 0.00),
(59, 30, 38, 123400, 43, NULL, '2025-04-26 14:17:33', '2025-04-26 14:17:33', 0.00),
(62, 33, 38, 900000, 12, NULL, '2025-04-26 14:36:15', '2025-04-26 14:36:15', 600000.00),
(63, 30, 40, 900000, 12, NULL, '2025-04-26 14:39:10', '2025-04-26 14:39:10', 0.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `size_colors`
--

CREATE TABLE `size_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `size_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `size_colors`
--

INSERT INTO `size_colors` (`id`, `size_id`, `color_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(86, 50, 5, NULL, '2025-04-13 07:27:12', '2025-04-13 07:27:12'),
(87, 50, 1, NULL, '2025-04-13 07:27:12', '2025-04-13 16:54:34'),
(103, 51, 5, NULL, '2025-04-13 17:38:24', '2025-04-13 17:38:24'),
(104, 51, 4, NULL, '2025-04-13 17:38:24', '2025-04-13 17:38:24'),
(105, 52, 1, NULL, '2025-04-13 17:39:05', '2025-04-13 17:39:05'),
(106, 52, 5, NULL, '2025-04-13 17:39:05', '2025-04-13 17:39:05'),
(113, 57, 5, NULL, '2025-04-26 14:04:31', '2025-04-26 14:04:31'),
(114, 57, 4, NULL, '2025-04-26 14:04:31', '2025-04-26 14:04:31'),
(115, 58, 4, NULL, '2025-04-26 14:04:31', '2025-04-26 14:04:31'),
(116, 58, 3, NULL, '2025-04-26 14:04:31', '2025-04-26 14:04:31'),
(117, 59, 3, NULL, '2025-04-26 14:17:33', '2025-04-26 14:17:33'),
(118, 59, 2, NULL, '2025-04-26 14:17:33', '2025-04-26 14:17:33'),
(123, 62, 4, NULL, '2025-04-26 14:36:15', '2025-04-26 14:36:15'),
(124, 62, 5, NULL, '2025-04-26 14:36:15', '2025-04-26 14:36:15'),
(125, 63, 5, NULL, '2025-04-26 14:39:10', '2025-04-26 14:39:10'),
(126, 63, 4, NULL, '2025-04-26 14:39:10', '2025-04-26 14:39:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `birthday` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `user_name`, `phone`, `birthday`, `address`, `avatar`, `password`, `email`, `role_id`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `remember_token`) VALUES
(8, 'Phạm Xuân Phương', 'xuanphuong', '0378423195', '06-04-2025', 'Tổ 7, Bình Quang, Bình Quế, Thăng Bình, Quảng Nam', '1745310665-Phạm Xuân Phương-imagef4.jpg', '$2y$10$U.rHHQxDCjGZtwz.EBLMCOah/B4CG3pxFBAS1At73zR0rGfnKu3V2', 'pp2215006@gmail.com', 2, NULL, '2025-04-22 08:31:05', '2025-04-22 08:31:05', NULL, NULL),
(9, 'Phan Văn Thành', 'xuanphuong0302', '0378423195', '02-04-2025', 'Tổ 7, Bình Quang, Bình Quế, Thăng Bình, Quảng Nam', '1745412531-Phan Văn Thành-anh1.jpg', '$2y$10$0Y5uUjDqhbumZzgXzVs3b.eLVcPkBau4HGTC4OdowrI0.1/QpTfwO', 'bui322412@gmail.com', 1, NULL, '2025-04-23 12:48:52', '2025-04-23 12:48:52', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_roles`
--

INSERT INTO `user_roles` (`id`, `role_id`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(8, 1, 8, NULL, '2025-04-22 08:31:05', '2025-04-22 08:31:05'),
(9, 1, 9, NULL, '2025-04-23 12:48:52', '2025-04-23 12:48:52');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `count_views`
--
ALTER TABLE `count_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `count_views_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedback_product_id_foreign` (`product_id`),
  ADD KEY `feedback_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`),
  ADD KEY `order_details_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `origins`
--
ALTER TABLE `origins`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_origin_id_foreign` (`origin_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_gender_id_foreign` (`gender_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sizes_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `size_colors`
--
ALTER TABLE `size_colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `size_colors_size_id_foreign` (`size_id`),
  ADD KEY `size_colors_color_id_foreign` (`color_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_roles_role_id_foreign` (`role_id`),
  ADD KEY `user_roles_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `count_views`
--
ALTER TABLE `count_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `genders`
--
ALTER TABLE `genders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `origins`
--
ALTER TABLE `origins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT cho bảng `size_colors`
--
ALTER TABLE `size_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `count_views`
--
ALTER TABLE `count_views`
  ADD CONSTRAINT `count_views_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `feedback_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_gender_id_foreign` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_origin_id_foreign` FOREIGN KEY (`origin_id`) REFERENCES `origins` (`id`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `sizes`
--
ALTER TABLE `sizes`
  ADD CONSTRAINT `sizes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `size_colors`
--
ALTER TABLE `size_colors`
  ADD CONSTRAINT `size_colors_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `size_colors_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
