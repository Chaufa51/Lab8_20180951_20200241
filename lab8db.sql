CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `credenciales`
--

DROP TABLE IF EXISTS `credenciales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credenciales` (
  `correo` varchar(45) NOT NULL,
  `pass` varchar(125) NOT NULL,
  `idusuarios` int NOT NULL,
  PRIMARY KEY (`idusuarios`),
  CONSTRAINT `fk_credenciales_usuarios` FOREIGN KEY (`idusuarios`) REFERENCES `usuarios` (`idusuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credenciales`
--

LOCK TABLES `credenciales` WRITE;
/*!40000 ALTER TABLE `credenciales` DISABLE KEYS */;
INSERT INTO `credenciales` VALUES ('a20180951@pucp.edu.pe','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',1),('a20205986@pucp.edu.pe','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',2),('a20231122@pucp.edu.pe','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',3),('a20164578@pucp.edu.pe','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',4),('a201245781@pucp.edu.pe','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',5);
/*!40000 ALTER TABLE `credenciales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estatus`
--

DROP TABLE IF EXISTS `estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estatus` (
  `idEstatus` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idEstatus`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatus`
--

LOCK TABLES `estatus` WRITE;
/*!40000 ALTER TABLE `estatus` DISABLE KEYS */;
INSERT INTO `estatus` VALUES (1,'NORMAL'),(2,'SILVER'),(3,'GOLD'),(4,'PLATINUM');
/*!40000 ALTER TABLE `estatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguros`
--

DROP TABLE IF EXISTS `seguros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguros` (
  `idseguros` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idseguros`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguros`
--

LOCK TABLES `seguros` WRITE;
/*!40000 ALTER TABLE `seguros` DISABLE KEYS */;
INSERT INTO `seguros` VALUES (1,'RIMAC'),(2,'PACIFICO'),(3,'LA POSITIVA'),(4,'SEGURO INTERNACIONAL'),(5,'OTRO');
/*!40000 ALTER TABLE `seguros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idusuarios` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `edad` int NOT NULL,
  `codigoPucp` int NOT NULL,
  `correo` varchar(75) NOT NULL,
  `especialidad` varchar(45) NOT NULL,
  `Estatus_idEstatus` int NOT NULL,
  PRIMARY KEY (`idusuarios`),
  KEY `fk_usuarios_Estatus1_idx` (`Estatus_idEstatus`),
  CONSTRAINT `fk_usuarios_Estatus1` FOREIGN KEY (`Estatus_idEstatus`) REFERENCES `estatus` (`idEstatus`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Juan pablo','Loyola Mexico',22,20180951,'a20180951@pucp.edu.pe','telecomunicaciones',1),(2,'pedrito','picapiedra',16,20205986,'a20205986@pucp.edu.pe','telecomunicaciones',1),(3,'Juan','sdfdsf',25,20231122,'a20231122@pucp.edu.pe','industrial',1),(4,'pablo','Losdfdsfyola',23,20164578,'a20164578@pucp.edu.pe','chivil',1),(5,'pepe','valorant',33,20124578,'a201245781@pucp.edu.pe','telecomunicaciones',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viajes`
--

DROP TABLE IF EXISTS `viajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viajes` (
  `idviaje` int NOT NULL AUTO_INCREMENT,
  `fechaReserva` date NOT NULL,
  `fechaViaje` date NOT NULL,
  `ciudadOrigen` varchar(45) NOT NULL,
  `ciudadDestino` varchar(45) NOT NULL,
  `seguros_idseguros` int NOT NULL,
  `cantidadBoletos` int NOT NULL,
  `costoTotal` decimal(10,0) NOT NULL,
  `habilitado` tinyint NOT NULL,
  `idusuarios` int NOT NULL,
  PRIMARY KEY (`idviaje`),
  KEY `fk_viajes_seguros1_idx` (`seguros_idseguros`),
  KEY `fk_viajes_usuarios1_idx` (`idusuarios`),
  CONSTRAINT `fk_viajes_seguros1` FOREIGN KEY (`seguros_idseguros`) REFERENCES `seguros` (`idseguros`),
  CONSTRAINT `fk_viajes_usuarios1` FOREIGN KEY (`idusuarios`) REFERENCES `usuarios` (`idusuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viajes`
--

LOCK TABLES `viajes` WRITE;
/*!40000 ALTER TABLE `viajes` DISABLE KEYS */;
INSERT INTO `viajes` VALUES (1,'2023-06-15','2023-06-20','Lima','trujillo',1,1,350,1,1);
/*!40000 ALTER TABLE `viajes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-15 21:30:50
