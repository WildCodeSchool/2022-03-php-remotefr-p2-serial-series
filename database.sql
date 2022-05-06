-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: serial_series
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
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES 
(1, 'Comedy'),
(2, 'Horror'),
(3, 'Japanese Animation'),
(4, 'Thriller');

/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serie`
--

DROP TABLE IF EXISTS `serie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `number_serie` int DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `description` text, 
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_serie_category_idx` (`category_id`),
  CONSTRAINT `fk_serie_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serie`
--

LOCK TABLES `serie` WRITE;
/*!40000 ALTER TABLE `serie` DISABLE KEYS */;
INSERT INTO `serie` VALUES 
(1, 'Jijutsu kaizen0', 1, 'Jijutsu_kaizen0.jpg', "<p><strong>16+,1 Season, 1 Movie, Japan.</p></strong>
<p><strong>Genres : Anime Series, International TV Shows</strong></p>
<p>Yuta Okkotsu is haunted by the spirit of Rika, his childhood friend who died in a car accident. 
She is no longer the little girl he knew and manifests herself as a monstrous entity that protects him against his will.
After yet another accident caused by this scourge, Yuta is picked up by Satoru Gojo, a teacher at the Tokyo School of Exorcism, who convinces him to join the school to master his occult energy.
Will he be able to learn enough in time to face the curse that haunts him?</p>
Source :<a href= \"https://androidgadget.org/le-film-jujutsu-kaisen-0-arrive-bientot-sur-crunchyroll\">https://androidgadget.org/le-film-jujutsu-kaisen-0-arrive-bientot-sur-crunchyroll\</a>",3),
(2, 'Jijutsu kaizen', 2, 'Jijutsu_kaizen.jpg', "<p><strong>16+,1 Season, 1 Movie, Japan.</p></strong>
<p><strong>Genres : Anime Series, International TV Shows</strong></p>
<p>A boy fights... for the right death.
Hardship, regret, shame: the negative feelings that humans feel become curses that lurk in our everyday lives. 
The curses run rampant throughout the world, capable of leading people to terrible misfortune and even death. 
What's more, the curses can only be exorcised by another curse.
Itadori Yuuji is a boy with tremendous physical strength, though he lives a completely ordinary high school life. One day, to save a classmate who has been attacked by curses, he eats the finger of Ryomen Sukuna, taking the curse into his own soul. 
From then on, he shares one body with Ryomen Sukuna. Guided by the most powerful of sorcerers, Gojou Satoru, Itadori is admitted to the Tokyo Metropolitan Jujutsu Technical High School, an organization that fights the curses... and thus begins the heroic tale of a boy who became a curse to exorcise a curse, a life from which he could never turn back.</p>
Source:<a href= \"https://www.crunchyroll.com/jujutsu-kaisen/episode-1-ryomen-sukuna-797865\">https://www.crunchyroll.com/jujutsu-kaisen/episode-1-ryomen-sukuna-797865</a>",3),
(3, 'Demon Slayers', 3, 'Demonslayer1.jpg', "<p><strong>16+, 2 Seasons, 1 Movie, Japan.</strong></p>
<p><strong>Genres : Anime Series, International TV Shows</p></strong>
<p>After a demon attack leaves his family slain and his sister cursed, Tanjiro embarks upon a perilous journey to find a cure and avenge those he's lost.</p>
Source :  Demon Slayer: Kimetsu no Yaiba",3),
(4, 'One Piece', 4, 'onepieceS1.jpg', "<p><strong>14+, 20 Seasons, 15 Movies, Japan.</strong></p>
<p><strong>Genres : Anime Series, International TV Shows</strong></p>
<p>One Piece is a Japanese animated series about the adventures of Luffy, who dreams of becoming king of the pirates. 
A true rubber man, thanks to a Demon Fruit, Luffy sets out in search of the One Piece, the treasure that will make him king of the pirates. To hope to realize his dream, Luffy must take the road to Grand Line, also known as the Pirate Graveyard. So he sets out to recruit a crew worthy of the task. 
One Piece is adapted from the manga created by Eiichiro Oda.</p>
Source :<a href= \"https://www.crunchyroll.com/fr/one-piece/episode-1-im-luffy-the-man-whos-gonna-be-king-of-the-pirates-650673\">https://www.crunchyroll.com/fr/one-piece/episode-1-im-luffy-the-man-whos-gonna-be-king-of-the-pirates-650673</a>",3),
(5, 'Attack on Titans', 5, 'attack_on_titans1.jpg', "<p><strong>16+, 4 Seasons, Japan.</strong></p>
<p><strong>Genres : Anime Series, International TV Shows</strong></p>
<p>With his hometown in ruins, young Eren Yeager becomes determined to fight back against the giant Titans that threaten to destroy the human race.</p>
Source :<a href= \" https://www.crunchyroll.com/fr/attack-on-titan\">https://www.crunchyroll.com/fr/attack-on-titan\</a>",3),
(6, 'The walking dead', 6, 'walkingdead.jpeg', "<p><strong>18+, 11 seasons, United-States</strong></p> 
<p>Sheriff's deputy Rick Grimes awakens from a coma to find a post-apocalyptic world dominated by flesh-eating zombies.
He sets out to find his family and encounters many other survivors along the way.</p>
<p>Cast : Andrew Lincoln, Steven Yeun, Norman Reedus, Chandler Riggs, Melissa McBride, Lauren Cohan, Danai Gurira, Alanna Masterson, Sonequa Martin-Green, Josh McDermitt, Christian Serratos, Seth Gilliam, Ross Marquand, Lennie James, Emily Kinney, Jon Bernthal</p>
<br>source : reelgood.com flixable.com",2),
(7, 'Dark', 7, 'dark.jpeg', "<p><strong>18+, 3 seasons, Germany.</strong></p> 
<p>A missing child causes four families to help each other for answers. 
What they could not imagine is that this mystery would be connected to innumerable other secrets of the small town.</p>
<p>Cast : Louis Hofmann, Oliver Masucci, Jördis Triebel, Maja Schöne, Karoline Eichhorn, Sebastian Rudolph, Anatole Taubman, Mark Waschke, Stephan Kampwirth, Anne Ratte-Polle, Andreas Pietschmann, Lisa Vicari, Michael Mendl, Angela Winkler</p>
<br>source : reelgood.com flixable.com",2),
(8, 'Game of Thrones', 8, 'goat.jpeg', "<p><strong>18+, 8 seasons, United States.</strong></p> 
<p>Seven noble families fight for control of the mythical land of Westeros. 
Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. 
Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.</p>
<p>Cast : Emilia Clarke, Kit Harington, Sophie Turner, Gwendoline Christie, Maisie Williams, Peter Dinkage, Lena Headey, Nikolaj Coster-Waldau, John Bradley-West, Iain Glen, Richard Madden, Alfie Allen, Jason Momoa, Liam Cunningham</p>
<br>source : reelgood.com",2),
(9, 'Stranger Things', 9, 'strangerThings.jpeg', "<p><strong>14+, 4 seasons, United States.</strong></p> 
<p>When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.</p>
<p>Cast : Winona Ryder, David Harbour, Finn Wolfhard, Millie Bobby Brown, Gaten Matarazzo, Caleb McLaughlin, Natalia Dyer, Charlie Heaton, Cara Buono, Noah Schnapp, Matthew Modine, Joe Keery, Dacre Montgomery, Sadie Sink, Paul Reiser, Sean Astin</p>
<br>source : reelgood.com flixable.com",2),
(10, 'Rick and Morty', 10, 'rick_morty.jpg', "<p><strong>16+, 2013, 5 saisons, United States.</strong></p>
<p>Rick and Morty encounter a pawnshop in space, live in parallel universes, and come face to face with the devil.</p>
<p>Starring: Justin Roiland,Chris Parnell,Spencer Grammer</p>
Sources:<a href= \"https://www.netflix.com/fr/title/80014749\">https://www.netflix.com/fr/title/80014749</a>",1),
(11, 'Sex Education', 11, 'sex_education.jpg', "<p><strong>16+, 2019, 3 saisons, United States.</strong></p>
<p>The shy Otis knows everything about sex... thanks to his therapist mom. The rebel Maeve decides him to open an underground consulting firm in high school.</p>
<p>Starring: Asa Butterfield, Gillian Anderson, Ncuti Gatwa<p>
Source:<a href= \"https://www.netflix.com/fr/title/80197526\">https://www.netflix.com/fr/title/80197526</a>",1),
(12, 'Shameless', 12, 'shameless.jpg', "<p><strong>18 +, 2013, 11 saisons, United States.</strong></p> 
<p>Meet Frank Gallagher (series star WILLIAM H. MACY): proud, working-class patriarch to a motley brood of six smart, spirited and independent kids who, without him, would be... better off. 
The Gallaghers are irreverent, endearing, resilient — and they're absolutely, wildly and unapologetically SHAMELESS.</p>
<p>Starring:	Emmy Rossum, Jeremy Allen White, Ethan Cutkosky</p>
Sources:<a href= \"https://www.primevideo.com/detail/0K1UM6K115ZWVEVV6LMBC8WVAC/ref=atv_dp_season_select_s1\">https://www.primevideo.com/detail/0K1UM6K115ZWVEVV6LMBC8WVAC/ref=atv_dp_season_select_s1\</a>",1),
(13, 'Peacemaker', 13, 'peacemakerS1.jpg', "<p><strong>2022, 1 saison, United States.</strong></p>
<p>Left for dead after his confrontation with Bloodsport during their mission on the island of Corto Maltese with Task Force X, Christopher Smith, aka the Peacemaker, actually survived. 
He is found by Amanda Waller's team in order to entrust him with new missions.</p>
<p>Starring: John Cena, Danielle Brooks, Freddie Stroma, Chukwudi Iwuji, Jennifer Holland, Steve Agee, Robert Patrick, Annie Chang, Lochlyn Munro, Elizabeth Faith Ludlow, Rizwan Manji</p>
Sources:<a href= \"https://www.cineserie.com/series/4434842\">https://www.cineserie.com/series/4434842\</a>",1),
(14, 'Upload', 14, 'upload.jpg', "<p><strong>18+, 2020, 2 saisons, United States.</strong></p>
<p>From the Emmy-winning Greg Daniels (The Office, Parks & Rec) comes a hilarious new sci-fi comedy. 
In the future people can upload their consciousness to a luxurious digital afterlife. 
When party boy Nathan gets uploaded to a virtual resort he meets the down-to-earth Nora who starts as his customer service “angel”, but becomes so much more as she helps him find friendship, love and purpose</p>
<p>Starring: Robbie Amell, Andy Allo, Allegra Edwards</p>
Source:<a href= \"https://www.primevideo.com\">https://www.primevideo.com\</a>",1),
(15, 'Breaking Bad', 15, 'breakingbad.jpg', "<p><strong>18+, 5 seasons, United States.</strong></p>  
<p>When Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. 
He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime.</p>
<p>Cast: Bryan Cranston, Aaron Paul, Anna Gunn.</p><br> source: Reelgood.com",4),
(16, 'Dexter', 16, 'dexter.jpeg', "<p><strong>18+, 1 season, United States.</strong></p> 
<p>10 years after Dexter went missing in the eye of Hurricane Laura, we find him living under an assumed name in the small town of Iron Lake, New York. 
Dexter may be embracing his new life, but in the wake of unexpected events in this close-knit community, his Dark Passenger beckons.</p>
<p>Cast:  Michael C. Hall, Jack Alcott, Julia Jones.</p><br> source: Reelgood.com",4),
(17, 'Ozark', 17, 'ozark.jpeg', "<p><strong>18+, 4 seasons, United States.</strong></p>  
<p>A financial adviser drags his family from Chicago to the Missouri Ozarks, where he must launder $500 million in five years to appease a drug boss.</p>                                                                                                                                                                                                                                                              
<p>Cast: Jason Bateman, Laura Linney, Sofia Hublitz.</p><br> source: flixable.com",4),
(18, 'You', 18, 'you.jpeg', "<p><strong>18+, 4 seasons, United States.</strong></p>               
<p>A dangerously charming, intensely obsessive young man goes to extreme measures to insert himself into the lives of those he is transfixed by.</p>                                                                      
<p>Cast: Penn Badgley, Victoria Pedretti, Michaela.</p><br> source: Reelgood.com",4);


/*!40000 ALTER TABLE `serie` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seen`
--

DROP TABLE IF EXISTS `seen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_completed` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `serie_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_seen_serie_idx` (`serie_id`),
  KEY `fk_seen_user_idx` (`user_id`),
  CONSTRAINT `fk_seen_serie` FOREIGN KEY (`serie_id`) REFERENCES `serie` (`id`),
  CONSTRAINT `fk_seen_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seen`
--

LOCK TABLES `seen` WRITE;
/*!40000 ALTER TABLE `seen` DISABLE KEYS */;
/*!40000 ALTER TABLE `seen` ENABLE KEYS */;
UNLOCK TABLES;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-21 23:39:26

