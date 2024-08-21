-- MySQL dump 10.13  Distrib 5.7.8-rc, for Linux (x86_64)
--
-- Host: localhost    Database: hbnb_dev_db
-- ------------------------------------------------------
-- Server version	5.7.8-rc

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Drop database
DROP DATABASE IF EXISTS hbnb_dev_db;

-- Create database + user if doesn't exist
CREATE DATABASE IF NOT EXISTS hbnb_dev_db;
CREATE USER IF NOT EXISTS 'hbnb_dev'@'localhost';
SET PASSWORD FOR 'hbnb_dev'@'localhost' = 'hbnb_dev_pwd';
GRANT ALL ON hbnb_dev_db.* TO 'hbnb_dev'@'localhost';
GRANT SELECT ON performance_schema.* TO 'hbnb_dev'@'localhost';
FLUSH PRIVILEGES;

USE hbnb_dev_db;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(128) NOT NULL,
  `state_id` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES ('521a55f4-7d82-47d9-b54c-a76916479545','2017-03-25 19:42:40','2017-03-25 19:42:40','Akron','421a55f4-7d82-47d9-b54c-a76916479545'),('521a55f4-7d82-47d9-b54c-a76916479546','2017-03-25 19:42:40','2017-03-25 19:42:40','Douglas','421a55f4-7d82-47d9-b54c-a76916479546'),('521a55f4-7d82-47d9-b54c-a76916479547','2017-03-25 19:42:40','2017-03-25 19:42:40','San Francisco','421a55f4-7d82-47d9-b54c-a76916479547'),('521a55f4-7d82-47d9-b54c-a76916479548','2017-03-25 19:42:41','2017-03-25 19:42:41','Denver','421a55f4-7d82-47d9-b54c-a76916479548'),('521a55f4-7d82-47d9-b54c-a76916479549','2017-03-25 19:42:41','2017-03-25 19:42:41','Miami','421a55f4-7d82-47d9-b54c-a76916479549'),('521a55f4-7d82-47d9-b54c-a76916479551','2017-03-25 19:42:41','2017-03-25 19:42:41','Honolulu','421a55f4-7d82-47d9-b54c-a76916479551'),('521a55f4-7d82-47d9-b54c-a76916479552','2017-03-25 19:42:41','2017-03-25 19:42:41','Chicago','421a55f4-7d82-47d9-b54c-a76916479552'),('521a55f4-7d82-47d9-b54c-a76916479554','2017-03-25 19:42:41','2017-03-25 19:42:41','New Orleans','421a55f4-7d82-47d9-b54c-a76916479554'),('521a55f4-7d82-47d9-b54c-a76916479555','2017-03-25 19:42:41','2017-03-25 19:42:41','Saint Paul','421a55f4-7d82-47d9-b54c-a76916479555'),('521a55f4-7d82-47d9-b54c-a76916479556','2017-03-25 19:42:41','2017-03-25 19:42:41','Jackson','421a55f4-7d82-47d9-b54c-a76916479556'),('521a55f4-7d82-47d9-b54c-a76916479557','2017-03-25 19:42:41','2017-03-25 19:42:41','Portland','421a55f4-7d82-47d9-b54c-a76916479557'),('531a55f4-7d82-47d9-b54c-a76916479545','2017-03-25 19:42:40','2017-03-25 19:42:40','Babbie','421a55f4-7d82-47d9-b54c-a76916479545'),('531a55f4-7d82-47d9-b54c-a76916479546','2017-03-25 19:42:40','2017-03-25 19:42:40','Kearny','421a55f4-7d82-47d9-b54c-a76916479546'),('531a55f4-7d82-47d9-b54c-a76916479547','2017-03-25 19:42:40','2017-03-25 19:42:40','San Jose','421a55f4-7d82-47d9-b54c-a76916479547'),('531a55f4-7d82-47d9-b54c-a76916479549','2017-03-25 19:42:41','2017-03-25 19:42:41','Orlando','421a55f4-7d82-47d9-b54c-a76916479549'),('531a55f4-7d82-47d9-b54c-a76916479551','2017-03-25 19:42:41','2017-03-25 19:42:41','Kailua','421a55f4-7d82-47d9-b54c-a76916479551'),('531a55f4-7d82-47d9-b54c-a76916479552','2017-03-25 19:42:41','2017-03-25 19:42:41','Peoria','421a55f4-7d82-47d9-b54c-a76916479552'),('531a55f4-7d82-47d9-b54c-a76916479554','2017-03-25 19:42:41','2017-03-25 19:42:41','Baton rouge','421a55f4-7d82-47d9-b54c-a76916479554'),('531a55f4-7d82-47d9-b54c-a76916479556','2017-03-25 19:42:41','2017-03-25 19:42:41','Tupelo','421a55f4-7d82-47d9-b54c-a76916479556'),('531a55f4-7d82-47d9-b54c-a76916479557','2017-03-25 19:42:41','2017-03-25 19:42:41','Eugene','421a55f4-7d82-47d9-b54c-a76916479557'),('541a55f4-7d82-47d9-b54c-a76916479545','2017-03-25 19:42:40','2017-03-25 19:42:40','Calera','421a55f4-7d82-47d9-b54c-a76916479545'),('541a55f4-7d82-47d9-b54c-a76916479546','2017-03-25 19:42:40','2017-03-25 19:42:40','Tempe','421a55f4-7d82-47d9-b54c-a76916479546'),('541a55f4-7d82-47d9-b54c-a76916479547','2017-03-25 19:42:40','2017-03-25 19:42:40','Fremont','421a55f4-7d82-47d9-b54c-a76916479547'),('541a55f4-7d82-47d9-b54c-a76916479551','2017-03-25 19:42:41','2017-03-25 19:42:41','Pearl city','421a55f4-7d82-47d9-b54c-a76916479551'),('541a55f4-7d82-47d9-b54c-a76916479552','2017-03-25 19:42:41','2017-03-25 19:42:41','Naperville','421a55f4-7d82-47d9-b54c-a76916479552'),('541a55f4-7d82-47d9-b54c-a76916479554','2017-03-25 19:42:41','2017-03-25 19:42:41','Lafayette','421a55f4-7d82-47d9-b54c-a76916479554'),('541a55f4-7d82-47d9-b54c-a76916479556','2017-03-25 19:42:41','2017-03-25 19:42:41','Meridian','421a55f4-7d82-47d9-b54c-a76916479556'),('551a55f4-7d82-47d9-b54c-a76916479545','2017-03-25 19:42:40','2017-03-25 19:42:40','Fairfield','421a55f4-7d82-47d9-b54c-a76916479545'),('551a55f4-7d82-47d9-b54c-a76916479547','2017-03-25 19:42:40','2017-03-25 19:42:40','Napa','421a55f4-7d82-47d9-b54c-a76916479547'),('551a55f4-7d82-47d9-b54c-a76916479552','2017-03-25 19:42:41','2017-03-25 19:42:41','Urbana','421a55f4-7d82-47d9-b54c-a76916479552'),('561a55f4-7d82-47d9-b54c-a76916479547','2017-03-25 19:42:40','2017-03-25 19:42:40','Sonoma','421a55f4-7d82-47d9-b54c-a76916479547'),('561a55f4-7d82-47d9-b54c-a76916479552','2017-03-25 19:42:41','2017-03-25 19:42:41','Joliet','421a55f4-7d82-47d9-b54c-a76916479552');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

