-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: autorisation
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id_categorie` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `sort_order` int DEFAULT NULL,
  `created_at` date NOT NULL,
  `parent_id` int NOT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'IT Новости','it-novosti',1,'2023-02-10',1),(2,'Экономика','ekonomika',2,'2023-02-11',1),(3,'Международные','mezhdunarodnye',3,'2023-02-12',1),(4,'Программирование','programmirovanie',1,'2023-02-13',1),(5,'Железо','zhelezo',2,'2023-02-14',2),(6,'ИИ и ML','ii-i-ml',3,'2023-02-15',2),(7,'Футбол','futbol',1,'2023-02-16',3),(8,'Хоккей','khokkei',2,'2023-02-17',3),(9,'Теннис','tennis',3,'2023-02-18',3),(10,'Внутренняя','vnutrennyaya',1,'2023-02-19',4),(11,'Внешняя','vneshnyaya',2,'2023-02-20',4),(12,'Кино','kino',1,'2023-02-21',5);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `surname` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `date_created` date NOT NULL,
  `date_last_join` date DEFAULT NULL,
  `is_active` tinyint NOT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Иванов','Алексей','alex.ivanov@yandex.ru','Alex123!','2023-05-15','2024-01-20',1),(2,'Петрова','Мария','maria.petrova@gmail.com','Masha2023@','2023-06-10','2024-01-19',1),(3,'Сидоров','Максим','max.sidorov@yandex.ru','MaxPass1!','2023-07-05','2024-01-18',1),(4,'Козлов','Дмитрий','dmitry.kozlov@gmail.com','Dima#789','2023-09-12','2024-01-16',1),(5,'Николаева','Ольга','olga.nikolaeva@yandex.ru','OlgaPass1!','2023-10-08','2024-01-15',1),(6,'Волков','Сергей','sergey.volkov@mail.ru','Sergey@123','2023-11-25','2024-01-14',1),(7,'Орлова','Екатерина','katya.orlova@gmail.com','Katya2024!','2023-12-30','2024-01-13',0),(8,'Федоров','Андрей','andrey.fedorov@yandex.ru','Andrey$567','2022-01-14','2023-12-12',1),(9,'Новиков','Виктор','viktor.novikov@mail.ru','Viktor123','2024-01-10',NULL,0),(10,'Соколова','Наталья','natalya.sokolova@gmail.com','Natalya$789','2023-03-22','2024-01-18',1),(61,'Иванов','Алексей','alex.ivanov@mail.ru','Alex123!','2023-05-15','2024-01-20',1),(62,'Петрова','Мария','maria.petrova@gmail.com','Masha2023@','2023-06-10','2024-01-19',1),(63,'Сидоров','Максим','max.sidorov@yandex.ru','MaxPass1!','2023-07-05','2024-01-18',1),(64,'Козлов','Дмитрий','dmitry.kozlov@gmail.com','Dima#789','2023-09-12','2024-01-16',1),(65,'Николаева','Ольга','olga.nikolaeva@yandex.ru','OlgaPass1!','2023-10-08','2024-01-15',1),(66,'Волков','Сергей','sergey.volkov@mail.ru','Sergey@123','2023-11-25','2024-01-14',1),(67,'Орлова','Екатерина','katya.orlova@gmail.com','Katya2024!','2023-12-30','2024-01-13',0),(68,'Федоров','Андрей','andrey.fedorov@yandex.ru','Andrey$567','2022-01-14','2023-12-12',1),(69,'Новиков','Виктор','viktor.novikov@mail.ru','Viktor123','2024-01-10',NULL,0),(70,'Соколова','Наталья','natalya.sokolova@gmail.com','Natalya$789','2023-03-22','2024-01-18',1);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_has_roles`
--

