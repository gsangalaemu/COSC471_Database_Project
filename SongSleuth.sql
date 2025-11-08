-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: song_sleuth
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `affiliations`
--

DROP TABLE IF EXISTS `affiliations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliations` (
  `Affiliation_id` int NOT NULL AUTO_INCREMENT COMMENT 'Auto-generated integer to serve as the primary key for this entity.\n',
  `Group_id` int DEFAULT NULL COMMENT 'The group the artist is a member of\n. References GROUPS.Group_id\n',
  `Artist_id` int DEFAULT NULL COMMENT 'The artist in question. References ARTISTS.Artist_id',
  `Info` mediumtext COLLATE utf8mb3_bin COMMENT 'Stores information about the relationship between the artist and the group\n',
  PRIMARY KEY (`Affiliation_id`),
  KEY `Group_id_idx` (`Group_id`),
  KEY `Artist_id_idx` (`Artist_id`),
  CONSTRAINT `Affiliation_Artist_ID` FOREIGN KEY (`Artist_id`) REFERENCES `artists` (`Artist_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Affiliation_Group_ID` FOREIGN KEY (`Group_id`) REFERENCES `groups` (`Group_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliations`
--

LOCK TABLES `affiliations` WRITE;
/*!40000 ALTER TABLE `affiliations` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_genres`
--

DROP TABLE IF EXISTS `album_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album_genres` (
  `Album_id` int NOT NULL COMMENT 'The album in question. Serves as the primary key. Entity serves to link albums and the genres that appear on the album. References ALBUMS.Album_id',
  `Genre_id` int NOT NULL COMMENT 'The genre in question. References GENRES.Genre_id',
  PRIMARY KEY (`Album_id`,`Genre_id`),
  KEY `Genre_id_idx` (`Genre_id`),
  CONSTRAINT `Album_Genre_Album_ID` FOREIGN KEY (`Album_id`) REFERENCES `albums` (`Album_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Album_Genre_Genre_ID` FOREIGN KEY (`Genre_id`) REFERENCES `genres` (`Genre_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_genres`
--

LOCK TABLES `album_genres` WRITE;
/*!40000 ALTER TABLE `album_genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `album_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `Album_id` int NOT NULL AUTO_INCREMENT COMMENT 'Auto-generated integer to serve as the primary key for this entity. This method was chosen because it is not uncommon for different artists to have albums using the same name, and even sometimes a single artist will have multiple albums with the same name.\n',
  `Allbum_artist` int DEFAULT NULL COMMENT 'The primary artists for the album. References ARTIST.Artist_id',
  `Album_name` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'The name of the album.',
  `Release_date` date DEFAULT NULL COMMENT 'The original release date of an album',
  `Album_art` varchar(260) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'Following best practices, instead of storing the images directly in the database, we instead will store the images in the file system and store the path to each image in the database. VARCHAR(260) is chosen because 260 characters is the max path length on Windows systems.\n',
  PRIMARY KEY (`Album_id`),
  KEY `Album_artist_idx` (`Allbum_artist`),
  CONSTRAINT `Albums_Artist_ID` FOREIGN KEY (`Allbum_artist`) REFERENCES `artists` (`Artist_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `Artist_id` int NOT NULL AUTO_INCREMENT COMMENT 'Auto-generated integer to serve as the primary key for this entity. This method was chosen because there are multiple artists with the same name, as well as to account for artist name changes.\n',
  `Artist_name` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'Holds the artists name\n',
  PRIMARY KEY (`Artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `Genre_id` int NOT NULL AUTO_INCREMENT COMMENT 'Auto-generated integer to serve as the primary key for this entity. This was chosen because the same genre name sometimes refers to distinct genres. (Hardcore for instance can refer to a style of punk or a style of electronic music).\n',
  `Genre_name` varchar(50) COLLATE utf8mb3_bin NOT NULL COMMENT 'Attribute to hold the names of different music genres. 50 was chosen as the length as the longest genre name (including spaces) found on RateYourMusic is 39 characters, and this allows for some extra room for any other long genre names that may develop.\n',
  PRIMARY KEY (`Genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `Group_id` int NOT NULL AUTO_INCREMENT COMMENT 'Auto-generated integer to serve as the primary key for this entity.\n This method was chosen since multiple groups with the same name exist, sometimes from the same country, and even from the same region of the same country.',
  `Group_name` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'Holds the group''s name\n',
  PRIMARY KEY (`Group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performing_artist`
--

DROP TABLE IF EXISTS `performing_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performing_artist` (
  `Performing_artist_id` int NOT NULL AUTO_INCREMENT COMMENT 'Auto generated integer to server as the primary key',
  `Song_id` int DEFAULT NULL COMMENT 'The song in question References SONGS.Song_id',
  `Featured_artist` int DEFAULT NULL COMMENT 'The guest/featured artist Refences ARTIST.Artist_id',
  PRIMARY KEY (`Performing_artist_id`),
  KEY `Song_id_idx` (`Song_id`),
  KEY `Featured_artist_idx` (`Featured_artist`),
  CONSTRAINT `Featured_Artist_Artist_ID` FOREIGN KEY (`Featured_artist`) REFERENCES `artists` (`Artist_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Performing_Artist_Song_ID` FOREIGN KEY (`Song_id`) REFERENCES `songs` (`Song_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performing_artist`
--

LOCK TABLES `performing_artist` WRITE;
/*!40000 ALTER TABLE `performing_artist` DISABLE KEYS */;
/*!40000 ALTER TABLE `performing_artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_albums`
--

DROP TABLE IF EXISTS `song_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song_albums` (
  `Song_id` int NOT NULL COMMENT 'The song in question. Serves as the primary key. Table serves to link songs to the albums they appear on. References SONGS.Song_id',
  `Album_id` int NOT NULL COMMENT 'The album the song appears on. References ALBUMS.Album_id',
  `Track_number` int DEFAULT NULL COMMENT 'Attribute to hold the track number of a song/track on an album',
  PRIMARY KEY (`Song_id`,`Album_id`),
  KEY `Album_id_idx` (`Album_id`),
  CONSTRAINT `Song_Album_Songs_ID` FOREIGN KEY (`Song_id`) REFERENCES `songs` (`Song_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Song_Albums_Album_ID` FOREIGN KEY (`Album_id`) REFERENCES `albums` (`Album_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_albums`
--

LOCK TABLES `song_albums` WRITE;
/*!40000 ALTER TABLE `song_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `song_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `Song_id` int NOT NULL AUTO_INCREMENT COMMENT 'Auto-generated integer to serve as the primary key for this entity. This method was chosen because it is very common for different artists to have songs using the same name, and not unheard of for a single artist to have multiple songs by the same name.\n',
  `Song_name` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'Attribute to hold the song name\n',
  `Album_artist` int DEFAULT NULL COMMENT 'The primary artist for a song or album. References ARTIST.Artist_id',
  `Song_length` time DEFAULT NULL COMMENT 'The length of the song.',
  `Genre` int DEFAULT NULL COMMENT 'The genre of a song. For our design we are keeping things simple by only using the primary genre for a song. If a song crosses genre boundaries additional genres will not be included. This is due to the somewhat subjective nature of genres. References GENRES.Genre_id',
  `Year` int DEFAULT NULL COMMENT 'The year a song was originally released',
  PRIMARY KEY (`Song_id`),
  KEY `Album_artist_idx` (`Album_artist`),
  KEY `Genre_idx` (`Genre`),
  CONSTRAINT `Songs_Artist_ID` FOREIGN KEY (`Album_artist`) REFERENCES `artists` (`Artist_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Songs_Genre_ID` FOREIGN KEY (`Genre`) REFERENCES `genres` (`Genre_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `years_active`
--

DROP TABLE IF EXISTS `years_active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `years_active` (
  `Years_active_id` int NOT NULL AUTO_INCREMENT COMMENT 'Auto-generated integer to serve as the primary key for this entity.\n',
  `Artist_id` int DEFAULT NULL COMMENT 'The artist in question. References ARTISTS.Artist_id',
  `Start_date` varchar(10) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'The date or year an artist started to be active. Use a VARCHAR(10) as the most information that may be known for an artist start date is up to 10 characters (YYYY-MM-DD). More often only the year will be listed as this level of precision is often not known. The DATE data type is not used because of this inconsistent precision and a DATE type attribute is not able to accept only the year if the rest of the start date is not known. Inputting "Unknown" is acceptable when the start data is uknown and falls within the character limit.',
  `End_date` varchar(10) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'The date or year an artist stopped being active. Use a VARCHAR(10) as the most information that may be known for an artist start date is up to 10 characters (YYYY-MM-DD). More often only the year will be listed as this level of precision is often not known. For artists that are still active the value "present" will be used instead (which is less than 10 characters). Inputting "Unknown" is acceptable when the start data is uknown and falls within the character limit.',
  PRIMARY KEY (`Years_active_id`),
  KEY `Artist_id_idx` (`Artist_id`),
  CONSTRAINT `Years_Active_Artist_ID` FOREIGN KEY (`Artist_id`) REFERENCES `artists` (`Artist_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `years_active`
--

LOCK TABLES `years_active` WRITE;
/*!40000 ALTER TABLE `years_active` DISABLE KEYS */;
/*!40000 ALTER TABLE `years_active` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-08 15:47:44
