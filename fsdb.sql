CREATE DATABASE  IF NOT EXISTS `springbootweb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `springbootweb`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: springbootweb
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `createddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(45) DEFAULT NULL,
  `modifieddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `modifiedby` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Men','2023-03-08 00:08:03',NULL,'2023-03-08 12:49:17',NULL),(2,'Bag','2023-03-08 00:08:03',NULL,'2023-03-08 12:49:17',NULL),(3,'Clothing','2023-03-08 00:08:03',NULL,'2023-03-08 12:49:17',NULL),(4,'Shoes','2023-03-08 00:08:03',NULL,'2023-03-08 12:49:17',NULL),(5,'Accessories','2023-03-08 00:08:03',NULL,'2023-03-08 12:49:17',NULL),(6,'Kids','2023-03-08 00:08:03',NULL,'2023-03-08 12:49:17',NULL),(7,'Woman','2023-03-08 00:08:18',NULL,'2023-03-08 12:49:17',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` text,
  `product_id` bigint NOT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` text,
  `status` tinyint(1) DEFAULT '1',
  `price` float NOT NULL,
  `quantity` int DEFAULT '0',
  `supplier` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `category_id` bigint NOT NULL,
  `thumbnail` text,
  `createddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(45) DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `modifiedby` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (2,'Đồng hồ CSX20','Apple Watch SE 2022 44mm \nGPS viền nhôm chính là siêu phẩm với đầy sự tinh tế, \nhiện đại và đẳng cấp sẽ được nhà Táo cho ra mắt vào tháng \n9 năm nay. Với nhiều cập nhật nổi bật về thiết kế, nhiều \ncông nghệ màn hình hiện đại hơn và nhiều tiện ích mở \nrộng hơn được đưa ra thì đây chắc chắn chính là chiếc đồng hồ bạn nên lựa chọn. \nHãy tham khảo thêm cho mình một vài thông tin về chiếc đồng hồ này ngay sau đây \nđể có thể hiểu thêm về nó và các đặc tính nổi bật của nó nhé.',1,72.62,100,'CellphoneS',6,'https://res.cloudinary.com/dzgugrqxz/image/upload/v1677660803/fashion/product/applewatch_series_3_two_loop_full.jpg.og_goxtsy.jpg','2023-02-22 21:01:23',NULL,NULL,NULL),(3,'Apple Watch 15','Apple Watch SE 2022 44mm ',1,25.99,20,'CellphoneS',6,'https://res.cloudinary.com/dzgugrqxz/image/upload/v1677660872/fashion/product/mvw-star-msa003-03-nam-0-600x600_ryqelm.jpg','2023-02-22 21:01:23',NULL,NULL,NULL),(4,'Jean pro2','Hãy cùng khám phá bộ sưu tập quần độc đáo của chúng tôi! Mỗi chiếc quần đều được\n thiết kế với chất liệu cao cấp và kiểu dáng tinh tế, mang đến cho bạn cảm giác thoải mái và phong cách.\nChiếc quần dài đen của chúng tôi là một lựa chọn hoàn hảo cho các buổi tiệc hoặc sự kiện quan \ntrọng. Chất liệu vải cao cấp và đường may tỉ mỉ tạo nên sự sang trọng và đẳng cấp, trong khi kiểu \ndáng ôm sát vừa vặn với cơ thể giúp bạn trông thật quyến rũ và thu hút mọi ánh nhìn.\nNếu bạn đang tìm kiếm một chiếc quần thoải mái cho các hoạt động thể thao hoặc đi bộ, thì chiếc quần jogger\n của chúng tôi chắc chắn sẽ là lựa chọn tuyệt vời. Chất liệu vải co giãn và thiết kế lỏng lẻo giúp bạn cảm thấy thoải mái và dễ \n chịu trong suốt quá trình hoạt động.',1,29.99,12,'ABC Clothing',4,'https://res.cloudinary.com/dzgugrqxz/image/upload/v1677655434/fashion/product/product-6_dhb4dd.jpg','2023-03-01 15:33:22',NULL,NULL,NULL),(5,'Jean rog1','Hãy cùng khám phá bộ sưu tập quần độc đáo của chúng tôi! Mỗi chiếc quần đều được\n thiết kế với chất liệu cao cấp và kiểu dáng tinh tế, mang đến cho bạn cảm giác thoải mái và phong cách.\nChiếc quần dài đen của chúng tôi là một lựa chọn hoàn hảo cho các buổi tiệc hoặc sự kiện quan \ntrọng. Chất liệu vải cao cấp và đường may tỉ mỉ tạo nên sự sang trọng và đẳng cấp, trong khi kiểu \ndáng ôm sát vừa vặn với cơ thể giúp bạn trông thật quyến rũ và thu hút mọi ánh nhìn.\nNếu bạn đang tìm kiếm một chiếc quần thoải mái cho các hoạt động thể thao hoặc đi bộ, thì chiếc quần jogger\n của chúng tôi chắc chắn sẽ là lựa chọn tuyệt vời. Chất liệu vải co giãn và thiết kế lỏng lẻo giúp bạn cảm thấy thoải mái và dễ \n chịu trong suốt quá trình hoạt động.',1,21.99,200,'Diof Clothing',4,'https://res.cloudinary.com/dzgugrqxz/image/upload/v1677655434/fashion/product/product-6_dhb4dd.jpg','2023-03-01 15:39:23',NULL,NULL,NULL),(6,'Jean pro_xv','Hãy cùng khám phá bộ sưu tập quần độc đáo của chúng tôi! Mỗi chiếc quần đều được\n thiết kế với chất liệu cao cấp và kiểu dáng tinh tế, mang đến cho bạn cảm giác thoải mái và phong cách.\nChiếc quần dài đen của chúng tôi là một lựa chọn hoàn hảo cho các buổi tiệc hoặc sự kiện quan \ntrọng. Chất liệu vải cao cấp và đường may tỉ mỉ tạo nên sự sang trọng và đẳng cấp, trong khi kiểu \ndáng ôm sát vừa vặn với cơ thể giúp bạn trông thật quyến rũ và thu hút mọi ánh nhìn.\nNếu bạn đang tìm kiếm một chiếc quần thoải mái cho các hoạt động thể thao hoặc đi bộ, thì chiếc quần jogger\n của chúng tôi chắc chắn sẽ là lựa chọn tuyệt vời. Chất liệu vải co giãn và thiết kế lỏng lẻo giúp bạn cảm thấy thoải mái và dễ \n chịu trong suốt quá trình hoạt động.',1,25.39,32,'XYZ Clothing',4,'https://res.cloudinary.com/dzgugrqxz/image/upload/v1677655434/fashion/product/product-6_dhb4dd.jpg','2023-03-01 15:39:23',NULL,NULL,NULL),(7,'T-Shirt-ProA','Chào mừng đến với bộ sưu tập áo thun của chúng tôi! Chúng tôi tự hào cung cấp các sản phẩm chất lượng cao, đa dạng về mẫu mã và kiểu dáng để đáp ứng nhu cầu của khách hàng.',1,36.99,72,'ShirtCore',1,'https://res.cloudinary.com/dzgugrqxz/image/upload/v1677655434/fashion/product/product-9_qtugyt.jpg','2023-03-01 15:44:13',NULL,NULL,NULL),(8,'BagLZ2','Chào mừng đến với bộ sưu tập túi của chúng tôi! Chúng tôi cung cấp các loại túi đa dạng về kích thước, kiểu dáng và chất liệu, giúp bạn thoải mái lựa chọn túi phù hợp với nhu cầu của mình.',1,82.99,11,'LzBagGu',3,'https://res.cloudinary.com/dzgugrqxz/image/upload/v1677655434/fashion/product/product-7_iss4qn.jpg','2023-03-01 15:44:13',NULL,NULL,NULL),(9,'T-Shirt-Strx','Chào mừng đến với bộ sưu tập áo thun của chúng tôi! Chúng tôi tự hào cung cấp các sản phẩm chất lượng cao, đa dạng về mẫu mã và kiểu dáng để đáp ứng nhu cầu của khách hàng.',1,16.99,200,'Guzzihaz',1,'https://res.cloudinary.com/dzgugrqxz/image/upload/v1677655434/fashion/product/product-5_r56uhl.jpg','2023-03-01 15:44:13',NULL,NULL,NULL),(10,'KidZx','Chào mừng đến với bộ sưu tập túi của chúng tôi! Chúng tôi cung cấp các loại túi đa dạng về kích thước, kiểu dáng và chất liệu, giúp bạn thoải mái lựa chọn túi phù hợp với nhu cầu của mình.',1,39.99,25,'Kiddo',7,'https://res.cloudinary.com/dzgugrqxz/image/upload/v1677655433/fashion/product/product-11_k75zxn.jpg','2023-03-01 15:44:13',NULL,NULL,NULL),(11,'CuzPro_X','Chào mừng đến với bộ sưu tập kính mát của chúng tôi! Chúng tôi tự hào cung cấp các sản phẩm chất lượng cao với đa dạng kiểu dáng và màu sắc để bạn dễ dàng tìm kiếm chiếc kính mát phù hợp với phong cách của mình.',1,37.99,39,'Lviz',6,'https://res.cloudinary.com/dzgugrqxz/image/upload/v1677655433/fashion/product/product-14_ixx93z.jpg','2023-03-01 15:45:42',NULL,NULL,NULL),(12,'CuzPro_XS','Chào mừng đến với bộ sưu tập kính mát của chúng tôi! Chúng tôi tự hào cung cấp các sản phẩm chất lượng cao với đa dạng kiểu dáng và màu sắc để bạn dễ dàng tìm kiếm chiếc kính mát phù hợp với phong cách của mình.',1,55.99,12,'Lviz',6,'https://res.cloudinary.com/dzgugrqxz/image/upload/v1677655433/fashion/product/product-14_ixx93z.jpg','2023-03-01 15:45:42',NULL,NULL,NULL),(13,'UltraBoot4','Chào mừng đến với Ultrabook adidas của chúng tôi! Được tạo ra từ sự kết hợp giữa thương hiệu thể thao hàng đầu và công nghệ hiện đại, Ultrabook adidas của chúng tôi sẽ đem lại cho bạn sự thoải mái và hiệu suất tuyệt vời trong mọi hoạt động của bạn.',1,29.99,33,'Addidas',5,'https://res.cloudinary.com/dzgugrqxz/image/upload/v1677655432/fashion/product/product-1_qtz6zz.jpg','2023-03-01 15:49:27',NULL,NULL,NULL),(14,'UltraBoot5','Chào mừng đến với Ultrabook adidas của chúng tôi! Được tạo ra từ sự kết hợp giữa thương hiệu thể thao hàng đầu và công nghệ hiện đại, Ultrabook adidas của chúng tôi sẽ đem lại cho bạn sự thoải mái và hiệu suất tuyệt vời trong mọi hoạt động của bạn.',1,45.99,23,'Addidas',5,'https://res.cloudinary.com/dzgugrqxz/image/upload/v1677655432/fashion/product/product-1_qtz6zz.jpg','2023-03-06 12:30:16',NULL,NULL,NULL),(15,'GucciBag','Tui nhu loz\r\n',NULL,229.99,12,NULL,2,'siuuuu.jpg',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saleorder`
--

DROP TABLE IF EXISTS `saleorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saleorder` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `subtotal` float DEFAULT '0',
  `user_id` bigint DEFAULT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `saleorder_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saleorder`
--

LOCK TABLES `saleorder` WRITE;
/*!40000 ALTER TABLE `saleorder` DISABLE KEYS */;
INSERT INTO `saleorder` VALUES (1,'3e2c6be5-ce27-4cad-ae3d-14c676db1478',150.59,11,'2023-03-17 17:11:21',NULL),(2,'115f4ad2-ae4d-48fb-a95a-1d5bc5b5a5d0',124.6,11,'2023-03-17 17:25:38',NULL),(3,'4d36cec9-e006-4e70-aab4-694b8ab8ee85',72.62,11,'2023-03-17 17:29:40',NULL),(4,'33ab97ed-3aa8-4f87-9196-d2515d7e02bb',72.62,11,'2023-03-17 17:32:10',NULL),(5,'c8829b50-b04d-481c-9085-c8fc8bd344e0',98.61,11,'2023-03-17 17:32:30',NULL),(6,'cf943bd9-b926-416b-8722-02fbab961d7e',29.99,11,'2023-03-17 17:34:51',NULL),(7,'de847827-fe30-469c-a5ea-e927e2ec04a7',98.61,11,'2023-03-17 17:36:29',NULL),(8,'18264379-18fc-429f-a435-470eb6ff809b',98.61,11,'2023-03-17 17:38:01',NULL),(9,'a5083015-b183-4090-af79-f681247e44b3',171.23,11,'2023-03-17 17:40:09',NULL),(10,'e724c3b6-e1d2-4adb-9fc6-52980728aad7',72.62,11,'2023-03-17 17:45:00',NULL),(11,'6a5dcdda-1bcc-4776-a3f6-cb5f6bd4475c',98.61,11,'2023-03-17 17:46:36',NULL),(12,'67e29182-9d0f-4fea-a1e1-4ed6be7d3053',98.61,11,'2023-03-17 17:57:53',NULL),(13,'d4a159fa-d452-421c-8b69-dc77674146ab',0,11,'2023-03-17 17:58:22',NULL),(14,'1b185f5e-45da-49fc-b9f3-cb2c2607b684',145.24,11,'2023-03-17 18:05:47',NULL),(15,'e4b45bf5-0ae6-4dd2-98e9-5533f9c08df8',145.24,11,'2023-03-17 18:06:16',NULL),(16,'506c70fe-564a-43ae-b263-ea4b1e4f12ee',170.63,11,'2023-03-17 18:07:33',NULL),(17,'be54b3a5-6fdb-4a08-8183-070d0050ee47',170.63,11,'2023-03-17 18:09:02',NULL),(18,'073eb879-7510-43e2-b2a4-f45516e22c07',170.63,11,'2023-03-17 18:11:18',NULL),(19,'0defe761-8c20-4bca-a6e3-559844799ab9',72.62,11,'2023-03-17 18:17:35',NULL),(20,'692464e0-19ef-4de8-9d01-30b0b4afb172',98.61,11,'2023-03-17 18:18:58',NULL),(21,'de6975ca-b73d-4484-8047-3f55dd64858d',98.61,11,'2023-03-17 18:21:17',NULL),(22,'07c6e9db-0f05-477e-9880-6ba94ca3057e',150.59,11,'2023-03-17 18:30:45',NULL);
/*!40000 ALTER TABLE `saleorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saleorderdetails`
--

DROP TABLE IF EXISTS `saleorderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saleorderdetails` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `unitprice` float DEFAULT NULL,
  `unitquantity` int DEFAULT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `saleorderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `saleorder` (`id`),
  CONSTRAINT `saleorderdetails_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saleorderdetails`
--

LOCK TABLES `saleorderdetails` WRITE;
/*!40000 ALTER TABLE `saleorderdetails` DISABLE KEYS */;
INSERT INTO `saleorderdetails` VALUES (1,'3e2c6be5-ce27-4cad-ae3d-14c676db1478',25.99,3,1,3,'2023-03-17 17:11:21',NULL),(2,'3e2c6be5-ce27-4cad-ae3d-14c676db1478',72.62,1,1,2,'2023-03-17 17:11:21',NULL),(3,'115f4ad2-ae4d-48fb-a95a-1d5bc5b5a5d0',72.62,1,2,2,'2023-03-17 17:25:38',NULL),(4,'115f4ad2-ae4d-48fb-a95a-1d5bc5b5a5d0',25.99,2,2,3,'2023-03-17 17:25:38',NULL),(5,'4d36cec9-e006-4e70-aab4-694b8ab8ee85',72.62,1,3,2,'2023-03-17 17:29:40',NULL),(6,'33ab97ed-3aa8-4f87-9196-d2515d7e02bb',72.62,1,4,2,'2023-03-17 17:32:10',NULL),(7,'c8829b50-b04d-481c-9085-c8fc8bd344e0',72.62,1,5,2,'2023-03-17 17:32:30',NULL),(8,'c8829b50-b04d-481c-9085-c8fc8bd344e0',25.99,1,5,3,'2023-03-17 17:32:30',NULL),(9,'cf943bd9-b926-416b-8722-02fbab961d7e',29.99,1,6,4,'2023-03-17 17:34:51',NULL),(10,'de847827-fe30-469c-a5ea-e927e2ec04a7',72.62,1,7,2,'2023-03-17 17:36:30',NULL),(11,'de847827-fe30-469c-a5ea-e927e2ec04a7',25.99,1,7,3,'2023-03-17 17:36:30',NULL),(12,'18264379-18fc-429f-a435-470eb6ff809b',72.62,1,8,2,'2023-03-17 17:38:01',NULL),(13,'18264379-18fc-429f-a435-470eb6ff809b',25.99,1,8,3,'2023-03-17 17:38:01',NULL),(14,'a5083015-b183-4090-af79-f681247e44b3',72.62,2,9,2,'2023-03-17 17:40:09',NULL),(15,'a5083015-b183-4090-af79-f681247e44b3',25.99,1,9,3,'2023-03-17 17:40:09',NULL),(16,'e724c3b6-e1d2-4adb-9fc6-52980728aad7',72.62,1,10,2,'2023-03-17 17:45:00',NULL),(17,'6a5dcdda-1bcc-4776-a3f6-cb5f6bd4475c',72.62,1,11,2,'2023-03-17 17:46:36',NULL),(18,'6a5dcdda-1bcc-4776-a3f6-cb5f6bd4475c',25.99,1,11,3,'2023-03-17 17:46:36',NULL),(19,'67e29182-9d0f-4fea-a1e1-4ed6be7d3053',72.62,1,12,2,'2023-03-17 17:57:53',NULL),(20,'67e29182-9d0f-4fea-a1e1-4ed6be7d3053',25.99,1,12,3,'2023-03-17 17:57:53',NULL),(21,'1b185f5e-45da-49fc-b9f3-cb2c2607b684',72.62,2,14,2,'2023-03-17 18:05:47',NULL),(22,'e4b45bf5-0ae6-4dd2-98e9-5533f9c08df8',72.62,2,15,2,'2023-03-17 18:06:16',NULL),(23,'506c70fe-564a-43ae-b263-ea4b1e4f12ee',72.62,2,16,2,'2023-03-17 18:07:33',NULL),(24,'506c70fe-564a-43ae-b263-ea4b1e4f12ee',25.39,1,16,6,'2023-03-17 18:07:33',NULL),(25,'be54b3a5-6fdb-4a08-8183-070d0050ee47',72.62,2,17,2,'2023-03-17 18:09:02',NULL),(26,'be54b3a5-6fdb-4a08-8183-070d0050ee47',25.39,1,17,6,'2023-03-17 18:09:02',NULL),(27,'073eb879-7510-43e2-b2a4-f45516e22c07',72.62,2,18,2,'2023-03-17 18:11:18',NULL),(28,'073eb879-7510-43e2-b2a4-f45516e22c07',25.39,1,18,6,'2023-03-17 18:11:18',NULL),(29,'0defe761-8c20-4bca-a6e3-559844799ab9',72.62,1,19,2,'2023-03-17 18:17:35',NULL),(30,'692464e0-19ef-4de8-9d01-30b0b4afb172',72.62,1,20,2,'2023-03-17 18:18:58',NULL),(31,'692464e0-19ef-4de8-9d01-30b0b4afb172',25.99,1,20,3,'2023-03-17 18:18:58',NULL),(32,'de6975ca-b73d-4484-8047-3f55dd64858d',72.62,1,21,2,'2023-03-17 18:21:17',NULL),(33,'de6975ca-b73d-4484-8047-3f55dd64858d',25.99,1,21,3,'2023-03-17 18:21:17',NULL),(34,'07c6e9db-0f05-477e-9880-6ba94ca3057e',25.99,3,22,3,'2023-03-17 18:30:45',NULL),(35,'07c6e9db-0f05-477e-9880-6ba94ca3057e',72.62,1,22,2,'2023-03-17 18:30:45',NULL);
/*!40000 ALTER TABLE `saleorderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `role` varchar(10) DEFAULT NULL,
  `account_number` varchar(20) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_r43af9ap4edm43mmtq01oddj6` (`username`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,NULL,NULL,NULL,'chu1@gmail.com','admin','$2a$10$lUrBPyGLZfSBKkqftycIJ.uw1t6EEM24QWsRt6ISfyHF/Pgf1lSzG',1,'admin','ADMIN','123456','123123123','Nguyễn Kiệm'),(2,NULL,NULL,'admin','2023-02-24 19:03:50','chu2@gmail.com','nguyen van a','$2a$10$lUrBPyGLZfSBKkqftycIJ.uw1t6EEM24QWsRt6ISfyHF/Pgf1lSzG',1,'nguyenvana','USER','789987','123123123','Nguyễn Kiệm'),(3,NULL,NULL,NULL,NULL,'chu3@gmail.com','Hùng vip','$2a$10$lUrBPyGLZfSBKkqftycIJ.uw1t6EEM24QWsRt6ISfyHF/Pgf1lSzG',1,'hung11','USER','0123456465','123123123','Nguyễn Kiệm'),(4,NULL,NULL,NULL,NULL,'chu4@gmail.com','Hùng vip','$2a$10$lUrBPyGLZfSBKkqftycIJ.uw1t6EEM24QWsRt6ISfyHF/Pgf1lSzG',1,'hung12','USER','0123456465','123123123','Nguyễn Kiệm'),(11,NULL,NULL,NULL,NULL,NULL,'chu','$2a$10$WtRxJCvBLAgy/ypa.dNos.kqGl5tciMWtSxbYjiFyBb05eVPHKSTm',1,'chu','USER',NULL,NULL,NULL),(12,NULL,NULL,NULL,NULL,NULL,'chuchu','$2a$10$4REJwX8TgOmghNEEW7EtgO/xu.MRBGMS/CNr1hPqVDiQyL6CX/asK',1,'chuchu','USER',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-18 14:40:12
