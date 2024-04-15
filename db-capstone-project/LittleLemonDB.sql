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
  `bookingSlot` time DEFAULT NULL,
  `customerID` int NOT NULL,
  `orderID` int DEFAULT NULL,
  `staffID` int NOT NULL,
  PRIMARY KEY (`bookingID`),
  KEY `fk_customerID_idx` (`customerID`),
  KEY `fk_staffID_idx` (`staffID`),
  CONSTRAINT `fk_customerID` FOREIGN KEY (`customerID`) REFERENCES `CustomerDetails` (`customerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_staffID` FOREIGN KEY (`staffID`) REFERENCES `Staff` (`staffID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bookings`
--

LOCK TABLES `Bookings` WRITE;
/*!40000 ALTER TABLE `Bookings` DISABLE KEYS */;
INSERT INTO `Bookings` VALUES (1,'2022-10-10',5,'19:00:00',1,1,1),(2,'2022-11-12',3,'20:00:00',3,3,1),(3,'2022-10-11',2,'21:00:00',2,5,2),(4,'2022-10-13',2,'14:00:00',1,7,3),(5,'2020-12-20',5,'15:00:00',6,9,4),(6,'2020-03-01',6,'16:00:00',9,11,11),(7,'2021-10-04',1,'17:00:00',11,12,1),(8,'2021-10-09',2,'18:00:00',8,10,2),(9,'2021-12-27',3,'19:00:00',2,8,3),(10,'2020-03-05',4,'20:00:00',5,6,4),(11,'2019-07-20',5,'21:00:00',7,4,5),(12,'2022-06-26',1,'13:30:00',10,2,6);
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
  `name` varchar(255) DEFAULT NULL,
  `contactNumber` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerDetails`
--

LOCK TABLES `CustomerDetails` WRITE;
/*!40000 ALTER TABLE `CustomerDetails` DISABLE KEYS */;
INSERT INTO `CustomerDetails` VALUES (1,'Laney Fadden',587499630,'Laney_Fadden@yahoo.com'),(2,'Giacopo Bramich',602387059,'Giacopo_Bramich@yahoo.com'),(3,'Lia Bonar',35757094,'Lia_Bonar@yahoo.com'),(4,'Merrill Baudon',834658495,'Merrill_Baudon@yahoo.com'),(5,'Tasia Fautly',971220077,'Tasia_Fautly@yahoo.com'),(6,'Angel Veschambre',441068726,'Angel_Veschambre@yahoo.com'),(7,'Sheilah Maestro',756528475,'Sheilah_Maestro@yahoo.com'),(8,'Audie Willcocks',666831761,'Audie_Willcocks@yahoo.com'),(9,'Mart Malsher',182382784,'Mart_Malsher@yahoo.com'),(10,'Magdalen Lacheze',144270652,'Magdalen_Lacheze@yahoo.com'),(11,'Margarita Mancktelow',968835571,'Margarita_Mancktelow@yahoo.com'),(12,'Ashil Brogini',594502625,'Ashil_Brogini@yahoo.com');
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
  `itemID` int NOT NULL,
  `cuisine` varchar(45) NOT NULL,
  PRIMARY KEY (`menuID`,`itemID`),
  KEY `fk_itemID_idx` (`itemID`),
  CONSTRAINT `fk_itemID` FOREIGN KEY (`itemID`) REFERENCES `MenuItems` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu`
--

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;
INSERT INTO `Menu` VALUES (1,1,'greek'),(1,7,'greek'),(1,10,'greek'),(1,13,'greek'),(2,3,'italian'),(2,9,'italian'),(2,12,'italian'),(2,15,'italian'),(3,5,'turkish'),(3,11,'turkish'),(3,16,'turkish'),(3,17,'turkish');
/*!40000 ALTER TABLE `Menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MenuItems`
--

DROP TABLE IF EXISTS `MenuItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MenuItems` (
  `itemID` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenuItems`
--

LOCK TABLES `MenuItems` WRITE;
/*!40000 ALTER TABLE `MenuItems` DISABLE KEYS */;
INSERT INTO `MenuItems` VALUES (1,'olives','starters',11),(2,'flatbread','starters',5),(3,'minestrone','starters',7),(4,'tomato bread','starters',8),(5,'falafel','starters',8),(6,'hummus','starters',6),(7,'greek salad','main courses',22),(8,'been soup','main courses',21),(9,'pizza','main courses',55),(10,'kabasa','main courses',33),(11,'carbonara','main courses',43),(12,'greek yoghurt','desserts',5),(13,'ice cream','desserts',4),(14,'cheescake','desserts',3),(15,'athens white wine','drinks',5),(16,'corfu red wine','drinks',7),(17,'turkish cofee','drinks',8);
/*!40000 ALTER TABLE `MenuItems` ENABLE KEYS */;
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
INSERT INTO `OrderDeliveryStatus` VALUES (1,'2020-03-26','delivered'),(2,'2020-07-17','delivered'),(3,'2020-04-24','in queue'),(4,'2020-04-13','delivered'),(5,'2021-02-02','preparing'),(6,'2020-01-13','served'),(7,'2019-10-26','served'),(8,'2020-12-27','served'),(9,'2021-04-16','preparing'),(10,'2021-11-13','in queue'),(11,'2019-11-28','in queue'),(12,'2021-04-17','delivered');
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
INSERT INTO `Orders` VALUES (1,'2020-06-15',2,250.00,1,1),(2,'2020-08-25',4,940.00,2,3),(3,'2021-08-17',1,75.00,2,5),(4,'2021-08-14',1,220.00,3,7),(5,'2020-12-20',2,640.00,1,9),(6,'2020-03-01',4,840.00,2,11),(7,'2021-10-04',3,930.00,3,2),(8,'2021-10-09',5,625.00,2,4),(9,'2021-12-27',2,380.00,1,6),(10,'2020-03-05',1,98.00,1,8),(11,'2019-07-20',2,336.54,2,2),(12,'2022-06-26',1,101.60,3,4);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `OrdersView`
--

DROP TABLE IF EXISTS `OrdersView`;
/*!50001 DROP VIEW IF EXISTS `OrdersView`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `OrdersView` AS SELECT 
 1 AS `orderID`,
 1 AS `quantity`,
 1 AS `cost`*/;
SET character_set_client = @saved_cs_client;

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
INSERT INTO `Staff` VALUES (1,'Sabra Calbreath','manager',870.50),(2,'Obidiah Zanicchi','head chef',152.50),(3,'Anders Stowe','receptionist',112.50),(4,'Locke Janaway','receptionist',300.00),(5,'Kaylyn Colebourne','chef assistant',480.00),(6,'Noni Quickenden','waiter',315.00),(7,'Alan Paskell','waiter',465.00),(8,'Anny Pattemore','waiter',337.50),(9,'Les Harmson','waiter',280.00),(10,'Horatio Lundy','head waiter',147.00),(11,'Sibley Rodder','head chef',252.45);
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db-capstone-project'
--

--
-- Dumping routines for database 'db-capstone-project'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`capstoneProject`@`%` PROCEDURE `AddBooking`(booking_id int, customer_id int, table_no int, booking_date date)
BEGIN
DECLARE is_present int;
DECLARE check_bookingID int;
DECLARE check_customerID int;
DECLARE booking_status varchar(45);

set is_present = (select exists (select bookingID from Bookings 
                                 where bookingDate = booking_date  
                                   and tableNo = table_no));

set check_bookingID = (select exists (select bookingID from Bookings where bookingID = booking_id));
set check_customerID = (select exists (select customerID from CustomerDetails where customerID = customer_id));

if is_present = 1 then
    set booking_status = " is already booked for date: ";
    select concat("Table ", table_no, booking_status, booking_date) as "Confirmation";

elseif check_bookingID = 1 then
    set booking_status = "BookingID is present, select ";
    select concat( booking_status, max(bookingID)+1 ) as "Confirmation" from Bookings;
    
else
    if check_customerID = 0 then
        insert into CustomerDetails (CustomerID) 
                             values (customer_id);
    end if;
    
    set booking_status = "New booking added";
	select booking_status as "Confirmation";
	insert into Bookings(bookingID, bookingDate, tableNo, customerID, staffID)
				  values(booking_id, booking_date, table_no, customer_id, 3);
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CancelBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`capstoneProject`@`%` PROCEDURE `CancelBooking`(booking_id int)
BEGIN

DECLARE check_bookingID int;
DECLARE booking_status varchar(100);

set check_bookingID = (select exists (select bookingID from Bookings where bookingID = booking_id));

if check_bookingID = 0 then
    set booking_status = "Can not cancel, BookingID not present in table";
   
else
    set booking_status = (select concat("Booking ", booking_id, " cancelled"));
    delete from Bookings where bookingID = booking_id;
    
end if;
select booking_status as "Confirmation";

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CancelOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`capstoneProject`@`%` PROCEDURE `CancelOrder`(IN order_id INT)
BEGIN
DECLARE is_present INT;
DECLARE order_status VARCHAR(45);

SET is_present = (select exists (select orderID from Orders where orderID = order_id));

if is_present = 1 then
    /* DELETE FROM Orders WHERE orderID = order_id */
    set order_status = " is cancelled";
else
    set order_status = " not exists";
end if;

select concat("Order ", order_id, order_status) as "Confirmation";

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`capstoneProject`@`%` PROCEDURE `CheckBooking`(booking_date DATE, table_no INT)
BEGIN
DECLARE is_present int;
DECLARE table_status varchar(45);

set is_present = (select exists (select bookingID from Bookings where bookingDate = booking_date and tableNo = table_no ));

if is_present = 1 then
    set table_status = " is already booked";
else
    set table_status = " is not booked";
end if;
select concat("Table ", table_no, table_status) as "Booking status";

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMaxQuantity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`capstoneProject`@`%` PROCEDURE `GetMaxQuantity`()
BEGIN
select max(quantity) as `Max Quantity in Order`
from Orders;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`capstoneProject`@`%` PROCEDURE `UpdateBooking`(booking_id int, booking_date date)
BEGIN

DECLARE check_bookingID int;
DECLARE check_date int;
DECLARE booking_status varchar(100);

set check_bookingID = (select exists (select bookingID from Bookings where bookingID = booking_id));
set check_date = (select exists (select bookingDate from Bookings where bookingDate = booking_date));

if check_bookingID = 0 then
    set booking_status = "Can not update, BookingID not present in table";
    select booking_status as "Confirmation";

elseif check_date = 1 then
    set booking_status = "Can not update, date already booked";
    select booking_status as "Confirmation";

else
    set booking_status = " updated";
    select concat("Booking ", booking_id, booking_status);
    update Bookings set bookingDate = booking_date where bookingID = booking_id; 
     
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `OrdersView`
--

/*!50001 DROP VIEW IF EXISTS `OrdersView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`capstoneProject`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `OrdersView` AS select `Orders`.`orderID` AS `orderID`,`Orders`.`quantity` AS `quantity`,`Orders`.`cost` AS `cost` from `Orders` where (`Orders`.`quantity` > 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-15 15:37:18