-- Table structure for table `users`
CREATE TABLE `users` (
  `id` varchar(60) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(128),
  `last_name` varchar(128),
  `created_at` datetime,
  `updated_at` datetime,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES 
('user1', 'user1@example.com', 'password1', 'John', 'Doe', '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
('user2', 'user2@example.com', 'password2', 'Jane', 'Smith', '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
('user3', 'user3@example.com', 'password3', 'Alice', 'Johnson', '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
('user4', 'user4@example.com', 'password4', 'Bob', 'Brown', '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
('user5', 'user5@example.com', 'password5', 'Charlie', 'Davis', '2023-10-01 12:00:00', '2023-10-01 12:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

-- Create table `reviews`
CREATE TABLE `reviews` (
  `id` varchar(60) NOT NULL,
  `place_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `text` varchar(1024) NOT NULL,
  `created_at` datetime,
  `updated_at` datetime,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`place_id`) REFERENCES `places` (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insert dummy data into `reviews`
LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES 
('review1', '1', 'user1', 'Great place, very cozy!', '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
('review2', '2', 'user2', 'Amazing view and location.', '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
('review3', '3', 'user3', 'Had a wonderful time here.', '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
('review4', '4', 'user4', 'Very clean and well-maintained.', '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
('review5', '5', 'user5', 'Spacious and comfortable.', '2023-10-01 12:00:00', '2023-10-01 12:00:00');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `id` varchar(60) NOT NULL,
  `city_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(1024),
  `number_rooms` int NOT NULL,
  `number_bathrooms` int NOT NULL,
  `max_guest` int NOT NULL,
  `price_by_night` int NOT NULL,
  `latitude` float,
  `longitude` float,
  `created_at` datetime,
  `updated_at` datetime,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES 
('1', '521a55f4-7d82-47d9-b54c-a76916479545', 'user1', 'Cozy Cottage', 'A small, cozy cottage in the woods.', 2, 1, 4, 100, 34.0522, -118.2437, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
('2', '521a55f4-7d82-47d9-b54c-a76916479546', 'user2', 'Beach House', 'A beautiful beach house with ocean views.', 3, 2, 6, 200, 36.7783, -119.4179, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
('3', '521a55f4-7d82-47d9-b54c-a76916479547', 'user3', 'Mountain Cabin', 'A rustic cabin in the mountains.', 4, 3, 8, 150, 39.7392, -104.9903, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
('4', '521a55f4-7d82-47d9-b54c-a76916479548', 'user4', 'City Apartment', 'A modern apartment in the city center.', 2, 2, 4, 120, 40.7128, -74.0060, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
('5', '521a55f4-7d82-47d9-b54c-a76916479549', 'user5', 'Country House', 'A spacious house in the countryside.', 5, 4, 10, 250, 37.7749, -122.4194, '2023-10-01 12:00:00', '2023-10-01 12:00:00');
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

-- Create table `place_amenity`
CREATE TABLE `place_amenity` (
  `place_id` varchar(60) NOT NULL,
  `amenity_id` varchar(60) NOT NULL,
  PRIMARY KEY (`place_id`, `amenity_id`),
  FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`amenity_id`) REFERENCES `amenities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insert dummy data into `place_amenity`
LOCK TABLES `place_amenity` WRITE;
/*!40000 ALTER TABLE `place_amenity` DISABLE KEYS */;
INSERT INTO `place_amenity` VALUES 
('1', 'amenity1'),
('2', 'amenity2'),
('3', 'amenity3'),
('4', 'amenity4'),
('5', 'amenity5');
/*!40000 ALTER TABLE `place_amenity` ENABLE KEYS */;
UNLOCK TABLES;

-- Create table `amenities`
CREATE TABLE `amenities` (
  `id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  `created_at` datetime,
  `updated_at` datetime,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insert dummy data into `amenities`
LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
INSERT INTO `amenities` VALUES 
('amenity1', 'WiFi', '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
('amenity2', 'Pool', '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
('amenity3', 'Parking', '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
('amenity4', 'Air Conditioning', '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
('amenity5', 'Gym', '2023-10-01 12:00:00', '2023-10-01 12:00:00');
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES ('421a55f4-7d82-47d9-b54c-a76916479545','2017-03-25 19:42:40','2017-03-25 19:42:40','Alabama'),('421a55f4-7d82-47d9-b54c-a76916479546','2017-03-25 19:42:40','2017-03-25 19:42:40','Arizona'),('421a55f4-7d82-47d9-b54c-a76916479547','2017-03-25 19:42:40','2017-03-25 19:42:40','California'),('421a55f4-7d82-47d9-b54c-a76916479548','2017-03-25 19:42:40','2017-03-25 19:42:40','Colorado'),('421a55f4-7d82-47d9-b54c-a76916479549','2017-03-25 19:42:40','2017-03-25 19:42:40','Florida'),('421a55f4-7d82-47d9-b54c-a76916479550','2017-03-25 19:42:40','2017-03-25 19:42:40','Georgia'),('421a55f4-7d82-47d9-b54c-a76916479551','2017-03-25 19:42:40','2017-03-25 19:42:40','Hawaii'),('421a55f4-7d82-47d9-b54c-a76916479552','2017-03-25 19:42:40','2017-03-25 19:42:40','Illinois'),('421a55f4-7d82-47d9-b54c-a76916479553','2017-03-25 19:42:40','2017-03-25 19:42:40','Indiana'),('421a55f4-7d82-47d9-b54c-a76916479554','2017-03-25 19:42:40','2017-03-25 19:42:40','Louisiana'),('421a55f4-7d82-47d9-b54c-a76916479555','2017-03-25 19:42:40','2017-03-25 19:42:40','Minnesota'),('421a55f4-7d82-47d9-b54c-a76916479556','2017-03-25 19:42:40','2017-03-25 19:42:40','Mississippi'),('421a55f4-7d82-47d9-b54c-a76916479557','2017-03-25 19:42:40','2017-03-25 19:42:40','Oregon');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-25 19:42:51
