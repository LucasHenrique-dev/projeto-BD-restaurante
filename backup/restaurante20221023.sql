CREATE DATABASE  IF NOT EXISTS `restaurante_bd_2022_1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `restaurante_bd_2022_1`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: restaurante_bd_2022_1
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `mesa`
--

DROP TABLE IF EXISTS `mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesa` (
  `numero` int NOT NULL AUTO_INCREMENT,
  `area` varchar(50) NOT NULL,
  `QTDMaxOcupantes` int NOT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesa`
--

LOCK TABLES `mesa` WRITE;
/*!40000 ALTER TABLE `mesa` DISABLE KEYS */;
INSERT INTO `mesa` VALUES (1,'térreo',4),(2,'térreo',5),(3,'térreo',4),(4,'vip',2),(5,'vip',3),(6,'primeiro andar',4),(7,'terraco',6),(8,'terraco',4),(9,'terraco',2),(10,'terraco',6),(11,'terraco',5),(12,'vip',5),(13,'vip',2),(14,'vip',4),(15,'primeiro andar',5),(16,'primeiro andar',6),(17,'primeiro andar',6),(18,'primeiro andar',4),(19,'térreo',6),(20,'térreo',4);
/*!40000 ALTER TABLE `mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `IDPagamento` int NOT NULL AUTO_INCREMENT,
  `desconto` float NOT NULL,
  `tipoPagamento` varchar(20) NOT NULL,
  PRIMARY KEY (`IDPagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,0,'cartão'),(2,5,'cartão'),(3,10,'dinheiro'),(4,10,'dinheiro'),(5,0,'dinheiro'),(6,0,'cartão'),(7,0,'cartão'),(8,5,'pix'),(9,0,'cartão'),(10,0,'dinheiro'),(11,15,'pix'),(12,10,'dinheiro'),(13,5,'cartão'),(14,0,'cartão'),(15,0,'cartão'),(16,3,'pix'),(17,5,'pix'),(18,15,'dinheiro'),(19,0,'cartão'),(20,5,'pix');
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `IDPedido` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `IDpagamento` int NOT NULL,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`IDPedido`),
  KEY `numero` (`numero`),
  KEY `IDpagamento` (`IDpagamento`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`numero`) REFERENCES `mesa` (`numero`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`IDpagamento`) REFERENCES `pagamento` (`IDPagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,1,'2022-07-15'),(2,7,2,'2022-07-15'),(3,3,3,'2022-07-15'),(4,2,4,'2022-07-28'),(5,2,6,'2022-07-30'),(6,3,7,'2022-08-03'),(7,5,8,'2022-08-06'),(8,7,2,'2022-07-15'),(9,1,1,'2022-07-15'),(10,3,5,'2022-07-30'),(11,3,5,'2022-07-30'),(12,1,1,'2022-07-15'),(13,13,9,'2022-08-18'),(14,20,10,'2022-09-01'),(15,11,12,'2022-09-23'),(16,13,9,'2022-08-18'),(17,13,9,'2022-08-18'),(18,12,15,'2022-10-10'),(19,12,15,'2022-10-10'),(20,19,18,'2022-10-10'),(21,16,14,'2022-09-28'),(22,1,13,'2022-09-28'),(23,14,11,'2022-09-23'),(24,15,17,'2022-10-10');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidoprato`
--

DROP TABLE IF EXISTS `pedidoprato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidoprato` (
  `IDPedido` int NOT NULL,
  `IDPrato` int NOT NULL,
  `data` date NOT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`IDPedido`,`IDPrato`),
  KEY `IDPrato` (`IDPrato`),
  CONSTRAINT `pedidoprato_ibfk_1` FOREIGN KEY (`IDPedido`) REFERENCES `pedido` (`IDPedido`),
  CONSTRAINT `pedidoprato_ibfk_2` FOREIGN KEY (`IDPrato`) REFERENCES `prato` (`IDPrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidoprato`
--

LOCK TABLES `pedidoprato` WRITE;
/*!40000 ALTER TABLE `pedidoprato` DISABLE KEYS */;
INSERT INTO `pedidoprato` VALUES (1,8,'2022-07-15',1),(1,22,'2022-07-15',1),(1,23,'2022-07-15',1),(2,5,'2022-07-15',1),(2,21,'2022-07-15',1),(2,24,'2022-07-15',1),(2,32,'2022-07-15',2),(3,7,'2022-07-15',1),(3,9,'2022-07-15',1),(3,12,'2022-07-15',2),(4,7,'2022-07-28',2),(4,14,'2022-07-28',1),(4,17,'2022-07-28',1),(4,24,'2022-07-28',1),(4,32,'2022-07-28',2),(5,17,'2022-07-30',2),(5,20,'2022-07-30',2),(5,24,'2022-07-30',1),(5,25,'2022-07-30',1),(6,6,'2022-08-03',1),(6,7,'2022-08-03',2),(6,17,'2022-08-03',1),(7,31,'2022-08-06',1),(8,3,'2022-07-15',2),(8,17,'2022-07-15',2),(8,28,'2022-07-15',2),(8,30,'2022-07-15',1),(9,7,'2022-07-15',2),(9,8,'2022-07-15',2),(9,20,'2022-07-15',2),(10,14,'2022-07-30',2),(10,20,'2022-07-30',2),(10,24,'2022-07-30',2),(10,32,'2022-07-30',2),(11,18,'2022-07-30',2),(11,20,'2022-07-30',2),(11,24,'2022-07-30',2),(11,26,'2022-07-30',2),(11,28,'2022-07-30',2),(12,2,'2022-07-15',1),(12,16,'2022-07-15',1),(13,10,'2022-08-18',2),(13,12,'2022-08-18',2),(13,18,'2022-08-18',1),(14,3,'2022-09-01',1),(14,21,'2022-09-01',1),(15,16,'2022-09-23',1),(15,19,'2022-09-23',2),(15,31,'2022-09-23',2),(16,15,'2022-08-18',2),(17,23,'2022-08-18',1),(18,11,'2022-10-10',2),(18,14,'2022-10-10',2),(18,21,'2022-10-10',2),(19,13,'2022-10-10',2),(19,18,'2022-10-10',2),(19,23,'2022-10-10',2),(19,27,'2022-10-10',2),(19,30,'2022-10-10',2),(20,1,'2022-10-10',2),(20,10,'2022-10-10',2),(20,21,'2022-10-10',1),(20,30,'2022-10-10',1),(21,32,'2022-09-28',1),(22,3,'2022-09-28',2),(22,4,'2022-09-28',2),(22,25,'2022-09-28',2),(22,27,'2022-09-28',1),(22,29,'2022-09-28',2),(23,6,'2022-09-23',1),(23,16,'2022-09-23',2),(23,29,'2022-09-23',1),(24,7,'2022-10-10',2);
/*!40000 ALTER TABLE `pedidoprato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pedidoprecos`
--

DROP TABLE IF EXISTS `pedidoprecos`;
/*!50001 DROP VIEW IF EXISTS `pedidoprecos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pedidoprecos` AS SELECT 
 1 AS `IDPedido`,
 1 AS `IDPrato`,
 1 AS `data`,
 1 AS `quantidade`,
 1 AS `Preço Bruto`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `prato`
--

DROP TABLE IF EXISTS `prato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prato` (
  `IDPrato` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `preco` float NOT NULL,
  `tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`IDPrato`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prato`
--

LOCK TABLES `prato` WRITE;
/*!40000 ALTER TABLE `prato` DISABLE KEYS */;
INSERT INTO `prato` VALUES (1,'Maminha',50,'Executivo'),(2,'Filé à Parmegiana',40,'Executivo'),(3,'Frango Grelhado',35,'Executivo'),(4,'Bife à milanesa',200,'Executivo'),(5,'Bife bovino',100,'Executivo'),(6,'Strogonoff de Frango',40,'Executivo'),(7,'Galeto',110,'Família'),(8,'Carne de Sol',130,'Família'),(9,'Picanha',150,'Família'),(10,'Moranga de Camarão',130,'Família'),(11,'Peixada ao molho de côco',142.5,'Família'),(12,'Risoto de Polvo',140,'Família'),(13,'Almoço Feliz',12.5,'KIDS'),(14,'Filézinho',18,'KIDS'),(15,'Camarão Empanado',20,'Petisco'),(16,'Filé com Fritas',30,'Petisco'),(17,'Casquinho de Siri',15,'Petisco'),(18,'Batata Frita',30,'Petisco'),(19,'Caldinho de feijoada',7.5,'Petisco'),(20,'Caldinho de Camarão',7.5,'Petisco'),(21,'Coca-Cola Lata',5,'Bebida'),(22,'Guaraná Lata',4,'Bebida'),(23,'Coca-Cola 1L',10,'Bebida'),(24,'Guaraná 1L',9,'Bebida'),(25,'Petit gateau',45,'Sobremesa'),(26,'Cartola',25,'Sobremesa'),(27,'Pudim',10,'Sobremesa'),(28,'Fatia de bolo',7,'Sobremesa'),(29,'Pastel de belém',10.5,'Sobremesa'),(30,'Jarra de Laranja',8,'Bebida'),(31,'Jarra de Morango',12,'Bebida'),(32,'Suco de Limão',5,'Bebida');
/*!40000 ALTER TABLE `prato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `IDProduto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `preco` float NOT NULL,
  `fornecedor` varchar(30) NOT NULL,
  PRIMARY KEY (`IDProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Frango',12,'Granja Feliz'),(2,'Feijão',6.5,'Atacado Preço Bom'),(3,'Arroz',4.5,'Atacado Preço Bom'),(4,'Laranja',2.5,'Atacado POLI frutas'),(5,'Morango',5,'Atacado POLI frutas'),(6,'Camarão',5,'Atacado ECOMPra Feliz'),(7,'Sorvete de creme',12,'Atacado ECOMPra Feliz'),(8,'Massa de bolo',6,'Atacado ECOMPra Feliz'),(9,'Farinha de rosca',4,'Atacado ECOMPra Feliz'),(10,'Açúcar',10.5,'Amigão Supermercados'),(11,'Limão',3,'Atacado POLI frutas'),(12,'Peixe',10,'Peixaria do José'),(13,'Tomate',5,'Amigão Supermercados'),(14,'Cebola',6,'Amigão Supermercados'),(15,'Queijo parmesão',18.5,'Lucas Supermercados'),(16,'Leite',4,'Lucas Supermercados'),(17,'Leite condensado',10,'Lucas Supermercados'),(18,'Paio',40,'Lucas Supermercados'),(19,'Carne de porco',60,'Renascer Casa de Carnes'),(20,'Pastel de belém',4.5,'Panificadora Rio Doce'),(21,'Creme de Leite',9.5,'Lucas Supermercados'),(22,'Carne de carangueijo',40,'Atacado ECOMPra Feliz'),(23,'Banana',3,'Atacado POLI frutas'),(24,'Chocolate',12,'Assaí'),(25,'Batata',9,'Assaí'),(26,'Óleo',20,'Assaí'),(27,'Manteiga',8,'Extra'),(28,'Polvo',65.5,'Atacado ECOMPra Feliz'),(29,'Picanha',80,'Renascer Casa de Carnes'),(30,'Maminha',70,'Renascer Casa de Carnes'),(31,'Abóbora',20,'Atacado ECOMPra Feliz'),(32,'Leite de côco',5,'Lucas Supermercados'),(33,'Carne de Sol',80,'Renascer Casa de Carnes');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtoprato`
--

DROP TABLE IF EXISTS `produtoprato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtoprato` (
  `IDPrato` int NOT NULL,
  `IDProduto` int NOT NULL,
  PRIMARY KEY (`IDPrato`,`IDProduto`),
  KEY `IDProduto` (`IDProduto`),
  CONSTRAINT `produtoprato_ibfk_1` FOREIGN KEY (`IDPrato`) REFERENCES `prato` (`IDPrato`),
  CONSTRAINT `produtoprato_ibfk_2` FOREIGN KEY (`IDProduto`) REFERENCES `produto` (`IDProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtoprato`
--

LOCK TABLES `produtoprato` WRITE;
/*!40000 ALTER TABLE `produtoprato` DISABLE KEYS */;
INSERT INTO `produtoprato` VALUES (7,1),(20,1),(12,2),(13,2),(19,2),(14,3),(22,3),(13,4),(22,4),(30,4),(31,4),(32,4),(31,5),(15,6),(23,6),(24,7),(28,8),(15,9),(13,10),(20,10),(27,10),(30,10),(18,11),(32,11),(13,12),(2,13),(8,13),(16,13),(19,13),(1,14),(4,14),(18,14),(19,14),(16,15),(12,16),(15,16),(23,16),(25,16),(11,18),(13,18),(19,18),(15,19),(11,20),(29,20),(14,21),(18,21),(20,21),(27,21),(17,23),(19,23),(10,24),(11,24),(25,24),(16,25),(22,25),(1,26),(11,26),(19,27),(22,27),(25,27),(11,28),(22,29),(23,29),(1,30),(5,30),(13,30),(19,30),(20,30),(15,31),(21,32),(8,33);
/*!40000 ALTER TABLE `produtoprato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `IDReserva` int NOT NULL AUTO_INCREMENT,
  `nomeCliente` varchar(50) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `QTDOcupantes` int NOT NULL,
  PRIMARY KEY (`IDReserva`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,'Lucas','2022-07-15','20:30:00',5),(2,'Andressa','2022-07-15','12:00:00',8),(3,'Francisco','2022-10-15','20:30:00',2),(4,'Leonidas','2022-10-15','21:00:00',6),(5,'Pedro','2022-07-15','20:30:00',10),(6,'Aline','2022-07-15','12:00:00',5),(7,'Mateus','2022-10-10','12:00:00',6),(8,'Maria','2022-10-10','21:00:00',2),(9,'Rodrigo','2022-09-01','14:30:00',2),(10,'Mateus','2022-08-03','14:00:00',4),(11,'Ana','2022-10-17','13:00:00',6),(12,'João','2022-08-16','20:30:00',4),(13,'Vagner','2022-09-14','19:30:00',6),(14,'Sanpaio','2022-08-18','20:30:00',4),(15,'Maria Lencastre','2022-08-18','16:30:00',2),(16,'Amanda','2022-09-15','15:00:00',5),(17,'Daniel','2022-10-25','11:00:00',4),(18,'Junior','2022-10-24','16:00:00',2),(19,'Luiz','2022-09-23','18:00:00',5),(20,'George','2022-10-23','16:30:00',6),(21,'José','2022-07-19','13:30:00',4),(22,'Lucas','2022-07-23','12:00:00',2),(23,'Mateus','2022-08-17','16:30:00',4),(24,'Maria Lencastre','2022-09-23','17:00:00',6);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `reservamax`
--

DROP TABLE IF EXISTS `reservamax`;
/*!50001 DROP VIEW IF EXISTS `reservamax`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reservamax` AS SELECT 
 1 AS `MaisReservado`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reservamesa`
--

DROP TABLE IF EXISTS `reservamesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservamesa` (
  `numero` int NOT NULL,
  `IDReserva` int NOT NULL,
  PRIMARY KEY (`numero`,`IDReserva`),
  KEY `IDReserva` (`IDReserva`),
  CONSTRAINT `reservamesa_ibfk_1` FOREIGN KEY (`numero`) REFERENCES `mesa` (`numero`),
  CONSTRAINT `reservamesa_ibfk_2` FOREIGN KEY (`IDReserva`) REFERENCES `reserva` (`IDReserva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservamesa`
--

LOCK TABLES `reservamesa` WRITE;
/*!40000 ALTER TABLE `reservamesa` DISABLE KEYS */;
INSERT INTO `reservamesa` VALUES (2,1),(18,2),(4,3),(7,4),(16,5),(15,6),(7,7),(5,8),(4,9),(20,10),(18,11),(20,12),(17,13),(8,14),(13,15),(12,16),(14,17),(4,18),(2,19),(19,20),(19,21),(13,22),(14,23),(7,24);
/*!40000 ALTER TABLE `reservamesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `reservaquantidade`
--

DROP TABLE IF EXISTS `reservaquantidade`;
/*!50001 DROP VIEW IF EXISTS `reservaquantidade`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reservaquantidade` AS SELECT 
 1 AS `numero`,
 1 AS `area`,
 1 AS `QTDMaxOcupantes`,
 1 AS `QTDReservas`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `pedidoprecos`
--

/*!50001 DROP VIEW IF EXISTS `pedidoprecos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pedidoprecos` AS select `pp`.`IDPedido` AS `IDPedido`,`pp`.`IDPrato` AS `IDPrato`,`pp`.`data` AS `data`,`pp`.`quantidade` AS `quantidade`,sum((`p`.`preco` * `pp`.`quantidade`)) AS `Preço Bruto` from (`pedidoprato` `pp` join `prato` `p` on((`pp`.`IDPrato` = `p`.`IDPrato`))) group by `pp`.`IDPedido` order by `pp`.`IDPedido` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reservamax`
--

/*!50001 DROP VIEW IF EXISTS `reservamax`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reservamax` AS select max(`reservaquantidade`.`QTDReservas`) AS `MaisReservado` from `reservaquantidade` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reservaquantidade`
--

/*!50001 DROP VIEW IF EXISTS `reservaquantidade`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reservaquantidade` AS select `m`.`numero` AS `numero`,`m`.`area` AS `area`,`m`.`QTDMaxOcupantes` AS `QTDMaxOcupantes`,count(`m`.`numero`) AS `QTDReservas` from ((`mesa` `m` join `reservamesa` `rm` on((`m`.`numero` = `rm`.`numero`))) join `reserva` `r` on((`r`.`IDReserva` = `rm`.`IDReserva`))) where (month(`r`.`data`) = '10') group by `m`.`numero` */;
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

-- Dump completed on 2022-10-23  9:49:04
