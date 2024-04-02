-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: db-capstone-project
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `Bookings`
--

DROP TABLE IF EXISTS `Bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bookings` (
  `bookingID` int NOT NULL,
  `bookingDate` date NOT NULL,
  `tableNo` int NOT NULL,
  `bookingSlot` time NOT NULL,
  `customerID` int NOT NULL,
  `orderID` int NOT NULL,
  `staffID` int NOT NULL,
  PRIMARY KEY (`bookingID`),
  KEY `fk_orderID_idx` (`orderID`),
  KEY `fk_customerID_idx` (`customerID`),
  KEY `fk_staffID_idx` (`staffID`),
  CONSTRAINT `fk_customerID` FOREIGN KEY (`customerID`) REFERENCES `CustomerDetails` (`customerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_orderID` FOREIGN KEY (`orderID`) REFERENCES `Orders` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_staffID` FOREIGN KEY (`staffID`) REFERENCES `Staff` (`staffID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bookings`
--

LOCK TABLES `Bookings` WRITE;
/*!40000 ALTER TABLE `Bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerDetails`
--

DROP TABLE IF EXISTS `CustomerDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CustomerDetails` (
  `customerID` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `contactNumber` int NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerDetails`
--

LOCK TABLES `CustomerDetails` WRITE;
/*!40000 ALTER TABLE `CustomerDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `CustomerDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menu`
--

DROP TABLE IF EXISTS `Menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Menu` (
  `menuID` int NOT NULL,
  `cuisines` varchar(45) NOT NULL,
  `starters` varchar(45) NOT NULL,
  `courses` varchar(45) NOT NULL,
  `drinks` varchar(45) NOT NULL,
  `desserts` varchar(45) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  PRIMARY KEY (`menuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu`
--

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `Menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderDeliveryStatus`
--

DROP TABLE IF EXISTS `OrderDeliveryStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderDeliveryStatus` (
  `statusID` int NOT NULL,
  `deliveryDate` date NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`statusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderDeliveryStatus`
--

LOCK TABLES `OrderDeliveryStatus` WRITE;
/*!40000 ALTER TABLE `OrderDeliveryStatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderDeliveryStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `orderID` int NOT NULL,
  `orderDate` date NOT NULL,
  `quantity` int NOT NULL,
  `cost` decimal(5,2) NOT NULL,
  `menuID` int NOT NULL,
  `statusID` int NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `fk_menuID_idx` (`menuID`),
  KEY `fk_statusID_idx` (`statusID`),
  CONSTRAINT `fk_menuID` FOREIGN KEY (`menuID`) REFERENCES `Menu` (`menuID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_statusID` FOREIGN KEY (`statusID`) REFERENCES `OrderDeliveryStatus` (`statusID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Staff` (
  `staffID` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` varchar(45) NOT NULL,
  `salary` decimal(5,2) NOT NULL,
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-01 14:52:06
