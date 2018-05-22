-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: student_schedule
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `stud_sched`
--

DROP TABLE IF EXISTS `stud_sched`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stud_sched` (
  `idstud_sched` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stud_id` varchar(15) NOT NULL,
  `stud_section` varchar(15) NOT NULL,
  PRIMARY KEY (`idstud_sched`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_sched`
--

LOCK TABLES `stud_sched` WRITE;
/*!40000 ALTER TABLE `stud_sched` DISABLE KEYS */;
INSERT INTO `stud_sched` VALUES (1,'2014-0213-MN','BSIT-3A');
/*!40000 ALTER TABLE `stud_sched` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `stud_section` varchar(10) NOT NULL,
  `stud_id` varchar(15) NOT NULL,
  `stud_bday` varchar(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Novy John Albancia','BSIT-3A','2014-0213-MN','092297');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject_list` varchar(200) NOT NULL,
  `time` varchar(15) NOT NULL,
  `day` varchar(30) NOT NULL,
  `instructor` varchar(50) NOT NULL,
  `room` varchar(8) NOT NULL,
  `subj_id` varchar(15) NOT NULL,
  `stud_section` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'Introduction to Research','8:00-10:00','Monday / Wednesday','Cabacas, Regin','ICT106','ITE201B','BSIT-3A'),(2,'Society & Culture with Family Planning','10:00-11:30','Monday / Wednesday','Ritchelda, Auro','QH218','SS101','BSIT-3A'),(3,'Game and Entertainment Programming','1:00-3:00','Monday / Wednesday','Solidarios, Mark Joseph','ICT302','IT248','BSIT-3A'),(4,'Probability and Statistics','4:00-5:30','Monday / Wednesday','Nepomuceno, Cherry','STAT203','QH207','BSIT-3A'),(9,'Computer Systems Organizations with Assembly Language','7:00-9:00','Tuesday / Thursday','Subong, Paul Marlou C.','IT212','ICT301','BSIT-3A'),(10,'Web Services and Cloud Computing','9:00-12:00','Tuesday / Thursday','Dayot, Ralph Voltaire','IT242','ICT306','BSIT-3A'),(11,'Philosophy of Man','1:00-2:30','Tuesday / Thursday','Erebaren, Gerardo C.','HUM102','QH218','BSIT-3A'),(12,'System Analysis and Design','2:30-4:00','Tuesday / Thursday','Cenaroza, Raizza Victoria','ITE202B','ICT105','BSIT-3A');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-08 10:47:30