DROP TABLE IF EXISTS `client_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_has_roles` (
  `client_id_client` int NOT NULL,
  `roles_id_role` int NOT NULL,
  PRIMARY KEY (`client_id_client`,`roles_id_role`),
  KEY `fk_client_has_roles_roles1_idx` (`roles_id_role`),
  KEY `fk_client_has_roles_client_idx` (`client_id_client`),
  CONSTRAINT `fk_client_has_roles_client` FOREIGN KEY (`client_id_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `fk_client_has_roles_roles1` FOREIGN KEY (`roles_id_role`) REFERENCES `roles` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_has_roles`
--

LOCK TABLES `client_has_roles` WRITE;
/*!40000 ALTER TABLE `client_has_roles` DISABLE KEYS */;
INSERT INTO `client_has_roles` VALUES (1,1),(1,2),(2,2),(6,2),(9,2),(2,3),(4,3),(7,3),(10,3),(3,4),(5,5),(8,5);
/*!40000 ALTER TABLE `client_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contents` (
  `id_content` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `content_type` enum('статья','новость','страница','видео','файл') NOT NULL DEFAULT 'статья',
  `status` enum('черновик','опубликован','в архиве') NOT NULL DEFAULT 'черновик',
  `published_at` date NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `view_count` int NOT NULL,
  `categories_id_categorie` int NOT NULL,
  PRIMARY KEY (`id_content`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  UNIQUE KEY `slug_UNIQUE` (`slug`),
  KEY `fk_contents_client1_idx` (`author_id`),
  KEY `fk_contents_categories1_idx` (`categories_id_categorie`),
  CONSTRAINT `fk_contents_categories1` FOREIGN KEY (`categories_id_categorie`) REFERENCES `categories` (`id_categorie`),
  CONSTRAINT `fk_contents_client1` FOREIGN KEY (`author_id`) REFERENCES `client` (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents`
--

LOCK TABLES `contents` WRITE;
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` VALUES (1,1,'Новые тренды веб-разработки в 2024 году','novye-trendy-veb-razrabotki-2024','статья','опубликован','2024-01-15','2024-01-10','2024-01-10',1250,6),(2,3,'Как MySQL 8.0 улучшил производительность','mysql-8-0-proizvoditelnost','статья','опубликован','2024-01-16','2024-01-11','2024-01-11',890,6),(3,2,'ИИ в медицине: революция или риск?','ii-v-meditsine-revolyutsiya','новость','опубликован','2024-01-17','2024-01-12','2024-01-12',2100,11),(4,5,'Создание мобильного приложения с нуля','sozdanie-mobilnogo-prilozheniya','статья','черновик','2024-01-18','2024-01-13','2024-01-13',0,4),(5,7,'Основы кибербезопасности для разработчиков','osnovy-kiberbezopasnosti','статья','опубликован','2024-01-18','2024-01-14','2024-01-14',940,9),(6,4,'Лучшие практики дизайна UX/UI','luchshie-praktiki-dizayna-ux-ui','статья','опубликован','2024-01-19','2024-01-15','2024-01-15',1560,5),(7,6,'Стартап за 100 дней: реальная история','startap-za-100-dney','новость','опубликован','2024-01-20','2024-01-16','2024-01-16',1870,2),(8,1,'Онлайн-образование: будущее или тренд?','onlayn-obrazovanie-budushchee','статья','опубликован','2024-01-21','2024-01-17','2024-01-17',1100,5),(9,8,'React vs Vue: что выбрать в 2024','react-vs-vue-2024','статья','в архиве','2023-12-15','2023-12-10','2024-01-01',450,9),(10,10,'О нашем сайте и команде','o-nashem-saite','страница','опубликован','2023-06-01','2023-06-01','2024-01-01',5000,9),(11,3,'Базы данных NoSQL: когда использовать','nosql-bazy-dannyh','статья','черновик','2024-10-17','2024-01-18','2024-01-18',0,9),(12,2,'Технологии будущего: что нас ждет','tekhnologii-budushchego','видео','опубликован','2024-01-22','2024-01-19','2024-01-19',850,2);
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents_has_tag`
--

DROP TABLE IF EXISTS `contents_has_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contents_has_tag` (
  `contents_id_content` int NOT NULL,
  `tag_id_tag` int NOT NULL,
  PRIMARY KEY (`contents_id_content`,`tag_id_tag`),
  KEY `fk_contents_has_tag_tag1_idx` (`tag_id_tag`),
  KEY `fk_contents_has_tag_contents1_idx` (`contents_id_content`),
  CONSTRAINT `fk_contents_has_tag_contents1` FOREIGN KEY (`contents_id_content`) REFERENCES `contents` (`id_content`),
  CONSTRAINT `fk_contents_has_tag_tag1` FOREIGN KEY (`tag_id_tag`) REFERENCES `tags` (`id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents_has_tag`
--

LOCK TABLES `contents_has_tag` WRITE;
/*!40000 ALTER TABLE `contents_has_tag` DISABLE KEYS */;
INSERT INTO `contents_has_tag` VALUES (1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(2,3),(1,4),(2,4),(6,4),(7,4),(3,5),(5,6),(4,7),(4,8),(6,8),(7,9),(1,10),(3,10),(5,10);
/*!40000 ALTER TABLE `contents_has_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id_permission` int NOT NULL AUTO_INCREMENT,
  `permissions_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_permission`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'Чтение данных'),(2,'Создание записей'),(3,'Редактирование записей'),(4,'Удаление записей'),(5,'Управление пользователями'),(6,'Настройка системы'),(7,'Просмотр статистики'),(8,'Генерация отчетов'),(9,'Управление ролями'),(10,'Экспорт данных');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Администратор'),(2,'Модератор'),(3,'Пользователь'),(4,'Гость'),(5,'Редактор');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_has_permissions`
--

DROP TABLE IF EXISTS `roles_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_has_permissions` (
  `roles_id_role` int NOT NULL,
  `permissions_id_permission` int NOT NULL,
  PRIMARY KEY (`roles_id_role`,`permissions_id_permission`),
  KEY `fk_roles_has_permissions_permissions1_idx` (`permissions_id_permission`),
  KEY `fk_roles_has_permissions_roles1_idx` (`roles_id_role`),
  CONSTRAINT `fk_roles_has_permissions_permissions1` FOREIGN KEY (`permissions_id_permission`) REFERENCES `permissions` (`id_permission`),
  CONSTRAINT `fk_roles_has_permissions_roles1` FOREIGN KEY (`roles_id_role`) REFERENCES `roles` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_has_permissions`
--

LOCK TABLES `roles_has_permissions` WRITE;
/*!40000 ALTER TABLE `roles_has_permissions` DISABLE KEYS */;
INSERT INTO `roles_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(3,2),(5,2),(1,3),(2,3),(5,3),(1,4),(1,5),(1,6);
/*!40000 ALTER TABLE `roles_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id_session` int NOT NULL AUTO_INCREMENT,
  `token` varchar(45) NOT NULL,
  `expires` date NOT NULL COMMENT 'Дата истечения токена',
  `client_id_client` int NOT NULL,
  PRIMARY KEY (`id_session`),
  KEY `fk_sessions_client1_idx` (`client_id_client`),
  CONSTRAINT `fk_sessions_client1` FOREIGN KEY (`client_id_client`) REFERENCES `client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id_tag` int NOT NULL,
  `tag_name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id_tag`),
  UNIQUE KEY `slug_UNIQUE` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'PHP','php','2023-01-10'),(2,'JavaScript','javascript','2023-01-11'),(3,'Python','python','2023-01-12'),(4,'MySQL','mysql','2023-01-13'),(5,'React','react','2023-01-14'),(6,'Vue.js','vuejs','2023-01-15'),(7,'Искусственный интеллект','iskusstvennyj-intellekt','2023-01-16'),(8,'Машинное обучение','mashinnoe-obuchenie','2023-01-17'),(9,'Базы данных','bazy-dannyh','2023-01-18'),(10,'Фронтенд','frontend','2023-01-19'),(11,'Бэкенд','backend','2023-01-20'),(12,'Футбол','futbol','2023-01-21');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'autorisation'
--

--
-- Dumping routines for database 'autorisation'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-11  8:35:07
