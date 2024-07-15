CREATE DATABASE  IF NOT EXISTS `historiainteractiva` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `historiainteractiva`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: historiainteractiva
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
-- Table structure for table `decision`
--

DROP TABLE IF EXISTS `decision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decision` (
  `id` int NOT NULL AUTO_INCREMENT,
  `escena_id` int NOT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `escena_destino_id` int DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `escena_id` (`escena_id`),
  KEY `escena_destino_id` (`escena_destino_id`),
  CONSTRAINT `decision_ibfk_1` FOREIGN KEY (`escena_id`) REFERENCES `escena` (`id`),
  CONSTRAINT `decision_ibfk_2` FOREIGN KEY (`escena_destino_id`) REFERENCES `escena` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decision`
--

LOCK TABLES `decision` WRITE;
/*!40000 ALTER TABLE `decision` DISABLE KEYS */;
INSERT INTO `decision` VALUES (1,1,'Hablar en persona',2,'2024-07-14 20:11:30'),(2,1,'Responder por mensaje',3,'2024-07-14 20:11:30'),(3,2,'Aceptar y marcharse',4,'2024-07-14 20:11:30'),(4,2,'Tratar de convencerle',5,'2024-07-14 20:11:30'),(5,3,'Aceptar y marcharse',4,'2024-07-14 20:11:30'),(6,3,'Tratar de convencerle',5,'2024-07-14 20:11:30'),(7,4,'Buscar apoyo en amigos',6,'2024-07-14 20:11:30'),(8,4,'Refugiarse en el trabajo',7,'2024-07-14 20:11:30'),(9,5,'Aceptar y marcharse',4,'2024-07-14 20:11:30'),(10,5,'Insistir',8,'2024-07-14 20:11:30'),(11,6,'Conocer gente nueva',9,'2024-07-14 20:11:30'),(12,6,'Seguir lamentándote',10,'2024-07-14 20:11:30'),(13,7,'Encontrar satisfacción en el trabajo',11,'2024-07-14 20:11:30'),(14,7,'Sentirse vacío',12,'2024-07-14 20:11:30'),(15,8,'Aceptar y marcharse',4,'2024-07-14 20:11:30'),(16,8,'Acosarle',13,'2024-07-14 20:11:30'),(17,9,'Tomarse tiempo para sí mismo',14,'2024-07-14 20:11:30'),(18,9,'Forzar una nueva relación',15,'2024-07-14 20:11:30'),(19,10,'Buscar ayuda profesional',16,'2024-07-14 20:11:30'),(20,10,'Quedarse estancado',17,'2024-07-14 20:11:30'),(21,11,'Seguir enfocado en el trabajo',18,'2024-07-14 20:11:30'),(22,11,'Equilibrar vida personal y laboral',19,'2024-07-14 20:11:30'),(23,12,'Buscar nuevas actividades',20,'2024-07-14 20:11:30'),(24,12,'Seguir sintiéndote vacío',21,'2024-07-14 20:11:30'),(25,14,'Explorar nuevas aficiones',22,'2024-07-14 20:11:30'),(26,14,'Viajar solo',23,'2024-07-14 20:11:30'),(27,16,'Seguir con la terapia',24,'2024-07-14 20:11:30'),(28,16,'Aplicar lo aprendido en nuevas relaciones',25,'2024-07-14 20:11:30'),(29,18,'Buscar equilibrio',19,'2024-07-14 20:11:30'),(30,18,'Dejar que el trabajo consuma tu vida',26,'2024-07-14 20:11:30'),(31,19,'Empezar una nueva relación',27,'2024-07-14 20:11:30'),(32,19,'Disfrutar de la soltería',28,'2024-07-14 20:11:30'),(33,20,'Seguir explorando',29,'2024-07-14 20:11:30'),(34,20,'Compartir con otros',30,'2024-07-14 20:11:30'),(35,22,'Compartir aficiones con amigos',31,'2024-07-14 20:11:30'),(36,22,'Buscar comunidad en línea',32,'2024-07-14 20:11:30'),(37,23,'Conocer gente en el viaje',33,'2024-07-14 20:11:30'),(38,23,'Disfrutar del viaje en soledad',34,'2024-07-14 20:11:30'),(39,24,'Aplicar lo aprendido',25,'2024-07-14 20:11:30'),(40,24,'Ayudar a otros',35,'2024-07-14 20:11:30'),(41,36,'Entrar al bosque',37,'2024-07-15 00:28:12'),(42,36,'Volver a casa',38,'2024-07-15 00:28:12'),(43,39,'Ir a la escena del crimen',40,'2024-07-15 00:28:19'),(44,39,'Enviar a tu asistente',41,'2024-07-15 00:28:19'),(45,42,'Seguir el curso actual',43,'2024-07-15 00:28:26'),(46,42,'Buscar refugio en una isla cercana',44,'2024-07-15 00:28:26');
/*!40000 ALTER TABLE `decision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escena`
--

DROP TABLE IF EXISTS `escena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escena` (
  `id` int NOT NULL AUTO_INCREMENT,
  `historia_id` int NOT NULL,
  `titulo` varchar(60) NOT NULL,
  `video` varchar(1000) DEFAULT NULL,
  `audio` varchar(1000) DEFAULT NULL,
  `imagen` varchar(1000) DEFAULT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `es_final` tinyint(1) DEFAULT '0',
  `texto_final` varchar(1000) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `historia_id` (`historia_id`),
  CONSTRAINT `escena_ibfk_1` FOREIGN KEY (`historia_id`) REFERENCES `historia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escena`
--

LOCK TABLES `escena` WRITE;
/*!40000 ALTER TABLE `escena` DISABLE KEYS */;
INSERT INTO `escena` VALUES (1,1,'La Relación Se Rompe','https://www.youtube.com/embed/bo9Z_pgByQY?si=j4iJqNIP-nvtmqR0',NULL,NULL,'Recibes un mensaje de texto de esa persona especial. Te dice que necesitan hablar. Sabes que algo no está bien.',0,NULL,'2024-07-14 20:11:30'),(2,1,'La Conversación en Persona',NULL,NULL,'https://c0.klipartz.com/pngpicture/375/580/gratis-png-emoji-emoticono-de-tristeza-emoticon-adios.png','Se encuentran en el parque donde solían pasear. Te dice que ya no siente lo mismo y que quiere terminar con esta relación indefinida.',0,NULL,'2024-07-14 20:11:30'),(3,1,'La Respuesta por Mensaje',NULL,NULL,NULL,'Decides responder el mensaje. Te dice que ya no siente lo mismo y que quiere terminar con esta relación indefinida.',0,NULL,'2024-07-14 20:11:30'),(4,1,'La Resignación',NULL,NULL,NULL,'Aceptas la decisión y te marchas. Pasas días en soledad, reflexionando sobre lo que salió mal.',0,NULL,'2024-07-14 20:11:30'),(5,1,'El Intento de Convencerle',NULL,NULL,NULL,'Tratas de convencer a esa persona de que lo intenten una vez más. Sin embargo, está decidida y no cambia de opinión.',0,NULL,'2024-07-14 20:11:30'),(6,1,'El Apoyo de los Amigos',NULL,NULL,NULL,'Buscas el apoyo de tus amigos. Ellos te llevan a salir y tratar de distraerte.',0,NULL,'2024-07-14 20:11:30'),(7,1,'El Refugio en el Trabajo',NULL,NULL,NULL,'Te sumerges en tu trabajo, tratando de olvidar a esa persona.',0,NULL,'2024-07-14 20:11:30'),(8,1,'La Insistencia',NULL,NULL,NULL,'Insistes en intentar salvar la relación, pero la otra persona se molesta y te dice que debes aceptar su decisión.',0,NULL,'2024-07-14 20:11:30'),(9,1,'Conociendo Gente Nueva',NULL,NULL,NULL,'Conoces a alguien nuevo en una fiesta, pero te das cuenta de que aún no estás listo para otra relación.',0,NULL,'2024-07-14 20:11:30'),(10,1,'Seguir Lamentándote',NULL,NULL,NULL,'Te sumerges en la tristeza y no haces nada por superar la situación.',0,NULL,'2024-07-14 20:11:30'),(11,1,'Encontrar Satisfacción en el Trabajo',NULL,NULL,NULL,'Encuentras satisfacción en tu trabajo y empiezas a sentirte mejor contigo mismo.',0,NULL,'2024-07-14 20:11:30'),(12,1,'Sentirse Vacío',NULL,NULL,NULL,'A pesar de tu dedicación al trabajo, sientes un vacío que no puedes llenar.',0,NULL,'2024-07-14 20:11:30'),(13,1,'Acosar a la Persona',NULL,NULL,NULL,'Decides no aceptar la situación y empiezas a acosar a la otra persona. Esto solo agrava la situación y terminas perdiendo el contacto definitivamente.',1,NULL,'2024-07-14 20:11:30'),(14,1,'Tomarse Tiempo para Sí Mismo',NULL,NULL,NULL,'Decides tomarte un tiempo para ti mismo, reflexionas y trabajas en tu crecimiento personal.',0,NULL,'2024-07-14 20:11:30'),(15,1,'Forzar una Nueva Relación',NULL,NULL,NULL,'Intentas forzar una nueva relación sin estar listo, lo que lleva a más desilusiones y a un nuevo rompimiento.',1,NULL,'2024-07-14 20:11:30'),(16,1,'Buscar Ayuda Profesional',NULL,NULL,NULL,'Decides buscar ayuda profesional y empiezas a asistir a terapia, lo que te ayuda a superar la situación y crecer emocionalmente.',0,NULL,'2024-07-14 20:11:30'),(17,1,'Quedarse Estancado',NULL,NULL,NULL,'Te quedas estancado en tu tristeza, incapaz de seguir adelante.',1,NULL,'2024-07-14 20:11:30'),(18,1,'Seguir Enfocado en el Trabajo',NULL,NULL,NULL,'Continúas enfocándote en el trabajo y alcanzas grandes logros profesionales.',0,NULL,'2024-07-14 20:11:30'),(19,1,'Equilibrar Vida Personal y Laboral',NULL,NULL,NULL,'Encuentras un equilibrio entre tu vida personal y laboral, y comienzas a disfrutar de ambas.',0,NULL,'2024-07-14 20:11:30'),(20,1,'Buscar Nuevas Actividades',NULL,NULL,NULL,'Decides buscar nuevas actividades y hobbies, lo que te ayuda a sentirte mejor.',0,NULL,'2024-07-14 20:11:30'),(21,1,'Seguir Sintiendo Vacío',NULL,NULL,NULL,'Sigues sintiéndote vacío y nada parece llenarte.',1,NULL,'2024-07-14 20:11:30'),(22,1,'Explorar Nuevas Aficiones',NULL,NULL,NULL,'Encuentras nuevas aficiones que te apasionan y empiezas a sentirte mejor.',0,NULL,'2024-07-14 20:11:30'),(23,1,'Viajar Solo',NULL,NULL,NULL,'Decides viajar solo, lo que te ayuda a descubrirte a ti mismo y superar la tristeza.',0,NULL,'2024-07-14 20:11:30'),(24,1,'Seguir con la Terapia',NULL,NULL,NULL,'Continúas con la terapia y sigues creciendo emocionalmente.',0,NULL,'2024-07-14 20:11:30'),(25,1,'Aplicar lo Aprendido en Nuevas Relaciones',NULL,NULL,NULL,'Empiezas a aplicar lo que has aprendido en terapia en nuevas relaciones y te sientes mejor preparado.',0,NULL,'2024-07-14 20:11:30'),(26,1,'Dejar que el Trabajo Consuma tu Vida',NULL,NULL,NULL,'Dejas que el trabajo consuma tu vida y pierdes el equilibrio entre tu vida personal y laboral.',1,NULL,'2024-07-14 20:11:30'),(27,1,'Empezar una Nueva Relación',NULL,NULL,NULL,'Conoces a alguien nuevo y decides iniciar una relación basada en lo que has aprendido y crecido.',1,NULL,'2024-07-14 20:11:30'),(28,1,'Disfrutar de la Soltería',NULL,NULL,NULL,'Decides disfrutar de la soltería, encontrando paz y felicidad en ti mismo.',1,NULL,'2024-07-14 20:11:30'),(29,1,'Seguir Explorando',NULL,NULL,NULL,'Sigues explorando nuevas actividades y encuentras muchas cosas que te apasionan.',0,NULL,'2024-07-14 20:11:30'),(30,1,'Compartir con Otros',NULL,NULL,NULL,'Compartes tus nuevas actividades y aficiones con otras personas y encuentras una comunidad que te apoya.',0,NULL,'2024-07-14 20:11:30'),(31,1,'Compartir Aficiones con Amigos',NULL,NULL,NULL,'Empiezas a compartir tus nuevas aficiones con tus amigos y fortaleces tus relaciones.',0,NULL,'2024-07-14 20:11:30'),(32,1,'Buscar Comunidad en Línea',NULL,NULL,NULL,'Encuentras una comunidad en línea con intereses similares y te sientes apoyado y comprendido.',0,NULL,'2024-07-14 20:11:30'),(33,1,'Conocer Gente en el Viaje',NULL,NULL,NULL,'Conoces gente nueva en tu viaje y haces nuevas amistades que enriquecen tu vida.',0,NULL,'2024-07-14 20:11:30'),(34,1,'Disfrutar del Viaje en Soledad',NULL,NULL,NULL,'Disfrutas del viaje en soledad, encontrando paz y satisfacción en tu propia compañía.',0,NULL,'2024-07-14 20:11:30'),(35,1,'Ayudar a Otros',NULL,NULL,NULL,'Empiezas a ayudar a otros con tus experiencias y encuentras una nueva pasión en el apoyo a los demás.',0,NULL,'2024-07-14 20:11:30'),(36,2,'La entrada al bosque','','','img/forest_entry.jpg','Es una noche oscura y tormentosa...',0,'','2024-07-15 00:28:08'),(37,2,'El crujido de las hojas','','','img/forest_crackle.jpg','Escuchas el crujido de hojas detrás de ti...',0,'','2024-07-15 00:28:08'),(38,2,'La tranquilidad del hogar','','','img/home.jpg','Decides no arriesgarte y vuelves a casa.',1,'A veces, es mejor no ceder a la curiosidad.','2024-07-15 00:28:08'),(39,3,'La llamada urgente','','','img/urgent_call.jpg','Recibes una llamada urgente sobre un asesinato...',0,'','2024-07-15 00:28:16'),(40,3,'La escena del crimen','','','img/crime_scene.jpg','Llegas a la escena del crimen...',0,'','2024-07-15 00:28:16'),(41,3,'La llamada de auxilio','','','img/help_call.jpg','Envías a tu asistente, pero recibe una llamada de auxilio.',1,'A veces, la acción directa es necesaria.','2024-07-15 00:28:16'),(42,4,'La tormenta','','','img/storm.jpg','Estás en un barco en medio de una tormenta feroz...',0,'','2024-07-15 00:28:23'),(43,4,'El naufragio','','','img/shipwreck.jpg','La tormenta se intensifica y el barco se hunde.',0,'','2024-07-15 00:28:23'),(44,4,'La isla misteriosa','','','img/mysterious_island.jpg','Encuentras refugio en una isla cercana, pero es un lugar misterioso.',0,'','2024-07-15 00:28:23');
/*!40000 ALTER TABLE `escena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_publicacion`
--

DROP TABLE IF EXISTS `estado_publicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_publicacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `historia_id` int NOT NULL,
  `estado` varchar(20) NOT NULL,
  `fecha_cambio` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `historia_id` (`historia_id`),
  CONSTRAINT `estado_publicacion_ibfk_1` FOREIGN KEY (`historia_id`) REFERENCES `historia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_publicacion`
--

LOCK TABLES `estado_publicacion` WRITE;
/*!40000 ALTER TABLE `estado_publicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_publicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historia`
--

DROP TABLE IF EXISTS `historia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `autor_id` int NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `autor_id` (`autor_id`),
  CONSTRAINT `historia_ibfk_1` FOREIGN KEY (`autor_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historia`
--

LOCK TABLES `historia` WRITE;
/*!40000 ALTER TABLE `historia` DISABLE KEYS */;
INSERT INTO `historia` VALUES (1,'Los Casi Algo',1,'2024-07-14 20:11:30'),(2,'El Bosque Embrujado',1,'2024-07-15 00:27:51'),(3,'El Misterio del Detective',1,'2024-07-15 00:27:51'),(4,'El Naufragio',1,'2024-07-15 00:27:51'),(5,'testp10',1,'2024-07-15 16:18:58'),(6,'testp11',1,'2024-07-15 16:21:41'),(7,'test12',1,'2024-07-15 16:24:45');
/*!40000 ALTER TABLE `historia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portada`
--

DROP TABLE IF EXISTS `portada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portada` (
  `id` int NOT NULL AUTO_INCREMENT,
  `historia_id` int NOT NULL,
  `titulo` varchar(60) NOT NULL,
  `video` varchar(1000) DEFAULT NULL,
  `audio` varchar(1000) DEFAULT NULL,
  `imagen` varchar(1000) DEFAULT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `historia_id` (`historia_id`),
  CONSTRAINT `portada_ibfk_1` FOREIGN KEY (`historia_id`) REFERENCES `historia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portada`
--

LOCK TABLES `portada` WRITE;
/*!40000 ALTER TABLE `portada` DISABLE KEYS */;
INSERT INTO `portada` VALUES (1,1,'Los casi algo',NULL,NULL,'https://pbs.twimg.com/media/F_SBgKqWMAA35nP.jpg','¿Fue tu culpa?','2024-07-14 20:11:30'),(2,2,'El Bosque Embrujado','https://www.youtube.com/embed/Sz7eZAKJ4PU?si=WO9-nuG68wS2RNTk','','img/forest.jpg','Una historia de terror en un bosque oscuro.','2024-07-15 00:28:01'),(3,3,'El Misterio del Detective','','','https://w7.pngwing.com/pngs/787/919/png-transparent-private-investigator-detective-mystery-shopping-service-computer-forensics-mysteries-miscellaneous-hat-black.png','Un asesinato por resolver.','2024-07-15 00:28:01'),(4,4,'El Naufragio','','audio/naufragio.mp3','https://static.vecteezy.com/system/resources/previews/029/846/726/non_2x/eerie-shipwreck-resting-on-the-ocean-floor-surrounded-by-marine-life-free-photo.jpg','Una tragedia en alta mar.','2024-07-15 00:28:01'),(5,5,'testp10','https://www.youtube.com/embed/E-DDmIhL4IM?si=No5b3aNCHnXPpi4X',NULL,NULL,'eee','2024-07-15 16:19:57'),(6,6,'testp11',NULL,'ee','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZYbuz_5yH_zgzafFTS-MeUykq5b_cSAm-3w&s','Holaaa','2024-07-15 16:22:34'),(7,7,'test12',NULL,'ee','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZYbuz_5yH_zgzafFTS-MeUykq5b_cSAm-3w&s','ee','2024-07-15 16:24:56');
/*!40000 ALTER TABLE `portada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Isaac','Jimenez','20233tn182@utez.edu.mx','f2ae844de75e2853ea3c6a2a07444e5b1ffab75af71d0ff909f5e9a5bbfe2323',1,'codigo1','2024-07-14 20:11:30','2024-07-14 20:11:30'),(2,'María','Gómez','maria.gomez@example.com','95a3b5a1d9d5e781bcc05902ce0f1f4cb9b5648be03321fafc1dfc534e467ce6',1,'codigo2','2024-07-14 20:11:30','2024-07-14 20:11:30'),(3,'Carlos','López','carlos.lopez@example.com','5906ac361a137e2d286465cd6588ebb5ac3f5ae955001100bc41577c3d751764',1,'codigo3','2024-07-14 20:11:30','2024-07-14 20:11:30'),(4,'Ana','Martínez','ana.martinez@example.com','b97873a40f73abedd8d685a7cd5e5f85e4a9cfb83eac26886640a0813850122b',1,'codigo4','2024-07-14 20:11:30','2024-07-14 20:11:30'),(5,'Luis','García','luis.gusuarioarcia@example.com','8b2c86ea9cf2ea4eb517fd1e06b74f399e7fec0fef92e3b482a6cf2e2b092023',1,'codigo5','2024-07-14 20:11:30','2024-07-14 20:11:30'),(6,'Elena','Rodríguez','elena.rodriguez@example.com','598a1a400c1dfdf36974e69d7e1bc98593f2e15015eed8e9b7e47a83b31693d5',1,'codigo6','2024-07-14 20:11:30','2024-07-14 20:11:30'),(7,'Pedro','Fernández','pedro.fernandez@example.com','5860836e8f13fc9837539a597d4086bfc0299e54ad92148d54538b5c3feefb7c',1,'codigo7','2024-07-14 20:11:30','2024-07-14 20:11:30'),(8,'Sofía','Torres','sofia.torres@example.com','57f3ebab63f156fd8f776ba645a55d96360a15eeffc8b0e4afe4c05fa88219aa',1,'codigo8','2024-07-14 20:11:30','2024-07-14 20:11:30'),(9,'Jorge','Sánchez','jorge.sanchez@example.com','9323dd6786ebcbf3ac87357cc78ba1abfda6cf5e55cd01097b90d4a286cac90e',1,'codigo9','2024-07-14 20:11:30','2024-07-14 20:11:30'),(10,'Marta','Ramírez','marta.ramirez@example.com','aa4a9ea03fcac15b5fc63c949ac34e7b0fd17906716ac3b8e58c599cdc5a52f0',1,'codigo10','2024-07-14 20:11:30','2024-07-14 20:11:30'),(11,'Alberto','Flores','alberto.flores@example.com','53d453b0c08b6b38ae91515dc88d25fbecdd1d6001f022419629df844f8ba433',1,'codigo11','2024-07-14 20:11:30','2024-07-14 20:11:30'),(12,'Lucía','Hernández','lucia.hernandez@example.com','b3d17ebbe4f2b75d27b6309cfaae1487b667301a73951e7d523a039cd2dfe110',1,'codigo12','2024-07-14 20:11:30','2024-07-14 20:11:30'),(13,'David','Jiménez','david.jimenez@example.com','48caafb68583936afd0d78a7bfd7046d2492fad94f3c485915f74bb60128620d',1,'codigo13','2024-07-14 20:11:30','2024-07-14 20:11:30'),(14,'Paula','Díaz','paula.diaz@example.com','c6863e1db9b396ed31a36988639513a1c73a065fab83681f4b77adb648fac3d6',1,'codigo14','2024-07-14 20:11:30','2024-07-14 20:11:30'),(15,'Manuel','Vargas','manuel.vargas@example.com','c63c2d34ebe84032ad47b87af194fedd17dacf8222b2ea7f4ebfee3dd6db2dfb',1,'codigo15','2024-07-14 20:11:30','2024-07-14 20:11:30'),(16,'Tato','Jimenez Barcelata','isaac777jb@gmail.com','8d1a978e876ce55710d5c4bc7b8f41232d200ede5bbb29d7370c3bc55d48a519',1,NULL,'2024-07-15 01:31:14',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-15 10:27:15
