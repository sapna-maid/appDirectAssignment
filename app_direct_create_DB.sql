DROP DATABASE IF EXISTS app_direct;
CREATE DATABASE app_direct;
CREATE TABLE `company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `ph_number` varchar(30) DEFAULT NULL,
  `uuid` varchar(50) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `creater` (
  `creater_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `language` tinyint(2) DEFAULT NULL,
  `locale` varchar(20) DEFAULT NULL,
  `open_id` varchar(50) DEFAULT NULL,
  `uuid` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`creater_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `marketplace` (
  `marketplace_id` int(11) NOT NULL AUTO_INCREMENT,
  ` base_url` varchar(50) DEFAULT NULL,
  `partner` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`marketplace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `edition_code` varchar(20) DEFAULT NULL,
  `pricing_duration` tinyint(2) DEFAULT NULL,
  `unit` tinyint(2) DEFAULT NULL,
  `item_quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `subscription` (
  `subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) DEFAULT NULL,
  `marketplace_id` int(11) NOT NULL,
  `creater_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `company_FK` (`company_id`),
  KEY `creater_FK` (`creater_id`),
  KEY `marketplace_FK` (`marketplace_id`),
  KEY `order_FK` (`order_id`),
  CONSTRAINT `company_FK` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `creater_FK` FOREIGN KEY (`creater_id`) REFERENCES `creater` (`creater_id`),
  CONSTRAINT `marketplace_FK` FOREIGN KEY (`marketplace_id`) REFERENCES `marketplace` (`marketplace_id`),
  CONSTRAINT `order_FK` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

