CREATE DATABASE  IF NOT EXISTS `ecommercedb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ecommercedb`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: ecommercedb
-- ------------------------------------------------------
-- Server version	5.5.32

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

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `AddressID` int(11) NOT NULL,
  `ApartmentNumber` varchar(45) NOT NULL,
  `StreetName` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `Zipcode` varchar(45) NOT NULL,
  `LandMark` varchar(45) DEFAULT NULL,
  `ContactNumber` int(11) NOT NULL,
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'909','Alphonsus','Boston','MA','02120','Longwood',2147483647);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartdetails`
--

DROP TABLE IF EXISTS `cartdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartdetails` (
  `CartID` int(11) NOT NULL,
  `InventoryID` int(11) NOT NULL,
  `CartState` varchar(45) NOT NULL,
  `Timestamp` timestamp NULL DEFAULT NULL,
  KEY `CartID_idx` (`CartID`),
  KEY `InventoryID_idx` (`InventoryID`),
  CONSTRAINT `CartID` FOREIGN KEY (`CartID`) REFERENCES `shoppingcart` (`ShoppingCartID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `InventoryID` FOREIGN KEY (`InventoryID`) REFERENCES `inventoryitem` (`InventoryItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartdetails`
--

LOCK TABLES `cartdetails` WRITE;
/*!40000 ALTER TABLE `cartdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcard`
--

DROP TABLE IF EXISTS `creditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditcard` (
  `AccountID` int(11) NOT NULL,
  `CreditCardNumber` int(11) NOT NULL,
  `HolderName` varchar(45) NOT NULL,
  `ExpiryDate` date NOT NULL,
  `CustomerCardID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`AccountID`),
  KEY `CustomerCardID_idx` (`CustomerCardID`),
  CONSTRAINT `CustomerCardID` FOREIGN KEY (`CustomerCardID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcard`
--

LOCK TABLES `creditcard` WRITE;
/*!40000 ALTER TABLE `creditcard` DISABLE KEYS */;
INSERT INTO `creditcard` VALUES (2147483647,2147483647,'danisha','0000-00-00','2145');
/*!40000 ALTER TABLE `creditcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CustomerID` varchar(20) NOT NULL,
  `CustomerSSN` int(11) NOT NULL,
  `CustomerTypeID` tinyint(4) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `SSN_idx` (`CustomerSSN`),
  KEY `CustomerTypeID_idx` (`CustomerTypeID`),
  CONSTRAINT `CustomerSSN` FOREIGN KEY (`CustomerSSN`) REFERENCES `person` (`SSN`),
  CONSTRAINT `CustomerTypeID` FOREIGN KEY (`CustomerTypeID`) REFERENCES `customertype` (`CustomerTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('2145',10076,2);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `customer_order_view`
--

DROP TABLE IF EXISTS `customer_order_view`;
/*!50001 DROP VIEW IF EXISTS `customer_order_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `customer_order_view` (
  `Customer ID` varchar(20),
  `Order ID` int(11),
  `Order Date` date,
  `Order Status` varchar(45),
  `Total Amount` decimal(15,2),
  `Due Date` date
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customerorder`
--

DROP TABLE IF EXISTS `customerorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerorder` (
  `OrderID` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `OrderStatus` varchar(45) NOT NULL,
  `OrderTotalAmount` decimal(15,2) NOT NULL,
  `CustomerOrderID` varchar(20) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerOrderID_idx` (`CustomerOrderID`),
  CONSTRAINT `CustomerOrderID` FOREIGN KEY (`CustomerOrderID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerorder`
--

LOCK TABLES `customerorder` WRITE;
/*!40000 ALTER TABLE `customerorder` DISABLE KEYS */;
INSERT INTO `customerorder` VALUES (21451,'2014-12-02','Pending',214.00,'2145'),(21452,'2014-12-05','Pending',500.00,'2145');
/*!40000 ALTER TABLE `customerorder` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `checkCustomerorder` 
AFTER INSERT ON customerorder 
FOR EACH ROW
-- Edit trigger body code below this line. Do not edit lines above this one
BEGIN
   IF new.OrderTotalAmount> 400 THEN
       UPDATE customer SET CustomerTypeID=2
		WHERE customer.CustomerID= new.CustomerOrderID;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customerreviews`
--

DROP TABLE IF EXISTS `customerreviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerreviews` (
  `CustomerReviewID` int(11) NOT NULL,
  `ItemRate` varchar(45) NOT NULL,
  `ReviewNotes` varchar(45) NOT NULL,
  `ReviewProductID` int(11) NOT NULL,
  `ReviewCustomerId` varchar(20) NOT NULL,
  PRIMARY KEY (`CustomerReviewID`),
  KEY `ReviewCustomerID_idx` (`ReviewCustomerId`),
  KEY `ReviewInventoryID_idx` (`ReviewProductID`),
  CONSTRAINT `ReviewCustomerID` FOREIGN KEY (`ReviewCustomerId`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ReviewProductID` FOREIGN KEY (`ReviewProductID`) REFERENCES `product` (`ProductID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerreviews`
--

LOCK TABLES `customerreviews` WRITE;
/*!40000 ALTER TABLE `customerreviews` DISABLE KEYS */;
INSERT INTO `customerreviews` VALUES (1,'4','was nice',456,'2145');
/*!40000 ALTER TABLE `customerreviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customertype`
--

DROP TABLE IF EXISTS `customertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customertype` (
  `CustomerTypeID` tinyint(4) NOT NULL,
  `TypeDescription` varchar(45) NOT NULL,
  PRIMARY KEY (`CustomerTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customertype`
--

LOCK TABLES `customertype` WRITE;
/*!40000 ALTER TABLE `customertype` DISABLE KEYS */;
INSERT INTO `customertype` VALUES (1,'Registered'),(2,'Privileged'),(3,'New'),(4,'Unregistered User');
/*!40000 ALTER TABLE `customertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `DepartmentID` int(11) NOT NULL,
  `DepartmentName` varchar(45) NOT NULL,
  `DepartmentManager` varchar(45) NOT NULL,
  `DepartmentTypeID` int(11) NOT NULL,
  `DepartmentEmployeeID` varchar(20) NOT NULL,
  PRIMARY KEY (`DepartmentID`),
  KEY `DepartmentTypeID_idx` (`DepartmentTypeID`),
  KEY `DepartmentEmployeeID_idx` (`DepartmentEmployeeID`),
  CONSTRAINT `DepartmentEmployeeID` FOREIGN KEY (`DepartmentEmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `DepartmentTypeID` FOREIGN KEY (`DepartmentTypeID`) REFERENCES `departmenttype` (`DepartmentTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (212,'Finance','Anderson',2,'213');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departmenttype`
--

DROP TABLE IF EXISTS `departmenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departmenttype` (
  `DepartmentTypeID` int(11) NOT NULL,
  `DepartmentTypeName` varchar(45) NOT NULL,
  `DepartmentTypeDetails` varchar(45) NOT NULL,
  PRIMARY KEY (`DepartmentTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departmenttype`
--

LOCK TABLES `departmenttype` WRITE;
/*!40000 ALTER TABLE `departmenttype` DISABLE KEYS */;
INSERT INTO `departmenttype` VALUES (2,'Finance','looks after incoming and outgoing money');
/*!40000 ALTER TABLE `departmenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependent` (
  `EmployeeID` varchar(20) NOT NULL,
  `DependentName` varchar(45) NOT NULL,
  `DependentAge` tinyint(4) NOT NULL,
  `DependentRelation` varchar(45) NOT NULL,
  `DependentGender` varchar(45) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  CONSTRAINT `EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `EmployeeID` varchar(20) NOT NULL,
  `EmployeeSSN` int(11) NOT NULL,
  `AccountNumber` varchar(30) NOT NULL,
  `Salary` decimal(15,2) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `SSN_idx` (`EmployeeSSN`),
  CONSTRAINT `EmployeeSSN` FOREIGN KEY (`EmployeeSSN`) REFERENCES `person` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('213',10078,'9792341',25000.00);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `hr_view`
--

DROP TABLE IF EXISTS `hr_view`;
/*!50001 DROP VIEW IF EXISTS `hr_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `hr_view` (
  `Employee SSN` int(11),
  `Employee ID` varchar(20),
  `First Name` varchar(45),
  `Last Name` varchar(45),
  `Age` tinyint(4),
  `Gender` varchar(10),
  `Contact Number` int(11),
  `Department Name` varchar(45),
  `UserName` varchar(45),
  `Password` varchar(45)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `inventoryitem`
--

DROP TABLE IF EXISTS `inventoryitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventoryitem` (
  `InventoryItemID` int(11) NOT NULL,
  `Title` varchar(45) NOT NULL,
  `Price` decimal(15,2) NOT NULL,
  `Details` varchar(100) NOT NULL,
  `ManufacturedDate` date NOT NULL,
  `Quantity` int(11) NOT NULL,
  `InventoryProductID` int(11) NOT NULL,
  PRIMARY KEY (`InventoryItemID`),
  KEY `InventoryProductID_idx` (`InventoryProductID`),
  CONSTRAINT `InventoryProductID` FOREIGN KEY (`InventoryProductID`) REFERENCES `product` (`ProductID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventoryitem`
--

LOCK TABLES `inventoryitem` WRITE;
/*!40000 ALTER TABLE `inventoryitem` DISABLE KEYS */;
INSERT INTO `inventoryitem` VALUES (167,'HP books',23.00,'asc','2014-10-23',23,456);
/*!40000 ALTER TABLE `inventoryitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `InvoiceID` int(11) NOT NULL,
  `InvoiceDate` date NOT NULL,
  `DueDate` date NOT NULL,
  `AmountDue` decimal(15,2) NOT NULL,
  `AmountReceived` decimal(15,2) NOT NULL,
  `BalanceDue` decimal(15,2) NOT NULL,
  `InvoiceOrderID` varchar(20) NOT NULL,
  PRIMARY KEY (`InvoiceID`),
  KEY `InvoiceCustomerID_idx` (`InvoiceOrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1234,'2014-12-02','2014-12-12',215.00,100.00,115.00,'21451');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `OrderItemNumber` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `OrderNumber` int(11) NOT NULL,
  `ProductItemNumber` int(11) NOT NULL,
  `size` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`OrderItemNumber`),
  KEY `OrderNumber_idx` (`OrderNumber`),
  KEY `InventoryItemNumber_idx` (`ProductItemNumber`),
  CONSTRAINT `OrderNumber` FOREIGN KEY (`OrderNumber`) REFERENCES `customerorder` (`OrderID`),
  CONSTRAINT `ProductItemNumber` FOREIGN KEY (`ProductItemNumber`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (214511,5,21451,456,NULL,NULL);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `PaymentAmount` decimal(15,2) NOT NULL,
  `PaymentState` decimal(15,2) NOT NULL,
  `PaymentTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PaymentTypeID` int(11) NOT NULL,
  `PaymentOrderID` int(11) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `PaymentTypeID_idx` (`PaymentTypeID`),
  KEY `PaymentOrderID_idx` (`PaymentOrderID`),
  CONSTRAINT `PaymentOrderID` FOREIGN KEY (`PaymentOrderID`) REFERENCES `customerorder` (`OrderID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PaymentTypeID` FOREIGN KEY (`PaymentTypeID`) REFERENCES `paymenttype` (`PaymentTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,300.00,0.00,'2014-12-10 05:52:02',1,21451);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymenttype`
--

DROP TABLE IF EXISTS `paymenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymenttype` (
  `PaymentTypeID` int(11) NOT NULL,
  `PaymentTypeDescription` varchar(45) NOT NULL,
  PRIMARY KEY (`PaymentTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymenttype`
--

LOCK TABLES `paymenttype` WRITE;
/*!40000 ALTER TABLE `paymenttype` DISABLE KEYS */;
INSERT INTO `paymenttype` VALUES (1,'Credit card');
/*!40000 ALTER TABLE `paymenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `SSN` int(11) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `MiddleName` varchar(45) DEFAULT NULL,
  `Age` tinyint(4) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `MobileNumber` int(11) NOT NULL,
  `ResidentialNumber` int(11) DEFAULT NULL,
  `EmailID` varchar(45) NOT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (10076,'Danny','Vayalandi','Kannan',21,'Female',2147483647,2147483647,'dannykannan1993@gmail.com'),(10078,'Gurprit Kaur','Rathor','Joginder Singh',22,'Female',2147483647,2147483647,'gurpritkaur@gmail.com');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personaddress`
--

DROP TABLE IF EXISTS `personaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personaddress` (
  `AddressID` int(11) NOT NULL,
  `AptNumber` smallint(6) NOT NULL,
  `StreetName` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `Zipcode` int(11) NOT NULL,
  `Landmark` varchar(45) DEFAULT NULL,
  `AddressType` varchar(30) NOT NULL,
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaddress`
--

LOCK TABLES `personaddress` WRITE;
/*!40000 ALTER TABLE `personaddress` DISABLE KEYS */;
INSERT INTO `personaddress` VALUES (1,909,'Alphonsus','Boston','MA',2120,'Longwood','Residential');
/*!40000 ALTER TABLE `personaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personaddresslink`
--

DROP TABLE IF EXISTS `personaddresslink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personaddresslink` (
  `PersonAddressSSN` int(11) NOT NULL,
  `PersonAddressID` int(11) NOT NULL,
  KEY `PersonAddressSSN_idx` (`PersonAddressSSN`),
  KEY `PersonAddressID_idx` (`PersonAddressID`),
  CONSTRAINT `PersonAddressID` FOREIGN KEY (`PersonAddressID`) REFERENCES `personaddress` (`AddressID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PersonAddressSSN` FOREIGN KEY (`PersonAddressSSN`) REFERENCES `person` (`SSN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaddresslink`
--

LOCK TABLES `personaddresslink` WRITE;
/*!40000 ALTER TABLE `personaddresslink` DISABLE KEYS */;
/*!40000 ALTER TABLE `personaddresslink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(45) NOT NULL,
  `ProductCategoryID` int(11) NOT NULL,
  `ProductDescription` varchar(45) NOT NULL,
  `SizesAvailable` varchar(45) DEFAULT NULL,
  `ColorsAvailable` varchar(45) DEFAULT NULL,
  `UnitWeight` decimal(12,2) DEFAULT NULL,
  `UnitDiscount` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `ProductCategoryID_idx` (`ProductCategoryID`),
  CONSTRAINT `ProductCategoryID` FOREIGN KEY (`ProductCategoryID`) REFERENCES `productitemcategory` (`CategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (456,'Peter Pan',1,'An Amazing Childrens Book',NULL,NULL,NULL,2),(567,'Game Of Thrones',1,'George RR Martin Book',NULL,NULL,NULL,5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productitemcategory`
--

DROP TABLE IF EXISTS `productitemcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productitemcategory` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(45) NOT NULL,
  `CategoryDescription` varchar(45) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productitemcategory`
--

LOCK TABLES `productitemcategory` WRITE;
/*!40000 ALTER TABLE `productitemcategory` DISABLE KEYS */;
INSERT INTO `productitemcategory` VALUES (1,'Ebooks','Soft Copies of books'),(2,'Gift Cards','Some Amount of Cash Cards Available for use');
/*!40000 ALTER TABLE `productitemcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping`
--

DROP TABLE IF EXISTS `shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping` (
  `ShippingID` int(11) NOT NULL,
  `ShippingMethod` varchar(45) NOT NULL,
  `ShippingCharge` decimal(15,2) NOT NULL,
  `ShippingDate` date NOT NULL,
  `ShippingStateID` int(11) NOT NULL,
  `ShippingAddressID` int(11) NOT NULL,
  `ShippingInvoiceID` int(11) NOT NULL,
  PRIMARY KEY (`ShippingID`),
  KEY `ShippingStateID_idx` (`ShippingStateID`),
  KEY `ShippingAddressID_idx` (`ShippingAddressID`),
  KEY `ShippingInvoiceID_idx` (`ShippingInvoiceID`),
  CONSTRAINT `ShippingAddressID` FOREIGN KEY (`ShippingAddressID`) REFERENCES `address` (`AddressID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ShippingInvoiceID` FOREIGN KEY (`ShippingInvoiceID`) REFERENCES `invoice` (`InvoiceID`),
  CONSTRAINT `ShippingStateID` FOREIGN KEY (`ShippingStateID`) REFERENCES `shippingstatus` (`ShippingStatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
INSERT INTO `shipping` VALUES (34,'Mail',34.00,'2014-12-25',3,1,1234);
/*!40000 ALTER TABLE `shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippingstatus`
--

DROP TABLE IF EXISTS `shippingstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shippingstatus` (
  `ShippingStatusID` int(11) NOT NULL,
  `ShippingStatus` varchar(30) NOT NULL,
  PRIMARY KEY (`ShippingStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippingstatus`
--

LOCK TABLES `shippingstatus` WRITE;
/*!40000 ALTER TABLE `shippingstatus` DISABLE KEYS */;
INSERT INTO `shippingstatus` VALUES (3,'Active and will reach in 1 day');
/*!40000 ALTER TABLE `shippingstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippingwarehouse`
--

DROP TABLE IF EXISTS `shippingwarehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shippingwarehouse` (
  `ShippingID` int(11) NOT NULL,
  `WarehouseID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ShippingID`),
  KEY `WarehouseID_idx` (`WarehouseID`),
  CONSTRAINT `ShippingID` FOREIGN KEY (`ShippingID`) REFERENCES `shipping` (`ShippingID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `WarehouseID` FOREIGN KEY (`WarehouseID`) REFERENCES `warehouse` (`WarehouseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippingwarehouse`
--

LOCK TABLES `shippingwarehouse` WRITE;
/*!40000 ALTER TABLE `shippingwarehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `shippingwarehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart`
--

DROP TABLE IF EXISTS `shoppingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart` (
  `ShoppingCartID` int(11) NOT NULL,
  `Active` varchar(20) NOT NULL,
  `ExpiryDate` datetime NOT NULL,
  `CartUserSessionID` varchar(20) NOT NULL,
  PRIMARY KEY (`ShoppingCartID`),
  KEY `CartUserSessionID_idx` (`CartUserSessionID`),
  CONSTRAINT `CartUserSessionID` FOREIGN KEY (`CartUserSessionID`) REFERENCES `usersession` (`UserSessionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart`
--

LOCK TABLES `shoppingcart` WRITE;
/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
INSERT INTO `shoppingcart` VALUES (67890,'yes','2014-01-24 00:00:00','12345');
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timesheet`
--

DROP TABLE IF EXISTS `timesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timesheet` (
  `WorkDate` date NOT NULL,
  `TimeSheetEmployeeID` varchar(20) NOT NULL,
  `InTime` time NOT NULL,
  `OutTime` time NOT NULL,
  KEY `TimeSheetEmployeeID_idx` (`TimeSheetEmployeeID`),
  CONSTRAINT `TimeSheetEmployeeID` FOREIGN KEY (`TimeSheetEmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheet`
--

LOCK TABLES `timesheet` WRITE;
/*!40000 ALTER TABLE `timesheet` DISABLE KEYS */;
/*!40000 ALTER TABLE `timesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount` (
  `UserAccountNumber` varchar(20) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `Visits` int(11) DEFAULT NULL,
  `SecurityQuestion` varchar(45) NOT NULL,
  `SecurityAnswer` varchar(45) NOT NULL,
  `PersonSSN` int(11) NOT NULL,
  PRIMARY KEY (`UserAccountNumber`),
  KEY `PersonSSN_idx` (`PersonSSN`),
  CONSTRAINT `PersonSSN` FOREIGN KEY (`PersonSSN`) REFERENCES `person` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` VALUES ('09876','dannykannan1993','dannyneu','2104-12-12 00:00:00',21,'favourite teacher','debashree',10076);
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersession`
--

DROP TABLE IF EXISTS `usersession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersession` (
  `UserSessionID` varchar(20) NOT NULL,
  `IPAddress` varchar(45) NOT NULL,
  `Clicks` int(11) DEFAULT NULL,
  `SessionStartTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SessionEndTimestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UserAccountID` varchar(20) NOT NULL,
  PRIMARY KEY (`UserSessionID`),
  KEY `UserAccountID_idx` (`UserAccountID`),
  CONSTRAINT `UserAccountID` FOREIGN KEY (`UserAccountID`) REFERENCES `useraccount` (`UserAccountNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersession`
--

LOCK TABLES `usersession` WRITE;
/*!40000 ALTER TABLE `usersession` DISABLE KEYS */;
INSERT INTO `usersession` VALUES ('12345','215.245.325.425',21,'2014-12-10 05:46:36','0000-00-00 00:00:00','09876');
/*!40000 ALTER TABLE `usersession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse` (
  `WarehouseID` int(11) NOT NULL,
  `WarehouseName` varchar(45) NOT NULL,
  `WarehouseRevenue` decimal(15,2) NOT NULL,
  `WarehouseExpenditure` decimal(15,2) NOT NULL,
  `WarehouseAddressID` int(11) NOT NULL,
  PRIMARY KEY (`WarehouseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (123,'rubens',234555.00,32321.00,1);
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouseinventory`
--

DROP TABLE IF EXISTS `warehouseinventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouseinventory` (
  `INVWarehouseID` int(11) NOT NULL,
  `INVInventoryID` int(11) NOT NULL,
  PRIMARY KEY (`INVWarehouseID`,`INVInventoryID`),
  KEY `WarehouseID_idx` (`INVWarehouseID`),
  KEY `InventoryID_idx` (`INVInventoryID`),
  CONSTRAINT `INVInventoryID` FOREIGN KEY (`INVInventoryID`) REFERENCES `inventoryitem` (`InventoryItemID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `INVWarehouseID` FOREIGN KEY (`INVWarehouseID`) REFERENCES `warehouse` (`WarehouseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouseinventory`
--

LOCK TABLES `warehouseinventory` WRITE;
/*!40000 ALTER TABLE `warehouseinventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `warehouseinventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ecommercedb'
--

--
-- Dumping routines for database 'ecommercedb'
--
/*!50003 DROP PROCEDURE IF EXISTS `orderDetails_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `orderDetails_procedure`(IN orderID int)
BEGIN
	SET @sql= Concat('Select 
        `customer`.`CustomerID` AS `Customer ID`,
        `customerorder`.`OrderDate` AS `Order Date`,
        `customerorder`.`OrderStatus` AS `Order Status`,
        `customerorder`.`OrderTotalAmount` AS `Total Amount`,
        `invoice`.`DueDate` AS `Due Date`
    from
        ((`customer`
        join `invoice`)
        join `customerorder`)
    where
        ((`customer`.`CustomerID` = `customerorder`.`CustomerOrderID`)
            and (`invoice`.`InvoiceOrderID` = ',orderID,'))');

	
PREPARE stmt FROM @sql;
 
 EXECUTE stmt;
 DEALLOCATE PREPARE stmt;  
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `orderItemDetails_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `orderItemDetails_procedure`(IN orderID int(11))
BEGIN
SET @sql= Concat('Select 
     OrderItemNumber as `Item Number`,
	 ProductName as `Product Name`,
	 Quantity as `Quantity`,
	 ProductItemNumber as `Product Code`,
     ProductItemCategory.CategoryName as `Product Category`,
	 size as `Size`,
	 color as `Color`,
	 UnitWeight as `Weight`,
	 UnitDiscount as `Discount`
     
    from
        (`orderitem`
        join `product`), `ProductItemCategory`
    where
        ((`orderitem`.`ProductItemNumber` = `product`.`ProductID`)
            and (`orderitem`.`OrderNumber` = ',orderID,') 
	and (product.ProductCategoryID = ProductItemCategory.CategoryID))');



	
PREPARE stmt FROM @sql;
 
 EXECUTE stmt;
 DEALLOCATE PREPARE stmt;  
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `customer_order_view`
--

/*!50001 DROP TABLE IF EXISTS `customer_order_view`*/;
/*!50001 DROP VIEW IF EXISTS `customer_order_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_order_view` AS select `customer`.`CustomerID` AS `Customer ID`,`customerorder`.`OrderID` AS `Order ID`,`customerorder`.`OrderDate` AS `Order Date`,`customerorder`.`OrderStatus` AS `Order Status`,`customerorder`.`OrderTotalAmount` AS `Total Amount`,`invoice`.`DueDate` AS `Due Date` from ((`customer` join `invoice`) join `customerorder`) where ((`customer`.`CustomerID` = `customerorder`.`CustomerOrderID`) and (`invoice`.`InvoiceOrderID` = `customerorder`.`OrderID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `hr_view`
--

/*!50001 DROP TABLE IF EXISTS `hr_view`*/;
/*!50001 DROP VIEW IF EXISTS `hr_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `hr_view` AS select `employee`.`EmployeeSSN` AS `Employee SSN`,`employee`.`EmployeeID` AS `Employee ID`,`person`.`FirstName` AS `First Name`,`person`.`LastName` AS `Last Name`,`person`.`Age` AS `Age`,`person`.`Gender` AS `Gender`,`person`.`MobileNumber` AS `Contact Number`,`department`.`DepartmentName` AS `Department Name`,`useraccount`.`Username` AS `UserName`,`useraccount`.`Password` AS `Password` from (((`employee` join `useraccount`) join `department`) join `person`) where ((`employee`.`EmployeeSSN` = `useraccount`.`PersonSSN`) and (`department`.`DepartmentEmployeeID` = `employee`.`EmployeeID`) and (`person`.`SSN` = `employee`.`EmployeeSSN`)) */;
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

-- Dump completed on 2015-08-19 14:44:24
