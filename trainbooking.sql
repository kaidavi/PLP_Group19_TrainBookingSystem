-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: trainbooking
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booking_tbl`
--

DROP TABLE IF EXISTS `booking_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_tbl` (
  `booking_id` int NOT NULL,
  `ticket_id` int NOT NULL,
  `train_id` int NOT NULL,
  `schedule_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `booking_date` date DEFAULT NULL,
  `booking_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `train_id` (`train_id`),
  KEY `schedule_id` (`schedule_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `booking_tbl_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket_tbl` (`ticket_id`),
  CONSTRAINT `booking_tbl_ibfk_2` FOREIGN KEY (`train_id`) REFERENCES `train_tbl` (`train_id`),
  CONSTRAINT `booking_tbl_ibfk_3` FOREIGN KEY (`schedule_id`) REFERENCES `schedule_tbl` (`schedule_id`),
  CONSTRAINT `booking_tbl_ibfk_4` FOREIGN KEY (`customer_id`) REFERENCES `customers_tbl` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_tbl`
--

LOCK TABLES `booking_tbl` WRITE;
/*!40000 ALTER TABLE `booking_tbl` DISABLE KEYS */;
INSERT INTO `booking_tbl` VALUES (1,1,1,1,1,'2025-01-10','John Kamau booking for East-West Route'),(2,2,2,2,2,'2025-01-11','Jane Chebet booking for North-East Route');
/*!40000 ALTER TABLE `booking_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_tbl`
--

DROP TABLE IF EXISTS `customers_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers_tbl` (
  `customer_id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `customer_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_tbl`
--

LOCK TABLES `customers_tbl` WRITE;
/*!40000 ALTER TABLE `customers_tbl` DISABLE KEYS */;
INSERT INTO `customers_tbl` VALUES (1,'John','Kamau','john.kam@gmail.com','0712345678','123 kilifi, MSA'),(2,'Jane','Chebet','jane.cheb@gmail.com','0798765432','456 Kim, ELD');
/*!40000 ALTER TABLE `customers_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_tbl`
--

DROP TABLE IF EXISTS `payment_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_tbl` (
  `payment_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `booking_id` int NOT NULL,
  `payment_amount` decimal(10,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `customer_id` (`customer_id`),
  KEY `booking_id` (`booking_id`),
  CONSTRAINT `payment_tbl_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers_tbl` (`customer_id`),
  CONSTRAINT `payment_tbl_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `booking_tbl` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_tbl`
--

LOCK TABLES `payment_tbl` WRITE;
/*!40000 ALTER TABLE `payment_tbl` DISABLE KEYS */;
INSERT INTO `payment_tbl` VALUES (1,1,1,1500.00,'2025-01-10','Paid'),(2,2,2,1000.00,'2025-01-11','Paid');
/*!40000 ALTER TABLE `payment_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_tbl`
--

DROP TABLE IF EXISTS `schedule_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_tbl` (
  `schedule_id` int NOT NULL,
  `train_id` int NOT NULL,
  `route_id` int NOT NULL,
  `departure_time` datetime DEFAULT NULL,
  `arrival_time` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `train_id` (`train_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `schedule_tbl_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train_tbl` (`train_id`),
  CONSTRAINT `schedule_tbl_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `trainroute_tbl` (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_tbl`
--

LOCK TABLES `schedule_tbl` WRITE;
/*!40000 ALTER TABLE `schedule_tbl` DISABLE KEYS */;
INSERT INTO `schedule_tbl` VALUES (1,1,1,'2025-01-10 08:00:00','2025-01-10 20:00:00','On Time'),(2,2,2,'2025-01-11 09:00:00','2025-01-11 15:00:00','Delayed');
/*!40000 ALTER TABLE `schedule_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station_tbl`
--

DROP TABLE IF EXISTS `station_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station_tbl` (
  `station_id` int NOT NULL,
  `station_name` varchar(100) DEFAULT NULL,
  `station_code` varchar(20) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station_tbl`
--

LOCK TABLES `station_tbl` WRITE;
/*!40000 ALTER TABLE `station_tbl` DISABLE KEYS */;
INSERT INTO `station_tbl` VALUES (1,'Eldoret Station','CST','Eldoret','ELD'),(2,' Nairobi Station','DST','Nairobi','NAI'),(3,'Mombasa Station','UST','Mombasa','MSA');
/*!40000 ALTER TABLE `station_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_tbl`
--

DROP TABLE IF EXISTS `ticket_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_tbl` (
  `ticket_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `ticket_type` varchar(50) DEFAULT NULL,
  `ticket_date` date DEFAULT NULL,
  `ticket_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `ticket_tbl_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers_tbl` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_tbl`
--

LOCK TABLES `ticket_tbl` WRITE;
/*!40000 ALTER TABLE `ticket_tbl` DISABLE KEYS */;
INSERT INTO `ticket_tbl` VALUES (1,1,'First Class','2025-01-10','Ticket for East-West Route'),(2,2,'Economy','2025-01-11','Ticket for North-East Route');
/*!40000 ALTER TABLE `ticket_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_tbl`
--

DROP TABLE IF EXISTS `train_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_tbl` (
  `train_id` int NOT NULL,
  `train_name` varchar(100) DEFAULT NULL,
  `train_number` varchar(20) DEFAULT NULL,
  `train_seat_number` int DEFAULT NULL,
  `train_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`train_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_tbl`
--

LOCK TABLES `train_tbl` WRITE;
/*!40000 ALTER TABLE `train_tbl` DISABLE KEYS */;
INSERT INTO `train_tbl` VALUES (1,'Express Train','ET123',300,'Express'),(2,'Regional Train','RT456',200,'Regional');
/*!40000 ALTER TABLE `train_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainroute_tbl`
--

DROP TABLE IF EXISTS `trainroute_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainroute_tbl` (
  `route_id` int NOT NULL,
  `source_station_id` int NOT NULL,
  `destination_station_id` int NOT NULL,
  `route_name` varchar(100) DEFAULT NULL,
  `route_distance` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`route_id`),
  KEY `source_station_id` (`source_station_id`),
  KEY `destination_station_id` (`destination_station_id`),
  CONSTRAINT `trainroute_tbl_ibfk_1` FOREIGN KEY (`source_station_id`) REFERENCES `station_tbl` (`station_id`),
  CONSTRAINT `trainroute_tbl_ibfk_2` FOREIGN KEY (`destination_station_id`) REFERENCES `station_tbl` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainroute_tbl`
--

LOCK TABLES `trainroute_tbl` WRITE;
/*!40000 ALTER TABLE `trainroute_tbl` DISABLE KEYS */;
INSERT INTO `trainroute_tbl` VALUES (1,1,2,'East-West Route',4500.00),(2,3,1,'North-East Route',800.00);
/*!40000 ALTER TABLE `trainroute_tbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-10 11:13:10
