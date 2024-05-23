-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: wikip
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
-- Table structure for table `character`
--

DROP TABLE IF EXISTS `character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `model_size` varchar(255) NOT NULL,
  `WeaponTypes_id` int unsigned NOT NULL,
  `Elements_id` int unsigned NOT NULL,
  `Regions_id` int unsigned NOT NULL,
  `Rarity_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Character_WeaponTypes1_idx` (`WeaponTypes_id`),
  KEY `fk_Character_Elements1_idx` (`Elements_id`),
  KEY `fk_Character_Regions1_idx` (`Regions_id`),
  KEY `fk_Character_Rarity1_idx` (`Rarity_id`),
  CONSTRAINT `fk_Character_Elements1` FOREIGN KEY (`Elements_id`) REFERENCES `elements` (`id`),
  CONSTRAINT `fk_Character_Rarity1` FOREIGN KEY (`Rarity_id`) REFERENCES `rarity` (`id`),
  CONSTRAINT `fk_Character_Regions1` FOREIGN KEY (`Regions_id`) REFERENCES `regions` (`id`),
  CONSTRAINT `fk_Character_WeaponTypes1` FOREIGN KEY (`WeaponTypes_id`) REFERENCES `weapontypes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character`
--

LOCK TABLES `character` WRITE;
/*!40000 ALTER TABLE `character` DISABLE KEYS */;
INSERT INTO `character` VALUES (1,'	Eula','Tall Female',2,5,1,5),(2,'Bennett','Medium Male',1,4,1,4),(3,'Hu Tao','Medium Female',5,4,2,5),(4,'Ningguang','Tall Female',4,2,2,4),(5,'	Kamisato Ayato','Tall Male',1,6,3,5),(6,'Sayu','Short Female',2,1,3,4),(7,'Tighnari','Medium Male',3,7,4,5),(8,'Faruzan','Medium Female',3,1,4,4),(9,'Wriothesley','Tall Male',4,5,5,5),(10,'	Chevreuse','Medium Female',5,4,5,4);
/*!40000 ALTER TABLE `character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,'Anemo'),(2,'Geo'),(3,'Electro'),(4,'Pyro'),(5,'Cryo'),(6,'Hydro'),(7,'Dendro'),(8,'Physical');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `Rarity_id` int unsigned NOT NULL,
  `Regions_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Foods_Rarity1_idx` (`Rarity_id`),
  KEY `fk_Foods_Regions1_idx` (`Regions_id`),
  CONSTRAINT `fk_Foods_Rarity1` FOREIGN KEY (`Rarity_id`) REFERENCES `rarity` (`id`),
  CONSTRAINT `fk_Foods_Regions1` FOREIGN KEY (`Regions_id`) REFERENCES `regions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (1,'Aaru Mixed Rice','Adventurer\'s Dishes',2,4),(2,'Adeptus\' Temptation','ATK-Boosting Dishes',5,2),(3,'Pile \'Em Up','ATK-Boosting Dishes',3,1),(4,'Bamboo Shoot Soup','Recovery Dishes',3,2),(5,'Biryani','DEF-Boosting Dishes',4,4),(6,'Braised Meatball','ATK-Boosting Dishes',3,2),(7,'Dango Milk','Recovery Dishes',2,3),(8,'Egg Roll','Recovery Dishes',1,3),(9,'Fontainian Onion Soup','DEF-Boosting Dishes',5,5),(10,'Fruity Trio',' Adventurer\'s Dishes',3,5);
/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rarity`
--

DROP TABLE IF EXISTS `rarity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rarity` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `stars` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rarity`
--

LOCK TABLES `rarity` WRITE;
/*!40000 ALTER TABLE `rarity` DISABLE KEYS */;
INSERT INTO `rarity` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `rarity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'Mondstadt'),(2,'Liyue'),(3,'Inazuma'),(4,'Sumeru'),(5,'Fontaine');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapons`
--

DROP TABLE IF EXISTS `weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weapons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `Rarity_id` int unsigned NOT NULL,
  `WeaponTypes_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Weapons_Rarity1_idx` (`Rarity_id`),
  KEY `fk_Weapons_WeaponTypes1_idx` (`WeaponTypes_id`),
  CONSTRAINT `fk_Weapons_Rarity1` FOREIGN KEY (`Rarity_id`) REFERENCES `rarity` (`id`),
  CONSTRAINT `fk_Weapons_WeaponTypes1` FOREIGN KEY (`WeaponTypes_id`) REFERENCES `weapontypes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapons`
--

LOCK TABLES `weapons` WRITE;
/*!40000 ALTER TABLE `weapons` DISABLE KEYS */;
INSERT INTO `weapons` VALUES (1,'Uraku Misugiri',5,1),(2,'Harbinger of Dawn',3,1),(3,'The Catch',4,5),(4,'Crimson Moon\'s Semblance',5,5),(5,'Verdict',5,2),(6,'Serpent Spine',4,2),(7,'Thrilling Tales of Dragon Slayers',3,4),(8,'Wine and Song',4,4),(9,'Thundering Pulse',5,3),(10,'Amos\' Bow',5,3);
/*!40000 ALTER TABLE `weapons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapontypes`
--

DROP TABLE IF EXISTS `weapontypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weapontypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapontypes`
--

LOCK TABLES `weapontypes` WRITE;
/*!40000 ALTER TABLE `weapontypes` DISABLE KEYS */;
INSERT INTO `weapontypes` VALUES (1,'Sword'),(2,'Claymore'),(3,'Bow'),(4,'Catalyst'),(5,'Polearm');
/*!40000 ALTER TABLE `weapontypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worldbosses`
--

DROP TABLE IF EXISTS `worldbosses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worldbosses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `Regions_id` int unsigned NOT NULL,
  `Elements_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_WorldBosses_Regions1_idx` (`Regions_id`),
  KEY `fk_WorldBosses_Elements1_idx` (`Elements_id`),
  CONSTRAINT `fk_WorldBosses_Elements1` FOREIGN KEY (`Elements_id`) REFERENCES `elements` (`id`),
  CONSTRAINT `fk_WorldBosses_Regions1` FOREIGN KEY (`Regions_id`) REFERENCES `regions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worldbosses`
--

LOCK TABLES `worldbosses` WRITE;
/*!40000 ALTER TABLE `worldbosses` DISABLE KEYS */;
INSERT INTO `worldbosses` VALUES (1,'Anemo Hypostasis','Hypostases',1,1),(2,'Cryo Regisvine','Regisvines',1,5),(3,'Rhodeia of Loch','Elemental Lifeforms',2,6),(4,'Ruin Machines','Automatons',2,8),(5,'Perpetual Mechanical Array','Ruin Machines',3,8),(6,'Thunder Manifestation','Elemental Lifeforms',3,3),(7,'Jadeplume Terrorshroom','Fungi',4,7),(8,'Setekh Wenut','Mystical Beasts',4,1),(9,'Prototype Cal. Breguet','Clockwork Meka',5,2),(10,'Hydro Tulpa','Elemental Lifeforms',5,6);
/*!40000 ALTER TABLE `worldbosses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-11 20:37:05
