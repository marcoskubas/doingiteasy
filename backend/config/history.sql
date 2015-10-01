-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           5.6.17 - MySQL Community Server (GPL)
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela advanced_yii2.branches
CREATE TABLE IF NOT EXISTS `branches` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `companies_company_id` int(11) DEFAULT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `branch_address` varchar(100) DEFAULT NULL,
  `branch_created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `branch_status` enum('active','inactive') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`branch_id`),
  KEY `FK1_companies` (`companies_company_id`),
  CONSTRAINT `FK1_companies` FOREIGN KEY (`companies_company_id`) REFERENCES `companies` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela advanced_yii2.branches: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` (`branch_id`, `companies_company_id`, `branch_name`, `branch_address`, `branch_created_date`, `branch_status`) VALUES
	(1, 1, 'My Branche', 'Branch Address', '2015-09-22 23:18:58', 'active'),
	(2, 2, 'Marcos', 'Kubas', '2015-09-30 22:12:36', 'inactive');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;


-- Copiando estrutura para tabela advanced_yii2.companies
CREATE TABLE IF NOT EXISTS `companies` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) DEFAULT NULL,
  `company_email` varchar(100) DEFAULT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `company_start_date` date NOT NULL DEFAULT '0000-00-00',
  `company_created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_status` enum('active','inactive') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela advanced_yii2.companies: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` (`company_id`, `company_name`, `company_email`, `company_address`, `company_start_date`, `company_created_date`, `company_status`) VALUES
	(1, 'Yakso Corp', 'contato@yakso.com.br', 'Rua sem saída', '0000-00-00', '2015-09-22 23:13:16', 'active'),
	(2, 'Nova Empresa', 'empresa@email.com.br', 'Novo Endereço', '2015-09-25', '2015-09-29 23:25:42', 'active');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;


-- Copiando estrutura para tabela advanced_yii2.departaments
CREATE TABLE IF NOT EXISTS `departaments` (
  `departament_id` int(11) NOT NULL AUTO_INCREMENT,
  `branches_branch_id` int(11) NOT NULL,
  `departament_name` varchar(100) DEFAULT NULL,
  `companies_company_id` int(11) NOT NULL,
  `departament_created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `departament_status` enum('active','inactive') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`departament_id`),
  KEY `FK1_branches` (`branches_branch_id`),
  KEY `FK2_companies` (`companies_company_id`),
  CONSTRAINT `FK1_branches` FOREIGN KEY (`branches_branch_id`) REFERENCES `branches` (`branch_id`),
  CONSTRAINT `FK2_companies` FOREIGN KEY (`companies_company_id`) REFERENCES `companies` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela advanced_yii2.departaments: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `departaments` DISABLE KEYS */;
INSERT INTO `departaments` (`departament_id`, `branches_branch_id`, `departament_name`, `companies_company_id`, `departament_created_date`, `departament_status`) VALUES
	(1, 1, 'Sales', 1, '2015-09-22 23:23:37', 'active');
/*!40000 ALTER TABLE `departaments` ENABLE KEYS */;


-- Copiando estrutura para tabela advanced_yii2.migration
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela advanced_yii2.migration: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` (`version`, `apply_time`) VALUES
	('m000000_000000_base', 1442884248),
	('m130524_201442_init', 1442884268);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;


-- Copiando estrutura para tabela advanced_yii2.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela advanced_yii2.user: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
	(1, NULL, NULL, 'doingiteasy', 'd6uT9K1smdmRZVzaO0XpKwMoMmWtWnCL', '$2y$13$3VV7ZW/Zjkn5SzZGs/okE.YLOCk3cTAFgaDyQlSf5Z.5gRVWCHAYa', NULL, 'marcosarobed@gmail.com', 10, 1442884477, 1442884477),
	(2, NULL, NULL, 'admin', 'hbBupV44qVvRInMXD3bOugETOc4lXrcx', '$2y$13$M8i5XwnNW4LgQisWiAFtAO9HYpl3d4V2WWqmztwHT125W.m8E9bLG', NULL, 'marcosarobed@gmail.com.br', 10, 1442885176, 1442885176);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
