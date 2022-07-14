-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              8.0.29 - MySQL Community Server - GPL
-- S.O. server:                  Win64
-- HeidiSQL Versione:            12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dump della struttura del database blog
CREATE DATABASE IF NOT EXISTS `blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `blog`;

-- Dump della struttura di tabella blog.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella blog.categories: ~5 rows (circa)
INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'sed', 'quos-vitae-omnis-qui-illum-similique', '2022-07-14 12:17:19', '2022-07-14 12:17:19'),
	(2, 'nihil', 'nemo-numquam-esse-et-officiis', '2022-07-14 12:17:19', '2022-07-14 12:17:19'),
	(3, 'molestiae', 'quis-debitis-quisquam-culpa-est-quia', '2022-07-14 12:17:19', '2022-07-14 12:17:19'),
	(4, 'est', 'qui-ea-inventore-et', '2022-07-14 12:17:19', '2022-07-14 12:17:19'),
	(5, 'rerum', 'explicabo-aut-velit-perspiciatis-sed', '2022-07-14 12:17:19', '2022-07-14 12:17:19');

-- Dump della struttura di tabella blog.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_post_id_foreign` (`post_id`),
  KEY `comments_user_id_foreign` (`user_id`),
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella blog.comments: ~0 rows (circa)
INSERT INTO `comments` (`id`, `post_id`, `user_id`, `body`, `created_at`, `updated_at`) VALUES
	(1, 3, 6, 'Questo è un commento di prova, test.', '2022-07-14 15:03:02', '2022-07-14 15:03:02'),
	(2, 3, 6, 'asdasdadasdadasdasdasdasdaadadasdasdasd', '2022-07-14 15:34:05', '2022-07-14 15:34:05'),
	(3, 3, 6, 'adfcsdfsfsd', '2022-07-14 15:40:46', '2022-07-14 15:40:46'),
	(4, 12, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam maximus pulvinar consectetur. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.', '2022-07-14 16:45:18', '2022-07-14 16:45:18');

-- Dump della struttura di tabella blog.failed_jobs
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

-- Dump dei dati della tabella blog.failed_jobs: ~0 rows (circa)

-- Dump della struttura di tabella blog.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella blog.migrations: ~0 rows (circa)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2022_07_11_165448_create_posts_table', 1),
	(6, '2022_07_12_082156_create_categories_table', 1),
	(7, '2022_07_13_130425_create_comments_table', 1),
	(8, '2022_07_14_134017_create_tags_table', 1),
	(9, '2022_07_14_141124_create_post_tag_table', 1);

-- Dump della struttura di tabella blog.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella blog.password_resets: ~0 rows (circa)

-- Dump della struttura di tabella blog.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella blog.personal_access_tokens: ~0 rows (circa)

-- Dump della struttura di tabella blog.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `publiushed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella blog.posts: ~4 rows (circa)
INSERT INTO `posts` (`id`, `category_id`, `user_id`, `slug`, `title`, `excerpt`, `body`, `created_at`, `updated_at`, `publiushed_at`) VALUES
	(1, 1, 1, 'sed-aut-incidunt-sed-omnis-aut-voluptatibus-ut', 'Eligendi facere quam hic amet amet eveniet.', 'Assumenda voluptatem reprehenderit illo laborum ipsum magni eos.', 'Ut adipisci id voluptatum. Quae neque assumenda dolor quam et esse. Excepturi unde qui quae explicabo rerum et. Voluptatem cupiditate esse qui excepturi molestiae.', '2022-07-14 12:17:19', '2022-07-14 12:17:19', NULL),
	(2, 2, 2, 'vero-nisi-magnam-aut-minima-totam-asperiores', 'Ut tenetur ipsa reiciendis aliquam.', 'Necessitatibus facere quo voluptas dolores sit perspiciatis.', 'Repellendus molestiae sint qui earum ex. Pariatur eos ut distinctio sint voluptates atque.', '2022-07-14 12:17:19', '2022-07-14 12:17:19', NULL),
	(3, 3, 3, 'non-qui-qui-alias-eos-omnis-animi-molestiae', 'Voluptas impedit praesentium dolor sed eum facere eveniet.', 'Quos eligendi error suscipit officiis debitis quibusdam autem.', 'Reiciendis aut et id quasi voluptas. Laborum adipisci adipisci minima itaque corporis itaque et architecto. Optio aspernatur similique ea dolore sit quos cumque.', '2022-07-14 12:17:19', '2022-07-14 12:17:19', NULL),
	(4, 4, 4, 'autem-quos-quia-ad-et', 'Aut et consequatur voluptas quis accusamus a.', 'Animi voluptas ullam et eaque.', 'Omnis qui qui molestias pariatur deleniti repellendus labore. Est quo esse et.', '2022-07-14 12:17:19', '2022-07-14 12:17:19', NULL),
	(9, 1, 6, 'wrewer', 'dewqfewr', 'wrewerccccccdcdcdcdc', 'rwerwer', '2022-07-14 13:26:52', '2022-07-14 17:44:35', NULL),
	(10, 1, 6, 'rwerwe', 'qrewqr', 'rwerwerw', 'rwerwerwerwer', '2022-07-14 13:27:17', '2022-07-14 13:27:17', NULL),
	(11, 1, 6, 'werwerwerwer', 'werwr', 'werwerwr', 'werwerwerwerw', '2022-07-14 13:28:36', '2022-07-14 13:28:36', NULL),
	(12, 2, 6, 'aenean-leo-erat', 'Aenean leo erat, mollis non sapien ut, imperdiet laoreet lectus.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam maximus pulvinar consectetur. Pellentesque habitant morbi.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam maximus pulvinar consectetur. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce efficitur, urna quis maximus ornare, tortor odio ornare massa, nec aliquam magna justo et diam. Etiam vitae volutpat ligula. Nam semper sed orci id fringilla. Vivamus maximus urna eget libero pellentesque feugiat. Integer non tortor et mauris tempor fermentum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '2022-07-14 16:39:33', '2022-07-14 16:39:33', NULL),
	(13, 2, 6, 'nuovo-post', 'nuovo post', 'ciaowewewewesdasdas', 'prova', '2022-07-14 17:45:20', '2022-07-14 18:06:09', NULL),
	(14, 3, 7, 'asdasdasdasdad', 'adasdasdad', 'asdasdasd', 'dasdasdasdasdasd', '2022-07-14 18:10:37', '2022-07-14 18:10:37', NULL);

-- Dump della struttura di tabella blog.post_tag
CREATE TABLE IF NOT EXISTS `post_tag` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_tag_post_id_foreign` (`post_id`),
  KEY `post_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella blog.post_tag: ~0 rows (circa)
INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
	(1, 2, 1, '2022-07-14 14:19:46', '2022-07-14 14:19:47'),
	(2, 1, 1, '2022-07-14 14:19:48', '2022-07-14 14:19:47'),
	(3, 1, 3, '2022-07-14 14:19:49', '2022-07-14 14:19:49'),
	(6, 11, 1, NULL, NULL),
	(7, 11, 2, NULL, NULL),
	(8, 11, 3, NULL, NULL),
	(9, 12, 1, NULL, NULL),
	(10, 12, 2, NULL, NULL),
	(11, 12, 3, NULL, NULL),
	(12, 13, 2, NULL, NULL),
	(13, 13, 3, NULL, NULL),
	(14, 13, 1, NULL, NULL),
	(15, 14, 1, NULL, NULL),
	(16, 14, 2, NULL, NULL);

-- Dump della struttura di tabella blog.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella blog.tags: ~0 rows (circa)
INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'sport', NULL, NULL),
	(2, 'photo', NULL, NULL),
	(3, 'music', NULL, NULL);

-- Dump della struttura di tabella blog.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella blog.users: ~5 rows (circa)
INSERT INTO `users` (`id`, `username`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'wyman.tania', 'Prof. Craig Hintz Sr.', 'friesen.domenico@example.net', '2022-07-14 12:17:19', '$2y$10$NVihQGGsgU4f4PtE3Nvq6OyFRvQe24BXIRKvxpPmSHu.KX4f2nJ.W', 'QpBSN4i0bf', '2022-07-14 12:17:19', '2022-07-14 12:17:19'),
	(2, 'wrutherford', 'Dr. Arnold Farrell Sr.', 'johathan46@example.net', '2022-07-14 12:17:19', '$2y$10$Uaj19TY0vNClU.ytKVBMxuK0EMXPbSHa8XwtdHu4hRDYt2EeOthY2', 'pPJDtf1AJr', '2022-07-14 12:17:19', '2022-07-14 12:17:19'),
	(3, 'hayes.cora', 'Callie Effertz', 'henry.bahringer@example.org', '2022-07-14 12:17:19', '$2y$10$igTUHV0Ljqr4As0hkY1FwOV/EDUwJwh5BJK49.e.y1nIxx959d.2.', 'FbIMSZvnBN', '2022-07-14 12:17:19', '2022-07-14 12:17:19'),
	(4, 'melisa.witting', 'Louisa Wyman', 'patsy32@example.net', '2022-07-14 12:17:19', '$2y$10$ha6e7KUCbdZu97l3UVC/0.XurrIF3hP.RE.EH.tS9A8VJBvANqra6', 'aLL6X4JMpp', '2022-07-14 12:17:19', '2022-07-14 12:17:19'),
	(5, 'weimann.albert', 'Matt Denesik DVM', 'kris.halvorson@example.net', '2022-07-14 12:17:19', '$2y$10$euL.eOUd4GCGBKR3qs0n/.pue7/uWMpLedBuzpGT.fq1Db8xLTTY2', 'VLoQIxhfyu', '2022-07-14 12:17:19', '2022-07-14 12:17:19'),
	(6, 'gianni', 'gianni', 'gianni@gmail.com', NULL, '$2y$10$tWIZMVQE47IyabaTcZiNwu2taItkGFm6jgQUhbq.TJde5TUeY/pY2', NULL, '2022-07-14 12:41:57', '2022-07-14 12:41:57'),
	(7, 'ciao', 'ciao', 'ciao@ciao.it', NULL, '$2y$10$M5nWZPyCA/Kz0EferTuZTOz2wxpwwAW/9IkYIjAGbaGXYA/QhASe6', NULL, '2022-07-14 18:10:18', '2022-07-14 18:10:18');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
