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

-- Copiando estrutura para tabela advanced_yii2.auth_assignment
CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `auth_assignment_ibfk_2` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_assignment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela advanced_yii2.auth_assignment: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
  ('admin', 2, '2015-10-06 21:51:07'),
  ('create-branch', 3, '2015-10-06 21:54:00'),
  ('create-company', 3, '2015-10-06 21:51:07'),
  ('updateOwnPost', 3, '2015-10-06 21:51:07');
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;


-- Copiando estrutura para tabela advanced_yii2.auth_item
CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela advanced_yii2.auth_item: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
  ('admin', 1, 'admin can create branches and create companies', NULL, NULL, NULL, NULL),
  ('create-branch', 2, 'allow a user to add a branch', NULL, NULL, NULL, NULL),
  ('create-company', 2, 'allow a user to add a company', NULL, NULL, NULL, NULL),
  ('updateOwnPost', 2, 'update yout own post', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;


-- Copiando estrutura para tabela advanced_yii2.auth_item_child
CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela advanced_yii2.auth_item_child: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
  ('admin', 'create-branch'),
  ('admin', 'create-company');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;


-- Copiando estrutura para tabela advanced_yii2.auth_rule
CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela advanced_yii2.auth_rule: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela advanced_yii2.branches: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` (`branch_id`, `companies_company_id`, `branch_name`, `branch_address`, `branch_created_date`, `branch_status`) VALUES
  (1, 1, 'My Branche', 'Branch Address', '2015-09-22 23:18:58', 'active'),
  (2, 2, 'Marcos', 'Kubas', '2015-09-30 22:12:36', 'inactive'),
  (3, 3, 'New Branch Master', 'Guaíba', '2015-10-03 17:58:24', 'active');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;


-- Copiando estrutura para tabela advanced_yii2.companies
CREATE TABLE IF NOT EXISTS `companies` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) DEFAULT NULL,
  `company_email` varchar(100) DEFAULT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `company_logo` varchar(255) DEFAULT NULL,
  `company_start_date` date NOT NULL DEFAULT '0000-00-00',
  `company_created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_status` enum('active','inactive') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela advanced_yii2.companies: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` (`company_id`, `company_name`, `company_email`, `company_address`, `company_logo`, `company_start_date`, `company_created_date`, `company_status`) VALUES
  (1, 'Yakso Corp', 'contato@yakso.com.br', 'Rua sem saída', NULL, '0000-00-00', '2015-09-22 23:13:16', 'active'),
  (2, 'Nova Empresa', 'empresa@email.com.br', 'Novo Endereço', NULL, '2015-09-25', '2015-09-29 23:25:42', 'active'),
  (3, 'KubasYakso', 'contato@yakso.com.br', 'Avenida A', 'uploads/KubasYakso.png', '0000-00-00', '2015-10-01 21:04:25', 'active');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;


-- Copiando estrutura para tabela advanced_yii2.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela advanced_yii2.customers: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;


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


-- Copiando estrutura para tabela advanced_yii2.emails
CREATE TABLE IF NOT EXISTS `emails` (
  `email_id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver_name` varchar(50) NOT NULL,
  `receiver_email` varchar(200) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `attachment` varchar(255) NOT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela advanced_yii2.emails: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
INSERT INTO `emails` (`email_id`, `receiver_name`, `receiver_email`, `subject`, `content`, `attachment`) VALUES
  (1, 'Marcos', 'marcosarobed@gmail.com', 'Testing Mail', 'Mail to attachments', 'attachments/1443891245.png');
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;


-- Copiando estrutura para tabela advanced_yii2.locations
CREATE TABLE IF NOT EXISTS `locations` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `zip_code` varchar(20) NOT NULL,
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela advanced_yii2.locations: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` (`location_id`, `zip_code`, `city`, `province`) VALUES
  (1, '111', 'Colombo', 'Westerm'),
  (2, '2222', 'Galle', 'Southern');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;


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


-- Copiando estrutura para tabela advanced_yii2.po
CREATE TABLE IF NOT EXISTS `po` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `po_no` varchar(10) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela advanced_yii2.po: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `po` DISABLE KEYS */;
INSERT INTO `po` (`id`, `po_no`, `description`) VALUES
  (1, 'po-1', 'some description');
/*!40000 ALTER TABLE `po` ENABLE KEYS */;


-- Copiando estrutura para tabela advanced_yii2.po_item
CREATE TABLE IF NOT EXISTS `po_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `po_item_no` varchar(10) NOT NULL,
  `quantity` double NOT NULL,
  `po_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `po_id` (`po_id`),
  CONSTRAINT `fk001_poItem_po` FOREIGN KEY (`po_id`) REFERENCES `po` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela advanced_yii2.po_item: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `po_item` DISABLE KEYS */;
INSERT INTO `po_item` (`id`, `po_item_no`, `quantity`, `po_id`) VALUES
  (1, 'po-item-1', 10, 1),
  (2, 'po-item-2', 15, 1);
/*!40000 ALTER TABLE `po_item` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela advanced_yii2.user: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
  (1, NULL, NULL, 'doingiteasy', 'd6uT9K1smdmRZVzaO0XpKwMoMmWtWnCL', '$2y$13$3VV7ZW/Zjkn5SzZGs/okE.YLOCk3cTAFgaDyQlSf5Z.5gRVWCHAYa', NULL, 'marcosarobed@gmail.com', 10, 1442884477, 1442884477),
  (2, NULL, NULL, 'admin', 'hbBupV44qVvRInMXD3bOugETOc4lXrcx', '$2y$13$M8i5XwnNW4LgQisWiAFtAO9HYpl3d4V2WWqmztwHT125W.m8E9bLG', NULL, 'marcosarobed@gmail.com.br', 10, 1442885176, 1442885176),
  (3, 'somename', 'somename', 'sam', 'YEQZ93b_snGyAObvTcBVDyRr2eh5l-R5', '$2y$13$iHxnJ/V7l8SH8RbTFY7R5utjBj8rxZYfj6K5VOpaPts9bibEeLJ2i', NULL, 'somename@gmail.com', 10, 1444178615, 1444178615);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
