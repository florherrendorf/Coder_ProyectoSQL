CREATE DATABASE  IF NOT EXISTS `reparto_agua` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `reparto_agua`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: reparto_agua
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `apellido_nombre` varchar(100) NOT NULL,
  `DNI` bigint unsigned NOT NULL,
  `CUIT` bigint unsigned NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `genero` varchar(1) DEFAULT NULL,
  `estado_civil` varchar(30) DEFAULT 'Sin especificar',
  `fecha_alta` date NOT NULL,
  `fecha_baja` date DEFAULT NULL,
  `id_tipo_cliente` varchar(1) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `id_cliente` (`id_cliente`),
  KEY `id_tipo_cliente` (`id_tipo_cliente`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_tipo_cliente`) REFERENCES `tipos_clientes` (`id_tipo_cliente`),
  CONSTRAINT `clientes_chk_1` CHECK ((`genero` in (_utf8mb4'F',_utf8mb4'M',_utf8mb4'O'))),
  CONSTRAINT `clientes_chk_2` CHECK ((`estado_civil` in (_utf8mb4'Soltero',_utf8mb4'Casado',_utf8mb4'Viudo',_utf8mb4'Sin especificar')))
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Ramos ',14808187,20148081876,'1977-01-09','M','Soltero','2016-06-30',NULL,'A','3624843475','ramos@gmail.com '),(2,'Barrientos Ramona ',4734541,20047345416,'1988-10-01','M','Soltero','2016-06-30',NULL,'A','4483161','barrientos ramona@gmail.com '),(3,'Facor Srl (Farmar) ',30647675502,30647675502,'1995-10-28','O',NULL,'2016-06-30',NULL,'F','3624452794','facor srl farmar@gmail.com '),(4,'Medero Walter ',17425215,20174252158,'1956-06-04','M','Soltero','2016-06-30',NULL,'A','3624437560','medero walter@gmail.com '),(5,'Su Pan Vallejos Sebastian ',10980348,20109803481,'1969-05-07','M','Soltero','2016-06-30',NULL,'F','4484055','su pan vallejos sebastian@gmail.com '),(6,'Todo Motor ',13116730,20131167300,'1948-06-25','M','Soltero','2016-06-30',NULL,'F','3624466448','todo motor@gmail.com '),(7,'Starcevich Patricia (Cotillon Pochoclos) ',13116730,20131167303,'1962-10-29','M','Soltero','2016-06-30',NULL,'N','3624698936','starcevich patricia cotillon pochoclos@gmail.com '),(8,'La Flota ',30670180065,30670180065,'1996-09-16','O',NULL,'2016-06-30',NULL,'F','4485649','la flota@gmail.com '),(9,'Borda Alcaida ',6590061,20065900616,'1962-10-01','M','Soltero','2016-06-30',NULL,'F','4482814','borda alcaida@gmail.com '),(10,'Gomez Marcelo ',12467958,20124679586,'1966-06-19','M','Soltero','2016-06-30',NULL,'N','4482642','gomez marcelo@gmail.com '),(11,'Autogoma Mari ',30124578963,30124578963,'1953-05-16','O',NULL,'2016-06-30',NULL,'N','3624427054','autogoma mari@gmail.com '),(12,'Gomez Jorge ',12467973,20124679736,'1978-01-27','M','Soltero','2016-06-30',NULL,'N','154365220','gomez jorge@gmail.com '),(13,'Ceweluk Jorge ',23912550,20239125506,'1961-07-30','M','Soltero','2016-06-30',NULL,'N','3624957076','ceweluk jorge@gmail.com '),(14,'Aguirre Eusebia ',4967110,20049671106,'1981-10-26','M','Soltero','2016-06-30','2017-04-30','A','3624589877','aguirre eusebia@gmail.com '),(15,'Gimenez Acuña Lucia ',40818584,20332915326,'1989-10-28','M','Soltero','2016-06-30',NULL,'A','3624538537','gimenez acuña lucia@gmail.com '),(16,'Peron Osmar (Joyería Vilmar) ',7623619,20076236195,'1979-02-19','M','Soltero','2016-06-30',NULL,'F','3624426741','peron osmar joyería vilmar@gmail.com '),(17,'Nuñez Paulino ',11895266,20118952666,'1985-07-15','M','Soltero','2016-06-30',NULL,'R','3624737327','nuñez paulino@gmail.com '),(18,'Pilcheria Lulu ',22522050,20217495996,'1988-04-13','M','Soltero','2016-06-30',NULL,'F','3624035584','pilcheria lulu@gmail.com '),(19,'Ramirez Carniceria ',10578633,20105786336,'1947-11-02','M','Soltero','2016-06-30',NULL,'N','4482857','ramirez carniceria@gmail.com '),(20,'Pilcheria Lulu Pilcheria Lulu',31221440,20283931846,'1986-09-15','M','Soltero','2016-06-30',NULL,'A','3624035584','pilcheria lulu pilcheria lulu@gmail.com '),(21,'Ramos Bernabe',14808187,20148081876,'1980-07-06','M','Soltero','2016-06-30',NULL,'A','3624739994','ramos bernabe@gmail.com '),(22,'Barrientos Ramona',4734541,20047345416,'1970-01-13','M','Soltero','2016-06-30',NULL,'A','4483161','barrientos ramona@gmail.com '),(23,'Franco Romina Daniela ',10719564,20400413376,'1972-02-06','M','Soltero','2016-09-09',NULL,'A','3624414442','franco romina daniela@gmail.com '),(24,'Juzgado De Faltas Nº 1 ',30999167655,30999167655,'2001-09-27','O',NULL,'2016-09-09',NULL,'A','3624500730','juzgado de faltas nº 1@gmail.com '),(25,'Amar Joyas ',40190636,20124603906,'1996-07-07','M','Soltero','2016-09-10',NULL,'N','3624650566','amar joyas@gmail.com '),(26,'Supermercado Filiponi Mazon Lidia ',18545502,20248228626,'1948-12-22','M','Soltero','2016-09-10',NULL,'F','3624781127','supermercado filiponi mazon lidia@gmail.com '),(27,'Registro Del Automotor ',29625647,27296256477,'1977-11-11','F','Soltero','2016-09-14',NULL,'A','3624765644','registro del automotor@gmail.com '),(28,'Inpach ',30712337881,30712337881,'2002-06-02','O',NULL,'2016-09-14',NULL,'F','3624426567','inpach@gmail.com '),(29,'Marcelo Mecanico ',32818811,20128961346,'1998-06-28','M','Soltero','2016-09-14',NULL,'N','3624697771','marcelo mecanico@gmail.com '),(30,'Ceweluk Miguel ',17197981,20328340686,'2002-05-12','M','Soltero','2016-09-15',NULL,'N','3624449105','ceweluk miguel@gmail.com '),(31,'Municipalidad De Barranqueras ',30670180065,30670180065,'1953-11-21','O',NULL,'2016-09-26',NULL,'F','3624555360','municipalidad de barranqueras@gmail.com '),(32,'Nuñez Estela ',37253947,20322016076,'1952-04-24','M','Soltero','2016-09-26',NULL,'N','3624202638','nuñez estela@gmail.com '),(33,'Unitan Saica ',30506733002,30506733002,'1958-12-14','O',NULL,'2016-10-03',NULL,'F','3482538858','unitan saica@gmail.com '),(34,'Wasinger Wilson ',17298342,20144100396,'1965-11-20','M','Soltero','2016-10-03',NULL,'R','3624507698','wasinger wilson@gmail.com '),(35,'Gomez Rolando Verduleria 9 De Julio ',23382686,20233826864,'1964-10-04','M','Soltero','2016-10-03',NULL,'R','3624897178','gomez rolando verduleria 9 de julio@gmail.com '),(36,'Lopez Jesus Alberto ',27025770,20270257705,'1995-03-22','M','Soltero','2016-10-03',NULL,'R','3624669606','lopez jesus alberto@gmail.com '),(37,'Baez Daniel ',20020197,20261066276,'1990-04-13','M','Soltero','2016-10-03',NULL,'R','3624634629','baez daniel@gmail.com '),(38,'Meza Julio Oscar',22330847,20223308476,'1988-10-18','M','Soltero','2016-10-03',NULL,'R','3624990195','meza julio oscar@gmail.com '),(39,'Fleyta Vicente (Punto De Venta) ',39663439,20147126686,'1948-04-30','M','Soltero','2016-10-03',NULL,'R','3624506467','fleyta vicente punto de venta@gmail.com '),(40,'Rudin Pablo ',13703464,20215377086,'1958-02-18','M','Soltero','2016-10-03',NULL,'R','3624122623','rudin pablo@gmail.com '),(41,'Cuenca Tato Rey De Las Frutas ',39745181,20396097486,'2004-08-25','M','Soltero','2016-10-25',NULL,'R','3624914101','cuenca tato rey de las frutas@gmail.com '),(42,'Fernandez Nora Rotiseria ',22232131,20295866236,'1962-09-19','M','Soltero','2016-10-25',NULL,'R','3624268774','fernandez nora rotiseria@gmail.com '),(43,'Hipermercado Libertad ',30612929455,30612929455,'1980-02-06','O',NULL,'2016-10-25',NULL,'F','4458452','hipermercado libertad@gmail.com '),(44,'Victor Cerdan ',37490107,20285281466,'2001-09-02','M','Soltero','2016-10-31',NULL,'N','3624934708','victor cerdan@gmail.com '),(45,'Instituto Del Deporte Chaqueño (Montenegro Raul ) ',30712337679,30712337679,'1964-08-22','O',NULL,'2016-11-14',NULL,'F','3624706608','instituto del deporte chaqueño montenegro raul@gmail.com '),(46,'Toñanes Marcelo Eduardo ',30712337679,30712337679,'1963-04-13','O',NULL,'2016-11-14',NULL,'F','3624901820','toñanes marcelo eduardo@gmail.com '),(47,'Manfrey Cooperativa De Tamberos ',30501773383,30501773383,'1985-11-10','O',NULL,'2016-11-14',NULL,'F','3624490911','manfrey cooperativa de tamberos@gmail.com '),(48,'Hospital Eva Peron ',30999177448,30999177448,'1970-01-17','O',NULL,'2016-12-22',NULL,'F','3624799326','hospital eva peron@gmail.com '),(49,'Velazco Graciela Jorgelina',29724384,20297243846,'1991-01-19','M','Soltero','2017-01-01',NULL,'R','3624769762','velazco graciela jorgelina@gmail.com '),(50,'Wal Mar ',33015626,20359548936,'1994-12-26','M','Soltero','2017-01-01',NULL,'N','3624539484','wal mar@gmail.com '),(51,'Cotelo Hector Alejandro',28047929,20280479296,'2001-07-28','M','Soltero','2017-01-01',NULL,'R','3624261650','cotelo hector alejandro@gmail.com '),(52,'Opessa Sa ',17956175,20242435966,'1983-11-13','M','Soltero','2017-01-01',NULL,'A','3624713203','opessa sa@gmail.com '),(53,'Monuti Santiago ',37329063,20165889646,'1961-01-14','M','Soltero','2017-01-03',NULL,'R','3624907611','monuti santiago@gmail.com '),(54,'Famago ',18988902,20186565536,'1980-01-19','M','Soltero','2017-01-04',NULL,'N','3624584223','famago@gmail.com '),(55,'Dorita ',37978861,20167502516,'1970-09-16','M','Soltero','2017-01-05',NULL,'N','4481334','dorita@gmail.com '),(56,'Trangoni Julio',34795770,20347957706,'1982-03-31','M','Soltero','2017-01-10',NULL,'R','3624751434','trangoni julio@gmail.com '),(57,'Cementerio ',30670180065,30670180065,'2000-02-29','O',NULL,'2017-02-17',NULL,'F','3624591999','cementerio@gmail.com '),(58,'El Parrillon ',30711206740,30711206740,'1959-09-28','O',NULL,'2017-02-17',NULL,'N','3624482192','el parrillon@gmail.com '),(59,'Gonzales Angel ',14931777,20101750566,'1957-08-16','M','Soltero','2017-03-30',NULL,'N','3624733632','gonzales angel@gmail.com '),(60,'Supercemento Saic ',30502888419,30502888419,'1993-07-19','O',NULL,'2017-04-01',NULL,'F','3624702289','supercemento saic@gmail.com '),(61,'Verduleria Galardon ',32583077,20278798016,'1965-07-21','M','Soltero','2017-04-28',NULL,'R','3624619683','verduleria galardon@gmail.com '),(62,'Tamara De Paniagua - Inmobiliaria Puente ',32745456,20406102756,'1958-12-02','M','Soltero','2017-05-10',NULL,'N','3624693499','tamara de paniagua - inmobiliaria puente@gmail.com '),(63,'Gomez Walter',17257827,20219665206,'1956-03-08','M','Soltero','2017-06-01',NULL,'N','3624493320','gomez walter@gmail.com '),(64,'Meza Roberto',25699545,20256995456,'1982-02-26','M','Soltero','2017-06-14',NULL,'A','3624538608','meza roberto@gmail.com '),(65,'Rodriguez Cecilia ',10072548,20261853986,'1952-12-06','M','Soltero','2017-06-23',NULL,'R','3624711530','rodriguez cecilia@gmail.com '),(66,'Leonardo Feyen ',29581164,20140240186,'1952-02-04','M','Soltero','2017-06-27',NULL,'R','3624865717','leonardo feyen@gmail.com '),(67,'Freshi Ramon Hugo (Pv) ',17376966,20246052426,'1948-02-01','M','Soltero','2017-06-27',NULL,'R','3624745834','freshi ramon hugo pv@gmail.com '),(68,'Pividori Eduardo José',13367929,20133679296,'1956-06-25','M','Soltero','2017-06-30',NULL,'N','3624895978','pividori eduardo josé@gmail.com '),(69,'Grupo Nuevo Horizonte S.R.L. Patricio Cané',30710350694,30710350694,'1991-06-24','O',NULL,'2017-07-03',NULL,'N','3624600478','grupo nuevo horizonte s.r.l. patricio cané@gmail.com '),(70,'Fortini Luis Antonio',17369316,20173693166,'1954-01-28','M','Soltero','2017-07-05',NULL,'R','3624168361','fortini luis antonio@gmail.com '),(71,'Mondelo Luis ',33760194,20119878116,'1966-02-05','M','Soltero','2017-07-05',NULL,'R','3624577839','mondelo luis@gmail.com '),(72,'Chaco Servicios S.A. ',30650408922,30650408922,'1953-04-27','O',NULL,'2017-08-01',NULL,'N','3624907282','chaco servicios s.a.@gmail.com '),(73,'Chaco Servicios Srl ',19864614,20213935586,'1994-05-15','M','Soltero','2017-08-01',NULL,'N','3624439826','chaco servicios srl@gmail.com '),(74,'La Colonia Goitia Hugo ',23987315,20239873156,'2000-10-26','M','Soltero','2017-08-16',NULL,'R','3624618680','la colonia goitia hugo@gmail.com '),(75,'Herrera Telma Dora',3920785,20039207856,'1969-12-14','M','Soltero','2017-08-30',NULL,'A','3624794229','herrera telma dora@gmail.com '),(76,'Eiden Marcos',30484229,20304842297,'1985-04-07','M','Soltero','2017-09-05',NULL,'A','3624540592','eiden marcos@gmail.com '),(77,'Robledo Nelson Fabian',26447478,20264474788,'1993-11-08','M','Soltero','2017-10-01',NULL,'R','3624731226','robledo nelson fabian@gmail.com '),(78,'El Leon Supermercado ',25039633,20216719576,'1947-05-30','M','Soltero','2017-10-13',NULL,'R','3624465767','el leon supermercado@gmail.com '),(79,'Maria De Los Angeles Romero Pv ',28318301,20283183018,'1973-09-12','M','Soltero','2017-10-18',NULL,'R','3624514777','maria de los angeles romero pv@gmail.com '),(80,'Rovella Carranza ',35524309,20221920256,'1964-07-18','M','Soltero','2017-12-19',NULL,'F','3624576332','rovella carranza@gmail.com '),(81,'Zacarias Blanca Selva',6155947,20061559476,'2002-09-22','M','Soltero','2017-12-20',NULL,'A','3624789541','zacarias blanca selva@gmail.com '),(82,'Barrientos Manuel ',26447249,20264472496,'1974-12-19','M','Soltero','2017-12-29',NULL,'N','3624714592','barrientos manuel@gmail.com '),(83,'Kiosco Franco ',31337388,20295839516,'1985-06-17','M','Soltero','2018-01-04',NULL,'R','3624756453','kiosco franco@gmail.com '),(84,'Maidana Mirta Lilian',16368407,20163684076,'1951-11-25','M','Soltero','2018-01-17',NULL,'A','3624646991','maidana mirta lilian@gmail.com '),(85,'Rios Gabriel Edgardo',30789924,20307899246,'1987-09-16','M','Soltero','2018-01-17',NULL,'A','3624636593','rios gabriel edgardo@gmail.com '),(86,'Maria Jeremich ',27324726,20196993846,'1947-10-20','M','Soltero','2018-01-24',NULL,'N','3794271654','maria jeremich@gmail.com '),(87,'Albarracin Ruben Alfredo',14606892,20146068926,'1975-06-06','M','Soltero','2018-03-01',NULL,'A','3624885711','albarracin ruben alfredo@gmail.com '),(88,'Mazzero Christian',37704480,20377044806,'1955-07-03','M','Soltero','2018-03-06',NULL,'A','3624854650','mazzero christian@gmail.com '),(89,'Gutierrez Luis (Pv) ',13413545,20219369826,'1949-10-14','M','Soltero','2018-04-12',NULL,'R','3624841833','gutierrez luis pv@gmail.com '),(90,'Galarza Roberto Javier',22830025,20228300256,'1947-09-24','M','Soltero','2018-04-13',NULL,'A','3624683839','galarza roberto javier@gmail.com '),(91,'Miranda Nidia Beatriz',12104394,20121043946,'1984-01-05','M','Soltero','2018-04-20',NULL,'A','3624612861','miranda nidia beatriz@gmail.com '),(92,'Block Walter',20521917,30710834489,'1959-06-20','O',NULL,'2018-05-18',NULL,'A','3624812811','block walter@gmail.com '),(93,'Castillo ',26513312,20382860366,'1996-08-03','M','Soltero','2018-06-25',NULL,'R','3624624708','castillo@gmail.com '),(94,'Franco María Estela',12485710,20124857106,'1955-07-15','M','Soltero','2018-06-26',NULL,'A','362444444','franco maría estela@gmail.com '),(95,'Ruíz Ivana Soledad',28567770,20285677706,'1950-02-07','M','Soltero','2018-08-08',NULL,'A','3624311336','ruíz ivana soledad@gmail.com '),(96,'Burosky Lucia ',18599179,20143107126,'1952-07-21','M','Soltero','2018-08-15',NULL,'N','3624868706','burosky lucia@gmail.com '),(97,'Gomez Norma Beatriz',24077683,20240776836,'1969-01-24','M','Soltero','2018-08-15',NULL,'A','3625240876','gomez norma beatriz@gmail.com '),(98,'Santillan Mariela Alejandra',25827884,20258278846,'1954-07-13','M','Soltero','2018-08-15',NULL,'A','3624761684','santillan mariela alejandra@gmail.com '),(99,'Raynoldi Alejo Camilo',16746655,20167466556,'1990-06-15','M','Soltero','2018-08-16',NULL,'A','3624513263','raynoldi alejo camilo@gmail.com '),(100,'Guevara Vanesa Janet',37865069,20378650696,'1962-10-10','M','Soltero','2018-08-16',NULL,'A','3624250585','guevara vanesa janet@gmail.com '),(101,'Montagner Nicolas',25278559,30716052776,'1963-02-16','O',NULL,'2018-08-22',NULL,'N','3624595481','montagner nicolas@gmail.com '),(102,'Palacios Isabel Adelaida',22912116,20229121166,'1965-04-09','M','Soltero','2018-09-01','2019-08-06','A','3624765028','palacios isabel adelaida@gmail.com '),(103,'Benítez Patricia Alejandra',22882401,20228824016,'1994-08-23','M','Soltero','2018-09-01',NULL,'A','3624731222','benítez patricia alejandra@gmail.com '),(104,'Docteur Patricia - R (24) ',23256584,20142215286,'1971-09-22','M','Soltero','2018-09-05',NULL,'R','3624318625','docteur patricia - r 24@gmail.com '),(105,'Valoriani Edgard ',34977206,20319247716,'1989-02-20','M','Soltero','2018-09-06',NULL,'R','3624466366','valoriani edgard@gmail.com '),(106,'Soto Ana - R ',30807002,20231339946,'1992-07-23','M','Soltero','2018-09-06',NULL,'R','3624813318','soto ana - r@gmail.com '),(107,'Kostecki Horacio',32301838,20323018384,'1987-11-30','M','Soltero','2018-09-06',NULL,'A','3624247530','kostecki horacio@gmail.com '),(108,'Madona Jorge Luis - R ',27579291,20313497316,'1980-12-11','M','Soltero','2018-09-07',NULL,'R','3624304231','madona jorge luis - r@gmail.com '),(109,'Acevedo Soledad Mabel',36631982,23366319824,'1946-06-16','O',NULL,'2018-09-18',NULL,'A','3624487974','acevedo soledad mabel@gmail.com '),(110,'Gilfauy Laura Susana - R (Pv) ',36361252,20329182656,'1952-02-14','M','Soltero','2018-09-21',NULL,'R','3624333311','gilfauy laura susana - r pv@gmail.com '),(111,'Almada Federico Daniel',34477156,20344771566,'1962-08-05','M','Soltero','2018-10-05',NULL,'A','3625237876','almada federico daniel@gmail.com '),(112,'(Farmar I) Quintana Zulma Beatriz',32426688,30670152673,'1957-08-14','O',NULL,'2018-10-30',NULL,'N','3644654732','farmar i quintana zulma beatriz@gmail.com '),(113,'Kiosco Patricia Y Hnos - Pv ',24377281,20243772816,'1994-03-27','M','Soltero','2018-11-02',NULL,'R','3624683886','kiosco patricia y hnos - pv@gmail.com '),(114,'Barboza María Laura',24343843,20243438436,'1989-03-18','M','Soltero','2018-11-20',NULL,'A','3624131094','barboza maría laura@gmail.com '),(115,'Esquivel Hugo Luis',11832997,20118329976,'1973-08-28','M','Soltero','2018-12-11',NULL,'A','3624868570','esquivel hugo luis@gmail.com '),(116,'Espindola Rodrigo Javier',41227523,20412275236,'2005-09-29','M','Soltero','2018-12-15',NULL,'A','3624788110','espindola rodrigo javier@gmail.com '),(117,'Sabater Silvia Susana',16551360,20165513606,'1950-05-25','M','Soltero','2018-12-18',NULL,'A','3624221566','sabater silvia susana@gmail.com '),(118,'Claudia Trangoni ',11654195,20353967446,'1951-06-15','M','Soltero','2019-01-18',NULL,'R','3624817206','claudia trangoni@gmail.com '),(119,'Oviedo Esteban Horacio',31972156,20319721566,'1954-10-05','M','Soltero','2019-02-15',NULL,'R','3624800204','oviedo esteban horacio@gmail.com '),(120,'Saucedo Claudio Agustín',32745798,20327457986,'1947-02-04','M','Soltero','2019-02-22',NULL,'N','3624079169','saucedo claudio agustín@gmail.com '),(121,'Godoy Nicolas Hector',35466571,20354665716,'1952-07-08','M','Soltero','2019-03-19',NULL,'A','3624616203','godoy nicolas hector@gmail.com '),(122,'Acuña Pablo G. ',25792980,20257929806,'1955-04-12','M','Soltero','2019-03-30',NULL,'R','3624894817','acuña pablo g.@gmail.com '),(123,'Castillo Ireneo Dimas',5080766,20050807666,'1995-11-22','M','Soltero','2019-04-01',NULL,'A','3624867106','castillo ireneo dimas@gmail.com '),(124,'Faranda Maria Laura',13439448,20134394486,'1951-05-22','M','Soltero','2019-04-25',NULL,'A','3624623579','faranda maria laura@gmail.com '),(125,'Solis Mauricio',19035422,20190354226,'1990-12-13','M','Soltero','2019-06-07',NULL,'A','3624903375','solis mauricio@gmail.com '),(126,'Gomez Jorge (Pv) ',25612024,20168877356,'1970-11-04','M','Soltero','2019-06-19',NULL,'R','3624603791','gomez jorge pv@gmail.com '),(127,'Antoniolli Karina Elisabet',25828227,20258282276,'1952-10-19','M','Soltero','2019-06-22',NULL,'N','3624224604','antoniolli karina elisabet@gmail.com '),(128,'Gòmez Marcela Natalia',33612920,20336129206,'1985-06-12','M','Soltero','2019-06-25',NULL,'A','3624950469','gòmez marcela natalia@gmail.com '),(129,'Lopez Hernan Rolando',17808548,20178085486,'2003-07-08','M','Soltero','2019-08-02',NULL,'A','3625221657','lopez hernan rolando@gmail.com '),(130,'Avalos Carolina Nancy',23575134,20235751346,'1996-02-21','M','Soltero','2019-08-02',NULL,'A','3624262886','avalos carolina nancy@gmail.com '),(131,'Sodja Alexis',28888442,30711459851,'2005-10-22','O',NULL,'2019-09-02',NULL,'N','1121577000','sodja alexis@gmail.com '),(132,'Sandoval Hector Fabian ',11966457,20276202746,'1953-04-10','M','Soltero','2019-09-14',NULL,'N','3624611824','sandoval hector fabian@gmail.com '),(133,'Jacinto Farias ',40478551,20150787266,'1981-02-23','M','Soltero','2019-09-24',NULL,'N','3624924679','jacinto farias@gmail.com '),(134,'Sosa Gladys Noemi (Pv) ',38224508,20227779026,'1970-09-19','M','Soltero','2019-10-10',NULL,'R','3624220836','sosa gladys noemi pv@gmail.com '),(135,'Sandoval Liliana Elisabeth',29826903,20298269036,'1977-11-12','M','Soltero','2019-10-11',NULL,'R','3624725808','sandoval liliana elisabeth@gmail.com '),(136,'Gonzalez Laura',22436850,20224368506,'1990-09-01','M','Soltero','2019-10-24',NULL,'R','3624607685','gonzalez laura@gmail.com '),(137,'Leguizamon Mauricio Antonio',32180986,20321809866,'1975-03-17','M','Soltero','2019-10-28',NULL,'A','3624406137','leguizamon mauricio antonio@gmail.com '),(138,'Acosta Norma Romina',32446189,20324461896,'1993-07-23','M','Soltero','2019-10-29',NULL,'A','3624033211','acosta norma romina@gmail.com '),(139,'Gilfauy Laura Susana - Panaderia Pv ',27472258,20105519816,'1971-12-12','M','Soltero','2019-10-30',NULL,'R','3624333311','gilfauy laura susana - panaderia pv@gmail.com '),(140,'Borchichi Federico Alberto (Pv) ',14604903,20124461936,'1958-07-11','M','Soltero','2019-10-31',NULL,'R','3624212526','borchichi federico alberto pv@gmail.com '),(141,'Servasoni Marina ',14962778,20158402216,'1980-10-29','M','Soltero','2019-11-05',NULL,'R','4482064','servasoni marina@gmail.com '),(142,'Familia Aguirre ',40035647,20261031186,'1977-04-28','M','Soltero','2019-11-15',NULL,'R','3624278953','familia aguirre@gmail.com '),(143,'Soto Ana (Mercadito Anita 2 ) R ',12725493,20347277716,'1970-08-30','M','Soltero','2019-11-21',NULL,'R','3624450478','soto ana mercadito anita 2 r@gmail.com '),(144,'Natalia Gomez ',11243104,20199639006,'1959-06-11','M','Soltero','2019-11-22',NULL,'R','3624618690','natalia gomez@gmail.com '),(145,'Aranda Enrique Alejandro',25961395,20259613956,'1964-02-20','M','Soltero','2019-11-22',NULL,'R','3624310759','aranda enrique alejandro@gmail.com '),(146,'Rodríguez Oscar Ramón',20419619,20204196196,'1983-08-20','M','Soltero','2019-11-22',NULL,'A','3624243363','rodríguez oscar ramón@gmail.com '),(147,'Dulce Limon ',28224189,20314168046,'1981-07-03','M','Soltero','2019-11-26',NULL,'R','3624524390','dulce limon@gmail.com '),(148,'Alarcon Gustavo',30704744,20205000946,'1954-12-01','M','Soltero','2019-11-27',NULL,'R','3624480452','alarcon gustavo@gmail.com '),(149,'Ballestero Graciela ',16959420,20239951986,'1967-03-28','M','Soltero','2019-12-06',NULL,'N','3624527202','ballestero graciela@gmail.com '),(150,'Quiroz Sergio Nestor',21930694,20219306946,'1987-11-24','M','Soltero','2019-12-11',NULL,'R','3624175047','quiroz sergio nestor@gmail.com '),(151,'Marin ',16041110,20115494106,'1962-01-24','M','Soltero','2019-12-24',NULL,'R','3624458545','marin@gmail.com '),(152,'Britez Oscar Alfredo',20634842,20206348426,'1953-01-03','M','Soltero','2020-01-02',NULL,'R','3624773637','britez oscar alfredo@gmail.com '),(153,'Fibro Art ',32893701,20285039846,'2003-07-18','M','Soltero','2020-01-09',NULL,'N','3624493658','fibro art@gmail.com '),(154,'Rios Gabriel (Pv) ',15584888,20328902276,'1985-08-10','M','Soltero','2020-01-28',NULL,'R','3624576829','rios gabriel pv@gmail.com '),(155,'Rolon Walter Edgardo (Pv) ',28876965,20318428186,'1965-06-13','M','Soltero','2020-01-29',NULL,'R','3624809120','rolon walter edgardo pv@gmail.com '),(156,'Rios Nelida ',24613988,20219959086,'1974-01-15','M','Soltero','2020-02-04',NULL,'N','3624565497','rios nelida@gmail.com '),(157,'Smith Adriana (Pv) ',14985891,20294720056,'1986-05-15','M','Soltero','2020-02-07',NULL,'R','3624715141','smith adriana pv@gmail.com '),(158,'Gomez Andrea (Pv) ',17401568,20218565396,'1979-03-19','M','Soltero','2020-02-07',NULL,'R','3624535653','gomez andrea pv@gmail.com '),(159,'Marlen Fibro Art ',27653824,20108451856,'1948-02-05','M','Soltero','2020-02-08',NULL,'N','3624420374','marlen fibro art@gmail.com '),(160,'Duarte Damian Joel',29934079,20299340796,'1999-10-03','M','Soltero','2020-02-10',NULL,'R','3624233766','duarte damian joel@gmail.com '),(161,'Ojeda Ramona P.V ',17184317,20352450056,'1981-06-25','M','Soltero','2020-02-20',NULL,'R','3624452742','ojeda ramona p.v@gmail.com '),(162,'Autoservicio Los Maestros ',21382107,20378760636,'1949-06-02','M','Soltero','2020-02-25',NULL,'R','3624577776','autoservicio los maestros@gmail.com '),(163,'Ludueño Amir',40606352,20406063526,'2005-03-31','M','Soltero','2020-03-07',NULL,'A','3624249616','ludueño amir@gmail.com '),(164,'Maffei Luis Angel',7910128,20079101286,'1945-02-17','M','Soltero','2020-03-16',NULL,'N','3624601164','maffei luis angel@gmail.com '),(165,'Añasco Lorena',17810118,20221057386,'2003-02-16','M','Soltero','2020-03-17',NULL,'N','3624872459','añasco lorena@gmail.com '),(166,'Juan Perez',16416588,20342277816,'1950-05-10','M','Soltero','2020-03-17',NULL,'R','3624774084','-@gmail.com '),(167,'Sotomayor Cristian (Pv) ',29654652,20125367246,'1978-11-30','M','Soltero','2020-03-18',NULL,'R','3624755903','sotomayor cristian pv@gmail.com '),(168,'Quiroz Mario Alcides',31858996,20318589966,'1961-03-26','M','Soltero','2020-03-20',NULL,'R','3624049123','quiroz mario alcides@gmail.com '),(169,'Encina Elena ',29364070,20395252976,'1971-01-10','M','Soltero','2020-04-13',NULL,'N','3624616586','encina elena@gmail.com '),(170,'Arguello Rita Erika Cecilia',29365583,27369779983,'1974-11-26','F','Soltero','2020-04-16',NULL,'R','3624278527','arguello rita erika cecilia@gmail.com '),(171,'Miño Jorge Luis - Propietario ',20451693,20204516936,'1972-11-14','M','Soltero','2020-04-21',NULL,'N','3624470528','miño jorge luis - propietario@gmail.com '),(172,'Gerez Romina',35742597,20299644976,'1967-05-02','M','Soltero','2020-04-23',NULL,'R','3624737027','gerez romina@gmail.com '),(173,'Contreras Sabrina',34949684,20247950506,'1989-06-08','M','Soltero','2020-04-24',NULL,'R','3624009559','contreras sabrina@gmail.com '),(174,'Gomez Vanesa',14400761,20384951666,'2001-07-18','M','Soltero','2020-04-24',NULL,'R','3624253684','gomez vanesa@gmail.com '),(175,'Ponce Irma Noemi',17920971,20179209716,'1983-12-21','M','Soltero','2020-04-24',NULL,'R','3624596745','ponce irma noemi@gmail.com '),(176,'Mercadito Charly ',18698069,20171339386,'1946-01-23','M','Soltero','2020-04-25',NULL,'N','3624877924','mercadito charly@gmail.com '),(177,'Amarilla Maria Luisa',17150991,20171509916,'1964-02-20','M','Soltero','2020-04-25',NULL,'R','3624970297','amarilla maria luisa@gmail.com '),(178,'Julian Salinas ',17825350,20204832196,'1971-06-04','M','Soltero','2020-04-25',NULL,'R','3625240859','julian salinas@gmail.com '),(179,'Vodanovich Miriam',39691788,20288283406,'1963-11-12','M','Soltero','2020-04-25',NULL,'R','3624423357','vodanovich miriam@gmail.com '),(180,'Fleyta Mario Ruben',26924184,20269241846,'1951-09-22','M','Soltero','2020-04-29',NULL,'R','3624235522','fleyta mario ruben@gmail.com '),(181,'Changazzo Miriam Lorena',25210875,20252108756,'1946-11-30','M','Soltero','2020-04-30',NULL,'R','3624236905','changazzo miriam lorena@gmail.com '),(182,'Torres Victoria',33075016,27330750161,'1998-04-30','F','Soltero','2020-04-30',NULL,'R','3624235114','torres victoria@gmail.com '),(183,'Sartori Adolfo',30543294760,30543294760,'1952-07-10','O',NULL,'2020-05-01',NULL,'F','3624851203','sartori adolfo@gmail.com '),(184,'Gutierrez Emanuel',29613929,20296139296,'1985-07-05','M','Soltero','2020-05-02',NULL,'R','3624175700','gutierrez emanuel@gmail.com '),(185,'Sanchez Hernando Jesus',29137755,20291377556,'1967-03-12','M','Soltero','2020-05-02',NULL,'R','3625243624','sanchez hernando jesus@gmail.com '),(186,'Torres Olga Noemi',16704473,20167044736,'1986-05-21','M','Soltero','2020-05-02',NULL,'R','3624050912','torres olga noemi@gmail.com '),(187,'Fernandez Vanesa Noemi',28126471,20149338176,'1968-12-13','M','Soltero','2020-05-02',NULL,'R','3624271070','fernandez vanesa noemi@gmail.com '),(188,'Cañete Monica Beatriz',21860041,20218600416,'2000-11-03','M','Soltero','2020-05-02',NULL,'R','3624483842','cañete monica beatriz@gmail.com '),(189,'Monzon Paola Lilian',28125912,20281259126,'1994-02-13','M','Soltero','2020-05-05',NULL,'R','3624655563','monzon paola lilian@gmail.com '),(190,'Castillo Laura',30522852,27171281461,'1946-01-23','F','Soltero','2020-05-06','2023-01-30','R','3624625795','castillo laura@gmail.com '),(191,'Rosciani Nicolas',31971091,20319710915,'1998-09-14','M','Soltero','2020-05-09',NULL,'R','3624549587','rosciani nicolas@gmail.com '),(192,'Cardozo Vanesa Estela',30159396,20301593966,'1980-01-13','M','Soltero','2020-05-09',NULL,'R','3624603589','cardozo vanesa estela@gmail.com '),(193,'Toledo Leandro Edgar',34671231,20346712318,'1957-05-15','M','Soltero','2020-05-09',NULL,'R','3624865970','toledo leandro edgar@gmail.com '),(194,'Roman Lorena Marisol',30159130,20301591306,'1962-09-30','M','Soltero','2020-05-11',NULL,'A','3624257546','roman lorena marisol@gmail.com '),(195,'Gonzalez Elsa Roxana',12624658,20245989766,'1968-01-23','M','Soltero','2020-05-13',NULL,'R','3625224235','gonzalez elsa roxana@gmail.com '),(196,'Zapata Laura Magali',30791690,27307916903,'1953-12-27','F','Soltero','2020-05-14',NULL,'R','3624817009','zapata laura magali@gmail.com '),(197,'Aquino Isabel',16366420,20163664206,'1988-11-14','M','Soltero','2020-05-14',NULL,'A','3624266793','aquino isabel@gmail.com '),(198,'Romero Elena Beatriz',27526700,20275267006,'1965-07-31','M','Soltero','2020-05-15',NULL,'R','3624641408','romero elena beatriz@gmail.com '),(199,'Farias Pablo Andres',35690246,20356902466,'1983-05-09','M','Soltero','2020-05-15',NULL,'R','3624041630','farias pablo andres@gmail.com '),(200,'Hardy ',29933099,20300435836,'1955-09-06','M','Soltero','2020-05-22',NULL,'N','3624528330','hardy@gmail.com '),(201,'Ruiz Diaz Marcelo Gabriel',43347367,20433473676,'1966-05-06','M','Soltero','2020-05-22',NULL,'R','3624901584','ruiz diaz marcelo gabriel@gmail.com '),(202,'Esteban Vall Fernando Emiliano',33377573,20333775736,'1952-09-28','M','Soltero','2020-06-01',NULL,'A','3725454460','esteban vall fernando emiliano@gmail.com '),(203,'Bellini Laura Cecilia (N)',26140274,20261402746,'2005-08-28','M','Soltero','2020-06-05',NULL,'N','3624128426','bellini laura cecilia n@gmail.com '),(204,'Dure Jorge Raul',31330117,20313301176,'2004-07-29','M','Soltero','2020-06-10',NULL,'A','3624688616','dure jorge raul@gmail.com '),(205,'Gonzalez Noelia Soledad',28047876,27280478763,'1946-12-26','F','Soltero','2020-06-17',NULL,'R','3624253831','gonzalez noelia soledad@gmail.com '),(206,'Gonzalez Jorge',28926778,20271486476,'1991-02-04','M','Soltero','2020-07-03',NULL,'R','3624872927','gonzalez jorge@gmail.com '),(207,'Morel Dario',34184023,20379174706,'1977-10-29','M','Soltero','2020-07-04',NULL,'R','3624748513','morel dario@gmail.com '),(208,'Cimbaro Canela Guliana',36211028,20362110286,'1956-05-14','M','Soltero','2020-07-11',NULL,'R','3624096999','cimbaro canela guliana@gmail.com '),(209,'Ferreyra Luis',38681000,20391440516,'1995-04-11','M','Soltero','2020-07-15',NULL,'N','3624792415','ferreyra luis@gmail.com '),(210,'Calvo Jose Antonio (Piero) ',20971598,20209715989,'1952-06-29','M','Soltero','2020-08-01',NULL,'F','3624448456','calvo jose antonio piero@gmail.com '),(211,'Foschiatti Maria Cristina',25828425,20258284256,'1988-01-05','M','Soltero','2020-08-01',NULL,'R','3624863419','foschiatti maria cristina@gmail.com '),(212,'Rojas Karina',26645198,20266451986,'1990-04-07','M','Soltero','2020-08-19',NULL,'R','3624385602','rojas karina@gmail.com '),(213,'Dominguez Ramon',14559590,20206094506,'1948-07-26','M','Casado','2020-09-01',NULL,'R','3624492408','dominguez ramon@gmail.com '),(214,'Landa Rodrigo Sebastian',26223772,20262237726,'1952-06-12','M','Casado','2020-09-01',NULL,'A','3624669784','landa rodrigo sebastian@gmail.com '),(215,'Ledesma Hector Antonio',19904221,20190842736,'2004-07-23','M','Casado','2020-09-15',NULL,'R','3624919292','ledesma hector antonio@gmail.com '),(216,'Lencina Daniel Alberto',42066793,20420667936,'1954-05-09','M','Casado','2020-10-03',NULL,'R','3624756219','lencina daniel alberto@gmail.com '),(217,'Cubilla Diego Javier',34055511,20340555113,'1973-02-18','M','Casado','2020-10-05',NULL,'R','3625207559','cubilla diego javier@gmail.com '),(218,'Gomez Narciso José',30791654,20307916542,'2004-04-02','M','Casado','2020-10-10',NULL,'R','3624888650','gomez narciso josé@gmail.com '),(219,'Quiroz Luis Oscar',22330189,20223301896,'1965-01-27','M','Casado','2020-10-21',NULL,'R','3624229932','quiroz luis oscar@gmail.com '),(220,'Acosta Carlos Alberto',29767912,20297679126,'1996-07-16','M','Casado','2020-10-21',NULL,'R','3624369242','acosta carlos alberto@gmail.com '),(221,'Peralta Juan Manuel',32728811,20327288116,'1979-12-09','M','Casado','2020-10-27',NULL,'R','3624729285','peralta juan manuel@gmail.com '),(222,'Blasco Julia (Hermano)',16551360,20165513606,'1957-04-05','M','Casado','2020-11-03',NULL,'A','3624221566','blasco julia hermano@gmail.com '),(223,'Sosa Ofelia Catalina',27980069,27279800697,'1997-03-08','F','Casado','2020-11-04',NULL,'R','3624074240','sosa ofelia catalina@gmail.com '),(224,'Cisneros Silvia Amalia',23513926,20365237276,'1945-11-19','M','Casado','2020-11-11',NULL,'N','3624832954','cisneros silvia amalia@gmail.com '),(225,'Acosta Gaston',32154477,20128673686,'1962-03-31','M','Casado','2021-01-04','2024-06-30','N','3624832322','acosta gaston@gmail.com '),(226,'Medina Cristian Jacobo',13716337,20408670506,'1987-12-24','M','Casado','2021-01-05',NULL,'R','3624609094','medina cristian jacobo@gmail.com '),(227,'Riedel Nicolas',10978103,20288824366,'1992-12-30','M','Casado','2021-01-09',NULL,'R','3624623996','riedel nicolas@gmail.com '),(228,'Morales Ruben',11061752,20351129966,'1979-09-30','M','Casado','2021-01-16',NULL,'R','3624631144','morales ruben@gmail.com '),(229,'Flores Alicia',39873381,20191544126,'2001-10-22','M','Casado','2021-01-20',NULL,'N','3624944792','flores alicia@gmail.com '),(230,'Escobar Marlene',10868392,20317387256,'1974-01-30','M','Casado','2021-01-28',NULL,'N','3624834635','escobar marlene@gmail.com '),(231,'Barni Alexis Ezequiel',28675236,20381885416,'1968-09-06','M','Casado','2021-01-29',NULL,'R','3625210542','barni alexis ezequiel@gmail.com '),(232,'Colman Dante Gustavo',27410816,23274108169,'1960-07-19','O',NULL,'2021-01-30',NULL,'A','3624256137','colman dante gustavo@gmail.com '),(233,'Espindola Jesus Salvador',13904681,34546687068,'2001-06-30','O',NULL,'2021-02-03',NULL,'A','3624693846','espindola jesus salvador@gmail.com '),(234,'Gonzalez Alfredo ',11442926,20322976126,'2004-08-08','M','Casado','2021-02-04',NULL,'N','3624500673','gonzalez alfredo@gmail.com '),(235,'Benitez Evelin',24299114,20188064396,'1963-07-27','M','Casado','2021-02-04',NULL,'R','3624480396','benitez evelin@gmail.com '),(236,'Aguirre Anibal',28661594,20286615946,'1958-10-21','M','Casado','2021-02-05',NULL,'R','3624801839','aguirre anibal@gmail.com '),(237,'Ojeda Dario Enrique',23987327,20239873276,'1974-06-14','M','Casado','2021-02-05',NULL,'A','3624597938','ojeda dario enrique@gmail.com '),(238,'Palacios Leandro',33383497,20333834976,'2001-01-08','M','Casado','2021-02-06',NULL,'A','3624727019','palacios leandro@gmail.com '),(239,'Passamano Ramon',24596501,20113962146,'1975-12-25','M','Casado','2021-02-09',NULL,'R','3624162723','passamano ramon@gmail.com '),(240,'Berezosky Leonardo Manuel',31209282,20312092826,'1992-05-31','M','Casado','2021-02-09',NULL,'A','3794318343','berezosky leonardo manuel@gmail.com '),(241,'Quiroz Horacio Norberto',27585646,20275856466,'1953-03-25','M','Casado','2021-02-19',NULL,'R','3624236424','quiroz horacio norberto@gmail.com '),(242,'Garcia Gisela Solange',33384093,20333840936,'1978-06-11','M','Casado','2021-02-19',NULL,'R','3624504173','garcia gisela solange@gmail.com '),(243,'Ramirez Emanuel David',34055900,20340559006,'1972-01-24','M','Casado','2021-02-23',NULL,'R','3624390278','ramirez emanuel david@gmail.com '),(244,'Hertler Hermes',39190295,20391902956,'1996-08-15','M','Casado','2021-02-24',NULL,'R','0','hertler hermes@gmail.com '),(245,'Arce Valeria',38332900,20237356706,'1989-10-01','M','Casado','2021-02-27',NULL,'N','3624554946','arce valeria@gmail.com '),(246,'Leiva Maximiliano Damian',40606851,20406068516,'2005-06-18','M','Casado','2021-03-01',NULL,'R','3624856342','leiva maximiliano damian@gmail.com '),(247,'Sanabria Celeste',23791649,20376087456,'1977-11-16','M','Casado','2021-03-01',NULL,'N','3624741942','sanabria celeste@gmail.com '),(248,'Cabrera Oscar Bonifacio',10639134,30715120409,'2001-03-18','O',NULL,'2021-03-12',NULL,'A','3624154266','cabrera oscar bonifacio@gmail.com '),(249,'Bangher Flavia Valeria',34702681,20347026816,'1961-11-14','M','Casado','2021-03-18',NULL,'R','3624804324','bangher flavia valeria@gmail.com '),(250,'Bogado Angelina',25073624,20250736246,'1991-11-22','M','Casado','2021-03-26',NULL,'R','3625207480','bogado angelina@gmail.com '),(251,'Bogado Alvaro',22343247,30716836165,'1988-08-22','O',NULL,'2021-04-14',NULL,'A','3624124279','bogado alvaro@gmail.com '),(252,'Sanchez Marcelo',21714185,20277839426,'1953-10-29','M','Casado','2021-04-16',NULL,'N','3624760916','sanchez marcelo@gmail.com '),(253,'Feldman Maximiliano',14154067,20342582186,'1996-10-24','M','Casado','2021-04-16',NULL,'N','3624710858','feldman maximiliano@gmail.com '),(254,'Alfonso Rafael Cesar',29223757,20292237576,'1958-03-07','M','Casado','2021-04-29',NULL,'R','3624824125','alfonso rafael cesar@gmail.com '),(255,'Fernández Marcelo Jose',29720741,20297207416,'1962-11-12','M','Casado','2021-05-12',NULL,'A','3624259467','fernández marcelo jose@gmail.com '),(256,'Herrendorf Florencia',15922523,20115407596,'1966-06-18','M','Casado','2021-05-22',NULL,'F','3624609467','herrendorf florencia@gmail.com '),(257,'Velazco Pablo Daniel',29223605,20292236056,'1950-11-24','M','Casado','2021-06-15',NULL,'A','3624125692','velazco pablo daniel@gmail.com '),(258,'Lopez Ruben',6192462,20061924626,'1965-01-15','M','Casado','2021-07-14',NULL,'F','3624539610','lopez ruben@gmail.com '),(259,'Caseres Monica Beatriz',17016730,20170167306,'1952-09-18','M','Casado','2021-07-16',NULL,'A','3624872285','caseres monica beatriz@gmail.com '),(260,'Panificadora Don Ramon ',33426712,20191870786,'1981-08-09','M','Casado','2021-08-27',NULL,'R','3624896794','panificadora don ramon@gmail.com '),(261,'Vera Ricardo Sebastian',28625577,30564680148,'1994-01-06','O',NULL,'2021-10-01',NULL,'A','3624108550','vera ricardo sebastian@gmail.com '),(262,'Acosta Gabriel Alberto',25942850,33717056189,'1968-01-10','O',NULL,'2021-10-14',NULL,'A','3624247339','acosta gabriel alberto@gmail.com '),(263,'Colussi Veronica Isabel',31570468,20315704686,'1992-11-16','M','Casado','2021-10-21',NULL,'A','3624875789','colussi veronica isabel@gmail.com '),(264,'Barrios Rodolfo Ramon',35899467,20358994676,'1946-04-05','M','Casado','2021-11-11',NULL,'A','3624290316','barrios rodolfo ramon@gmail.com '),(265,'Foschia Roberto German',30748101,20307481016,'1977-03-18','M','Casado','2021-12-01',NULL,'A','3624931089','foschia roberto german@gmail.com '),(266,'Soto Ramona',20977854,20209778546,'2000-09-25','M','Casado','2021-12-20','2022-10-30','A','3624710235','soto ramona@gmail.com '),(267,'Bianchi Williams',23987511,20239875116,'1948-04-06','M','Casado','2021-12-21',NULL,'A','3624921005','bianchi williams@gmail.com '),(268,'Bonavita Garcia Johanna Cristina',27001941,20270019416,'1989-02-27','M','Casado','2022-02-18',NULL,'A','3624549649','bonavita garcia johanna cristina@gmail.com '),(269,'De Bortoli Mario',33548653,20335486536,'1959-05-24','M','Casado','2022-03-02',NULL,'A','3624331836','de bortoli mario@gmail.com '),(270,'Bugnart Maria Nela',35030958,20350309586,'1965-08-04','M','Casado','2022-03-18',NULL,'A','3624968818','bugnart maria nela@gmail.com '),(271,'Castillo Leyes Jorge Diego',29554709,20295547096,'1995-10-19','M','Casado','2022-03-25',NULL,'A','3624259722','castillo leyes jorge diego@gmail.com '),(272,'Vidal Nilda Manuela',24727838,20247278386,'1987-11-17','M','Casado','2022-03-25',NULL,'A','3625269981','vidal nilda manuela@gmail.com '),(273,'Gomez Gustavo Horacio',16368128,20163681286,'1999-05-28','M','Casado','2022-04-01',NULL,'A','3721400225','gomez gustavo horacio@gmail.com '),(274,'Zapata Hector Gabriel',38190995,20381909956,'1950-04-01','M','Casado','2022-05-16',NULL,'A','3624067618','zapata hector gabriel@gmail.com '),(275,'Pereira Jessica Alejandra',27212256,20272122566,'1982-01-03','M','Casado','2022-05-17',NULL,'A','3624683560','pereira jessica alejandra@gmail.com '),(276,'Mieres Catalina',5274087,20052740876,'1952-02-02','M','Casado','2022-05-19',NULL,'A','3624462486','mieres catalina@gmail.com '),(277,'Alegre Sandra Viviana',23876267,20238762676,'1947-05-31','M','Casado','2022-06-16',NULL,'A','3624605305','alegre sandra viviana@gmail.com '),(278,'Gonzalez Analia Alexandra',33724739,20337247396,'2002-01-31','M','Casado','2022-07-25',NULL,'A','3624669642','gonzalez analia alexandra@gmail.com '),(279,'Ayala Pablo Daniel',31570768,20315707686,'2001-07-03','M','Casado','2022-08-08',NULL,'A','3624814149','ayala pablo daniel@gmail.com '),(280,'Maciel Carina Beatriz',35301899,20353018996,'1946-04-08','M','Casado','2022-08-22',NULL,'A','3625224764','maciel carina beatriz@gmail.com '),(281,'Veliz Nelida',10674493,20106744936,'1963-07-04','M','Casado','2022-08-30',NULL,'A','3624635788','veliz nelida@gmail.com '),(282,'Casco Vilma Noemi',23419966,20234199666,'1953-02-24','M','Casado','2022-09-09',NULL,'A','3624890012','casco vilma noemi@gmail.com '),(283,'Obregon Romina Vanesa',31330132,20313301326,'1970-01-24','M','Casado','2022-09-19',NULL,'A','3624248664','obregon romina vanesa@gmail.com '),(284,'Perez Karina Elisabeth',29925542,20299255426,'1989-02-14','M','Casado','2022-09-29',NULL,'A','3624127243','perez karina elisabeth@gmail.com '),(285,'Mihal Oscar Andres',12466446,20124664466,'1959-06-08','M','Casado','2022-09-29',NULL,'A','3624252124','mihal oscar andres@gmail.com '),(286,'Samita Maximiliano',41040474,20410404746,'2001-09-29','M','Casado','2022-10-03',NULL,'A','3644502904','samita maximiliano@gmail.com '),(287,'Viganotti Danielo Oscar',24908580,30686050145,'1985-02-06','O',NULL,'2022-11-17',NULL,'A','3624303941','viganotti danielo oscar@gmail.com '),(288,'Ferrero Marcos Sebastian',35466375,20354663756,'1961-10-30','M','Casado','2022-12-05',NULL,'A','3624510065','ferrero marcos sebastian@gmail.com '),(289,'Barreto Faustino Antonio',12343135,20123431356,'1981-07-23','M','Casado','2022-12-12',NULL,'A','3625459280','barreto faustino antonio@gmail.com '),(290,'Spesso Julieta Higinia',33123899,20331238996,'1976-09-02','M','Casado','2022-12-16',NULL,'A','3624725815','spesso julieta higinia@gmail.com '),(291,'Dure Laura Manuela',25534137,20255341376,'1954-10-28','M','Casado','2022-12-19',NULL,'A','3624703865','dure laura manuela@gmail.com '),(292,'Gonzalez Celia Adelina',23691439,20236914396,'1996-07-26','M','Casado','2022-12-23',NULL,'A','3624559277','gonzalez celia adelina@gmail.com '),(293,'Perin Gabriela Del Valle',28522481,20285224816,'1983-11-02','M','Casado','2023-01-11',NULL,'A','3537301303','perin gabriela del valle@gmail.com '),(294,'Martinez Andrea Veronica',27877560,20278775606,'1967-06-19','M','Casado','2023-01-14',NULL,'A','3624873719','martinez andrea veronica@gmail.com '),(295,'Perez Benitez Lilian',13114587,20131145876,'1989-06-25','M','Casado','2023-01-25',NULL,'A','3624651558','perez benitez lilian@gmail.com '),(296,'Chahin Cecilia Lorena',30791520,20307915206,'1947-03-21','M','Casado','2023-02-01',NULL,'A','1166609300','chahin cecilia lorena@gmail.com '),(297,'Martinez Facundo Nahuel',30748372,20307483726,'1988-10-07','M','Casado','2023-02-09',NULL,'A','3624728312','martinez facundo nahuel@gmail.com '),(298,'Gonzalez Victor Luis',35037300,20350373006,'1975-03-02','M','Casado','2023-02-09',NULL,'A','3624161267','gonzalez victor luis@gmail.com '),(299,'Alegre Maria Cecilia',37157919,20371579196,'1950-10-05','M','Casado','2023-02-17',NULL,'A','3764811199','alegre maria cecilia@gmail.com '),(300,'Thorlet Fernando Andres',25278388,20252783886,'1992-10-25','M','Casado','2023-02-22',NULL,'A','3644645167','thorlet fernando andres@gmail.com '),(301,'Lopez Marcelo Alejandro',23685584,20236855846,'1952-07-07','M','Casado','2023-02-23',NULL,'A','3624855975','lopez marcelo alejandro@gmail.com '),(302,'Gutierrez Francisco',7806118,20078061186,'1970-02-22','M','Casado','2023-03-14',NULL,'A','3624774313','gutierrez francisco@gmail.com '),(303,'Pereyra Maria Lorena',25083229,33715092129,'1999-12-12','O',NULL,'2023-03-16',NULL,'A','3625215209','pereyra maria lorena@gmail.com '),(304,'Gutierrez Yanina Alexandra',29613925,20296139256,'1985-06-07','M','Casado','2023-03-21',NULL,'A','3624263104','gutierrez yanina alexandra@gmail.com '),(305,'Jerez Roberto Oscar',22330219,20223302196,'1992-04-23','M','Casado','2023-03-27',NULL,'A','3624297980','jerez roberto oscar@gmail.com '),(306,'Ojeda Aurelio Oscar',13306119,20133061196,'1965-01-05','M','Casado','2023-03-28',NULL,'A','3624775132','ojeda aurelio oscar@gmail.com '),(307,'Vargas Susana Aida',23059927,20230599276,'1999-08-23','M','Casado','2023-04-04',NULL,'A','3624165207','vargas susana aida@gmail.com '),(308,'Ojeda Antonio Ramon',29552857,20295528576,'1983-08-21','M','Casado','2023-04-18',NULL,'A','3624232483','ojeda antonio ramon@gmail.com '),(309,'Escobar Cristian Ariel',30214987,20302149876,'1952-01-05','M','Casado','2023-05-04',NULL,'A','3624822177','escobar cristian ariel@gmail.com '),(310,'Leguizamon Miguel De Jesus',17369964,20173699646,'1973-08-31','M','Casado','2023-05-11',NULL,'A','3624562160','leguizamon miguel de jesus@gmail.com '),(311,'Sorba Isaac',34302900,20343029006,'1961-10-28','M','Casado','2023-06-02',NULL,'A','3624207722','sorba isaac@gmail.com '),(312,'Vence Rosalia',20500190,20205001906,'1985-05-17','M','Casado','2023-06-13',NULL,'A','3624366886','vence rosalia@gmail.com '),(313,'Bobadilla Ricardo Martin',32062322,20320623226,'2002-02-05','M','Casado','2023-06-16',NULL,'A','3624782065','bobadilla ricardo martin@gmail.com '),(314,'Alderete Juana Irene',13114423,20131144236,'1963-05-17','M','Casado','2023-06-21','2024-02-28','A','3624172947','alderete juana irene@gmail.com '),(315,'Alderete Juana Irene (Mamá)',13114423,20131144236,'1984-10-02','M','Casado','2023-07-28',NULL,'A','3624172947','alderete juana irene mamá@gmail.com '),(316,'Rodriguez Claudio Leonardo',27088637,30630617762,'1992-07-03','O',NULL,'2023-09-11',NULL,'A','3624125364','rodriguez claudio leonardo@gmail.com '),(317,'Perez Luis Alfredo',33878669,20338786696,'2002-02-19','M','Casado','2023-09-20',NULL,'A','3625470130','perez luis alfredo@gmail.com '),(318,'Kochowiec Karen',39309945,20393099456,'1988-07-25','M','Casado','2023-10-02',NULL,'A','3624614158','kochowiec karen@gmail.com '),(319,'Perez Graciela Beatriz',16349079,20163490796,'1998-12-07','M','Casado','2023-10-12',NULL,'A','3624793041','perez graciela beatriz@gmail.com '),(320,'Gill Nidia Mabel',26575287,30717828867,'1959-08-29','O',NULL,'2023-10-18',NULL,'A','3625628762','gill nidia mabel@gmail.com '),(321,'Duarte Nicolas Fernando',36198417,20361984176,'1981-03-01','M','Casado','2023-10-24',NULL,'A','3624692223','duarte nicolas fernando@gmail.com '),(322,'Alcaraz Ignacio Raul',17388712,20173887126,'1958-10-22','M','Casado','2023-11-09',NULL,'A','3624815908','alcaraz ignacio raul@gmail.com '),(323,'Romero Nicolas Ariel',33724985,20337249856,'1959-03-13','M','Casado','2023-11-13',NULL,'A','3624263505','romero nicolas ariel@gmail.com '),(324,'Alunni Ana Laura',36611313,20366113136,'1996-06-04','M','Casado','2023-11-14',NULL,'A','3624330030','alunni ana laura@gmail.com '),(325,'Suarez Marisa Griselda',22891419,20228914196,'2001-01-24','M','Casado','2023-11-15',NULL,'A','3624802809','suarez marisa griselda@gmail.com '),(326,'Fernandez Ivan Ezequiel',37168365,20371683656,'1956-10-01','M','Casado','2023-11-15',NULL,'A','3624333397','fernandez ivan ezequiel@gmail.com '),(327,'Kees Juan Ramon',28707552,20287075526,'1993-03-26','M','Casado','2023-11-15',NULL,'A','3624406726','kees juan ramon@gmail.com '),(328,'Mendez Silvina Elizabeth',26651153,30710390807,'2003-03-11','O',NULL,'2023-11-17',NULL,'A','3624836999','mendez silvina elizabeth@gmail.com '),(329,'Gonzalez Mirta Graciela',13309252,20133092526,'2004-05-16','M','Casado','2023-11-20',NULL,'A','3624013600','gonzalez mirta graciela@gmail.com '),(330,'Romera Carolina Lucia',28858145,20288581456,'1973-05-16','M','Casado','2023-12-04',NULL,'A','3624729280','romera carolina lucia@gmail.com '),(331,'Miño Nicolas Enrique',39776908,20397769086,'1949-02-27','M','Casado','2023-12-11',NULL,'A','3624556443','miño nicolas enrique@gmail.com '),(332,'Gonzalez Marcelo Javier',27212297,20272122976,'2002-04-20','M','Casado','2023-12-13',NULL,'A','3624528703','gonzalez marcelo javier@gmail.com '),(333,'Garcia Bustos Maria Florencia',30484112,20304841126,'1954-07-07','M','Casado','2023-12-14',NULL,'A','3624225146','garcia bustos maria florencia@gmail.com '),(334,'Godoy Leandro Francisco',32408034,20324080346,'1947-05-08','M','Casado','2023-12-19',NULL,'A','3624259696','godoy leandro francisco@gmail.com '),(335,'Del Valle Petrona',11035506,20110355066,'1975-12-27','M','Casado','2023-12-19',NULL,'A','3624967975','del valle petrona@gmail.com '),(336,'Espinola Lucazevich Gabriela',23987005,20239870056,'1977-04-10','M','Casado','2023-12-26',NULL,'A','3624253205','espinola lucazevich gabriela@gmail.com '),(337,'Moralez Delia Elena',28741121,20287411216,'1964-04-24','M','Casado','2023-12-26',NULL,'A','3624742836','moralez delia elena@gmail.com '),(338,'Fernandez Clarisa Lorena',24194921,20241949216,'1965-04-12','M','Casado','2023-12-26',NULL,'A','3794693448','fernandez clarisa lorena@gmail.com '),(339,'Riquelme Sonia Patricia',17251748,20172517486,'1975-04-29','M','Casado','2023-12-27',NULL,'A','3624185333','riquelme sonia patricia@gmail.com '),(340,'Maidana Julio Agustin',20763297,20207632976,'1982-10-20','M','Casado','2024-01-02',NULL,'A','3624903110','maidana julio agustin@gmail.com '),(341,'Ayala Laura Mabel',24632431,20246324316,'1957-01-06','M','Casado','2024-01-02',NULL,'A','3625629521','ayala laura mabel@gmail.com '),(342,'Rodriguez Garcia Maria Luisa',12482927,20124829276,'1981-07-09','M','Casado','2024-01-02',NULL,'A','3624776932','rodriguez garcia maria luisa@gmail.com '),(343,'Maidana Mario Hector',20192977,20201929776,'1989-12-14','M','Casado','2024-01-02',NULL,'A','3624382720','maidana mario hector@gmail.com '),(344,'Ramos Laura Noemí',10408689,20104086896,'1956-11-24','M','Casado','2024-01-04',NULL,'A','3624775694','ramos laura noemí@gmail.com '),(345,'Ruiz Sergio Daniel',21978134,20219781346,'1979-01-28','M','Casado','2024-01-05',NULL,'A','3624592625','ruiz sergio daniel@gmail.com '),(346,'Martinez Diana',37771589,30716264234,'1977-01-23','O',NULL,'2024-02-02',NULL,'A','3725465863','martinez diana@gmail.com '),(347,'Aguero Monica Alejandra',35690043,20356900436,'1971-07-18','M','Casado','2024-02-05',NULL,'A','3624784346','aguero monica alejandra@gmail.com ');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_clientes_update_clientes` BEFORE UPDATE ON `clientes` FOR EACH ROW BEGIN
	INSERT INTO log_auditoria(id_log, tabla, accion, mensaje, usuario, fecha)
    VALUES ( NULL
	,		'clientes'
	,		'modificación'
    ,		CONCAT(
					'Se modificó la información del cliente '
					, NEW.id_cliente
					)
    ,		user()
    ,		now()
    );
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clientes_dispensers`
--

DROP TABLE IF EXISTS `clientes_dispensers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes_dispensers` (
  `id_cliente_dispenser` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_dispenser` int NOT NULL,
  `fecha_movimiento` date NOT NULL,
  `movimiento` varchar(40) NOT NULL,
  PRIMARY KEY (`id_cliente_dispenser`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_dispenser` (`id_dispenser`),
  CONSTRAINT `clientes_dispensers_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `clientes_dispensers_ibfk_2` FOREIGN KEY (`id_dispenser`) REFERENCES `dispensers` (`id_dispenser`),
  CONSTRAINT `clientes_dispensers_chk_1` CHECK ((`movimiento` in (_utf8mb4'Devolución para cambio',_utf8mb4'Baja cliente',_utf8mb4'Entrega',_utf8mb4'Entrega por cambio',_utf8mb4'Reparado',_utf8mb4'A reparar',_utf8mb4'Descarte',_utf8mb4'En reparación')))
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes_dispensers`
--

LOCK TABLES `clientes_dispensers` WRITE;
/*!40000 ALTER TABLE `clientes_dispensers` DISABLE KEYS */;
INSERT INTO `clientes_dispensers` VALUES (1,1,1,'2016-06-30','Entrega'),(2,2,2,'2016-06-30','Entrega'),(3,4,3,'2016-06-30','Entrega'),(4,14,4,'2016-06-30','Entrega'),(5,14,4,'2017-04-30','Baja cliente'),(6,27,4,'2017-01-01','Entrega'),(7,15,5,'2016-06-30','Entrega'),(8,20,6,'2016-06-30','Entrega'),(9,21,7,'2016-06-30','Entrega'),(10,22,8,'2016-06-30','Entrega'),(11,23,9,'2016-09-09','Entrega'),(12,24,10,'2016-09-09','Entrega'),(13,52,11,'2017-06-14','Entrega'),(14,64,12,'2017-08-30','Entrega'),(15,75,13,'2017-09-05','Entrega'),(16,76,14,'2017-12-20','Entrega'),(17,81,15,'2018-01-17','Entrega'),(18,84,16,'2018-01-17','Entrega'),(19,85,17,'2018-03-01','Entrega'),(20,87,18,'2018-03-06','Entrega'),(21,88,19,'2018-04-13','Entrega'),(22,90,20,'2018-04-20','Entrega'),(23,91,21,'2018-05-18','Entrega'),(24,92,22,'2018-06-26','Entrega'),(25,94,23,'2018-08-08','Entrega'),(26,95,24,'2018-08-15','Entrega'),(27,97,25,'2018-08-15','Entrega'),(28,98,26,'2018-08-16','Entrega'),(29,99,27,'2018-08-16','Entrega'),(30,100,28,'2018-09-01','Entrega'),(31,103,29,'2018-09-06','Entrega'),(32,102,30,'2018-09-01','Entrega'),(33,102,30,'2019-08-06','Baja cliente'),(34,117,30,'2019-04-01','Entrega'),(35,107,31,'2018-09-18','Entrega'),(36,109,32,'2018-10-05','Entrega'),(37,111,33,'2018-11-20','Entrega'),(38,114,34,'2018-12-11','Entrega'),(39,115,35,'2018-12-15','Entrega'),(40,116,36,'2019-03-19','Entrega'),(41,121,37,'2019-04-25','Entrega'),(42,123,38,'2019-06-07','Entrega'),(43,124,39,'2019-06-25','Entrega'),(44,125,40,'2019-08-02','Entrega'),(45,128,41,'2019-08-02','Entrega'),(46,129,42,'2019-10-28','Entrega'),(47,130,43,'2019-10-29','Entrega'),(48,137,44,'2019-11-22','Entrega'),(49,138,45,'2020-03-07','Entrega'),(50,146,46,'2020-05-11','Entrega'),(51,163,47,'2020-05-14','Entrega'),(52,194,48,'2020-06-01','Entrega'),(53,197,49,'2020-06-10','Entrega'),(54,202,50,'2020-09-01','Entrega'),(55,204,51,'2020-11-03','Entrega'),(56,214,52,'2021-01-30','Entrega'),(57,222,53,'2021-02-03','Entrega'),(58,232,54,'2021-02-05','Entrega'),(59,233,55,'2021-02-06','Entrega'),(60,237,56,'2021-02-09','Entrega'),(61,238,57,'2021-03-12','Entrega'),(62,240,58,'2021-04-14','Entrega'),(63,248,59,'2021-05-12','Entrega'),(64,251,60,'2021-06-15','Entrega'),(65,255,61,'2021-07-16','Entrega'),(66,257,62,'2021-10-01','Entrega'),(67,259,63,'2021-10-14','Entrega'),(68,261,64,'2021-10-21','Entrega'),(69,262,65,'2021-11-11','Entrega'),(70,263,66,'2021-12-01','Entrega'),(71,264,67,'2022-02-18','Entrega'),(72,265,68,'2021-12-21','Entrega'),(73,268,69,'2022-03-18','Entrega'),(74,267,70,'2022-03-02','Entrega'),(75,266,71,'2021-12-20','Entrega'),(76,266,71,'2022-10-30','Baja cliente'),(77,282,71,'2022-09-29','Entrega'),(78,269,72,'2022-03-25','Entrega'),(79,270,73,'2022-03-25','Entrega'),(80,271,74,'2022-04-01','Entrega'),(81,272,75,'2022-05-16','Entrega'),(82,273,76,'2022-05-17','Entrega'),(83,274,77,'2022-05-19','Entrega'),(84,275,78,'2022-06-16','Entrega'),(85,276,79,'2022-07-25','Entrega'),(86,277,80,'2022-08-08','Entrega'),(87,278,81,'2022-08-22','Entrega'),(88,279,82,'2022-08-30','Entrega'),(89,280,83,'2022-09-19','Entrega'),(90,281,84,'2022-09-29','Entrega'),(91,283,85,'2022-10-03','Entrega'),(92,284,86,'2022-11-17','Entrega'),(93,285,87,'2022-12-05','Entrega'),(94,286,88,'2022-12-12','Entrega'),(95,287,89,'2022-12-16','Entrega'),(96,288,90,'2022-12-19','Entrega'),(97,289,91,'2022-12-23','Entrega'),(98,290,92,'2023-01-11','Entrega'),(99,291,93,'2023-01-14','Entrega'),(100,292,94,'2023-01-25','Entrega'),(101,293,95,'2023-02-01','Entrega'),(102,294,96,'2023-02-09','Entrega'),(103,295,97,'2023-02-09','Entrega'),(104,296,98,'2023-02-17','Entrega'),(105,297,99,'2023-02-22','Entrega'),(106,298,100,'2023-02-23','Entrega'),(107,299,101,'2023-03-14','Entrega'),(108,300,102,'2023-03-16','Entrega'),(109,301,103,'2023-03-21','Entrega'),(110,302,104,'2023-03-27','Entrega'),(111,303,105,'2023-03-28','Entrega'),(112,304,106,'2023-04-04','Entrega'),(113,305,107,'2023-04-18','Entrega'),(114,306,108,'2023-05-04','Entrega'),(115,307,109,'2023-05-11','Entrega'),(116,308,110,'2023-06-02','Entrega'),(117,309,111,'2023-06-13','Entrega'),(118,310,112,'2023-06-16','Entrega'),(119,311,113,'2023-07-28','Entrega'),(120,312,114,'2023-09-11','Entrega'),(121,313,115,'2023-09-20','Entrega'),(122,315,116,'2023-10-12','Entrega'),(123,316,117,'2023-12-02','Entrega por cambio'),(124,317,118,'2023-10-24','Entrega'),(125,339,119,'2024-01-02','Entrega'),(126,319,120,'2023-11-13','Entrega'),(127,320,121,'2023-11-14','Entrega'),(128,321,122,'2023-11-15','Entrega'),(129,322,123,'2023-11-15','Entrega'),(130,323,124,'2023-11-15','Entrega'),(131,324,125,'2023-11-17','Entrega'),(132,325,126,'2023-11-20','Entrega'),(133,326,127,'2023-12-04','Entrega'),(134,327,128,'2023-12-11','Entrega'),(135,328,129,'2023-12-13','Entrega'),(136,329,130,'2023-12-14','Entrega'),(137,330,131,'2023-12-19','Entrega'),(138,331,132,'2023-12-19','Entrega'),(139,332,133,'2023-12-26','Entrega'),(140,333,134,'2024-01-16','Entrega por cambio'),(141,334,135,'2023-12-26','Entrega'),(142,335,136,'2023-12-27','Entrega'),(143,336,137,'2024-01-02','Entrega'),(144,337,138,'2024-01-02','Entrega'),(145,338,139,'2024-02-15','Entrega por cambio'),(146,339,140,'2024-01-02','Entrega'),(147,340,141,'2024-01-04','Entrega'),(148,341,142,'2024-01-05','Entrega'),(149,342,143,'2024-02-05','Entrega por cambio'),(150,343,144,'2024-02-05','Entrega'),(151,344,145,'2023-03-16','Entrega'),(152,345,146,'2023-11-15','Entrega'),(153,346,147,'2024-02-05','Entrega'),(154,347,148,'2016-06-30','Entrega'),(155,303,149,'2023-03-28','Entrega'),(156,326,150,'2023-12-04','Entrega'),(157,347,151,'2016-06-30','Entrega'),(158,14,152,'2016-06-30','Entrega'),(159,1,153,'2016-06-30','Entrega'),(160,268,154,'2022-03-18','Entrega'),(161,269,155,'2022-03-25','Entrega'),(162,270,156,'2022-03-25','Entrega'),(163,271,157,'2022-04-01','Entrega'),(164,272,158,'2022-05-16','Entrega'),(165,273,159,'2022-05-17','Entrega'),(166,274,160,'2022-05-19','Entrega'),(167,275,161,'2022-06-16','Entrega'),(168,276,162,'2022-07-25','Entrega'),(169,277,163,'2022-08-08','Entrega'),(170,277,164,'2022-08-08','Entrega'),(171,318,165,'2024-02-29','Entrega por cambio'),(172,333,175,'2023-12-26','Entrega'),(173,333,175,'2024-01-15','Devolución para cambio'),(174,NULL,175,'2024-01-15','A reparar'),(175,NULL,175,'2024-01-20','Reparado'),(176,316,176,'2023-10-18','Entrega'),(177,316,176,'2023-12-01','Devolución para cambio'),(178,NULL,176,'2023-12-01','A reparar'),(179,NULL,176,'2023-12-16','Reparado'),(180,342,177,'2024-02-02','Entrega'),(181,342,177,'2024-02-01','Devolución para cambio'),(182,NULL,177,'2024-02-01','A reparar'),(183,NULL,177,'2024-02-11','Reparado'),(184,338,178,'2024-01-02','Entrega'),(185,338,178,'2024-02-10','Devolución para cambio'),(186,NULL,178,'2024-02-10','A reparar'),(187,NULL,178,'2024-03-10','Reparado'),(188,318,179,'2023-11-09','Entrega'),(189,318,179,'2024-02-29','Devolución para cambio'),(190,NULL,179,'2024-02-29','A reparar'),(191,NULL,179,'2024-03-10','Reparado'),(192,NULL,180,'2022-01-10','A reparar'),(193,NULL,181,'2022-03-27','A reparar'),(194,NULL,182,'2020-12-01','A reparar'),(195,NULL,183,'2023-01-01','A reparar'),(196,NULL,184,'2021-08-11','A reparar'),(197,NULL,185,'2022-11-06','A reparar'),(198,NULL,186,'2022-03-20','A reparar'),(199,NULL,187,'2021-06-16','A reparar'),(200,NULL,188,'2022-03-26','A reparar'),(201,NULL,189,'2020-11-17','A reparar'),(202,NULL,190,'2021-02-21','A reparar'),(203,NULL,191,'2021-05-25','A reparar'),(204,NULL,192,'2021-06-05','A reparar'),(205,NULL,193,'2021-05-30','A reparar'),(206,NULL,194,'2020-12-18','A reparar'),(207,NULL,197,'2024-12-03','En reparación'),(208,NULL,198,'2023-10-14','En reparación'),(209,NULL,199,'2023-12-31','En reparación'),(210,NULL,200,'2024-12-14','En reparación');
/*!40000 ALTER TABLE `clientes_dispensers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes_domicilios`
--

DROP TABLE IF EXISTS `clientes_domicilios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes_domicilios` (
  `id_cliente_domicilio` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_tipo_domicilio` varchar(1) NOT NULL,
  `id_domicilio` int NOT NULL,
  PRIMARY KEY (`id_cliente_domicilio`),
  KEY `id_domicilio` (`id_domicilio`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `clientes_domicilios_ibfk_1` FOREIGN KEY (`id_domicilio`) REFERENCES `domicilios` (`id_domicilio`),
  CONSTRAINT `clientes_domicilios_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=456 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes_domicilios`
--

LOCK TABLES `clientes_domicilios` WRITE;
/*!40000 ALTER TABLE `clientes_domicilios` DISABLE KEYS */;
INSERT INTO `clientes_domicilios` VALUES (1,1,'A',1),(2,2,'A',2),(3,3,'A',3),(4,4,'A',4),(5,5,'A',5),(6,6,'A',6),(7,7,'A',7),(8,8,'A',8),(9,9,'A',9),(10,10,'A',10),(11,11,'A',11),(12,12,'A',12),(13,13,'A',13),(14,14,'A',14),(15,15,'A',15),(16,16,'A',16),(17,17,'A',17),(18,18,'A',18),(19,19,'A',19),(20,20,'A',20),(21,21,'A',21),(22,22,'A',22),(23,23,'A',23),(24,24,'A',24),(25,25,'A',25),(26,26,'A',26),(27,27,'A',27),(28,28,'A',28),(29,29,'A',29),(30,30,'A',30),(31,31,'A',31),(32,32,'A',32),(33,33,'A',33),(34,34,'A',34),(35,35,'A',35),(36,36,'A',36),(37,37,'A',37),(38,38,'A',38),(39,39,'A',39),(40,40,'A',40),(41,41,'A',41),(42,42,'A',42),(43,43,'A',43),(44,44,'A',44),(45,45,'A',45),(46,46,'A',46),(47,47,'A',47),(48,48,'A',48),(49,49,'A',49),(50,50,'A',50),(51,51,'A',51),(52,52,'A',52),(53,53,'A',53),(54,54,'A',54),(55,55,'A',55),(56,56,'A',56),(57,57,'A',57),(58,58,'A',58),(59,59,'A',59),(60,60,'A',60),(61,61,'A',61),(62,62,'A',62),(63,63,'A',63),(64,64,'A',64),(65,65,'A',65),(66,66,'A',66),(67,67,'A',67),(68,68,'A',68),(69,69,'A',69),(70,70,'A',70),(71,71,'A',71),(72,72,'A',72),(73,73,'A',73),(74,74,'A',74),(75,75,'A',75),(76,76,'A',76),(77,77,'A',77),(78,78,'A',78),(79,79,'A',79),(80,80,'A',80),(81,81,'A',81),(82,82,'A',82),(83,83,'A',83),(84,84,'A',84),(85,85,'A',85),(86,86,'A',86),(87,87,'A',87),(88,88,'A',88),(89,89,'A',89),(90,90,'A',90),(91,91,'A',91),(92,92,'A',92),(93,93,'A',93),(94,94,'A',94),(95,95,'A',95),(96,96,'A',96),(97,97,'A',97),(98,98,'A',98),(99,99,'A',99),(100,100,'A',100),(101,101,'A',101),(102,102,'A',102),(103,103,'A',103),(104,104,'A',104),(105,105,'A',105),(106,106,'A',106),(107,107,'A',107),(108,108,'A',108),(109,109,'A',109),(110,110,'A',110),(111,111,'A',111),(112,112,'A',112),(113,113,'A',113),(114,114,'A',114),(115,115,'A',115),(116,116,'A',116),(117,117,'A',117),(118,118,'A',118),(119,119,'A',119),(120,120,'A',120),(121,121,'A',121),(122,122,'A',122),(123,123,'A',123),(124,124,'A',124),(125,125,'A',125),(126,126,'A',126),(127,127,'A',127),(128,128,'A',128),(129,129,'A',129),(130,130,'A',130),(131,131,'A',131),(132,132,'A',132),(133,133,'A',133),(134,134,'A',134),(135,135,'A',135),(136,136,'A',136),(137,137,'A',137),(138,138,'A',138),(139,139,'A',139),(140,140,'A',140),(141,141,'A',141),(142,142,'A',142),(143,143,'A',143),(144,144,'A',144),(145,145,'A',145),(146,146,'A',146),(147,147,'A',147),(148,148,'A',148),(149,149,'A',149),(150,150,'A',150),(151,151,'A',151),(152,152,'A',152),(153,153,'A',153),(154,154,'A',154),(155,155,'A',155),(156,156,'A',156),(157,157,'A',157),(158,158,'A',158),(159,159,'A',159),(160,160,'A',160),(161,161,'A',161),(162,162,'A',162),(163,163,'A',163),(164,164,'A',164),(165,165,'A',165),(166,166,'A',166),(167,167,'A',167),(168,168,'A',168),(169,169,'A',169),(170,170,'A',170),(171,171,'A',171),(172,172,'A',172),(173,173,'A',173),(174,174,'A',174),(175,175,'A',175),(176,176,'A',176),(177,177,'A',177),(178,178,'A',178),(179,179,'A',179),(180,180,'A',180),(181,181,'A',181),(182,182,'A',182),(183,183,'A',183),(184,184,'A',184),(185,185,'A',185),(186,186,'A',186),(187,187,'A',187),(188,188,'A',188),(189,189,'A',189),(190,190,'A',190),(191,191,'A',191),(192,192,'A',192),(193,193,'A',193),(194,194,'A',194),(195,195,'A',195),(196,196,'A',196),(197,197,'A',197),(198,198,'A',198),(199,199,'A',199),(200,200,'A',200),(201,201,'A',201),(202,202,'A',202),(203,203,'A',203),(204,204,'A',204),(205,205,'A',205),(206,206,'A',206),(207,207,'A',207),(208,208,'A',208),(209,209,'A',209),(210,210,'A',210),(211,211,'A',211),(212,212,'A',212),(213,213,'A',213),(214,214,'A',214),(215,215,'A',215),(216,216,'A',216),(217,217,'A',217),(218,218,'A',218),(219,219,'A',219),(220,220,'A',220),(221,221,'A',221),(222,222,'A',222),(223,223,'A',223),(224,224,'A',224),(225,225,'A',225),(226,226,'A',226),(227,227,'A',227),(228,228,'A',228),(229,229,'A',229),(230,230,'A',230),(231,231,'A',231),(232,232,'A',232),(233,233,'A',233),(234,234,'A',234),(235,235,'A',235),(236,236,'A',236),(237,237,'A',237),(238,238,'A',238),(239,239,'A',239),(240,240,'A',240),(241,241,'A',241),(242,242,'A',242),(243,243,'A',243),(244,244,'A',244),(245,245,'A',245),(246,246,'A',246),(247,247,'A',247),(248,248,'A',248),(249,249,'A',249),(250,250,'A',250),(251,251,'A',251),(252,252,'A',252),(253,253,'A',253),(254,254,'A',254),(255,255,'A',255),(256,256,'A',256),(257,257,'A',257),(258,258,'A',258),(259,259,'A',259),(260,260,'A',260),(261,261,'A',261),(262,262,'A',262),(263,263,'A',263),(264,264,'A',264),(265,265,'A',265),(266,266,'A',266),(267,267,'A',267),(268,268,'A',268),(269,269,'A',269),(270,270,'A',270),(271,271,'A',271),(272,272,'A',272),(273,273,'A',273),(274,274,'A',274),(275,275,'A',275),(276,276,'A',276),(277,277,'A',277),(278,278,'A',278),(279,279,'A',279),(280,280,'A',280),(281,281,'A',281),(282,282,'A',282),(283,283,'A',283),(284,284,'A',284),(285,285,'A',285),(286,286,'A',286),(287,287,'A',287),(288,288,'A',288),(289,289,'A',289),(290,290,'A',290),(291,291,'A',291),(292,292,'A',292),(293,293,'A',293),(294,294,'A',294),(295,295,'A',295),(296,296,'A',296),(297,297,'A',297),(298,298,'A',298),(299,299,'A',299),(300,300,'A',300),(301,301,'A',301),(302,302,'A',302),(303,303,'A',303),(304,304,'A',304),(305,305,'A',305),(306,306,'A',306),(307,307,'A',307),(308,308,'A',308),(309,309,'A',309),(310,310,'A',310),(311,311,'A',311),(312,312,'A',312),(313,313,'A',313),(314,314,'A',314),(315,315,'A',315),(316,316,'A',316),(317,317,'A',317),(318,318,'A',318),(319,319,'A',319),(320,320,'A',320),(321,321,'A',321),(322,322,'A',322),(323,323,'A',323),(324,324,'A',324),(325,325,'A',325),(326,326,'A',326),(327,327,'A',327),(328,328,'A',328),(329,329,'A',329),(330,330,'A',330),(331,331,'A',331),(332,332,'A',332),(333,333,'A',333),(334,334,'A',334),(335,335,'A',335),(336,336,'A',336),(337,337,'A',337),(338,338,'A',338),(339,339,'A',339),(340,340,'A',340),(341,341,'A',341),(342,194,'L',342),(343,34,'L',343),(344,19,'L',344),(345,198,'L',345),(346,23,'L',346),(347,237,'L',347),(348,309,'L',348),(349,151,'L',350),(350,177,'L',351),(351,67,'L',352),(352,14,'L',353),(353,215,'L',354),(354,222,'L',355),(355,182,'L',356),(356,229,'L',357),(357,155,'L',358),(358,105,'L',359),(359,140,'L',360),(360,86,'L',361),(361,82,'L',362),(362,162,'L',363),(363,341,'L',364),(364,87,'L',365),(365,35,'L',366),(366,189,'L',367),(367,90,'L',368),(368,197,'L',369),(369,300,'L',370),(370,318,'L',371),(371,200,'L',372),(372,154,'L',373),(373,299,'L',374),(374,284,'L',375),(375,232,'L',376),(376,131,'L',377),(377,316,'L',378),(378,18,'L',379),(379,255,'L',380),(380,183,'L',381),(381,22,'L',382),(382,218,'L',383),(383,206,'L',384),(384,51,'L',385),(385,212,'L',386),(386,141,'L',387),(387,199,'L',388),(388,4,'L',389),(389,196,'L',390),(390,100,'L',391),(391,205,'L',392),(392,37,'L',393),(393,174,'L',394),(394,20,'L',395),(395,79,'L',396),(396,187,'L',397),(397,294,'L',398),(398,327,'L',399),(399,64,'L',400),(400,253,'L',401),(401,225,'L',402),(402,21,'L',403),(403,306,'L',404),(404,347,'L',405),(405,246,'L',406),(406,36,'L',407),(407,288,'L',408),(408,188,'L',409),(409,77,'L',410),(410,101,'L',411),(411,106,'L',412),(412,276,'L',413),(413,312,'L',414),(414,80,'L',417),(415,92,'L',418),(416,68,'L',419),(417,78,'L',420),(418,93,'L',421),(419,65,'L',422),(420,326,'L',423),(421,256,'L',424),(422,6,'L',425),(423,110,'L',426),(424,66,'L',427),(425,288,'R',428),(426,70,'R',429),(427,300,'R',430),(428,340,'R',431),(429,267,'R',432),(430,116,'R',433),(431,303,'R',434),(432,260,'R',435),(433,140,'R',436),(434,25,'R',437),(435,236,'R',438),(436,248,'R',439),(437,323,'R',440),(438,258,'R',441),(439,75,'R',442),(440,281,'R',443),(441,240,'R',444),(442,307,'R',445),(443,185,'R',446),(444,193,'R',447),(445,133,'R',449),(446,77,'R',450),(447,68,'R',451),(448,297,'R',452),(449,108,'R',453),(450,250,'R',454),(451,187,'R',455),(452,166,'R',456),(453,287,'R',457),(454,115,'R',458),(455,80,'R',459);
/*!40000 ALTER TABLE `clientes_domicilios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispensers`
--

DROP TABLE IF EXISTS `dispensers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dispensers` (
  `id_dispenser` int NOT NULL AUTO_INCREMENT,
  `nro_serie` varchar(20) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `fecha_compra` date NOT NULL,
  `fecha_baja` date DEFAULT NULL,
  PRIMARY KEY (`id_dispenser`),
  UNIQUE KEY `id_dispenser` (`id_dispenser`),
  CONSTRAINT `dispensers_chk_1` CHECK ((`estado` in (_utf8mb4'Comodato',_utf8mb4'Nuevo',_utf8mb4'Usado',_utf8mb4'P/ reparar',_utf8mb4'Reservado',_utf8mb4'Técnico',_utf8mb4'Vendido')))
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispensers`
--

LOCK TABLES `dispensers` WRITE;
/*!40000 ALTER TABLE `dispensers` DISABLE KEYS */;
INSERT INTO `dispensers` VALUES (1,'U-274505-6290','Ushuaia','Comodato','2019-03-26',NULL),(2,'A-36601-35127','Aquadisp','Comodato','2019-05-02',NULL),(3,'A-53197-110009','Aquadisp','Comodato','2019-11-01',NULL),(4,'A-53178-110010','Aquadisp','Comodato','2019-08-28',NULL),(5,'H-40126-110028','Humma','Comodato','2019-05-23',NULL),(6,'A-53230-110054','Aquadisp','Comodato','2019-05-16',NULL),(7,'H-40325-110071','Humma','Comodato','2019-11-28',NULL),(8,'H-40601-110079','Humma','Comodato','2019-03-26',NULL),(9,'H-40255-110082','Humma','Comodato','2019-11-29',NULL),(10,'H-40440-110089','Humma','Comodato','2019-04-13',NULL),(11,'H-40304-110091','Humma','Comodato','2020-04-20',NULL),(12,'H-40282-110094','Humma','Comodato','2019-05-30',NULL),(13,'H-40374-110098','Humma','Comodato','2019-11-02',NULL),(14,'H-120002-112401','Humma','Comodato','2020-05-11',NULL),(15,'H-120008-112403','Humma','Comodato','2020-05-08',NULL),(16,'H-120078-112413','Humma','Comodato','2019-12-05',NULL),(17,'H-120080-112414','Humma','Comodato','2024-03-06',NULL),(18,'H-120088-112416','Humma','Comodato','2019-06-22',NULL),(19,'H-120096-112417','Humma','Comodato','2020-06-05',NULL),(20,'H-120121-112422','Humma','Comodato','2019-05-27',NULL),(21,'H-120141-112426','Humma','Comodato','2020-01-27',NULL),(22,'H-120158-112430','Humma','Comodato','2019-04-03',NULL),(23,'H-120187-112434','Humma','Comodato','2019-06-10',NULL),(24,'H-120219-112438','Humma','Comodato','2019-04-16',NULL),(25,'H-120242-112444','Humma','Comodato','2019-12-09',NULL),(26,'H-120245-112445','Humma','Comodato','2019-04-01',NULL),(27,'H-120277-112449','Humma','Comodato','2020-04-30',NULL),(28,'H-120285-112450','Humma','Comodato','2019-12-13',NULL),(29,'H-20291-112451','Humma','Comodato','2021-06-15',NULL),(30,'H-20329-112456','Humma','Comodato','2019-05-18',NULL),(31,'H-120398-112463','Humma','Comodato','2019-03-26',NULL),(32,'H-120411-112465','Humma','Comodato','2019-03-28',NULL),(33,'H-120414-112466','Humma','Comodato','2020-04-24',NULL),(34,'H-120415-112467','Humma','Comodato','2020-04-06',NULL),(35,'A-78413-112490','Aquadisp','Comodato','2020-07-03',NULL),(36,'A-78061-112493','Aquadisp','Comodato','2019-05-29',NULL),(37,'A-77778-112495','Aquadisp','Comodato','2019-03-26',NULL),(38,'A-78080-112499','Aquadisp','Comodato','2019-05-06',NULL),(39,'H-41086-116702','Humma','Comodato','2020-04-24',NULL),(40,'H-40826-116706','Humma','Comodato','2019-11-01',NULL),(41,'H-40817-116710','Humma','Comodato','2020-01-25',NULL),(42,'H-40711-116715','Humma','Comodato','2019-08-14',NULL),(43,'H-40716-116717','Humma','Comodato','2019-03-27',NULL),(44,'H-40989-116718','Humma','Comodato','2019-05-17',NULL),(45,'H-40982-116720','Humma','Comodato','2019-03-26',NULL),(46,'H-41030-116723','Humma','Comodato','2019-10-01',NULL),(47,'H-40356-116736','Humma','Comodato','2019-06-12',NULL),(48,'H-40329-116738','Humma','Comodato','2020-06-06',NULL),(49,'H-40113-116746','Humma','Comodato','2019-10-31',NULL),(50,'H-40478-116750','Humma','Comodato','2021-06-15',NULL),(51,'H-40724-116752','Humma','Comodato','2021-05-06',NULL),(52,'H-40975-116753','Humma','Comodato','2019-12-26',NULL),(53,'H-40858-116758','Humma','Comodato','2019-07-12',NULL),(54,'H-40346-116759','Humma','Comodato','2020-01-30',NULL),(55,'H-41015-116761','Humma','Comodato','2019-07-03',NULL),(56,'H-40719-116762','Humma','Comodato','2020-01-09',NULL),(57,'H-40316-116768','Humma','Comodato','2019-03-26',NULL),(58,'H-40754-116771','Humma','Comodato','2019-08-08',NULL),(59,'H-40361-116776','Humma','Comodato','2020-07-03',NULL),(60,'H-40462-116778','Humma','Comodato','2019-06-06',NULL),(61,'H-40384-116779','Humma','Comodato','2019-04-13',NULL),(62,'H-41259-116783','Humma','Comodato','2019-07-24',NULL),(63,'H-40489-116788','Humma','Comodato','2020-10-07',NULL),(64,'H-40332-116790','Humma','Comodato','2019-10-31',NULL),(65,'H-40437-116792','Humma','Comodato','2019-09-27',NULL),(66,'H-40219-116796','Humma','Comodato','2019-08-09',NULL),(67,'U---136209','Ushuaia','Comodato','2020-05-18',NULL),(68,'H-120865-136248','Humma','Comodato','2019-06-14',NULL),(69,'U-259542-136260','Ushuaia','Comodato','2019-10-26',NULL),(70,'H-120858-136285','Humma','Comodato','2019-12-16',NULL),(71,'H-120860-136286','Humma','Comodato','2020-02-24',NULL),(72,'U-279277-136296','Ushuaia','Comodato','2019-12-23',NULL),(73,'U----136300','Ushuaia','Comodato','2019-11-26',NULL),(74,'H-10447-350104','Humma','Comodato','2020-03-06',NULL),(75,'H-10456-350105','Humma','Comodato','2019-03-26',NULL),(76,'A-37311-350116','Aquadisp','Comodato','2019-04-30',NULL),(77,'A-37249-350118','Aquadisp','Comodato','2019-11-29',NULL),(78,'A-37533-350120','Aquadisp','Comodato','2019-12-27',NULL),(79,'A-37552-350123','Aquadisp','Comodato','2019-04-01',NULL),(80,'A-37279-350124','Aquadisp','Comodato','2019-04-18',NULL),(81,'A-37488-350125','Aquadisp','Comodato','2019-10-29',NULL),(82,'A-37531-350128','Aquadisp','Comodato','2019-06-21',NULL),(83,'A-37554-350130','Aquadisp','Comodato','2019-11-28',NULL),(84,'A-37155-350136','Aquadisp','Comodato','2021-04-14',NULL),(85,'A-37505-350138','Aquadisp','Comodato','2019-11-14',NULL),(86,'A-37243-350142','Aquadisp','Comodato','2019-05-07',NULL),(87,'A-37251-350146','Aquadisp','Comodato','2020-01-30',NULL),(88,'A-37532-350147','Aquadisp','Comodato','2019-10-18',NULL),(89,'A-36793-350156','Aquadisp','Comodato','2019-10-24',NULL),(90,'A-37520-350160','Aquadisp','Comodato','2019-08-19',NULL),(91,'A-37460-350165','Aquadisp','Comodato','2020-01-04',NULL),(92,'A-37526-350169','Aquadisp','Comodato','2019-05-27',NULL),(93,'A-37506-350185','Aquadisp','Comodato','2019-09-16',NULL),(94,'A-37046-350186','Aquadisp','Comodato','2019-04-18',NULL),(95,'A-37166-350187','Aquadisp','Comodato','2019-09-12',NULL),(96,'U-350194-350194','Ushuaia','Comodato','2019-05-13',NULL),(97,'H-71040-554101','Humma','Comodato','2019-05-16',NULL),(98,'H-80750-554119','Humma','Comodato','2019-04-08',NULL),(99,'H-70673-554122','Humma','Comodato','2019-12-06',NULL),(100,'H-80381-554123','Humma','Comodato','2019-12-06',NULL),(101,'A-52803-554138','Aquadisp','Comodato','2019-12-14',NULL),(102,'A-52997-554139','Aquadisp','Comodato','2019-05-31',NULL),(103,'A-53239-554144','Aquadisp','Comodato','2019-04-01',NULL),(104,'A-52986-554145','Aquadisp','Comodato','2020-01-08',NULL),(105,'A-53201-554164','Aquadisp','Comodato','2020-04-09',NULL),(106,'A-52790-554171','Aquadisp','Comodato','2020-01-21',NULL),(107,'A-53006-554183','Aquadisp','Comodato','2019-04-24',NULL),(108,'A-70117-554190','Aquadisp','Comodato','2019-12-23',NULL),(109,'A-36600-606901','Aquadisp','Comodato','2019-10-18',NULL),(110,'U-317600-606904','Ushuaia','Comodato','2020-09-08',NULL),(111,'A-36617-606913','Aquadisp','Comodato','2019-10-18',NULL),(112,'U-319492-606921','Ushuaia','Comodato','2020-09-08',NULL),(113,'U-318147-606922','Ushuaia','Comodato','2020-09-08',NULL),(114,'U-318156-606925','Ushuaia','Comodato','2020-09-08',NULL),(115,'U-317614-606926','Ushuaia','Comodato','2020-09-08',NULL),(116,'U-318302-606927','Ushuaia','Comodato','2020-09-08',NULL),(117,'H-80825-606934','Humma','Comodato','2019-12-24',NULL),(118,'A-52981-606935','Aquadisp','Comodato','2019-10-07',NULL),(119,'A-37261-606936','Aquadisp','Comodato','2019-03-26',NULL),(120,'U-271083-606938','Ushuaia','Comodato','2019-08-01',NULL),(121,'H-120170-606939','Humma','Comodato','2019-03-26',NULL),(122,'H-40722-606942','Humma','Comodato','2019-08-13',NULL),(123,'A-570123-606948','Aquadisp','Comodato','2019-12-04',NULL),(124,'A-570250-606949','Aquadisp','Comodato','2019-12-04',NULL),(125,'H-40727-606959','Humma','Comodato','2019-05-16',NULL),(126,'U-274515-606964','Ushuaia','Comodato','2019-10-24',NULL),(127,'A-53222-606970','Aquadisp','Comodato','2019-07-02',NULL),(128,'A-78255-606976','Aquadisp','Comodato','2019-03-26',NULL),(129,'H-80677-606978','Humma','Comodato','2019-07-15',NULL),(130,'U-606980-606980','Ushuaia','Comodato','2019-03-26',NULL),(131,'U-275031-606981','Ushuaia','Comodato','2019-03-26',NULL),(132,'U---606993','Ushuaia','Comodato','2020-04-24',NULL),(133,'U-268252-606995','Ushuaia','Comodato','2020-11-06',NULL),(134,'U-318365-639206','Ushuaia','Comodato','2020-09-08',NULL),(135,'U-318101-639207','Ushuaia','Comodato','2020-09-08',NULL),(136,'U-318169-639208','Ushuaia','Comodato','2020-09-08',NULL),(137,'A-52807-639209','Aquadisp','Comodato','2020-09-16',NULL),(138,'U-318166-639210','Ushuaia','Comodato','2020-09-08',NULL),(139,'U-335594-639234','Ushuaia','Comodato','2021-03-01',NULL),(140,'U-275027-639242','Ushuaia','Comodato','2019-04-13',NULL),(141,'A-70167-639248','Aquadisp','Comodato','2019-03-26',NULL),(142,'H-120171-639251','Humma','Comodato','2020-12-04',NULL),(143,'H-80625-639251','Humma','Comodato','2020-12-05',NULL),(144,'A-52809-639253','Aquadisp','Comodato','2019-04-30',NULL),(145,'A-53237-639257','Aquadisp','Comodato','2020-12-18',NULL),(146,'H-40319-639261','Humma','Comodato','2019-07-13',NULL),(147,'A-37487-639268','Aquadisp','Comodato','2019-10-09',NULL),(148,'H-71121-639273','Humma','Comodato','2019-11-23',NULL),(149,'H-40419-639278','Humma','Comodato','2019-11-06',NULL),(150,'A-52784-639286','Aquadisp','Comodato','2019-04-12',NULL),(151,'A-78251-950404','Aquadisp','Comodato','2019-12-04',NULL),(152,'A-78802-950405','Aquadisp','Comodato','2020-01-01',NULL),(153,'A-78399-950407','Aquadisp','Comodato','2019-05-31',NULL),(154,'A-69992-950408','Aquadisp','Comodato','2019-03-27',NULL),(155,'A-77632-950409','Aquadisp','Comodato','2019-05-03',NULL),(156,'A-78423-950415','Aquadisp','Comodato','2020-03-16',NULL),(157,'A-78011-950419','Aquadisp','Comodato','2019-08-13',NULL),(158,'A-70049-950471','Aquadisp','Comodato','2020-02-06',NULL),(159,'A-78089-950474','Aquadisp','Comodato','2019-05-17',NULL),(160,'A-70665-950479','Aquadisp','Comodato','2019-08-08',NULL),(161,'A-70256-950481','Aquadisp','Comodato','2019-05-18',NULL),(162,'A-77836-950484','Aquadisp','Comodato','2019-05-16',NULL),(163,'A-77651-950493','Aquadisp','Comodato','2020-02-06',NULL),(164,'A-70640-950494','Aquadisp','Comodato','2019-10-07',NULL),(165,'A-77815-950496','Aquadisp','Comodato','2020-01-07',NULL),(166,'A-78286-112500','Aquadisp','Nuevo','2021-04-13',NULL),(167,'A-37281-350113','Aquadisp','Nuevo','2021-01-28',NULL),(168,'U-335402-639231','Ushuaia','Nuevo','2021-02-04',NULL),(169,'U-335109-639232','Ushuaia','Nuevo','2021-02-04',NULL),(170,'U-335118-639233','Ushuaia','Nuevo','2021-02-06',NULL),(171,'U-335434-639250','Ushuaia','Nuevo','2021-02-02',NULL),(172,'A---639256','Aquadisp','Nuevo','2021-05-10',NULL),(173,'H-40814-639263','Humma','Nuevo','2021-05-28',NULL),(174,'A-57433-950482','Aquadisp','Nuevo','2021-04-13',NULL),(175,'H-40449-11088','Humma','Usado','2021-07-05',NULL),(176,'A-53131-110007','Aquadisp','Usado','2020-02-04',NULL),(177,'U-257467-110015','Ushuaia','Usado','2019-03-26',NULL),(178,'H-40592-110034','Humma','Usado','2021-05-06',NULL),(179,'H-120026-112407','Humma','Usado','2020-04-16',NULL),(180,'H-120065-112411','Humma','P/ reparar','2020-02-10',NULL),(181,'H-120100-112419','Humma','P/ reparar','2020-06-12',NULL),(182,'H-40818-116708','Humma','P/ reparar','2019-06-04',NULL),(183,'H-41072-116764','Humma','P/ reparar','2021-07-01',NULL),(184,'H-40409-116787','Humma','P/ reparar','2020-02-06',NULL),(185,'H-40413-116800','Humma','P/ reparar','2021-04-30',NULL),(186,'U-318190-350147','Ushuaia','P/ reparar','2020-09-08',NULL),(187,'A-37457-350167','Aquadisp','P/ reparar','2019-12-03',NULL),(188,'U-318175-606906','Ushuaia','P/ reparar','2020-09-08',NULL),(189,'A-70349-606924','Aquadisp','P/ reparar','2019-04-30',NULL),(190,'U-274500-606937','Ushuaia','P/ reparar','2019-08-01',NULL),(191,'A---606961','Aquadisp','P/ reparar','2019-10-30',NULL),(192,'A-53245-606962','Aquadisp','P/ reparar','2019-11-07',NULL),(193,'A-77631-950420','Aquadisp','P/ reparar','2019-10-29',NULL),(194,'A-70354-950488','Aquadisp','P/ reparar','2019-05-16',NULL),(195,'H-120190-112435','Humma','Reservado','2019-05-09',NULL),(196,'A-37310-606977','Aquadisp','Reservado','2019-05-16',NULL),(197,'A-32685-110020','Aquadisp','Técnico','2020-08-10',NULL),(198,'A-32909-110051','Aquadisp','Técnico','2019-06-13',NULL),(199,'A-52982-554146','Aquadisp','Técnico','2019-08-22',NULL),(200,'A-78106-950449','Aquadisp','Técnico','2020-07-28',NULL),(201,'A-53217-110052','Aquadisp','Vendido','2019-05-16','2019-06-16'),(202,'H-40335-110076','Humma','Vendido','2019-11-29','2019-11-30'),(203,'H-120293-112452','Humma','Vendido','2019-05-06','2019-07-05'),(204,'H-110639-136274','Humma','Vendido','2019-03-26','2019-04-15'),(205,'A-37491-350149','Aquadisp','Vendido','2019-05-31','2019-06-15'),(206,'A-570409-606946','Aquadisp','Vendido','2019-12-04','2019-12-07'),(207,'A-570423-606947','Aquadisp','Vendido','2019-12-04','2019-12-07'),(208,'A-570254-606953','Aquadisp','Vendido','2019-12-04','2019-12-07'),(209,'A-570089-606954','Aquadisp','Vendido','2019-12-04','2019-12-14'),(210,'A-570268-606955','Aquadisp','Vendido','2019-12-04','2019-12-09'),(211,'A-570092-606956','Aquadisp','Vendido','2019-12-04','2019-12-05'),(212,'A-570190-606957','Aquadisp','Vendido','2019-12-04','2019-12-05'),(213,'A-570026-606958','Aquadisp','Vendido','2019-12-04','2019-12-05');
/*!40000 ALTER TABLE `dispensers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domicilios`
--

DROP TABLE IF EXISTS `domicilios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domicilios` (
  `id_domicilio` int NOT NULL AUTO_INCREMENT,
  `latitud` decimal(17,13) DEFAULT NULL,
  `longitud` decimal(17,13) DEFAULT NULL,
  `calle` varchar(100) NOT NULL,
  `altura` int DEFAULT NULL,
  `barrio` varchar(30) DEFAULT NULL,
  `otro` varchar(30) DEFAULT NULL,
  `id_localidad` int DEFAULT NULL,
  PRIMARY KEY (`id_domicilio`),
  UNIQUE KEY `id_domicilio` (`id_domicilio`),
  KEY `id_localidad` (`id_localidad`),
  CONSTRAINT `domicilios_ibfk_1` FOREIGN KEY (`id_localidad`) REFERENCES `localidades` (`id_localidad`)
) ENGINE=InnoDB AUTO_INCREMENT=470 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domicilios`
--

LOCK TABLES `domicilios` WRITE;
/*!40000 ALTER TABLE `domicilios` DISABLE KEYS */;
INSERT INTO `domicilios` VALUES (1,-27.3746298000000,-59.0986756000000,'Mz. 30 Pc. 14',NULL,'49 Viviendas',NULL,4),(2,-27.3714065000000,-59.0974838000000,'Martiniano Gomez',NULL,'2 Viviendas',NULL,4),(3,-27.3717883000000,-59.0972117000000,'MZ 27 PC 16',NULL,'2 Viviendas',NULL,4),(4,-27.3721802000000,-59.0959424000000,'Santiago Del Estero',NULL,NULL,NULL,4),(5,-27.3691087000000,-59.0947402000000,'Puerto Tirol S/N',NULL,NULL,NULL,4),(6,-27.3716692000000,-59.0944434000000,'Casa',7,NULL,NULL,4),(7,-27.3726844000000,-59.0934762000000,'Av. Coronel Avalos',17,'17 De Octubre',NULL,4),(8,-27.3828718000000,-59.0905391000000,'Mario Canella (Casi Av. Italia)',NULL,NULL,NULL,4),(9,-27.3816944500000,-59.0881798100000,'Rivadavia',15,NULL,NULL,4),(10,-27.3729397000000,-59.0877545000000,'12 De Octubre 0',NULL,NULL,NULL,4),(11,-27.3876190000000,-59.0850907000000,'Casa',6,'Evita  1 Viviendas',NULL,4),(12,-27.3875917000000,-59.0842950000000,'Casa 22',NULL,'25 Viviendas',NULL,4),(13,-27.4211887000000,-59.0553075000000,'Mz 5 Pc 13',13,NULL,NULL,5),(14,-27.4168825000000,-59.0495665000000,'Mz 52 Pc 07',7,'444 Viviendas',NULL,5),(15,-27.4559163000000,-59.0490473000000,'Mz 69 pc 18 (Lago Argentino y Tapir)',18,NULL,NULL,1),(16,-27.4162653000000,-59.0484880000000,'Mz 43 Pc 20',2,'444 Viviendas',NULL,5),(17,-27.4590386000000,-59.0477222000000,'Ciervo de los Pantanos',2937,NULL,NULL,1),(18,-27.4135516000000,-59.0477151000000,'Pasaje Rivadavia',122,NULL,NULL,1),(19,-27.4564609000000,-59.0475957000000,'Ch 135 Mz 40 Pc 20',2,NULL,NULL,1),(20,-27.4222149000000,-59.0475844000000,'Mz. 38 Pc.',NULL,'Nueva Esperanza',NULL,5),(21,-27.4564991000000,-59.0457780000000,'Cataratas Del Iguazu',3597,'16 Viviendas',NULL,1),(22,-27.4106890000000,-59.0436928000000,'Mz 15 Pc',19,'Independencia',NULL,5),(23,-27.4224953000000,-59.0421024000000,'Av. Augusto Rey',1300,'Santa Ines',NULL,1),(24,-27.4133672000000,-59.0409443000000,'Mz 92 Pc 3',NULL,'263 Viviendas',NULL,5),(25,-27.4033058000000,-59.0405558000000,'25 De Mayo',6000,'Independencia',NULL,5),(26,-27.4513715000000,-59.0395683000000,'Mz. 92 Pc. 6',NULL,'16 Viviendas',NULL,1),(27,-27.4117087000000,-59.0392160000000,'Mz 84 Pc21',21,'14 Viviendas',NULL,5),(28,-27.4118103000000,-59.0390495000000,'Mz 84 Pc',1,'263 Viviendas',NULL,5),(29,-27.4120494000000,-59.0387243000000,'Mz. 84 Pc. 3',NULL,'263 Viviendas',NULL,5),(30,-27.4433146000000,-59.0378158000000,'Chapadmalal',2199,'Barrio Los Pinos',NULL,1),(31,-27.4175892000000,-59.0368498000000,'Av. Augusto Rey',680,'444 Viviendas',NULL,5),(32,-27.4509711000000,-59.0366767000000,'Barberan',NULL,NULL,NULL,1),(33,-27.4295728000000,-59.0348976000000,'Mz. 09 Pc. 144',NULL,'124 Viviendas',NULL,5),(34,-27.4114441000000,-59.0345436000000,'Brasil y Pasaje Peron',4500,'Villa Allin',NULL,5),(35,-27.4135611000000,-59.0335553000000,'Mz. 77 Pc. 11',NULL,'125 Viviendas',NULL,5),(36,-27.4307512000000,-59.0328409000000,'Pz. 24 Pc. 09',NULL,'124 Viviendas',NULL,5),(37,-27.4261350000000,-59.0319536000000,'Ch. 48 Mz. 02 Pc. 20',NULL,'José Hernandez',NULL,5),(38,-27.4591959000000,-59.0310749000000,'Cerca De La Terminal',NULL,NULL,NULL,1),(39,-27.4552605000000,-59.0306911000000,'Isaias 2714',NULL,NULL,NULL,1),(40,-27.4104625000000,-59.0288104000000,'Av. Cacique Pelayo',41,'Evita',NULL,5),(41,-27.4264770000000,-59.0275051000000,'Calle',33,'Villa Sarmiento',NULL,5),(42,-27.4118041000000,-59.0272455000000,'Mz 16 Pc4',4,'56 Viviendas',NULL,5),(43,-27.4308149000000,-59.0270700000000,'Av. Almirante Brown lote',3656,NULL,NULL,1),(44,-27.4213457000000,-59.0264032000000,'Mz. 109 Pc. 6',NULL,'8 Viviendas',NULL,5),(45,-27.4168653000000,-59.0252538000000,'Av. 25 De Mayo',4175,'Villa Allin',NULL,5),(46,-27.4488555000000,-59.0251719000000,'Mz 41 Pc 18',18,NULL,NULL,3),(47,-27.4277958000000,-59.0250154000000,'Ch 44 Mz 54 Pc10',1,NULL,NULL,5),(48,-27.4195962000000,-59.0248996000000,'Ch. 43 Mz. 6 Pc. 08',NULL,'Villa Allin',NULL,5),(49,-27.4254708000000,-59.0248591000000,'Casa 174 mz 79',NULL,'18 Viviendas',NULL,5),(50,-27.4561705000000,-59.0245623000000,'Av. Mac Lean',2347,NULL,NULL,1),(51,-27.4255970000000,-59.0227708000000,'Santiago Del Estero',3500,NULL,NULL,5),(52,-27.4523931000000,-59.0213337000000,'Mz 57 Pc 27',27,NULL,NULL,1),(53,-27.4216561000000,-59.0199831000000,'Av. 25 De Mayo 3550',3550,'Villa Oro',NULL,5),(54,-27.4251077000000,-59.0196867000000,'Mz. 11 Pc. 18',NULL,'Villa Oro (45 Viviendas)',NULL,5),(55,-27.4577970000000,-59.0195455000000,'Av. Mac Lean',26,NULL,'Centro Comercial Santa Ines',1),(56,-27.4591291000000,-59.0171292000000,'Mz. 98 Casa 959',NULL,'Santa Ines',NULL,1),(57,-27.4602661000000,-59.0166405000000,'Mz 101 Casa 909',NULL,'Santa Ines',NULL,1),(58,-27.4530743000000,-59.0149982000000,'S/D Nuñez Estela - Villa Don Enrique',NULL,NULL,NULL,1),(59,-27.4570692000000,-59.0147701000000,'Complejo Jaime Zapata',NULL,NULL,NULL,1),(60,-27.4509564000000,-59.0147285000000,'Mc Clean Y Marconi S/N',NULL,NULL,NULL,1),(61,-27.4445516000000,-59.0142445000000,'Mz. 86 Pc. 8 Casa 7',NULL,'España',NULL,1),(62,-27.4462269000000,-59.0137668000000,'Mz 25 Pc 2',2,'Provincias Unidas',NULL,1),(63,-27.4495518000000,-59.0135219000000,'Av. Urquiza',1988,NULL,NULL,1),(64,-27.4495640000000,-59.0134112000000,'Av. Mac Lean',152,NULL,NULL,1),(65,-27.4530855000000,-59.0133132000000,'20 De Junio',13,'Villa Don Enrique',NULL,1),(66,-27.4494538000000,-59.0131868000000,'Av. Mac Lean',1435,'La Liguria',NULL,1),(67,-27.4278897000000,-59.0129626000000,'Av. 25 De Mayo 2903 - San Javier',NULL,NULL,NULL,1),(68,-27.4837269000000,-59.0124590000000,'Av. Wilde',669,'Emercenciano',NULL,1),(69,-27.4810342000000,-59.0124439000000,'Av. San Martin',33,'Emerenciano',NULL,1),(70,-27.4692953000000,-59.0116127000000,'Necochea',2535,'Villa Don Alberto',NULL,1),(71,-27.4275961000000,-59.0109304000000,'Lote',216,'Vº Elba',NULL,1),(72,-27.4357935000000,-59.0104538000000,'Salta 2275',NULL,NULL,NULL,1),(73,-27.4223956000000,-59.0099486000000,'Ruta 11 Km.',16,NULL,NULL,1),(74,-27.4612970000000,-59.0077353000000,'Olegario Andrade',566,NULL,NULL,1),(75,-27.4214439000000,-59.0076663000000,'Ruta Nacional Nº 11 Km',1006,NULL,NULL,1),(76,-27.4412851000000,-59.0076599000000,'Mansilla',564,NULL,NULL,1),(77,-27.4583762000000,-59.0073054000000,'Av. Marconi',725,'Villa Progreso',NULL,1),(78,-27.4435938000000,-59.0067695000000,'Av. Mac Lean 686',NULL,NULL,NULL,1),(79,-27.4671715000000,-59.0064529000000,'Fortin Alvarado',615,NULL,NULL,1),(80,-27.4451325000000,-59.0064369000000,'Fray Rossi',779,'Villa Adelanto',NULL,1),(81,-27.4690580300000,-59.0062942100000,'Av. Alberdi',2201,'La Liguria',NULL,1),(82,-27.4627015000000,-59.0061467000000,'Av. Urquiza',5611,NULL,NULL,1),(83,-27.4412077000000,-59.0058786000000,'Uriburi',496,'Villa Universidad',NULL,1),(84,-27.4402943000000,-59.0058463000000,'Santiago Del Estero',1753,'Villa Seitor',NULL,1),(85,-27.4680904000000,-59.0054219000000,'Alberdi',2135,'Centenario',NULL,1),(86,-27.4772961000000,-59.0049607000000,'Ch 209 Mz 98 Pc 25',25,'24 Viviendas Palermo',NULL,1),(87,-27.4355217000000,-59.0046772000000,'Av. 25 De Mayo',225,NULL,NULL,1),(88,-27.4356981000000,-59.0045312000000,'Av. 25 de Mayo',2005,'Villa Alta',NULL,1),(89,-27.4386046000000,-59.0042308000000,'JUAN DOMINGO PERON',1775,'Provincias Unidas',NULL,1),(90,-27.4852264000000,-59.0038986000000,'Mz. 16 Pc. 25',NULL,'17 De Octubre',NULL,1),(91,-27.4693237000000,-59.0031420000000,'Jose María Paz',265,NULL,NULL,1),(92,-27.4774859000000,-59.0026397000000,'Pasaje San Lorenzo',2562,'Palermo 2',NULL,1),(93,-27.4373069000000,-59.0020446000000,'San Carlos SN',NULL,NULL,NULL,1),(94,-27.4506986000000,-59.0014536000000,'Av. Alvear 865',NULL,NULL,NULL,1),(95,-27.4375898000000,-59.0007786000000,'Santa Fe',151,NULL,NULL,1),(96,-27.4370457000000,-59.0007114000000,'M. T. De Alvear',1683,NULL,NULL,1),(97,-27.4561371000000,-59.0005553000000,'Av. Belgrano',1131,NULL,NULL,1),(98,-27.4441150000000,-59.0002690000000,'Padre Sena',337,'Villa Alta',NULL,1),(99,-27.4514567000000,-58.9999230000000,'Echeverria',628,NULL,NULL,1),(100,-27.4074553000000,-58.9998586000000,'Lote',216,'Vº Elba',NULL,1),(101,-27.4326844000000,-58.9992515000000,'Pasaje Palamedi',1865,'Villa Chica',NULL,1),(102,-27.4328094200000,-58.9991471300000,'Pasaje Entre Rios',1845,NULL,NULL,1),(103,-27.4438016000000,-58.9982025000000,'Juan D. Peron Y Calle 3',NULL,NULL,NULL,1),(104,-27.4599945000000,-58.9981957000000,'Santa Maria De Oro',1255,NULL,NULL,1),(105,-27.4600228000000,-58.9981084000000,'Santa Maria De Oro',1245,NULL,NULL,1),(106,-27.4473900000000,-58.9976266000000,'Santiago Del Estero',866,NULL,NULL,1),(107,-27.4473936000000,-58.9975929000000,'Santiago Del Estero 864',NULL,NULL,NULL,1),(108,-27.4329438800000,-58.9975861300000,'Av. Rivadavia',1752,NULL,NULL,1),(109,-27.4567596800000,-58.9975525300000,'Molina',274,NULL,NULL,1),(110,-27.4568859300000,-58.9974390800000,'Molina',26,NULL,NULL,1),(111,-27.4029416000000,-58.9972785000000,'Ruta 11 Km.',1009,'Villa Cristo Rey',NULL,1),(112,-27.4430838000000,-58.9972283000000,'Julio A. Roca 1100',NULL,NULL,NULL,1),(113,-27.4527733000000,-58.9970362000000,'Av. Belgrano 701',NULL,NULL,NULL,1),(114,-27.4542217000000,-58.9962164000000,'Ch 101 Mz 28 Pc 12',12,NULL,NULL,1),(115,-27.4323616000000,-58.9961930000000,'Jose Ameri',627,'Villa Chica',NULL,1),(116,-27.4448771000000,-58.9961502000000,'Av. 25 de mayo',821,NULL,NULL,1),(117,-27.4558901000000,-58.9955849000000,'Av. Alvear',235,NULL,NULL,1),(118,-27.4565647000000,-58.9943233000000,'Alvear Y Santa Maria De Oro',NULL,NULL,NULL,1),(119,-27.4488272900000,-58.9942166500000,'Tuyuti',25,NULL,NULL,1),(120,-27.4654593000000,-58.9942144000000,'Mz 6 Pc 35',35,'2 De Agosto',NULL,1),(121,-27.4338810000000,-58.9937491000000,'Catamarca',1487,'Villa Perrando',NULL,1),(122,-27.4707830500000,-58.9933892900000,'Av. Edison',844,NULL,'Dpto G PB',1),(123,-27.4574764000000,-58.9933880000000,'Av. Castelli',13,'Centro',NULL,1),(124,-27.4570632500000,-58.9933768300000,'Av. Alberdi',794,NULL,NULL,1),(125,-27.4643390000000,-58.9932048000000,'Dodero',454,NULL,NULL,1),(126,-27.4834210000000,-58.9932036000000,'Mza 19 Qta 4 Dpto 02/02',2,'Guiraldes',NULL,1),(127,-27.4470780000000,-58.9931175000000,'Av. Wilde',43,NULL,NULL,1),(128,-27.4835816000000,-58.9929239000000,'Mz 19 Dpto 01 Qta 4',4,'Guiraldes',NULL,1),(129,-27.4601190000000,-58.9925944000000,'Leandro N. Alem',242,'Villa Centenario',NULL,1),(130,-27.4532913000000,-58.9924488000000,'Vedia',484,NULL,NULL,1),(131,-27.4335147000000,-58.9921239000000,'Av. Lavalle',1415,'Villa Perrando',NULL,1),(132,-27.4532377000000,-58.9920607000000,'Vedia',475,NULL,NULL,1),(133,-27.4460794000000,-58.9920231000000,'Av. 25 De Mayo',64,NULL,NULL,1),(134,-27.3787531000000,-58.9920053000000,'Ruta 11 Km',1011,NULL,NULL,1),(135,-27.4485331000000,-58.9919398000000,'Av. 25 de mayo',343,NULL,NULL,1),(136,-27.4529201000000,-58.9918648000000,'Vedia',417,'Centro',NULL,1),(137,-27.4593868000000,-58.9918245000000,'Av. Castelli 214',NULL,NULL,NULL,1),(138,-27.4493843000000,-58.9913973000000,'Donovan',160,'Villa Odorico',NULL,1),(139,-27.4404573000000,-58.9906679000000,'San Buenaventura del Montealto',445,'Villa Donovan',NULL,1),(140,-27.4420448000000,-58.9906585000000,'Av. Avalos',351,'Centro',NULL,1),(141,-27.4540359000000,-58.9901375000000,'Santiago Del Estero 18',NULL,NULL,NULL,1),(142,-27.4509797000000,-58.9899952000000,'Juan Domingo Peron',22,NULL,NULL,1),(143,-27.4465024000000,-58.9898324000000,'Av. Wilde',99,'Microcentro',NULL,1),(144,-27.4525481000000,-58.9897548000000,'Santa María De Oro',277,'Centro',NULL,1),(145,-27.4568240000000,-58.9897040000000,'Pasaje Del Teatro',63,'Centro',NULL,1),(146,-27.4472462200000,-58.9889677600000,'Marcelo T De Alvear',384,NULL,NULL,1),(147,-27.4361774000000,-58.9889545000000,'Av. Lavalle',176,NULL,NULL,1),(148,-27.4838744000000,-58.9889363000000,'Mz 7 Pc 1 Qta2',2,'Bº Guiraldes',NULL,1),(149,-27.4428867000000,-58.9886988000000,'Entre Ríos',656,NULL,NULL,1),(150,-27.4510494000000,-58.9886427000000,'Julio A Roca',127,NULL,NULL,1),(151,-27.4871747000000,-58.9883355000000,'Mz35 Pc7',NULL,'Upcp',NULL,1),(152,-27.4872616900000,-58.9881443900000,'B° Upcp',NULL,'Upcp',NULL,3),(153,-27.4366727000000,-58.9880985000000,'Av. Lavalle',1,NULL,NULL,1),(154,-27.4544704000000,-58.9880204000000,'Obligado',127,'Centro',NULL,1),(155,-27.4487530000000,-58.9875440000000,'Pueyrredon',97,'17 Viviendas',NULL,1),(156,-27.4381979000000,-58.9873684000000,'Av. Lavalle',826,NULL,NULL,1),(157,-27.4493833000000,-58.9872110000000,'Marcelo T de Alvear',145,NULL,NULL,1),(158,-27.4765256000000,-58.9869900000000,'Mz 93 Uf 3 S/N',3,'Italoargentino',NULL,1),(159,-27.4539981000000,-58.9863409000000,'José María Paz',170,NULL,NULL,1),(160,-27.4538333000000,-58.9862773000000,'Jose Maria Paz',170,NULL,NULL,1),(161,-27.3952611000000,-58.9860699000000,'San Pablo Y Misiones',NULL,NULL,NULL,5),(162,-27.4409115000000,-58.9853703000000,'Pje Wilde',876,NULL,NULL,1),(163,-27.4882904000000,-58.9852480000000,'Urquiza',222,'San Valentin',NULL,1),(164,-27.4500946000000,-58.9850951000000,'Av. Sarmiento',146,NULL,NULL,1),(165,-27.4506107000000,-58.9849280000000,'Pellegrini',280,'Malvinas',NULL,3),(166,-27.4721937000000,-58.9846195000000,'Lestani',1438,'Amtter','Mz 72 Pc 6',1),(167,-27.4719102000000,-58.9845774000000,'Dr. Arturo Lestani (Mz 56 Pc 16)',145,'Llaponagat',NULL,1),(168,-27.4688606000000,-58.9843182000000,'Mz. 58 Pc. 4 Uf. 1',NULL,'Llaponagat',NULL,1),(169,-27.4535893900000,-58.9841766300000,'Roque Saenz Peña',18,NULL,NULL,1),(170,-27.4529760000000,-58.9840662000000,'Av. 9 de julio',259,NULL,NULL,1),(171,-27.4522619000000,-58.9840473000000,'Pellegrini',62,NULL,NULL,1),(172,-27.4547718000000,-58.9836409000000,'Colon',66,'Juan B. Alverdi',NULL,1),(173,-27.4539998200000,-58.9834741700000,'Av. 9 De Julio',360,NULL,NULL,1),(174,-27.4019577000000,-58.9830560000000,'Mz. 11 Casa 6',NULL,'Mapic 2',NULL,1),(175,-27.4559346000000,-58.9830509000000,'Av. San Martín',118,'La Liguria',NULL,1),(176,-27.4254690000000,-58.9824497000000,'Padre Juan Nicolau Nº 354 Bº La Isla Villa Rio Negro',NULL,NULL,NULL,1),(177,-27.4576830000000,-58.9823354000000,'Arturo Illia',655,NULL,NULL,1),(178,-27.4441878000000,-58.9820804000000,'Catamarca',197,'Microcentro',NULL,1),(179,-27.4538419000000,-58.9819063000000,'Irigoyen',448,NULL,NULL,1),(180,-27.4439837300000,-58.9818996900000,'Pueyrredon',72,NULL,NULL,1),(181,-27.4901499000000,-58.9806814000000,'Mz 80 Pc 06',6,'24 Viviendas',NULL,1),(182,-27.4520859000000,-58.9805794000000,'French',278,'Centro',NULL,1),(183,-27.4509046000000,-58.9801296000000,'Italia',52,'Los Troncos',NULL,1),(184,-27.4668497000000,-58.9800223000000,'Tuyuti',1352,'Villa Itati',NULL,1),(185,-27.4892510000000,-58.9799192000000,'Pasaje Coco Marola',24,NULL,NULL,1),(186,-27.4734495500000,-58.9792532800000,'Carlos Boggio',1786,NULL,NULL,1),(187,-27.4743657000000,-58.9789845000000,'Pasaje Boggio',1857,'Villa Centenario',NULL,1),(188,-27.4625073000000,-58.9788539000000,'Obligado',1131,NULL,NULL,1),(189,-27.4435806000000,-58.9788110000000,'Guemes',1050,NULL,NULL,1),(190,-27.4472983000000,-58.9784110000000,'Cordoba',217,NULL,NULL,1),(191,-27.4419846000000,-58.9780814000000,'Alice Le Seige',22,NULL,NULL,1),(192,-27.4015285000000,-58.9779836000000,'Mz. 21 Pc. 22',NULL,'162 Viviendas',NULL,1),(193,-27.4712682000000,-58.9779831000000,'Goitia 627 Tiro Federal',NULL,NULL,NULL,1),(194,-27.4456446000000,-58.9777586000000,'Lopez y Planes',986,'Centro',NULL,1),(195,-27.4210158000000,-58.9776977000000,'Fortin Warnes',2798,NULL,NULL,1),(196,-27.4497768000000,-58.9775678800000,'Saavedra Nº 420',NULL,NULL,NULL,1),(197,-27.4108838000000,-58.9774804000000,'Autovia Gobernador Tenev',15,'Ex Textil Abraham','Km. 15',1),(198,-27.4597960700000,-58.9768956300000,'Av. 9 De Julio',1050,NULL,NULL,1),(199,-27.4640408000000,-58.9763215000000,'Duvivier',254,NULL,NULL,1),(200,-27.4648387200000,-58.9762021900000,'Obligado 1451',NULL,NULL,NULL,1),(201,-27.4648345400000,-58.9761846800000,'Obligado',1451,'Central Norte',NULL,1),(202,-27.4607316000000,-58.9760180000000,'Av. 9 de Julio y Nicolás Rojas Acosta',NULL,'Villa Chica',NULL,1),(203,-27.4731732000000,-58.9759557000000,'Av. CastellI',1946,NULL,NULL,5),(204,-27.4609329000000,-58.9755265000000,'Av. 9 De Julio Y Calle 4',NULL,NULL,NULL,1),(205,-27.4615502000000,-58.9751053000000,'Av. 9 De Julio',13,NULL,NULL,1),(206,-27.5017944000000,-58.9749557000000,'Av. Soberanía Nacional',3971,'76 Viviendas',NULL,3),(207,-27.4178531000000,-58.9746149000000,'Ch 107 Mz 10 Pc 22',22,NULL,NULL,1),(208,-27.4591218000000,-58.9740242000000,'Brown',1210,'Central',NULL,1),(209,-27.4437720000000,-58.9737300000000,'Alice Lesaige',26,'Villa San Martin',NULL,1),(210,-27.4499556000000,-58.9736775000000,'Laprida',661,NULL,NULL,1),(211,-27.4839328000000,-58.9732330000000,'Viviano Meza',1194,NULL,NULL,1),(212,-27.4955447000000,-58.9731081000000,'Mz. 27 Pc. 12 Ch. 295 - 60 Viviendas Uom.',NULL,NULL,NULL,1),(213,-27.4770987000000,-58.9728261000000,'Av. Urquiza 870',NULL,NULL,NULL,1),(214,-27.4387425000000,-58.9726732000000,'Policia De Territorios',136,NULL,NULL,1),(215,-27.4634265000000,-58.9724755000000,'Av. 9 de Julio',1585,NULL,NULL,1),(216,-27.4177999600000,-58.9717316500000,'Av. Sabin',2929,NULL,NULL,1),(217,-27.4772328000000,-58.9711036000000,'Av. Castelli',2499,'Villa Luzuriaga',NULL,1),(218,-27.4818299000000,-58.9695079000000,'Castelan y Boggio',135,'Villa Luzuriaga',NULL,1),(219,-27.4661381000000,-58.9694028000000,'Av. 9 de Julio',1820,NULL,NULL,1),(220,-27.5045658000000,-58.9687311000000,'Mz. 33 Pc. 15',NULL,'56 Viviendas',NULL,3),(221,-27.4797729000000,-58.9687046000000,'Castelli Y Calle 20',NULL,NULL,NULL,1),(222,-27.4704771000000,-58.9686224000000,'Alice Lesaige',1465,NULL,NULL,1),(223,-27.4670556000000,-58.9683561000000,'Av. 9 de Julio',1999,'Ex Textil Abraham','Km. 15',1),(224,-27.4847146000000,-58.9681435000000,'La Rubita',NULL,NULL,NULL,1),(225,-27.4140520000000,-58.9679198000000,'Paseo Hiper Libertad',NULL,NULL,NULL,1),(226,-27.4140928000000,-58.9675550000000,'Ruta Nicolas Avellaneda Y Av. Sabin',NULL,NULL,NULL,1),(227,-27.4843436000000,-58.9664978000000,'Marcelino Castelan',1265,'Villa Luzuriaga',NULL,1),(228,-27.4700063000000,-58.9662971000000,'Ing. Schur',57,NULL,NULL,1),(229,-27.4690760000000,-58.9660393000000,'Av. 9 De Julio',2529,'Villa Donovan',NULL,1),(230,-27.4396515000000,-58.9639678000000,'Celmira G Cabral',571,NULL,NULL,1),(231,-27.5098574900000,-58.9629344700000,'Mz 14 Casa 10',NULL,'Los Milagros',NULL,3),(232,-27.4992247000000,-58.9622630000000,'Don Orione',55,NULL,NULL,3),(233,-27.4955914000000,-58.9613365000000,'Mz.105 Pc. 8',NULL,'12 Viviendas Utdyc',NULL,3),(234,-27.4867376000000,-58.9608740000000,'Av. Castelli Entre 20 Y 30',NULL,NULL,NULL,1),(235,-27.4107595000000,-58.9608453000000,'mz 6 pc 14',14,'Santo Domingo',NULL,1),(236,-27.4946665000000,-58.9606923000000,'Toledo',4265,NULL,NULL,3),(237,-27.4979492000000,-58.9599424000000,'Mz. 81 Pc. 12',NULL,'2 Viviendas',NULL,3),(238,-27.5128240000000,-58.9599290000000,'Soberania',NULL,'Los Milagros',NULL,3),(239,-27.5022110000000,-58.9592236000000,'Fortin Warnes Y Nicolas R. Acosta',NULL,'11 Viviendas',NULL,3),(240,-27.5023478000000,-58.9589369000000,'Mz10 Pc12 110',12,NULL,NULL,3),(241,-27.4954175000000,-58.9583222000000,'Toledo Y Yatay',NULL,NULL,NULL,3),(242,-27.4891053000000,-58.9580722000000,'Castelli Casi España',NULL,NULL,NULL,1),(243,-27.4970662300000,-58.9579796100000,'Av. Toledo',455,'2 Viviendas',NULL,3),(244,-27.4909270000000,-58.9578871000000,'Sauce Y Alem',NULL,NULL,NULL,3),(245,-27.5021457000000,-58.9578675000000,'Nicolas R. Acosta y Edison',NULL,NULL,NULL,3),(246,-27.4743394000000,-58.9578663000000,'Irigoyen M3035 Mz 62 Pc 4',4,'Vial',NULL,1),(247,-27.4980814000000,-58.9575458000000,'Ceweluk Miguel S/N',NULL,NULL,NULL,3),(248,-27.5004962000000,-58.9571262000000,'Pje. Carlos Hardy',4850,NULL,NULL,3),(249,-27.5006729000000,-58.9563356000000,'Mz. 113 Pc. 12',NULL,'237 Viviendas',NULL,3),(250,-27.4955031000000,-58.9560922000000,'Jose Marmol Y Algarrobo',NULL,'5 Viviendas',NULL,3),(251,-27.4927237500000,-58.9559722400000,'Timbo',4470,'Las Malvinas',NULL,3),(252,-27.4983489000000,-58.9553526000000,'Mz 64 Pc 9',NULL,'5 Viviendas',NULL,3),(253,-27.4870692000000,-58.9550702000000,'Rodriguez Peña',4120,'Mujeres Argentinas',NULL,1),(254,-27.4935330000000,-58.9548124000000,'Gomez Marcelo',NULL,NULL,NULL,3),(255,-27.4242397000000,-58.9524883000000,'Pasaje Italia',455,'Villa Fabiana Norte',NULL,1),(256,-27.4876199000000,-58.9517328000000,'Arturo Illia',446,NULL,NULL,3),(257,-27.4928178000000,-58.9507352000000,'Tatane',630,NULL,NULL,3),(258,-27.4861189000000,-58.9505677000000,'Arturo Illia',4287,'Las Malvinas',NULL,3),(259,-27.4187165000000,-58.9504718000000,'Av. Sarmiento',45,NULL,NULL,1),(260,-27.4892775000000,-58.9503165000000,'Lapacho',399,NULL,NULL,3),(261,-27.4815649000000,-58.9499167000000,'Aristobulos De Valle',3960,NULL,NULL,1),(262,-27.4841553000000,-58.9493478000000,'Av. 9 de julio',4202,'Las Malvinas',NULL,3),(263,-27.4873594000000,-58.9492003000000,'Arturo Illia',444,NULL,NULL,3),(264,-27.4942152000000,-58.9490039000000,'Nicolas R. Acosta',62,'Las Malvinas',NULL,3),(265,-27.4849001000000,-58.9486723000000,'Av. 9 De Julio',4302,NULL,NULL,3),(266,-27.4858334000000,-58.9480928000000,'Irigoyen',4545,NULL,NULL,3),(267,-27.4651232000000,-58.9478384000000,'Pc. 121 Uf. 14',NULL,'Mujeres Argentinas',NULL,1),(268,-27.4858540000000,-58.9473879000000,'Av. 9 De Julio',4440,NULL,NULL,3),(269,-27.4897618000000,-58.9473566000000,'Tatane',256,NULL,NULL,3),(270,-27.4880632000000,-58.9472970000000,'Algarrobo',140,NULL,NULL,3),(271,-27.4890555000000,-58.9466728000000,'Tatane S/N',NULL,NULL,NULL,3),(272,-27.4853376000000,-58.9462315000000,'Irigoyen',434,NULL,NULL,3),(273,-27.4807079000000,-58.9462159000000,'Sabatini',279,NULL,NULL,3),(274,-27.5104572000000,-58.9459018000000,'Mz 82 Pc18',18,'15 Viviendas',NULL,2),(275,-27.4849234000000,-58.9458536000000,'Pirovano',4618,NULL,NULL,3),(276,-27.4857008000000,-58.9458376000000,'Hipolito Irigoyen',4520,NULL,NULL,3),(277,-27.4868254000000,-58.9456728000000,'Chile',26,NULL,NULL,3),(278,-27.4877907000000,-58.9452897000000,'Av. 9 de Julio',4690,'Mapic 2',NULL,1),(279,-27.4931404000000,-58.9448781000000,'Nicolas R. Acosta',205,'Los Naranjitos',NULL,6),(280,-27.4905454000000,-58.9446942000000,'Nicolas R. Acosta',150,NULL,NULL,3),(281,-27.4834665000000,-58.9446022000000,'Paraguay',4557,'Villa Florida',NULL,3),(282,-27.4898324800000,-58.9445610900000,'Juan B Justo',4880,NULL,NULL,3),(283,-27.4842593000000,-58.9445316000000,'Bolivia',270,NULL,NULL,3),(284,-27.4926745000000,-58.9444634000000,'Nicolas R. Acosta',200,NULL,NULL,3),(285,-27.5165953000000,-58.9444232000000,'Mz 14 Pc 8',8,'San Jose',NULL,2),(286,-27.5106536000000,-58.9440755000000,'Saavedra Y Facundo Quiroga',NULL,'Lote 22',NULL,2),(287,-27.5089523000000,-58.9440639000000,'Mz 87 Pc 15',15,'Barrio 48 Viviendas',NULL,2),(288,-27.4913095600000,-58.9439762000000,'Nicolas R. Acosta',205,NULL,'Parque Industrial Ex Ucal',3),(289,-27.4831263000000,-58.9436583000000,'Diagonal Eva Peron',335,NULL,NULL,1),(290,-27.4859048000000,-58.9436070000000,'Brown',4665,NULL,NULL,3),(291,-27.5128676000000,-58.9435908000000,'Santa Lucia',612,NULL,NULL,2),(292,-27.4918750000000,-58.9435420000000,'Parque Industrial Barranqueras - Ex Ucal',NULL,'Centro',NULL,3),(293,-27.4920217000000,-58.9434102000000,'Nicolas R. Acosta',205,NULL,'Parque Industrial Ex Ucal',3),(294,-27.4895806000000,-58.9432506000000,'Av. 9 De Julio',4900,NULL,NULL,3),(295,-27.5069796000000,-58.9430030000000,'Mz 50 Pc 20 Cs 17',17,'6 Viviendas',NULL,2),(296,-27.4889055000000,-58.9429987000000,'San Martín',49,'Villa Florida',NULL,3),(297,-27.4870528000000,-58.9426755000000,'Brown',48,'Villa Florida',NULL,3),(298,-27.5093863000000,-58.9422570000000,'Av. San Martin',800,NULL,NULL,2),(299,-27.4873219000000,-58.9421751000000,'Pirovano',475,NULL,NULL,3),(300,-27.5132681000000,-58.9421567000000,'Av. San Martin',1100,NULL,NULL,2),(301,-27.5124997000000,-58.9420602000000,'Av. San Martin',NULL,NULL,NULL,2),(302,-27.5060580000000,-58.9417543000000,'Francisco Ramirez',NULL,NULL,NULL,2),(303,-27.5065525000000,-58.9412573000000,'Mendoza Y Peñaloza',NULL,'6 Viv','0',2),(304,-27.4880681000000,-58.9408149000000,'Brown',498,NULL,NULL,3),(305,-27.5109717000000,-58.9406520000000,'Pio XII',425,'Guemes',NULL,2),(306,-27.4998111000000,-58.9405911000000,'Mosconi',NULL,NULL,NULL,3),(307,-27.5114302000000,-58.9404573000000,'Pasaje',4,'Guemes',NULL,2),(308,-27.4828648000000,-58.9403053000000,'Saavedra',457,NULL,NULL,3),(309,-27.5103964000000,-58.9400822000000,'Pio Xii',346,NULL,NULL,2),(310,-27.5097131600000,-58.9400354200000,'Victoria',674,'Molino',NULL,2),(311,-27.4847102000000,-58.9398259000000,'Don Orione',55,NULL,NULL,3),(312,-27.4829870000000,-58.9397416000000,'Diagonal S/N',NULL,NULL,NULL,3),(313,-27.4918255000000,-58.9396122000000,'Pasaje San Martin',527,'Villa Emilia',NULL,3),(314,-27.5162877000000,-58.9393163000000,'Constitucion',40,NULL,NULL,2),(315,-27.4930150000000,-58.9386470000000,'Fray Mocho 40',40,NULL,NULL,3),(316,-27.4923800000000,-58.9380019000000,'Hipolito Yrigoyen',54,'Villa Emilia',NULL,3),(317,-27.5197253000000,-58.9378616000000,'Av. Juan Manuel De Rosas Y 1 De Mayo',NULL,NULL,NULL,2),(318,-27.4199535000000,-58.9375310000000,'Av. Velez Sarfield',479,'Villa Fabiana',NULL,1),(319,-27.4865219300000,-58.9375164800000,'Paraguay',5054,NULL,NULL,3),(320,-27.4970178500000,-58.9373752500000,'Villa Forestacion 5',NULL,NULL,NULL,3),(321,-27.4819596000000,-58.9373549000000,'Av. Laprida',4787,NULL,NULL,3),(322,-27.4824095500000,-58.9372709800000,'Don Orione',78,'Villa Rossi',NULL,3),(323,-27.4968305000000,-58.9371708000000,'Mosconi',115,NULL,NULL,3),(324,-27.4862636000000,-58.9371543000000,'Av. San Martin',455,'Aimara',NULL,3),(325,-27.5122206000000,-58.9369730000000,'Pasaje Yatay',NULL,'98 Viviendas','Mz. 121 Pc. 7',3),(326,-27.4866599000000,-58.9350557000000,'Miguel Cane',625,'Villa Emilia',NULL,3),(327,-27.4854351000000,-58.9331388000000,'Av. Laprida',5208,NULL,NULL,3),(328,-27.4891021000000,-58.9326865000000,'Saavedra 5485',5485,NULL,NULL,3),(329,-27.4862387000000,-58.9326172000000,'Av. Laprida',531,NULL,NULL,3),(330,-27.4813744000000,-58.9326057000000,'Joaquin V Gonzalez',1080,NULL,NULL,3),(331,-27.4952513000000,-58.9321607000000,'Av. del Puerto Sector:B Nave 8',235,NULL,NULL,5),(332,-27.4867268000000,-58.9319930000000,'Av. Laprida',3140,'Don Orione',NULL,3),(333,-27.4964909000000,-58.9318154000000,'Av. Río Parana',235,NULL,NULL,3),(334,-27.4718505000000,-58.9316812000000,'Pasaje Pasteur',4445,'2 De Abril',NULL,3),(335,-27.4884248000000,-58.9297775000000,'Av. Laprida Y Belgrano',5601,NULL,NULL,3),(336,-27.4746049000000,-58.9294730000000,'Pasteur',4763,'Zumalao',NULL,3),(337,-27.4862870000000,-58.9293480000000,'Guiraldes',95,NULL,NULL,3),(338,-27.4728746000000,-58.9292866000000,'Pasaje San Luis',4758,'Sumalao',NULL,3),(339,-27.4856761900000,-58.9291876000000,'Lestani',5485,'Villa Rossi',NULL,3),(340,-27.4782996000000,-58.9271928000000,'Pasaje San Luis',5800,NULL,NULL,3),(341,-27.4930389000000,-58.9269097000000,'Hipolito Irigoyen',4240,'28 Viviendas',NULL,1),(342,-27.4884066000000,-58.9265460000000,'Capitan Solari',123,NULL,NULL,3),(343,-27.4817786000000,-58.9260251000000,'Fray Mocho',1450,NULL,NULL,3),(344,-27.4807919000000,-58.9251400000000,'Fray Mocho',16,'La Lomita',NULL,3),(345,-27.4889548000000,-58.9245054000000,'Hipolito Irigoyen',4240,'28 Viviendas',NULL,1),(346,-27.4700526000000,-58.9217887000000,'Av. San Martin',248,NULL,NULL,3),(347,-27.4707354000000,-58.9205467000000,'Av. Las Piedras',NULL,NULL,NULL,3),(348,-27.4689360000000,-58.9204202000000,'Av. San Martin',NULL,NULL,NULL,3),(349,-27.4684468700000,-58.9203938600000,'Av. San Martin',2685,NULL,NULL,3),(350,-27.4725257000000,-58.9189925000000,'Miguel Cane',2415,NULL,NULL,3),(351,-27.4656212200000,-58.9172532000000,'Av. San Martin',3,'La Toma',NULL,3),(352,-27.4726334300000,-58.9106598000000,'Gaboto',31,NULL,NULL,3),(353,-27.4406564200000,-58.8946161300000,'Av. San Martin',NULL,NULL,NULL,3),(354,-27.4405735000000,-58.8484510000000,'Antequera A 150 Mts Del Asfalto',NULL,NULL,NULL,3),(355,NULL,NULL,'Miguel Cane',532,NULL,NULL,3),(356,NULL,NULL,'Casa 6 Mz 1',1,NULL,NULL,3),(357,NULL,NULL,'Don Orione',13,NULL,NULL,3),(358,NULL,NULL,'Mz 125 Pc 15',15,NULL,NULL,3),(359,NULL,NULL,'Sauce',199,NULL,NULL,3),(360,NULL,NULL,'Pje Boggio',438,NULL,NULL,3),(361,NULL,NULL,'Cervantes',4549,NULL,NULL,1),(362,NULL,NULL,'Parcela 72 Chacra 13',NULL,NULL,NULL,3),(363,NULL,NULL,'Mz. 51 Pc. 26',NULL,NULL,NULL,3),(364,NULL,NULL,'Sarmiento Y San Martin',NULL,NULL,NULL,1),(365,NULL,NULL,'Mz 81 Pc 9',9,NULL,NULL,1),(366,NULL,NULL,'Ch 43Mz 1 Pc 16',16,NULL,NULL,1),(367,NULL,NULL,'Calle 1',64,NULL,NULL,1),(368,NULL,NULL,'San Fernando',527,NULL,NULL,1),(369,NULL,NULL,'Pasaje San Juan',314,NULL,NULL,1),(370,NULL,NULL,'Padre Sena',337,NULL,NULL,1),(371,NULL,NULL,'Haceros',263,NULL,NULL,1),(372,NULL,NULL,'Vedia',126,NULL,NULL,1),(373,NULL,NULL,'Av. 9 De Julio',2529,NULL,NULL,1),(374,NULL,NULL,'Mitre',166,NULL,NULL,1),(375,NULL,NULL,'Av. Mac Lean',26,NULL,NULL,1),(376,NULL,NULL,'Castelan',135,NULL,NULL,1),(377,NULL,NULL,'Corrientes',67,NULL,NULL,1),(378,NULL,NULL,'Castelan',135,NULL,NULL,1),(379,NULL,NULL,'Mz. 9 Pc. 31',NULL,NULL,NULL,1),(380,NULL,NULL,'Av. Urquiza',275,NULL,NULL,1),(381,NULL,NULL,'Aristóbulo Del Valle',3947,NULL,NULL,3),(382,NULL,NULL,'Aristóbulo Del Valle',3947,NULL,NULL,3),(383,NULL,NULL,'Aristóbulo Del Valle',3947,NULL,NULL,3),(384,NULL,NULL,'Av. Urquiza',275,NULL,NULL,3),(385,NULL,NULL,'Mz. 11 Casa 6',NULL,NULL,NULL,3),(386,NULL,NULL,'Av. Sarmiento',65,NULL,NULL,1),(387,NULL,NULL,'Av. Italia',916,NULL,NULL,1),(388,NULL,NULL,'Ameri',3656,NULL,NULL,1),(389,NULL,NULL,'Cordoba',217,NULL,NULL,1),(390,NULL,NULL,'Obligado 1281',1281,NULL,NULL,1),(391,NULL,NULL,'Roberto Mora',95,NULL,NULL,1),(392,NULL,NULL,'Mz 9 Pc 3 Uf 01',NULL,NULL,NULL,1),(393,NULL,NULL,'Mz 62 Pc 16',NULL,NULL,NULL,1),(394,NULL,NULL,'Mz 62 Pc 16',NULL,NULL,NULL,1),(395,NULL,NULL,'Autovia Gobernador Tenev',15,NULL,NULL,1),(396,NULL,NULL,'Don Bosco',546,NULL,NULL,1),(397,NULL,NULL,'Marcelo T De Alvear',1683,NULL,NULL,1),(398,NULL,NULL,'Colon',573,NULL,NULL,1),(399,NULL,NULL,'Obligado',1524,NULL,NULL,1),(400,NULL,NULL,'Carlos Hardy',629,NULL,NULL,1),(401,NULL,NULL,'Mz 81 Casa 812',812,NULL,NULL,1),(402,NULL,NULL,'Mz 75 Pc 14',14,NULL,NULL,1),(403,NULL,NULL,'Fray Grotti',76,NULL,NULL,1),(404,NULL,NULL,'Fray Grotti',76,NULL,NULL,1),(405,NULL,NULL,'Mz 95 Cs11',11,NULL,NULL,1),(406,NULL,NULL,'Liniers',1198,NULL,NULL,1),(407,NULL,NULL,'Av. Laprida',4,NULL,NULL,1),(408,NULL,NULL,'Santa Fe',6,NULL,NULL,1),(409,NULL,NULL,'Mz 40 Casa 6',6,NULL,NULL,1),(410,NULL,NULL,'Arbo Y Blanco',1498,NULL,NULL,1),(411,NULL,NULL,'Av. Avalos',698,NULL,NULL,1),(412,NULL,NULL,'Av. Lavalle',1,NULL,NULL,1),(413,NULL,NULL,'Cataratas Del Iguazu',2695,NULL,NULL,1),(414,NULL,NULL,'Marcelo T De Alvear',26,NULL,NULL,1),(415,NULL,NULL,'Juan B. Justo',1517,NULL,NULL,1),(416,NULL,NULL,'Jose María Paz',735,NULL,NULL,1),(417,NULL,NULL,'Pellegrini',725,NULL,NULL,1),(418,NULL,NULL,'Mz 29 Pc 29',29,NULL,NULL,1),(419,NULL,NULL,'Santa Maria De Oro',1516,NULL,NULL,1),(420,NULL,NULL,'Colon',334,NULL,NULL,1),(421,NULL,NULL,'Arturo Illia',437,NULL,NULL,1),(422,NULL,NULL,'Jose Noveri',156,NULL,NULL,1),(423,NULL,NULL,'Jose Noveri',156,NULL,NULL,1),(424,NULL,NULL,'Jose Noveri',156,NULL,NULL,1),(425,NULL,NULL,'Av. Castelli',6468,NULL,NULL,1),(426,NULL,NULL,'Mz. 76 Pc. 25',NULL,NULL,NULL,1),(427,NULL,NULL,'Cs 19',NULL,'La Toma',NULL,4),(428,NULL,NULL,'Av. Rio Parana',45,NULL,NULL,4),(429,NULL,NULL,'Paraguay',NULL,'Villa Emilia',NULL,4),(430,NULL,NULL,'Sgto Cabral',NULL,NULL,NULL,4),(431,NULL,NULL,'Santa lucia S/N',NULL,NULL,NULL,4),(432,NULL,NULL,'40 Viviendas - mz 127 pc 107',7,NULL,NULL,4),(433,NULL,NULL,'Mauricio Feldman n°438',17,'Villa Gonzalito',NULL,4),(434,NULL,NULL,'Gaboto',NULL,'Villa Fucksman',NULL,4),(435,NULL,NULL,'Av. Paraguay',1815,NULL,NULL,4),(436,NULL,NULL,'Cordoba',5085,NULL,NULL,3),(437,NULL,NULL,'Pirovano',5245,'Villa Emilia',NULL,3),(438,NULL,NULL,'Asuncion',710,NULL,NULL,3),(439,NULL,NULL,'Mz. 2 Pc. 16 Casa 14',NULL,'Vista Linda',NULL,3),(440,NULL,NULL,'Av. Piacentini',1135,NULL,'Monoblock A PB Dpto. P34',1),(441,NULL,NULL,'Mz. 71 Pc. 12',NULL,'125 Viviendas CGT',NULL,3),(442,NULL,NULL,'Mz. 2 Pc. 16 Casa 14',NULL,'Vista Linda',NULL,1),(443,NULL,NULL,'Ameghino',4630,NULL,NULL,3),(444,NULL,NULL,'Benjamin Zorrilla',848,NULL,NULL,1),(445,NULL,NULL,'Obligado',2598,NULL,NULL,1),(446,NULL,NULL,'Leandro N. Alem',2720,NULL,NULL,1),(447,NULL,NULL,'Algarrobo',425,NULL,NULL,3),(448,NULL,NULL,'San Juan y Alem',NULL,'Gral. San Martin',NULL,3),(449,NULL,NULL,'Viedma',NULL,'Obrero',NULL,2),(450,NULL,NULL,'Juan B. Justo',5720,NULL,NULL,3),(451,NULL,NULL,'Juan B. Justo ',5140,NULL,NULL,3),(452,NULL,NULL,'Frondizi',1220,'Las Malvinas','piso 5 dpto 2',1),(453,NULL,NULL,'Pirovano',5220,'Hipolito Irigoyen 2',NULL,3),(454,NULL,NULL,'Mz. W Pc. 12',NULL,NULL,NULL,3),(455,NULL,NULL,'Mz. 84 Pc. 15',NULL,'Las Malvinas',NULL,1),(456,NULL,NULL,'LOTE 11 S/N',NULL,NULL,NULL,3),(457,NULL,NULL,'Yatay 690',690,'Villa Luzuriaga','Casa 2',3),(458,NULL,NULL,'Don Orione',540,'Barrio 300 Viviendas',NULL,3),(459,NULL,NULL,'Carlos Boggio',3125,NULL,NULL,1),(460,NULL,NULL,'Mz 29 Pc 2',NULL,'Barranqueras',NULL,1),(461,NULL,NULL,'Cordoba',5060,NULL,NULL,3),(462,NULL,NULL,'Av. Rio Parana',600,'Villa Florida',NULL,2),(463,NULL,NULL,'Irigoyen',4630,'Villa Forestacion',NULL,3),(464,NULL,NULL,'Lote 11 Casa 71',NULL,NULL,NULL,3),(465,NULL,NULL,'Pje. San Martin',1485,NULL,NULL,3),(466,NULL,NULL,'San Juan',5101,'Barrio La Toma',NULL,3),(467,NULL,NULL,'Av. San Martin',3250,NULL,NULL,3),(468,NULL,NULL,'Av. San Martin',1324,'LA LOMA',NULL,3),(469,NULL,NULL,'San Juan',5140,'Villa Maria Cristina',NULL,3);
/*!40000 ALTER TABLE `domicilios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidades` (
  `id_localidad` int NOT NULL AUTO_INCREMENT,
  `localidad` varchar(40) NOT NULL,
  `provincia` varchar(40) NOT NULL,
  PRIMARY KEY (`id_localidad`),
  UNIQUE KEY `id_localidad` (`id_localidad`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (1,'Resistencia','Chaco'),(2,'Puerto Vilelas','Chaco'),(3,'Barranqueras','Chaco'),(4,'Puerto Tirol','Chaco'),(5,'Fontana','Chaco'),(6,'La Escondida','Chaco'),(7,'Florencia','Santa Fe');
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_auditoria`
--

DROP TABLE IF EXISTS `log_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_auditoria` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `tabla` varchar(55) NOT NULL,
  `accion` varchar(15) NOT NULL,
  `mensaje` varchar(400) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_auditoria`
--

LOCK TABLES `log_auditoria` WRITE;
/*!40000 ALTER TABLE `log_auditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medios_pago`
--

DROP TABLE IF EXISTS `medios_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medios_pago` (
  `id_medio_pago` varchar(2) NOT NULL,
  `medio_pago` varchar(20) NOT NULL,
  PRIMARY KEY (`id_medio_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medios_pago`
--

LOCK TABLES `medios_pago` WRITE;
/*!40000 ALTER TABLE `medios_pago` DISABLE KEYS */;
INSERT INTO `medios_pago` VALUES ('CC','Cuenta Corriente'),('EF','Efectivo'),('TR','Transferencia');
/*!40000 ALTER TABLE `medios_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operaciones`
--

DROP TABLE IF EXISTS `operaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operaciones` (
  `id_operacion` varchar(1) NOT NULL,
  `operacion` varchar(20) NOT NULL,
  PRIMARY KEY (`id_operacion`),
  UNIQUE KEY `id_operacion` (`id_operacion`),
  UNIQUE KEY `operacion` (`operacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operaciones`
--

LOCK TABLES `operaciones` WRITE;
/*!40000 ALTER TABLE `operaciones` DISABLE KEYS */;
INSERT INTO `operaciones` VALUES ('A','Abono'),('C','Cobro'),('V','Venta');
/*!40000 ALTER TABLE `operaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precios`
--

DROP TABLE IF EXISTS `precios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `precios` (
  `id_precio` int NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date NOT NULL,
  `id_producto` varchar(3) NOT NULL,
  `id_tipo_cliente` varchar(1) NOT NULL,
  `precio` decimal(20,2) DEFAULT '0.00',
  PRIMARY KEY (`id_precio`),
  UNIQUE KEY `id_precio` (`id_precio`),
  KEY `id_producto` (`id_producto`),
  KEY `id_tipo_cliente` (`id_tipo_cliente`),
  CONSTRAINT `precios_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `precios_ibfk_2` FOREIGN KEY (`id_tipo_cliente`) REFERENCES `tipos_clientes` (`id_tipo_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precios`
--

LOCK TABLES `precios` WRITE;
/*!40000 ALTER TABLE `precios` DISABLE KEYS */;
INSERT INTO `precios` VALUES (1,'2016-01-01','B12','A',800.00),(2,'2016-01-01','B20','A',1300.00),(3,'2016-01-01','DFC','A',80000.00),(4,'2016-01-01','E20','A',1600.00),(5,'2016-01-01','B12','F',800.00),(6,'2016-01-01','B20','F',1300.00),(7,'2016-01-01','DFC','F',80000.00),(8,'2016-01-01','E20','F',1600.00),(9,'2016-01-01','B12','N',800.00),(10,'2016-01-01','B20','N',1300.00),(11,'2016-01-01','DFC','N',80000.00),(12,'2016-01-01','E20','N',1600.00),(13,'2016-01-01','B12','R',560.00),(14,'2016-01-01','B20','R',910.00),(15,'2016-01-01','DFC','R',80000.00),(16,'2016-01-01','E20','R',1600.00),(17,'2019-01-01','B12','A',1000.00),(18,'2019-01-01','B20','A',1600.00),(19,'2019-01-01','DFC','A',96000.00),(20,'2019-01-01','E20','A',2000.00),(21,'2019-01-01','B12','F',1000.00),(22,'2019-01-01','B20','F',1600.00),(23,'2019-01-01','DFC','F',96000.00),(24,'2019-01-01','E20','F',2000.00),(25,'2019-01-01','B12','N',1000.00),(26,'2019-01-01','B20','N',1600.00),(27,'2019-01-01','DFC','N',96000.00),(28,'2019-01-01','E20','N',2000.00),(29,'2019-01-01','B12','R',700.00),(30,'2019-01-01','B20','R',1120.00),(31,'2019-01-01','DFC','R',96000.00),(32,'2019-01-01','E20','R',2000.00),(33,'2021-01-01','B12','A',1200.00),(34,'2021-01-01','B20','A',2000.00),(35,'2021-01-01','DFC','A',120000.00),(36,'2021-01-01','E20','A',2400.00),(37,'2021-01-01','B12','F',1200.00),(38,'2021-01-01','B20','F',2000.00),(39,'2021-01-01','DFC','F',120000.00),(40,'2021-01-01','E20','F',2400.00),(41,'2021-01-01','B12','N',1200.00),(42,'2021-01-01','B20','N',2000.00),(43,'2021-01-01','DFC','N',120000.00),(44,'2021-01-01','E20','N',2400.00),(45,'2021-01-01','B12','R',840.00),(46,'2021-01-01','B20','R',1400.00),(47,'2021-01-01','DFC','R',120000.00),(48,'2021-01-01','E20','R',2400.00),(49,'2023-01-01','B12','A',1500.00),(50,'2023-01-01','B20','A',2500.00),(51,'2023-01-01','DFC','A',150000.00),(52,'2023-01-01','E20','A',3000.00),(53,'2023-01-01','B12','F',1500.00),(54,'2023-01-01','B20','F',2500.00),(55,'2023-01-01','DFC','F',150000.00),(56,'2023-01-01','E20','F',3000.00),(57,'2023-01-01','B12','N',1500.00),(58,'2023-01-01','B20','N',2500.00),(59,'2023-01-01','DFC','N',150000.00),(60,'2023-01-01','E20','N',3000.00),(61,'2023-01-01','B12','R',1050.00),(62,'2023-01-01','B20','R',1750.00),(63,'2023-01-01','DFC','R',150000.00),(64,'2023-01-01','E20','R',3000.00),(65,'2024-01-01','B12','A',3000.00),(66,'2024-01-01','B20','A',5000.00),(67,'2024-01-01','DFC','A',300000.00),(68,'2024-01-01','E20','A',6000.00),(69,'2024-01-01','B12','F',3000.00),(70,'2024-01-01','B20','F',5000.00),(71,'2024-01-01','DFC','F',300000.00),(72,'2024-01-01','E20','F',6000.00),(73,'2024-01-01','B12','N',3000.00),(74,'2024-01-01','B20','N',5000.00),(75,'2024-01-01','DFC','N',300000.00),(76,'2024-01-01','E20','N',6000.00),(77,'2024-01-01','B12','R',2100.00),(78,'2024-01-01','B20','R',3500.00),(79,'2024-01-01','DFC','R',300000.00),(80,'2024-01-01','E20','R',6000.00);
/*!40000 ALTER TABLE `precios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_precios_insert_after` AFTER INSERT ON `precios` FOR EACH ROW BEGIN
	INSERT INTO log_auditoria(id_log, tabla, accion, mensaje, usuario, fecha)
    VALUES ( NULL
	,		'precios'
	,		'alta'
    ,		CONCAT(
				'Se agrego un precio nuevo para'
                , NEW.id_producto
                ,' - Tipo de cliente: '
                , NEW.id_tipo_cliente
                , ' - Ingresa en vigencia: '
                , NEW.fecha_inicio
				)
    ,		user()
    ,		now()
    );
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` varchar(3) NOT NULL,
  `producto` varchar(20) NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `id_producto` (`id_producto`),
  UNIQUE KEY `producto` (`producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES ('B12','Bidón 12 lts.'),('B20','Bidón 20 lts.'),('DFC','Dispenser FC'),('E20','Envase 20 lts.');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repartidores`
--

DROP TABLE IF EXISTS `repartidores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repartidores` (
  `id_repartidor` int NOT NULL AUTO_INCREMENT,
  `apellido_nombre` varchar(100) NOT NULL,
  `DNI` int NOT NULL,
  `CUIT` bigint unsigned NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `genero` varchar(1) DEFAULT NULL,
  `id_domicilio` int NOT NULL,
  `estado_civil` varchar(30) DEFAULT 'Sin especificar',
  `fecha_ingreso` date NOT NULL,
  `fecha_baja` date DEFAULT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id_repartidor`),
  UNIQUE KEY `id_repartidor` (`id_repartidor`),
  KEY `id_domicilio` (`id_domicilio`),
  CONSTRAINT `repartidores_ibfk_1` FOREIGN KEY (`id_domicilio`) REFERENCES `domicilios` (`id_domicilio`),
  CONSTRAINT `repartidores_chk_1` CHECK ((`genero` in (_utf8mb4'F',_utf8mb4'M',_utf8mb4'O'))),
  CONSTRAINT `repartidores_chk_2` CHECK ((`estado_civil` in (_utf8mb4'Soltero',_utf8mb4'Casado',_utf8mb4'Viudo',_utf8mb4'Sin especificar')))
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repartidores`
--

LOCK TABLES `repartidores` WRITE;
/*!40000 ALTER TABLE `repartidores` DISABLE KEYS */;
INSERT INTO `repartidores` VALUES (1,'Alan Romero',44651968,20446519681,'2002-12-26','M',469,'Sin especificar','2024-03-18',NULL,'3624861313','alan_romero@gmail.com '),(2,'Ian Aramis Gomez Menesse',46777983,20467779831,'2006-01-05','M',468,'Sin especificar','2024-05-30',NULL,'3624861678','ian_aramis_gomez_menesse@gmail.com '),(3,'Fleyta Teodoro Vicente',14496079,20144960791,'1961-07-04','M',467,'Sin especificar','2010-03-25',NULL,'3624862043','fleyta_teodoro_vicente@gmail.com '),(4,'Cardozo Lucas Ezequiel',45469117,20454691171,'1990-06-23','M',466,'Sin especificar','2023-04-01',NULL,'3624862408','cardozo_lucas_ezequiel@gmail.com '),(5,'Brian Gomez Veron',45101860,20451018601,'2004-04-04','M',465,'Sin especificar','2023-12-21',NULL,'3624862773','brian_gomez_veron@gmail.com '),(6,'Ivan Kuszmiruk',45793879,20457938791,'2004-04-26','M',464,'Sin especificar','2024-05-06',NULL,'3624863138','ivan_kuszmiruk@gmail.com '),(7,'Insaurralde Vilma Romina Luciana',29523624,27295236243,'1982-06-06','F',463,'Sin especificar','2023-08-01',NULL,'3624863503','insaurralde_vilma_romina_luciana@gmail.com '),(8,'Ramirez Sofia Celeste',33732503,27337325039,'1988-11-26','F',462,'Sin especificar','2013-07-25',NULL,'3624863868','ramirez_sofia_celeste@gmail.com '),(9,'Benitez Jeremias Moises',38383956,20383839561,'1994-09-06','M',461,'Sin especificar','2023-04-01',NULL,'3624864233','benitez_jeremias_moises@gmail.com '),(10,'Barrientos Nestor Edgardo',44085527,20440855271,'1988-09-10','M',460,'Sin especificar','2023-01-16',NULL,'3624864598','barrientos_nestor_edgardo@gmail.com '),(11,'Haedo Exequiel',35858726,20358587261,'1991-06-13','M',459,'Sin especificar','2021-07-29',NULL,'3624864963','haedo_exequiel@gmail.com '),(12,'López Adrian Ezequiel',37584988,20375849881,'1994-01-14','M',458,'Sin especificar','2019-12-06','2020-02-07','3624865328','lópez_adrian_ezequiel@gmail.com '),(13,'Aguirre Angel Mariano',28048473,20280484731,'1980-06-16','M',457,'Sin especificar','2019-12-30','2022-09-25','3624865693','aguirre_angel_mariano@gmail.com '),(14,'González Martín Fernando',30879616,20308796161,'1984-03-05','M',456,'Sin especificar','2020-02-05','2020-05-25','3624866058','gonzález_martín_fernando@gmail.com '),(15,'Maidana Arnaldo Arsenio Ruben',31325534,20313255341,'1985-01-11','M',455,'Sin especificar','2020-01-28','2020-04-16','3624866423','maidana_arnaldo_arsenio_ruben@gmail.com '),(16,'Godoy Diego José',42202178,20422021781,'1997-05-25','M',454,'Sin especificar','2020-01-24','2022-11-05','3624866788','godoy_diego_josé@gmail.com '),(17,'Sandoval Enzo Esequiel',39940804,20399408041,'1996-11-30','M',453,'Sin especificar','2020-05-15','2021-12-20','3624867153','sandoval_enzo_esequiel@gmail.com '),(18,'Cuyua Alexis Leonardo',36019462,20360194621,'1991-02-01','M',452,'Sin especificar','2020-05-28','2020-10-01','3624867518','cuyua_alexis_leonardo@gmail.com '),(19,'Ramirez Wellig Emno Lautaro',46149145,20461491451,'2000-12-21','M',451,'Sin especificar','2020-10-24','2021-01-27','3624867883','ramirez_wellig_emno_lautaro@gmail.com '),(20,'Quintana Esteban Javier',37585624,20375856241,'1993-06-30','M',450,'Sin especificar','2020-10-24','2023-08-22','3624868248','quintana_esteban_javier@gmail.com '),(21,'Maidana Angel Ulises',36115366,20361153661,'1992-02-15','M',449,'Sin especificar','2020-11-10','2021-02-13','3624868613','maidana_angel_ulises@gmail.com '),(22,'Herrendorf Florencia Vanina',36233329,27362333291,'1992-03-24','F',448,'Sin especificar','2018-02-01','2020-11-29','3624868978','herrendorf_florencia_vanina@gmail.com '),(23,'Vallejos Pelozo Gonzalo Ezequiel',36115647,20361156471,'1992-04-23','M',447,'Sin especificar','2020-09-29','2022-05-22','3624869343','vallejos_pelozo_gonzalo_ezequiel@gmail.com '),(24,'Zalazar Emanuel Antonio',39177136,20391771361,'1994-12-12','M',446,'Sin especificar','2021-02-01','2021-06-23','3624869708','zalazar_emanuel_antonio@gmail.com '),(25,'Quiroz Gaston Lucas',38047660,20380476601,'1993-06-23','M',445,'Sin especificar','2020-05-29','2020-09-17','3624870073','quiroz_gaston_lucas@gmail.com '),(26,'Ayala Ivan Mauricio',39815232,20398152321,'1994-08-24','M',444,'Sin especificar','2020-01-01','2022-11-14','3624870438','ayala_ivan_mauricio@gmail.com '),(27,'Barrientos Nestor Edgardo',44085527,20440855271,'1988-09-10','M',443,'Sin especificar','2023-01-16','2023-05-07','3624870803','barrientos_nestor_edgardo@gmail.com '),(28,'Encina Leandro Maximiliano',38971997,20389719971,'1995-07-14','M',442,'Sin especificar','2020-09-29','2023-08-13','3624871168','encina_leandro_maximiliano@gmail.com '),(29,'Ortigoza Alexis Emmanuel',35858568,20358585681,'1991-04-18','M',441,'Sin especificar','2020-08-13','2022-04-21','3624871533','ortigoza_alexis_emmanuel@gmail.com '),(30,'Pintos Agustin Fabian',46462939,20464629391,'2005-05-11','M',440,'Sin especificar','2021-12-20','2022-05-27','3624871898','pintos_agustin_fabian@gmail.com '),(31,'Rolon Hugo Orlando',43006561,20430065611,'1995-09-18','M',439,'Sin especificar','2018-07-01','2018-11-05','3624872263','rolon_hugo_orlando@gmail.com '),(32,'Enzo Centurion',43145673,20431456731,'1995-12-09','M',438,'Sin especificar','2021-12-02','2024-10-31','3624872628','enzo_centurion@gmail.com '),(33,'Wirz Fernando Ariel',35687538,20356875381,'1991-03-08','M',437,'Sin especificar','2017-01-06','2017-05-13','3624872993','wirz_fernando_ariel@gmail.com '),(34,'Gutierrez Gaston Joaquin',42745521,20427455211,'2000-05-17','M',436,'Sin especificar','2021-05-10','2024-04-08','3624873358','gutierrez_gaston_joaquin@gmail.com '),(35,'Gomez Marcos Javier',36974738,20369747381,'1992-10-24','M',435,'Sin especificar','2022-04-18','2024-01-10','3624873723','gomez_marcos_javier@gmail.com '),(36,'Prieto Hector',28234239,20282342391,'1980-10-01','M',434,'Sin especificar','2022-01-21','2022-07-14','3624874088','prieto_hector@gmail.com '),(37,'Fernandez Matias',45370687,20453706871,'2003-12-24','M',433,'Sin especificar','2021-12-31','2022-05-23','3624874453','fernandez_matias@gmail.com '),(38,'Ferreyra Jorge Damian',32062902,20320629021,'1986-03-30','M',432,'Sin especificar','2020-02-26','2023-02-10','3624874818','ferreyra_jorge_damian@gmail.com '),(39,'Blanco Sebastian Alexis',45104560,20451045601,'2004-01-13','M',431,'Sin especificar','2021-11-08','2022-03-31','3624875183','blanco_sebastian_alexis@gmail.com '),(40,'Torres Gustavo Norberto',30391392,20303913921,'1983-10-09','M',430,'Sin especificar','2022-08-01','2022-11-17','3624875548','torres_gustavo_norberto@gmail.com '),(41,'Mosqueda Braian Leonel',40789987,20407899871,'1996-09-14','M',429,'Sin especificar','2022-12-16','2024-06-16','3624875913','mosqueda_braian_leonel@gmail.com '),(42,'Ojeda Ezequiel Gustavo',43145637,20431456371,'2000-03-06','M',428,'Sin especificar','2022-10-15','2023-04-23','3624876278','ojeda_ezequiel_gustavo@gmail.com '),(43,'Fernandez Juan Roman',44385711,20443857111,'2002-02-18','M',427,'Sin especificar','2022-10-11','2023-03-19','3624876643','fernandez_juan_roman@gmail.com '),(44,'Acosta Cecilia Noemi',31119314,27311193142,'1984-09-08','F',426,'Sin especificar','2021-05-12','2024-05-12','3624877008','acosta_cecilia_noemi@gmail.com '),(45,'Mosqueda Luis',38047956,20380479561,'1994-04-28','M',425,'Sin especificar','2022-11-09','2023-04-17','3624877373','mosqueda_luis@gmail.com ');
/*!40000 ALTER TABLE `repartidores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repartos`
--

DROP TABLE IF EXISTS `repartos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repartos` (
  `id_reparto` varchar(3) NOT NULL,
  `id_patente` varchar(7) DEFAULT NULL,
  `id_repartidor` int DEFAULT NULL,
  PRIMARY KEY (`id_reparto`),
  UNIQUE KEY `id_reparto` (`id_reparto`),
  KEY `id_patente` (`id_patente`),
  KEY `id_repartidor` (`id_repartidor`),
  CONSTRAINT `repartos_ibfk_1` FOREIGN KEY (`id_patente`) REFERENCES `vehiculos` (`id_patente`),
  CONSTRAINT `repartos_ibfk_2` FOREIGN KEY (`id_repartidor`) REFERENCES `repartidores` (`id_repartidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repartos`
--

LOCK TABLES `repartos` WRITE;
/*!40000 ALTER TABLE `repartos` DISABLE KEYS */;
INSERT INTO `repartos` VALUES ('R01','AA351EF',1),('R02','OTR896',3),('R11','AC688WR',2);
/*!40000 ALTER TABLE `repartos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rutas`
--

DROP TABLE IF EXISTS `rutas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rutas` (
  `id_ruta` varchar(6) NOT NULL,
  `ruta` varchar(3) NOT NULL,
  `id_reparto` varchar(3) NOT NULL,
  `id_cliente` int NOT NULL,
  `orden` int NOT NULL,
  PRIMARY KEY (`id_ruta`),
  KEY `id_reparto` (`id_reparto`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `rutas_ibfk_1` FOREIGN KEY (`id_reparto`) REFERENCES `repartos` (`id_reparto`),
  CONSTRAINT `rutas_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutas`
--

LOCK TABLES `rutas` WRITE;
/*!40000 ALTER TABLE `rutas` DISABLE KEYS */;
INSERT INTO `rutas` VALUES ('A01-1','A01','R01',1,1),('A01-10','A01','R01',10,10),('A01-11','A01','R01',11,11),('A01-12','A01','R01',12,12),('A01-13','A01','R01',13,13),('A01-14','A01','R01',15,14),('A01-15','A01','R01',16,15),('A01-16','A01','R01',17,16),('A01-17','A01','R01',18,17),('A01-18','A01','R01',19,18),('A01-19','A01','R01',20,19),('A01-2','A01','R01',2,2),('A01-20','A01','R01',21,20),('A01-21','A01','R01',22,21),('A01-22','A01','R01',23,22),('A01-3','A01','R01',3,3),('A01-4','A01','R01',4,4),('A01-5','A01','R01',5,5),('A01-6','A01','R01',6,6),('A01-7','A01','R01',7,7),('A01-8','A01','R01',8,8),('A01-9','A01','R01',9,9),('A02-1','A02','R02',24,1),('A02-10','A02','R02',33,10),('A02-11','A02','R02',34,11),('A02-2','A02','R02',25,2),('A02-3','A02','R02',26,3),('A02-4','A02','R02',27,4),('A02-5','A02','R02',28,5),('A02-6','A02','R02',29,6),('A02-7','A02','R02',30,7),('A02-8','A02','R02',31,8),('A02-9','A02','R02',32,9),('A11-1','A11','R11',35,1),('A11-10','A11','R11',44,10),('A11-11','A11','R11',45,11),('A11-12','A11','R11',46,12),('A11-13','A11','R11',47,13),('A11-14','A11','R11',48,14),('A11-15','A11','R11',49,15),('A11-16','A11','R11',50,16),('A11-17','A11','R11',51,17),('A11-18','A11','R11',52,18),('A11-19','A11','R11',53,19),('A11-2','A11','R11',36,2),('A11-20','A11','R11',54,20),('A11-21','A11','R11',55,21),('A11-3','A11','R11',37,3),('A11-4','A11','R11',38,4),('A11-5','A11','R11',39,5),('A11-6','A11','R11',40,6),('A11-7','A11','R11',41,7),('A11-8','A11','R11',42,8),('A11-9','A11','R11',43,9),('B01-1','B01','R01',56,1),('B01-10','B01','R01',65,10),('B01-11','B01','R01',66,11),('B01-12','B01','R01',67,12),('B01-13','B01','R01',68,13),('B01-14','B01','R01',69,14),('B01-15','B01','R01',70,15),('B01-16','B01','R01',71,16),('B01-17','B01','R01',72,17),('B01-18','B01','R01',73,18),('B01-19','B01','R01',74,19),('B01-2','B01','R01',57,2),('B01-20','B01','R01',75,20),('B01-21','B01','R01',76,21),('B01-22','B01','R01',77,22),('B01-23','B01','R01',78,23),('B01-3','B01','R01',58,3),('B01-4','B01','R01',59,4),('B01-5','B01','R01',60,5),('B01-6','B01','R01',61,6),('B01-7','B01','R01',62,7),('B01-8','B01','R01',63,8),('B01-9','B01','R01',64,9),('B02-1','B02','R02',79,1),('B02-10','B02','R02',88,10),('B02-11','B02','R02',89,11),('B02-12','B02','R02',90,12),('B02-13','B02','R02',91,13),('B02-14','B02','R02',92,14),('B02-15','B02','R02',93,15),('B02-16','B02','R02',94,16),('B02-2','B02','R02',80,2),('B02-3','B02','R02',81,3),('B02-4','B02','R02',82,4),('B02-5','B02','R02',83,5),('B02-6','B02','R02',84,6),('B02-7','B02','R02',85,7),('B02-8','B02','R02',86,8),('B02-9','B02','R02',87,9),('B11-1','B11','R11',95,1),('B11-10','B11','R11',105,10),('B11-11','B11','R11',106,11),('B11-12','B11','R11',107,12),('B11-13','B11','R11',108,13),('B11-14','B11','R11',109,14),('B11-15','B11','R11',110,15),('B11-16','B11','R11',111,16),('B11-17','B11','R11',112,17),('B11-18','B11','R11',113,18),('B11-19','B11','R11',114,19),('B11-2','B11','R11',96,2),('B11-20','B11','R11',115,20),('B11-3','B11','R11',97,3),('B11-4','B11','R11',98,4),('B11-5','B11','R11',99,5),('B11-6','B11','R11',100,6),('B11-7','B11','R11',101,7),('B11-8','B11','R11',103,8),('B11-9','B11','R11',104,9),('C01-1','C01','R01',116,1),('C01-10','C01','R01',125,10),('C01-11','C01','R01',126,11),('C01-12','C01','R01',127,12),('C01-13','C01','R01',128,13),('C01-14','C01','R01',129,14),('C01-15','C01','R01',130,15),('C01-16','C01','R01',131,16),('C01-17','C01','R01',132,17),('C01-18','C01','R01',133,18),('C01-19','C01','R01',134,19),('C01-2','C01','R01',117,2),('C01-20','C01','R01',135,20),('C01-21','C01','R01',136,21),('C01-22','C01','R01',137,22),('C01-3','C01','R01',118,3),('C01-4','C01','R01',119,4),('C01-5','C01','R01',120,5),('C01-6','C01','R01',121,6),('C01-7','C01','R01',122,7),('C01-8','C01','R01',123,8),('C01-9','C01','R01',124,9),('C02-1','C02','R02',138,1),('C02-10','C02','R02',147,10),('C02-11','C02','R02',148,11),('C02-12','C02','R02',149,12),('C02-13','C02','R02',150,13),('C02-14','C02','R02',151,14),('C02-15','C02','R02',152,15),('C02-16','C02','R02',153,16),('C02-17','C02','R02',154,17),('C02-2','C02','R02',139,2),('C02-3','C02','R02',140,3),('C02-4','C02','R02',141,4),('C02-5','C02','R02',142,5),('C02-6','C02','R02',143,6),('C02-7','C02','R02',144,7),('C02-8','C02','R02',145,8),('C02-9','C02','R02',146,9),('C11-1','C11','R11',155,1),('C11-10','C11','R11',164,10),('C11-11','C11','R11',165,11),('C11-12','C11','R11',166,12),('C11-13','C11','R11',167,13),('C11-14','C11','R11',168,14),('C11-15','C11','R11',169,15),('C11-16','C11','R11',170,16),('C11-17','C11','R11',171,17),('C11-18','C11','R11',172,18),('C11-19','C11','R11',173,19),('C11-2','C11','R11',156,2),('C11-20','C11','R11',174,20),('C11-3','C11','R11',157,3),('C11-4','C11','R11',158,4),('C11-5','C11','R11',159,5),('C11-6','C11','R11',160,6),('C11-7','C11','R11',161,7),('C11-8','C11','R11',162,8),('C11-9','C11','R11',163,9),('D01-1','D01','R01',175,1),('D01-10','D01','R01',184,10),('D01-11','D01','R01',185,11),('D01-12','D01','R01',186,12),('D01-13','D01','R01',187,13),('D01-14','D01','R01',188,14),('D01-15','D01','R01',189,15),('D01-16','D01','R01',191,16),('D01-17','D01','R01',192,17),('D01-18','D01','R01',193,18),('D01-19','D01','R01',194,19),('D01-2','D01','R01',176,2),('D01-20','D01','R01',195,20),('D01-21','D01','R01',196,21),('D01-22','D01','R01',197,22),('D01-3','D01','R01',177,3),('D01-4','D01','R01',178,4),('D01-5','D01','R01',179,5),('D01-6','D01','R01',180,6),('D01-7','D01','R01',181,7),('D01-8','D01','R01',182,8),('D01-9','D01','R01',183,9),('D02-1','D02','R02',198,1),('D02-10','D02','R02',207,10),('D02-11','D02','R02',208,11),('D02-12','D02','R02',209,12),('D02-13','D02','R02',210,13),('D02-14','D02','R02',211,14),('D02-15','D02','R02',212,15),('D02-16','D02','R02',213,16),('D02-17','D02','R02',214,17),('D02-18','D02','R02',215,18),('D02-19','D02','R02',216,19),('D02-2','D02','R02',199,2),('D02-20','D02','R02',217,20),('D02-21','D02','R02',218,21),('D02-22','D02','R02',219,22),('D02-23','D02','R02',220,23),('D02-24','D02','R02',221,24),('D02-3','D02','R02',200,3),('D02-4','D02','R02',201,4),('D02-5','D02','R02',202,5),('D02-6','D02','R02',203,6),('D02-7','D02','R02',204,7),('D02-8','D02','R02',205,8),('D02-9','D02','R02',206,9),('D11-1','D11','R11',222,1),('D11-10','D11','R11',232,10),('D11-11','D11','R11',233,11),('D11-12','D11','R11',234,12),('D11-13','D11','R11',235,13),('D11-14','D11','R11',236,14),('D11-15','D11','R11',237,15),('D11-16','D11','R11',238,16),('D11-17','D11','R11',239,17),('D11-18','D11','R11',240,18),('D11-19','D11','R11',241,19),('D11-2','D11','R11',223,2),('D11-20','D11','R11',242,20),('D11-3','D11','R11',224,3),('D11-4','D11','R11',226,4),('D11-5','D11','R11',227,5),('D11-6','D11','R11',228,6),('D11-7','D11','R11',229,7),('D11-8','D11','R11',230,8),('D11-9','D11','R11',231,9),('E01-1','E01','R01',243,1),('E01-10','E01','R01',252,10),('E01-11','E01','R01',253,11),('E01-12','E01','R01',254,12),('E01-13','E01','R01',255,13),('E01-14','E01','R01',256,14),('E01-15','E01','R01',257,15),('E01-16','E01','R01',258,16),('E01-17','E01','R01',259,17),('E01-18','E01','R01',260,18),('E01-19','E01','R01',261,19),('E01-2','E01','R01',244,2),('E01-20','E01','R01',262,20),('E01-21','E01','R01',263,21),('E01-22','E01','R01',264,22),('E01-23','E01','R01',265,23),('E01-24','E01','R01',267,24),('E01-25','E01','R01',268,25),('E01-26','E01','R01',269,26),('E01-27','E01','R01',270,27),('E01-28','E01','R01',271,28),('E01-29','E01','R01',272,29),('E01-3','E01','R01',245,3),('E01-30','E01','R01',273,30),('E01-31','E01','R01',274,31),('E01-32','E01','R01',275,32),('E01-33','E01','R01',276,33),('E01-34','E01','R01',277,34),('E01-35','E01','R01',278,35),('E01-36','E01','R01',279,36),('E01-37','E01','R01',280,37),('E01-38','E01','R01',281,38),('E01-39','E01','R01',282,39),('E01-4','E01','R01',246,4),('E01-40','E01','R01',283,40),('E01-41','E01','R01',284,41),('E01-42','E01','R01',285,42),('E01-43','E01','R01',286,43),('E01-44','E01','R01',287,44),('E01-45','E01','R01',288,45),('E01-46','E01','R01',289,46),('E01-47','E01','R01',290,47),('E01-48','E01','R01',291,48),('E01-49','E01','R01',292,49),('E01-5','E01','R01',247,5),('E01-50','E01','R01',293,50),('E01-51','E01','R01',294,51),('E01-52','E01','R01',295,52),('E01-53','E01','R01',296,53),('E01-54','E01','R01',297,54),('E01-55','E01','R01',298,55),('E01-56','E01','R01',299,56),('E01-57','E01','R01',300,57),('E01-58','E01','R01',301,58),('E01-6','E01','R01',248,6),('E01-7','E01','R01',249,7),('E01-8','E01','R01',250,8),('E01-9','E01','R01',251,9),('E02-1','E02','R02',302,1),('E02-10','E02','R02',311,10),('E02-11','E02','R02',312,11),('E02-12','E02','R02',313,12),('E02-13','E02','R02',315,13),('E02-14','E02','R02',316,14),('E02-15','E02','R02',317,15),('E02-16','E02','R02',318,16),('E02-17','E02','R02',319,17),('E02-18','E02','R02',320,18),('E02-19','E02','R02',321,19),('E02-2','E02','R02',303,2),('E02-20','E02','R02',322,20),('E02-21','E02','R02',323,21),('E02-22','E02','R02',324,22),('E02-23','E02','R02',325,23),('E02-3','E02','R02',304,3),('E02-4','E02','R02',305,4),('E02-5','E02','R02',306,5),('E02-6','E02','R02',307,6),('E02-7','E02','R02',308,7),('E02-8','E02','R02',309,8),('E02-9','E02','R02',310,9),('E11-1','E11','R11',326,1),('E11-10','E11','R11',335,10),('E11-11','E11','R11',336,11),('E11-12','E11','R11',337,12),('E11-13','E11','R11',338,13),('E11-14','E11','R11',339,14),('E11-15','E11','R11',340,15),('E11-16','E11','R11',341,16),('E11-17','E11','R11',342,17),('E11-18','E11','R11',343,18),('E11-19','E11','R11',344,19),('E11-2','E11','R11',327,2),('E11-20','E11','R11',345,20),('E11-21','E11','R11',346,21),('E11-22','E11','R11',347,22),('E11-3','E11','R11',328,3),('E11-4','E11','R11',329,4),('E11-5','E11','R11',330,5),('E11-6','E11','R11',331,6),('E11-7','E11','R11',332,7),('E11-8','E11','R11',333,8),('E11-9','E11','R11',334,9);
/*!40000 ALTER TABLE `rutas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_clientes`
--

DROP TABLE IF EXISTS `tipos_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_clientes` (
  `id_tipo_cliente` varchar(1) NOT NULL,
  `tipo_cliente` varchar(20) NOT NULL,
  PRIMARY KEY (`id_tipo_cliente`),
  UNIQUE KEY `id_tipo_cliente` (`id_tipo_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_clientes`
--

LOCK TABLES `tipos_clientes` WRITE;
/*!40000 ALTER TABLE `tipos_clientes` DISABLE KEYS */;
INSERT INTO `tipos_clientes` VALUES ('A','Abono'),('F','Facturado'),('N','Natural'),('R','Revendedor');
/*!40000 ALTER TABLE `tipos_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_domicilios`
--

DROP TABLE IF EXISTS `tipos_domicilios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_domicilios` (
  `id_tipo_domicilio` varchar(1) NOT NULL,
  `tipo_domicilio` varchar(20) NOT NULL DEFAULT 'Real',
  PRIMARY KEY (`id_tipo_domicilio`),
  UNIQUE KEY `id_tipo_domicilio` (`id_tipo_domicilio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_domicilios`
--

LOCK TABLES `tipos_domicilios` WRITE;
/*!40000 ALTER TABLE `tipos_domicilios` DISABLE KEYS */;
INSERT INTO `tipos_domicilios` VALUES ('A','De atención'),('L','Legal'),('R','Real');
/*!40000 ALTER TABLE `tipos_domicilios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacciones`
--

DROP TABLE IF EXISTS `transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacciones` (
  `id_transaccion` int NOT NULL AUTO_INCREMENT,
  `id_operacion` varchar(1) NOT NULL,
  `id_medio_pago` varchar(2) NOT NULL,
  `id_cliente` int NOT NULL,
  `id_producto` varchar(3) DEFAULT NULL,
  `cantidad` int NOT NULL DEFAULT '1',
  `id_reparto` varchar(3) DEFAULT NULL,
  `fecha` date NOT NULL,
  `nro_comprobante` int DEFAULT NULL,
  `precio` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`id_transaccion`),
  UNIQUE KEY `id_transaccion` (`id_transaccion`),
  KEY `id_operacion` (`id_operacion`),
  KEY `id_medio_pago` (`id_medio_pago`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_producto` (`id_producto`),
  KEY `id_reparto` (`id_reparto`),
  CONSTRAINT `transacciones_ibfk_1` FOREIGN KEY (`id_operacion`) REFERENCES `operaciones` (`id_operacion`),
  CONSTRAINT `transacciones_ibfk_2` FOREIGN KEY (`id_medio_pago`) REFERENCES `medios_pago` (`id_medio_pago`),
  CONSTRAINT `transacciones_ibfk_3` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `transacciones_ibfk_4` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `transacciones_ibfk_5` FOREIGN KEY (`id_reparto`) REFERENCES `repartos` (`id_reparto`)
) ENGINE=InnoDB AUTO_INCREMENT=690 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciones`
--

LOCK TABLES `transacciones` WRITE;
/*!40000 ALTER TABLE `transacciones` DISABLE KEYS */;
INSERT INTO `transacciones` VALUES (1,'V','EF',1,'B20',2,'R01','2023-12-28',1,NULL),(2,'V','EF',2,'B20',1,'R01','2022-01-07',2,NULL),(3,'V','EF',3,'B20',4,'R01','2023-12-30',3,NULL),(4,'V','EF',4,'B20',3,'R01','2024-05-02',4,NULL),(5,'V','TR',5,'B20',4,'R01','2023-11-23',5,NULL),(6,'V','EF',6,'B20',1,'R01','2023-02-18',6,NULL),(7,'V','EF',7,'B20',1,'R01','2022-07-21',7,NULL),(8,'V','EF',8,'B20',1,'R01','2022-02-07',8,NULL),(9,'V','EF',9,'B20',4,'R01','2023-01-07',9,NULL),(10,'V','EF',10,'B20',1,'R01','2024-04-28',10,NULL),(11,'V','EF',11,'B20',1,'R01','2024-02-16',11,NULL),(12,'V','EF',12,'B20',1,'R01','2022-05-26',12,NULL),(13,'V','EF',13,'B20',2,'R01','2023-05-10',13,NULL),(14,'V','EF',15,'B20',4,'R01','2022-11-01',14,NULL),(15,'V','EF',16,'B20',4,'R01','2024-03-10',15,NULL),(16,'V','EF',17,'B20',4,'R01','2022-01-08',16,NULL),(17,'V','EF',18,'B20',2,'R01','2022-01-28',17,NULL),(18,'V','EF',19,'B20',2,'R01','2023-04-27',18,NULL),(19,'V','EF',20,'B20',4,'R01','2023-09-14',19,NULL),(20,'V','EF',21,'B20',1,'R01','2022-05-20',20,NULL),(21,'V','EF',22,'B20',2,'R01','2022-07-28',21,NULL),(22,'V','TR',23,'B20',3,'R01','2023-09-02',22,NULL),(23,'V','EF',24,'B20',2,'R02','2022-07-19',23,NULL),(24,'V','EF',25,'B20',4,'R02','2022-10-22',24,NULL),(25,'V','EF',26,'B20',4,'R02','2023-07-18',25,NULL),(26,'V','EF',27,'B20',3,'R02','2022-12-01',26,NULL),(27,'V','EF',28,'B20',4,'R02','2023-01-15',27,NULL),(28,'V','EF',29,'B20',4,'R02','2024-05-12',28,NULL),(29,'V','EF',30,'B20',1,'R02','2023-10-12',29,NULL),(30,'V','EF',31,'B20',2,'R02','2023-10-24',30,NULL),(31,'V','EF',32,'B20',4,'R02','2023-02-06',31,NULL),(32,'V','EF',33,'B20',3,'R02','2023-09-29',32,NULL),(33,'V','EF',34,'B20',3,'R02','2022-06-25',33,NULL),(34,'V','EF',35,'B20',2,'R11','2022-09-30',34,NULL),(35,'V','EF',36,'B20',4,'R11','2022-04-17',35,NULL),(36,'V','EF',37,'B20',2,'R11','2022-11-10',36,NULL),(37,'V','EF',38,'B20',3,'R11','2023-01-14',37,NULL),(38,'V','EF',39,'B20',1,'R11','2022-04-06',38,NULL),(39,'V','TR',40,'B20',3,'R11','2023-03-03',39,NULL),(40,'V','EF',41,'B20',1,'R11','2024-06-18',40,NULL),(41,'V','EF',42,'B20',2,'R11','2022-03-10',41,NULL),(42,'V','EF',43,'B20',2,'R11','2022-03-30',42,NULL),(43,'V','EF',44,'B20',3,'R11','2023-12-14',43,NULL),(44,'V','EF',45,'B20',2,'R11','2022-03-12',44,NULL),(45,'V','EF',46,'B20',4,'R11','2022-04-14',45,NULL),(46,'V','EF',47,'B20',3,'R11','2022-03-31',46,NULL),(47,'V','EF',48,'B20',2,'R11','2023-12-26',47,NULL),(48,'V','EF',49,'B20',3,'R11','2022-10-01',48,NULL),(49,'V','EF',50,'B20',4,'R11','2023-08-22',49,NULL),(50,'V','EF',51,'B20',2,'R11','2023-09-03',50,NULL),(51,'V','EF',52,'B20',4,'R11','2022-07-25',51,NULL),(52,'V','EF',53,'B20',1,'R11','2023-11-17',52,NULL),(53,'V','EF',54,'B20',4,'R11','2024-05-13',53,NULL),(54,'V','EF',55,'B20',1,'R11','2022-10-25',54,NULL),(55,'V','EF',56,'B20',3,'R01','2024-07-12',55,NULL),(56,'V','TR',57,'B20',4,'R01','2023-12-16',56,NULL),(57,'V','EF',58,'B20',2,'R01','2022-12-20',57,NULL),(58,'V','EF',59,'B20',4,'R01','2024-06-23',58,NULL),(59,'V','EF',60,'B20',1,'R01','2023-06-19',59,NULL),(60,'V','EF',61,'B20',2,'R01','2024-05-22',60,NULL),(61,'V','EF',62,'B20',3,'R01','2024-07-22',61,NULL),(62,'V','EF',63,'B20',3,'R01','2022-02-20',62,NULL),(63,'V','EF',64,'B20',2,'R01','2022-06-02',63,NULL),(64,'V','EF',65,'B20',3,'R01','2023-05-14',64,NULL),(65,'V','EF',66,'B20',1,'R01','2023-03-04',65,NULL),(66,'V','EF',67,'B20',3,'R01','2022-04-19',66,NULL),(67,'V','EF',68,'B20',1,'R01','2022-03-22',67,NULL),(68,'V','EF',69,'B20',1,'R01','2023-02-16',68,NULL),(69,'V','EF',70,'B20',2,'R01','2023-08-09',69,NULL),(70,'V','EF',71,'B20',2,'R01','2024-02-04',70,NULL),(71,'V','EF',72,'B20',4,'R01','2024-04-30',71,NULL),(72,'V','EF',73,'B20',1,'R01','2024-05-03',72,NULL),(73,'V','TR',74,'B20',2,'R01','2022-10-26',73,NULL),(74,'V','EF',75,'B20',2,'R01','2023-10-17',74,NULL),(75,'V','EF',76,'B20',1,'R01','2023-08-13',75,NULL),(76,'V','EF',77,'B20',3,'R01','2022-07-24',76,NULL),(77,'V','EF',78,'B20',1,'R01','2023-08-25',77,NULL),(78,'V','EF',79,'B20',1,'R02','2023-01-30',78,NULL),(79,'V','EF',80,'B20',2,'R02','2024-05-06',79,NULL),(80,'V','EF',81,'B20',1,'R02','2023-11-12',80,NULL),(81,'V','EF',82,'B20',2,'R02','2022-11-02',81,NULL),(82,'V','EF',83,'B20',3,'R02','2022-07-24',82,NULL),(83,'V','EF',84,'B20',1,'R02','2023-02-26',83,NULL),(84,'V','EF',85,'B20',1,'R02','2023-04-19',84,NULL),(85,'V','EF',86,'B20',1,'R02','2024-06-04',85,NULL),(86,'V','EF',87,'B20',3,'R02','2024-06-19',86,NULL),(87,'V','EF',88,'B20',3,'R02','2022-03-17',87,NULL),(88,'V','EF',89,'B20',3,'R02','2024-05-25',88,NULL),(89,'V','EF',90,'B20',2,'R02','2024-06-19',89,NULL),(90,'V','TR',91,'B20',2,'R02','2023-06-10',90,NULL),(91,'V','EF',92,'B20',4,'R02','2023-05-19',91,NULL),(92,'V','EF',93,'B20',4,'R02','2024-04-22',92,NULL),(93,'V','EF',94,'B20',4,'R02','2024-07-08',93,NULL),(94,'V','EF',95,'B20',2,'R11','2022-02-09',94,NULL),(95,'V','EF',96,'B20',4,'R11','2023-03-04',95,NULL),(96,'V','EF',97,'B20',4,'R11','2023-10-06',96,NULL),(97,'V','EF',98,'B20',2,'R11','2022-06-15',97,NULL),(98,'V','EF',99,'B20',2,'R11','2024-03-05',98,NULL),(99,'V','EF',100,'B20',2,'R11','2023-02-24',99,NULL),(100,'V','EF',101,'B20',1,'R11','2023-11-28',100,NULL),(101,'V','EF',103,'B20',3,'R11','2023-06-06',101,NULL),(102,'V','EF',104,'B20',3,'R11','2024-02-02',102,NULL),(103,'V','EF',105,'B20',3,'R11','2022-07-03',103,NULL),(104,'V','EF',106,'B20',1,'R11','2022-10-12',104,NULL),(105,'V','EF',107,'B20',1,'R11','2023-07-30',105,NULL),(106,'V','EF',108,'B20',2,'R11','2023-05-16',106,NULL),(107,'V','TR',109,'B20',4,'R11','2024-02-23',107,NULL),(108,'V','EF',110,'B20',1,'R11','2023-03-25',108,NULL),(109,'V','EF',111,'B20',2,'R11','2022-03-09',109,NULL),(110,'V','EF',112,'B20',3,'R11','2022-11-17',110,NULL),(111,'V','EF',113,'B20',1,'R11','2022-06-16',111,NULL),(112,'V','EF',114,'B20',2,'R11','2023-04-17',112,NULL),(113,'V','EF',115,'B20',1,'R11','2022-07-08',113,NULL),(114,'V','EF',116,'B20',2,'R01','2022-03-15',114,NULL),(115,'V','EF',117,'B20',1,'R01','2022-04-16',115,NULL),(116,'V','EF',118,'B20',2,'R01','2024-06-14',116,NULL),(117,'V','EF',119,'B20',2,'R01','2022-10-20',117,NULL),(118,'V','EF',120,'B20',2,'R01','2022-04-05',118,NULL),(119,'V','EF',121,'B20',3,'R01','2022-08-14',119,NULL),(120,'V','EF',122,'B20',2,'R01','2024-06-21',120,NULL),(121,'V','EF',123,'B20',2,'R01','2023-12-21',121,NULL),(122,'V','EF',124,'B20',4,'R01','2022-06-26',122,NULL),(123,'V','EF',125,'B20',1,'R01','2024-03-28',123,NULL),(124,'V','TR',126,'B20',4,'R01','2022-01-17',124,NULL),(125,'V','EF',127,'B20',4,'R01','2024-03-23',125,NULL),(126,'V','EF',128,'B20',1,'R01','2022-05-15',126,NULL),(127,'V','EF',129,'B20',1,'R01','2023-10-08',127,NULL),(128,'V','EF',130,'B20',2,'R01','2022-09-02',128,NULL),(129,'V','EF',131,'B20',1,'R01','2022-12-09',129,NULL),(130,'V','EF',132,'B20',3,'R01','2023-03-06',130,NULL),(131,'V','EF',133,'B20',2,'R01','2023-03-01',131,NULL),(132,'V','EF',134,'B20',1,'R01','2024-06-09',132,NULL),(133,'V','EF',135,'B20',1,'R01','2023-11-17',133,NULL),(134,'V','EF',136,'B20',2,'R01','2022-09-22',134,NULL),(135,'V','EF',137,'B20',4,'R01','2022-03-19',135,NULL),(136,'V','EF',138,'B20',2,'R02','2023-10-29',136,NULL),(137,'V','EF',139,'B20',4,'R02','2023-01-10',137,NULL),(138,'V','EF',140,'B20',2,'R02','2022-01-29',138,NULL),(139,'V','EF',141,'B20',2,'R02','2023-03-29',139,NULL),(140,'V','EF',142,'B20',3,'R02','2024-05-18',140,NULL),(141,'V','TR',143,'B20',1,'R02','2023-03-10',141,NULL),(142,'V','EF',144,'B20',2,'R02','2023-06-28',142,NULL),(143,'V','EF',145,'B20',4,'R02','2022-03-30',143,NULL),(144,'V','EF',146,'B20',2,'R02','2023-12-02',144,NULL),(145,'V','EF',147,'B20',4,'R02','2023-08-21',145,NULL),(146,'V','EF',148,'B20',2,'R02','2022-01-27',146,NULL),(147,'V','EF',149,'B20',3,'R02','2024-06-07',147,NULL),(148,'V','EF',150,'B20',2,'R02','2023-11-04',148,NULL),(149,'V','EF',151,'B20',1,'R02','2022-07-15',149,NULL),(150,'V','EF',152,'B20',4,'R02','2023-08-24',150,NULL),(151,'V','EF',153,'B20',3,'R02','2024-06-07',151,NULL),(152,'V','EF',154,'B20',4,'R02','2024-02-29',152,NULL),(153,'V','EF',155,'B20',3,'R11','2023-06-08',153,NULL),(154,'V','EF',156,'B20',4,'R11','2023-11-26',154,NULL),(155,'V','EF',157,'B20',2,'R11','2022-05-29',155,NULL),(156,'V','EF',158,'B20',1,'R11','2022-08-18',156,NULL),(157,'V','EF',159,'B20',3,'R11','2022-01-19',157,NULL),(158,'V','TR',160,'B20',3,'R11','2022-09-04',158,NULL),(159,'V','EF',161,'B20',3,'R11','2023-11-08',159,NULL),(160,'V','EF',162,'B20',3,'R11','2022-12-09',160,NULL),(161,'V','EF',163,'B20',1,'R11','2022-04-05',161,NULL),(162,'V','EF',164,'B20',3,'R11','2024-01-20',162,NULL),(163,'V','EF',165,'B20',2,'R11','2024-06-03',163,NULL),(164,'V','EF',166,'B20',2,'R11','2022-04-12',164,NULL),(165,'V','EF',167,'B20',3,'R11','2024-04-08',165,NULL),(166,'V','EF',168,'B20',1,'R11','2022-01-29',166,NULL),(167,'V','EF',169,'B20',3,'R11','2023-08-30',167,NULL),(168,'V','EF',170,'B20',1,'R11','2022-10-27',168,NULL),(169,'V','EF',171,'B20',1,'R11','2022-01-18',169,NULL),(170,'V','EF',172,'B20',3,'R11','2022-08-25',170,NULL),(171,'V','EF',173,'B20',4,'R11','2023-02-22',171,NULL),(172,'V','EF',174,'B20',3,'R11','2023-01-10',172,NULL),(173,'V','EF',175,'B20',3,'R01','2023-01-28',173,NULL),(174,'V','EF',176,'B20',1,'R01','2023-04-08',174,NULL),(175,'V','TR',177,'B20',1,'R01','2022-12-24',175,NULL),(176,'V','EF',178,'B20',2,'R01','2023-04-29',176,NULL),(177,'V','EF',179,'B20',1,'R01','2022-11-02',177,NULL),(178,'V','EF',180,'B20',3,'R01','2023-05-09',178,NULL),(179,'V','EF',181,'B20',3,'R01','2023-10-10',179,NULL),(180,'V','EF',182,'B20',1,'R01','2024-04-13',180,NULL),(181,'V','EF',183,'B20',2,'R01','2023-07-24',181,NULL),(182,'V','EF',184,'B20',1,'R01','2023-01-08',182,NULL),(183,'V','EF',185,'B20',2,'R01','2024-01-04',183,NULL),(184,'V','EF',186,'B20',2,'R01','2024-04-19',184,NULL),(185,'V','EF',187,'B20',1,'R01','2022-02-17',185,NULL),(186,'V','EF',188,'B20',4,'R01','2024-04-13',186,NULL),(187,'V','EF',189,'B20',2,'R01','2022-05-02',187,NULL),(188,'V','EF',191,'B20',2,'R01','2023-10-11',188,NULL),(189,'V','EF',192,'B20',3,'R01','2023-06-07',189,NULL),(190,'V','EF',193,'B20',2,'R01','2023-03-05',190,NULL),(191,'V','EF',194,'B20',3,'R01','2022-07-02',191,NULL),(192,'V','TR',195,'B20',3,'R01','2022-12-20',192,NULL),(193,'V','EF',196,'B20',1,'R01','2024-03-10',193,NULL),(194,'V','EF',197,'B20',4,'R01','2023-03-26',194,NULL),(195,'V','EF',198,'B20',1,'R02','2022-09-14',195,NULL),(196,'V','EF',199,'B20',2,'R02','2024-04-17',196,NULL),(197,'V','EF',200,'B20',2,'R02','2024-01-31',197,NULL),(198,'V','EF',201,'B20',1,'R02','2024-04-12',198,NULL),(199,'V','EF',202,'B20',1,'R02','2022-08-04',199,NULL),(200,'V','EF',203,'B20',4,'R02','2022-06-28',200,NULL),(201,'V','EF',204,'B20',2,'R02','2023-02-24',201,NULL),(202,'V','EF',205,'B20',3,'R02','2024-03-20',202,NULL),(203,'V','EF',206,'B20',4,'R02','2022-12-22',203,NULL),(204,'V','EF',207,'B20',3,'R02','2023-11-16',204,NULL),(205,'V','EF',208,'B20',1,'R02','2024-03-14',205,NULL),(206,'V','EF',209,'B20',3,'R02','2022-05-12',206,NULL),(207,'V','EF',210,'B20',4,'R02','2022-03-24',207,NULL),(208,'V','EF',211,'B20',4,'R02','2022-03-16',208,NULL),(209,'V','TR',212,'B20',4,'R02','2024-03-03',209,NULL),(210,'V','EF',213,'B20',4,'R02','2022-07-10',210,NULL),(211,'V','EF',214,'B20',2,'R02','2022-04-01',211,NULL),(212,'V','EF',215,'B20',3,'R02','2022-03-23',212,NULL),(213,'V','EF',216,'B20',2,'R02','2024-02-14',213,NULL),(214,'V','EF',217,'B20',4,'R02','2022-09-16',214,NULL),(215,'V','EF',218,'B20',2,'R02','2024-07-05',215,NULL),(216,'V','EF',219,'B20',1,'R02','2024-01-16',216,NULL),(217,'V','EF',220,'B20',2,'R02','2024-02-22',217,NULL),(218,'V','EF',221,'B20',4,'R02','2022-05-24',218,NULL),(219,'V','EF',222,'B20',4,'R11','2023-06-16',219,NULL),(220,'V','EF',223,'B20',4,'R11','2023-08-26',220,NULL),(221,'V','EF',224,'B20',2,'R11','2022-10-22',221,NULL),(222,'V','EF',226,'B20',4,'R11','2023-03-19',222,NULL),(223,'V','EF',227,'B20',1,'R11','2022-10-31',223,NULL),(224,'V','EF',228,'B20',3,'R11','2024-02-24',224,NULL),(225,'V','EF',229,'B20',3,'R11','2024-02-01',225,NULL),(226,'V','TR',230,'B20',1,'R11','2023-08-31',226,NULL),(227,'V','EF',231,'B20',4,'R11','2023-02-28',227,NULL),(228,'V','EF',232,'B20',4,'R11','2022-12-31',228,NULL),(229,'V','EF',233,'B20',2,'R11','2022-03-28',229,NULL),(230,'V','EF',234,'B20',1,'R11','2022-03-07',230,NULL),(231,'V','EF',235,'B20',1,'R11','2022-10-02',231,NULL),(232,'V','EF',236,'B20',3,'R11','2022-04-12',232,NULL),(233,'V','EF',237,'B20',2,'R11','2022-09-03',233,NULL),(234,'V','EF',238,'B20',2,'R11','2023-02-03',234,NULL),(235,'V','EF',239,'B20',3,'R11','2023-01-12',235,NULL),(236,'V','EF',240,'B20',2,'R11','2022-03-14',236,NULL),(237,'V','EF',241,'B20',3,'R11','2022-08-18',237,NULL),(238,'V','EF',242,'B20',2,'R11','2024-03-04',238,NULL),(239,'V','EF',243,'B20',1,'R01','2022-12-25',239,NULL),(240,'V','EF',244,'B20',3,'R01','2022-09-29',240,NULL),(241,'V','EF',245,'B20',4,'R01','2022-03-15',241,NULL),(242,'V','EF',246,'B20',2,'R01','2022-07-10',242,NULL),(243,'V','TR',247,'B20',2,'R01','2022-05-22',243,NULL),(244,'V','EF',248,'B20',2,'R01','2022-09-01',244,NULL),(245,'V','EF',249,'B20',1,'R01','2023-06-24',245,NULL),(246,'V','EF',250,'B20',3,'R01','2023-09-05',246,NULL),(247,'V','EF',251,'B20',2,'R01','2023-10-12',247,NULL),(248,'V','EF',252,'B20',3,'R01','2022-06-10',248,NULL),(249,'V','EF',253,'B20',3,'R01','2022-03-25',249,NULL),(250,'V','EF',254,'B20',4,'R01','2023-08-03',250,NULL),(251,'V','EF',255,'B20',3,'R01','2023-11-30',251,NULL),(252,'V','EF',256,'B20',3,'R01','2024-06-19',252,NULL),(253,'V','EF',257,'B20',3,'R01','2022-03-21',253,NULL),(254,'V','EF',258,'B20',2,'R01','2023-01-02',254,NULL),(255,'V','EF',259,'B20',1,'R01','2023-05-31',255,NULL),(256,'V','EF',260,'B20',1,'R01','2024-03-06',256,NULL),(257,'V','EF',261,'B20',4,'R01','2023-07-21',257,NULL),(258,'V','EF',262,'B20',2,'R01','2024-03-02',258,NULL),(259,'V','EF',263,'B20',4,'R01','2024-02-24',259,NULL),(260,'V','TR',264,'B20',4,'R01','2023-11-15',260,NULL),(261,'V','EF',265,'B20',4,'R01','2023-12-04',261,NULL),(262,'V','EF',267,'B20',3,'R01','2022-06-01',262,NULL),(263,'V','EF',268,'B20',1,'R01','2022-03-15',263,NULL),(264,'V','EF',269,'B20',1,'R01','2022-02-11',264,NULL),(265,'V','EF',270,'B20',4,'R01','2022-05-13',265,NULL),(266,'V','EF',271,'B20',2,'R01','2022-07-16',266,NULL),(267,'V','EF',272,'B20',2,'R01','2023-10-16',267,NULL),(268,'V','EF',273,'B20',2,'R01','2022-06-25',268,NULL),(269,'V','EF',274,'B20',3,'R01','2022-04-11',269,NULL),(270,'V','EF',275,'B20',2,'R01','2024-01-10',270,NULL),(271,'V','EF',276,'B20',3,'R01','2022-05-20',271,NULL),(272,'V','EF',277,'B20',1,'R01','2022-06-12',272,NULL),(273,'V','EF',278,'B20',2,'R01','2022-08-21',273,NULL),(274,'V','EF',279,'B20',1,'R01','2024-02-01',274,NULL),(275,'V','EF',280,'B20',4,'R01','2022-02-15',275,NULL),(276,'V','EF',281,'B20',4,'R01','2022-05-02',276,NULL),(277,'V','TR',282,'B20',1,'R01','2022-11-11',277,NULL),(278,'V','EF',283,'B20',2,'R01','2023-03-20',278,NULL),(279,'V','EF',284,'B20',4,'R01','2022-05-26',279,NULL),(280,'V','EF',285,'B20',4,'R01','2024-01-22',280,NULL),(281,'V','EF',286,'B20',1,'R01','2023-07-04',281,NULL),(282,'V','EF',287,'B20',2,'R01','2022-03-02',282,NULL),(283,'V','EF',288,'B20',3,'R01','2022-04-24',283,NULL),(284,'V','EF',289,'B20',3,'R01','2024-01-21',284,NULL),(285,'V','EF',290,'B20',2,'R01','2022-07-04',285,NULL),(286,'V','EF',291,'B20',4,'R01','2023-11-05',286,NULL),(287,'V','EF',292,'B20',2,'R01','2024-05-17',287,NULL),(288,'V','EF',293,'B20',3,'R01','2024-01-03',288,NULL),(289,'V','EF',294,'B20',4,'R01','2022-04-16',289,NULL),(290,'V','EF',295,'B20',4,'R01','2023-01-28',290,NULL),(291,'V','EF',296,'B20',4,'R01','2022-09-01',291,NULL),(292,'V','EF',297,'B20',2,'R01','2023-05-22',292,NULL),(293,'V','EF',298,'B20',3,'R01','2023-11-16',293,NULL),(294,'V','TR',299,'B20',2,'R01','2022-05-12',294,NULL),(295,'V','EF',300,'B20',2,'R01','2022-10-01',295,NULL),(296,'V','EF',301,'B20',4,'R01','2024-07-14',296,NULL),(297,'V','EF',302,'B20',3,'R02','2023-05-30',297,NULL),(298,'V','EF',303,'B20',1,'R02','2023-07-12',298,NULL),(299,'V','EF',304,'B20',2,'R02','2023-04-20',299,NULL),(300,'V','EF',305,'B20',1,'R02','2022-09-29',300,NULL),(301,'V','EF',306,'B20',2,'R02','2023-08-29',301,NULL),(302,'V','EF',307,'B20',3,'R02','2022-07-28',302,NULL),(303,'V','EF',308,'B20',2,'R02','2023-01-20',303,NULL),(304,'V','EF',309,'B20',1,'R02','2023-10-24',304,NULL),(305,'V','EF',310,'B20',3,'R02','2023-02-15',305,NULL),(306,'V','EF',311,'B20',1,'R02','2022-02-22',306,NULL),(307,'V','EF',312,'B20',1,'R02','2023-05-11',307,NULL),(308,'V','EF',313,'B20',2,'R02','2022-04-16',308,NULL),(309,'V','EF',315,'B20',3,'R02','2024-06-14',309,NULL),(310,'V','EF',316,'B20',2,'R02','2022-06-20',310,NULL),(311,'V','TR',317,'B20',4,'R02','2023-06-05',311,NULL),(312,'V','EF',318,'B20',4,'R02','2023-01-16',312,NULL),(313,'V','EF',319,'B20',4,'R02','2024-03-12',313,NULL),(314,'V','EF',320,'B20',1,'R02','2022-09-02',314,NULL),(315,'V','EF',321,'B20',2,'R02','2022-05-07',315,NULL),(316,'V','EF',322,'B20',2,'R02','2022-06-13',316,NULL),(317,'V','EF',323,'B20',2,'R02','2022-08-29',317,NULL),(318,'V','EF',324,'B20',3,'R02','2022-08-31',318,NULL),(319,'V','EF',325,'B20',4,'R02','2022-09-25',319,NULL),(320,'V','EF',326,'B20',4,'R11','2022-05-27',320,NULL),(321,'V','EF',327,'B20',2,'R11','2023-03-22',321,NULL),(322,'V','EF',328,'B20',4,'R11','2024-01-24',322,NULL),(323,'V','EF',329,'B20',1,'R11','2023-10-18',323,NULL),(324,'V','EF',330,'B20',1,'R11','2022-09-23',324,NULL),(325,'V','EF',331,'B20',2,'R11','2024-01-04',325,NULL),(326,'V','EF',332,'B20',3,'R11','2024-02-26',326,NULL),(327,'V','EF',333,'B20',2,'R11','2023-08-30',327,NULL),(328,'V','TR',334,'B20',2,'R11','2022-02-09',328,NULL),(329,'V','EF',335,'B20',4,'R11','2022-09-18',329,NULL),(330,'V','EF',336,'B20',1,'R11','2022-09-11',330,NULL),(331,'V','EF',337,'B20',1,'R11','2023-05-27',331,NULL),(332,'V','EF',338,'B20',2,'R11','2024-01-02',332,NULL),(333,'V','EF',339,'B20',4,'R11','2023-12-01',333,NULL),(334,'V','TR',340,'B20',2,'R11','2022-08-26',334,NULL),(335,'V','TR',341,'B20',3,'R11','2022-12-30',335,NULL),(336,'V','TR',342,'B20',3,'R11','2024-03-26',336,NULL),(337,'V','TR',343,'B20',3,'R11','2023-07-24',337,NULL),(338,'V','EF',344,'B20',3,'R11','2024-01-22',338,NULL),(339,'V','TR',345,'B20',2,'R11','2023-02-25',339,NULL),(340,'V','TR',346,'B20',1,'R11','2022-08-05',340,NULL),(341,'V','EF',347,'B20',4,'R11','2023-03-01',341,NULL),(342,'V','EF',1,'B20',2,'R01','2022-03-10',342,NULL),(343,'V','EF',2,'B20',1,'R01','2022-02-25',343,NULL),(344,'V','EF',3,'B20',4,'R01','2022-03-26',344,NULL),(345,'V','EF',4,'B20',4,'R01','2022-07-09',345,NULL),(346,'V','TR',5,'B20',2,'R01','2022-08-03',346,NULL),(347,'V','EF',6,'B20',3,'R01','2023-01-29',347,NULL),(348,'V','EF',7,'B20',2,'R01','2024-02-10',348,NULL),(349,'V','EF',8,'B20',2,'R01','2024-05-19',349,NULL),(350,'V','EF',9,'B20',2,'R01','2022-03-19',350,NULL),(351,'V','EF',10,'B20',4,'R01','2023-12-22',351,NULL),(352,'V','EF',11,'B20',2,'R01','2022-10-18',352,NULL),(353,'V','EF',12,'B20',4,'R01','2023-06-24',353,NULL),(354,'V','EF',13,'B20',4,'R01','2024-03-12',354,NULL),(355,'V','EF',15,'B20',2,'R01','2022-04-03',355,NULL),(356,'V','EF',16,'B20',1,'R01','2022-10-26',356,NULL),(357,'V','EF',17,'B20',3,'R01','2022-02-01',357,NULL),(358,'V','EF',18,'B20',3,'R01','2022-06-24',358,NULL),(359,'V','EF',19,'B20',2,'R01','2022-07-17',359,NULL),(360,'V','EF',20,'B20',2,'R01','2022-01-22',360,NULL),(361,'V','EF',21,'B20',3,'R01','2024-07-03',361,NULL),(362,'V','EF',22,'B20',3,'R01','2023-03-25',362,NULL),(363,'V','TR',23,'B20',3,'R01','2022-12-31',363,NULL),(364,'V','EF',24,'B20',1,'R02','2022-02-02',364,NULL),(365,'V','EF',25,'B20',3,'R02','2023-07-22',365,NULL),(366,'V','EF',26,'B20',4,'R02','2023-09-06',366,NULL),(367,'V','EF',27,'B20',1,'R02','2022-10-10',367,NULL),(368,'V','EF',28,'B20',1,'R02','2023-12-29',368,NULL),(369,'V','EF',29,'B20',3,'R02','2024-04-15',369,NULL),(370,'V','EF',30,'B20',3,'R02','2022-01-25',370,NULL),(371,'V','EF',31,'B20',3,'R02','2022-02-26',371,NULL),(372,'V','EF',32,'B20',4,'R02','2024-06-19',372,NULL),(373,'V','EF',33,'B20',3,'R02','2023-12-25',373,NULL),(374,'V','EF',34,'B20',3,'R02','2024-04-27',374,NULL),(375,'V','EF',35,'B20',4,'R11','2022-03-24',375,NULL),(376,'V','EF',36,'B20',1,'R11','2022-08-09',376,NULL),(377,'V','EF',37,'B20',1,'R11','2023-04-27',377,NULL),(378,'V','EF',38,'B20',3,'R11','2022-10-31',378,NULL),(379,'V','EF',39,'B20',4,'R11','2022-06-11',379,NULL),(380,'V','TR',40,'B20',3,'R11','2022-09-17',380,NULL),(381,'V','EF',41,'B20',2,'R11','2023-01-22',381,NULL),(382,'V','EF',42,'B20',3,'R11','2024-04-30',382,NULL),(383,'V','EF',43,'B20',2,'R11','2024-05-28',383,NULL),(384,'V','EF',44,'B20',4,'R11','2024-07-11',384,NULL),(385,'V','EF',45,'B20',1,'R11','2023-01-03',385,NULL),(386,'V','EF',46,'B20',3,'R11','2023-01-14',386,NULL),(387,'V','EF',47,'B20',3,'R11','2024-04-24',387,NULL),(388,'V','EF',48,'B20',4,'R11','2022-02-10',388,NULL),(389,'V','EF',49,'B20',3,'R11','2023-06-11',389,NULL),(390,'V','EF',50,'B20',2,'R11','2023-04-12',390,NULL),(391,'V','EF',51,'B20',4,'R11','2024-04-23',391,NULL),(392,'V','EF',52,'B20',3,'R11','2022-08-25',392,NULL),(393,'V','EF',53,'B20',4,'R11','2024-05-11',393,NULL),(394,'V','EF',54,'B20',1,'R11','2022-08-01',394,NULL),(395,'V','EF',55,'B20',1,'R11','2023-07-27',395,NULL),(396,'V','EF',56,'B20',1,'R01','2024-04-24',396,NULL),(397,'V','TR',57,'B20',4,'R01','2023-06-20',397,NULL),(398,'V','EF',58,'B20',3,'R01','2023-01-15',398,NULL),(399,'V','EF',59,'B20',2,'R01','2024-04-18',399,NULL),(400,'V','EF',60,'B20',4,'R01','2024-07-20',400,NULL),(401,'V','EF',61,'B20',1,'R01','2022-01-10',401,NULL),(402,'V','EF',62,'B20',3,'R01','2023-11-04',402,NULL),(403,'V','EF',63,'B20',4,'R01','2022-07-12',403,NULL),(404,'V','EF',64,'B20',3,'R01','2024-03-18',404,NULL),(405,'V','EF',65,'B20',3,'R01','2024-01-31',405,NULL),(406,'V','EF',66,'B20',4,'R01','2022-03-03',406,NULL),(407,'V','EF',67,'B20',4,'R01','2022-03-28',407,NULL),(408,'V','EF',68,'B20',1,'R01','2022-07-30',408,NULL),(409,'V','EF',69,'B20',2,'R01','2023-12-14',409,NULL),(410,'V','EF',70,'B20',2,'R01','2023-12-07',410,NULL),(411,'V','EF',71,'B20',4,'R01','2022-10-06',411,NULL),(412,'V','EF',72,'B20',2,'R01','2024-02-26',412,NULL),(413,'V','EF',73,'B20',4,'R01','2022-07-09',413,NULL),(414,'V','TR',74,'B20',2,'R01','2023-11-02',414,NULL),(415,'V','EF',75,'B20',1,'R01','2023-08-10',415,NULL),(416,'V','EF',76,'B20',3,'R01','2022-09-20',416,NULL),(417,'V','EF',77,'B20',4,'R01','2022-05-20',417,NULL),(418,'V','EF',78,'B20',3,'R01','2024-06-05',418,NULL),(419,'V','EF',79,'B20',2,'R02','2023-09-07',419,NULL),(420,'V','EF',80,'B20',4,'R02','2024-04-18',420,NULL),(421,'V','EF',81,'B20',4,'R02','2023-11-21',421,NULL),(422,'V','EF',82,'B20',3,'R02','2022-04-25',422,NULL),(423,'V','EF',83,'B20',2,'R02','2022-09-02',423,NULL),(424,'V','EF',84,'B20',4,'R02','2022-07-24',424,NULL),(425,'V','EF',85,'B20',4,'R02','2023-01-07',425,NULL),(426,'V','EF',86,'B20',1,'R02','2022-03-04',426,NULL),(427,'V','EF',87,'B20',2,'R02','2022-04-23',427,NULL),(428,'V','EF',88,'B20',1,'R02','2024-03-24',428,NULL),(429,'V','EF',89,'B20',4,'R02','2022-12-17',429,NULL),(430,'V','EF',90,'B20',4,'R02','2023-04-22',430,NULL),(431,'V','TR',91,'B20',1,'R02','2023-10-16',431,NULL),(432,'V','EF',92,'B20',2,'R02','2024-01-14',432,NULL),(433,'V','EF',93,'B20',1,'R02','2023-05-30',433,NULL),(434,'V','EF',94,'B20',4,'R02','2023-12-12',434,NULL),(435,'V','EF',95,'B20',4,'R11','2023-05-10',435,NULL),(436,'V','EF',96,'B20',3,'R11','2022-11-30',436,NULL),(437,'V','EF',97,'B20',2,'R11','2023-03-21',437,NULL),(438,'V','EF',98,'B20',4,'R11','2023-01-02',438,NULL),(439,'V','EF',99,'B20',4,'R11','2022-09-02',439,NULL),(440,'V','EF',100,'B20',2,'R11','2023-07-24',440,NULL),(441,'V','EF',101,'B20',1,'R11','2023-06-12',441,NULL),(442,'V','EF',103,'B20',1,'R11','2024-04-25',442,NULL),(443,'V','EF',104,'B20',3,'R11','2022-04-03',443,NULL),(444,'V','EF',105,'B20',2,'R11','2023-11-23',444,NULL),(445,'V','EF',106,'B20',2,'R11','2024-06-26',445,NULL),(446,'V','EF',107,'B20',3,'R11','2022-10-29',446,NULL),(447,'V','EF',108,'B20',1,'R11','2024-02-23',447,NULL),(448,'V','TR',109,'B20',4,'R11','2022-03-23',448,NULL),(449,'V','EF',110,'B20',4,'R11','2022-04-15',449,NULL),(450,'V','EF',111,'B20',3,'R11','2022-04-30',450,NULL),(451,'V','EF',112,'B20',4,'R11','2024-06-26',451,NULL),(452,'V','EF',113,'B20',3,'R11','2022-10-02',452,NULL),(453,'V','EF',114,'B20',4,'R11','2023-07-26',453,NULL),(454,'V','EF',115,'B20',1,'R11','2023-09-19',454,NULL),(455,'V','EF',116,'B20',2,'R01','2022-12-14',455,NULL),(456,'V','EF',117,'B20',2,'R01','2023-02-07',456,NULL),(457,'V','EF',118,'B20',1,'R01','2023-03-16',457,NULL),(458,'V','EF',119,'B20',4,'R01','2022-02-11',458,NULL),(459,'V','EF',120,'B20',3,'R01','2024-01-31',459,NULL),(460,'V','EF',121,'B20',1,'R01','2022-10-29',460,NULL),(461,'V','EF',122,'B20',3,'R01','2023-08-08',461,NULL),(462,'V','EF',123,'B20',1,'R01','2022-05-01',462,NULL),(463,'V','EF',124,'B20',2,'R01','2022-12-04',463,NULL),(464,'V','EF',125,'B20',3,'R01','2023-02-19',464,NULL),(465,'V','TR',126,'B20',3,'R01','2024-02-22',465,NULL),(466,'V','EF',127,'B20',1,'R01','2022-06-07',466,NULL),(467,'V','EF',128,'B20',2,'R01','2022-07-26',467,NULL),(468,'V','EF',129,'B20',1,'R01','2023-03-30',468,NULL),(469,'V','EF',130,'B20',1,'R01','2024-07-12',469,NULL),(470,'V','EF',131,'B20',2,'R01','2023-11-05',470,NULL),(471,'V','EF',132,'B20',2,'R01','2023-12-18',471,NULL),(472,'V','EF',133,'B20',2,'R01','2023-10-22',472,NULL),(473,'V','EF',134,'B20',1,'R01','2022-04-13',473,NULL),(474,'V','EF',135,'B20',4,'R01','2024-07-16',474,NULL),(475,'V','EF',136,'B20',3,'R01','2022-05-06',475,NULL),(476,'V','EF',137,'B20',1,'R01','2022-11-10',476,NULL),(477,'V','EF',138,'B20',2,'R02','2022-07-19',477,NULL),(478,'V','EF',139,'B20',2,'R02','2023-04-03',478,NULL),(479,'V','EF',140,'B20',3,'R02','2023-01-17',479,NULL),(480,'V','EF',141,'B20',4,'R02','2022-12-03',480,NULL),(481,'V','EF',142,'B20',1,'R02','2024-05-19',481,NULL),(482,'V','TR',143,'B20',4,'R02','2023-05-14',482,NULL),(483,'V','EF',144,'B20',3,'R02','2024-07-18',483,NULL),(484,'V','EF',145,'B20',4,'R02','2022-10-19',484,NULL),(485,'V','EF',146,'B20',4,'R02','2023-06-18',485,NULL),(486,'V','EF',147,'B20',4,'R02','2022-11-12',486,NULL),(487,'V','EF',148,'B20',4,'R02','2024-04-09',487,NULL),(488,'V','EF',149,'B20',3,'R02','2022-05-06',488,NULL),(489,'V','EF',150,'B20',2,'R02','2022-05-14',489,NULL),(490,'V','EF',151,'B20',1,'R02','2024-02-14',490,NULL),(491,'V','EF',152,'B20',4,'R02','2023-12-17',491,NULL),(492,'V','EF',153,'B20',3,'R02','2023-01-06',492,NULL),(493,'V','EF',154,'B20',2,'R02','2023-01-13',493,NULL),(494,'V','EF',155,'B20',4,'R11','2023-07-21',494,NULL),(495,'V','EF',156,'B20',3,'R11','2023-12-12',495,NULL),(496,'V','EF',157,'B20',1,'R11','2023-03-26',496,NULL),(497,'V','EF',158,'B20',4,'R11','2023-05-21',497,NULL),(498,'V','EF',159,'B20',3,'R11','2023-01-01',498,NULL),(499,'V','TR',160,'B20',4,'R11','2024-01-06',499,NULL),(500,'V','EF',161,'B20',3,'R11','2024-07-12',500,NULL),(501,'V','EF',162,'B20',3,'R11','2024-04-22',501,NULL),(502,'V','EF',163,'B20',4,'R11','2022-03-04',502,NULL),(503,'V','EF',164,'B20',2,'R11','2023-11-27',503,NULL),(504,'V','EF',165,'B20',1,'R11','2022-07-22',504,NULL),(505,'V','EF',166,'B20',3,'R11','2024-06-18',505,NULL),(506,'V','EF',167,'B20',4,'R11','2022-11-29',506,NULL),(507,'V','EF',168,'B20',4,'R11','2023-04-07',507,NULL),(508,'V','EF',169,'B20',2,'R11','2023-04-17',508,NULL),(509,'V','EF',170,'B20',4,'R11','2024-01-21',509,NULL),(510,'V','EF',171,'B20',2,'R11','2024-04-12',510,NULL),(511,'V','EF',172,'B20',1,'R11','2023-04-06',511,NULL),(512,'V','EF',173,'B20',2,'R11','2022-05-06',512,NULL),(513,'V','EF',174,'B20',3,'R11','2024-04-30',513,NULL),(514,'V','EF',175,'B20',1,'R01','2023-05-24',514,NULL),(515,'V','EF',176,'B20',4,'R01','2022-12-25',515,NULL),(516,'V','TR',177,'B20',1,'R01','2023-07-06',516,NULL),(517,'V','EF',178,'B20',4,'R01','2024-05-01',517,NULL),(518,'V','EF',179,'B20',3,'R01','2023-02-07',518,NULL),(519,'V','EF',180,'B20',3,'R01','2022-08-14',519,NULL),(520,'V','EF',181,'B20',4,'R01','2022-05-23',520,NULL),(521,'V','EF',182,'B20',4,'R01','2022-10-08',521,NULL),(522,'V','EF',183,'B20',3,'R01','2022-11-04',522,NULL),(523,'V','EF',184,'B20',4,'R01','2023-04-03',523,NULL),(524,'V','EF',185,'B20',4,'R01','2022-06-05',524,NULL),(525,'V','EF',186,'B20',4,'R01','2022-07-12',525,NULL),(526,'V','EF',187,'B20',3,'R01','2022-06-12',526,NULL),(527,'V','EF',188,'B20',4,'R01','2023-12-21',527,NULL),(528,'V','EF',189,'B20',3,'R01','2023-06-15',528,NULL),(529,'V','EF',191,'B20',2,'R01','2023-05-25',529,NULL),(530,'V','EF',192,'B20',4,'R01','2023-01-09',530,NULL),(531,'V','EF',193,'B20',3,'R01','2022-06-17',531,NULL),(532,'V','EF',194,'B20',1,'R01','2023-07-19',532,NULL),(533,'V','TR',195,'B20',3,'R01','2023-08-18',533,NULL),(534,'V','EF',196,'B20',3,'R01','2023-01-06',534,NULL),(535,'V','EF',197,'B20',2,'R01','2022-06-24',535,NULL),(536,'V','EF',198,'B20',1,'R02','2023-12-29',536,NULL),(537,'V','EF',199,'B20',3,'R02','2024-01-17',537,NULL),(538,'V','EF',200,'B20',1,'R02','2023-10-19',538,NULL),(539,'V','EF',201,'B20',3,'R02','2022-02-28',539,NULL),(540,'V','EF',202,'B20',3,'R02','2023-05-07',540,NULL),(541,'V','EF',203,'B20',1,'R02','2022-06-30',541,NULL),(542,'V','EF',204,'B20',1,'R02','2023-09-14',542,NULL),(543,'V','EF',205,'B20',2,'R02','2022-04-23',543,NULL),(544,'V','EF',206,'B20',2,'R02','2022-03-31',544,NULL),(545,'V','EF',207,'B20',2,'R02','2023-07-07',545,NULL),(546,'V','EF',208,'B20',4,'R02','2023-07-01',546,NULL),(547,'V','EF',209,'B20',3,'R02','2023-09-07',547,NULL),(548,'V','EF',210,'B20',2,'R02','2022-06-26',548,NULL),(549,'V','EF',211,'B20',3,'R02','2023-09-16',549,NULL),(550,'V','TR',212,'B20',1,'R02','2022-07-24',550,NULL),(551,'V','EF',213,'B20',1,'R02','2023-06-12',551,NULL),(552,'V','EF',214,'B20',1,'R02','2023-01-16',552,NULL),(553,'V','EF',215,'B20',4,'R02','2024-05-08',553,NULL),(554,'V','EF',216,'B20',2,'R02','2022-06-13',554,NULL),(555,'V','EF',217,'B20',3,'R02','2023-02-03',555,NULL),(556,'V','EF',218,'B20',1,'R02','2023-04-28',556,NULL),(557,'V','EF',219,'B20',3,'R02','2022-05-24',557,NULL),(558,'V','EF',220,'B20',1,'R02','2024-02-21',558,NULL),(559,'V','EF',221,'B20',4,'R02','2022-09-19',559,NULL),(560,'V','EF',222,'B20',4,'R11','2022-03-03',560,NULL),(561,'V','EF',223,'B20',2,'R11','2024-01-06',561,NULL),(562,'V','EF',224,'B20',3,'R11','2024-05-20',562,NULL),(563,'V','EF',226,'B20',3,'R11','2022-11-09',563,NULL),(564,'V','EF',227,'B20',1,'R11','2024-06-24',564,NULL),(565,'V','EF',228,'B20',4,'R11','2023-04-22',565,NULL),(566,'V','EF',229,'B20',3,'R11','2024-04-23',566,NULL),(567,'V','TR',230,'B20',4,'R11','2023-12-17',567,NULL),(568,'V','EF',231,'B20',3,'R11','2023-06-29',568,NULL),(569,'V','EF',232,'B20',1,'R11','2024-03-10',569,NULL),(570,'V','EF',233,'B20',4,'R11','2024-05-28',570,NULL),(571,'V','EF',234,'B20',2,'R11','2022-08-18',571,NULL),(572,'V','EF',235,'B20',4,'R11','2022-06-05',572,NULL),(573,'V','EF',236,'B20',2,'R11','2022-01-31',573,NULL),(574,'V','EF',237,'B20',3,'R11','2022-07-29',574,NULL),(575,'V','EF',238,'B20',3,'R11','2022-05-26',575,NULL),(576,'V','EF',239,'B20',4,'R11','2023-02-15',576,NULL),(577,'V','EF',240,'B20',3,'R11','2024-02-10',577,NULL),(578,'V','EF',241,'B20',3,'R11','2022-04-22',578,NULL),(579,'V','EF',242,'B20',4,'R11','2024-05-13',579,NULL),(580,'V','EF',243,'B20',3,'R01','2022-01-10',580,NULL),(581,'V','EF',244,'B20',2,'R01','2022-11-25',581,NULL),(582,'V','EF',245,'B20',3,'R01','2024-03-30',582,NULL),(583,'V','EF',246,'B20',2,'R01','2022-10-25',583,NULL),(584,'V','TR',247,'B20',3,'R01','2022-06-11',584,NULL),(585,'V','EF',248,'B20',1,'R01','2023-02-23',585,NULL),(586,'V','EF',249,'B20',2,'R01','2024-04-06',586,NULL),(587,'V','EF',250,'B20',1,'R01','2022-01-23',587,NULL),(588,'V','EF',251,'B20',4,'R01','2022-04-06',588,NULL),(589,'V','EF',252,'B20',3,'R01','2023-08-08',589,NULL),(590,'V','EF',253,'B20',1,'R01','2022-11-15',590,NULL),(591,'V','EF',254,'B20',4,'R01','2022-12-02',591,NULL),(592,'V','EF',255,'B20',3,'R01','2023-03-30',592,NULL),(593,'V','EF',256,'B20',2,'R01','2023-10-16',593,NULL),(594,'V','EF',257,'B20',2,'R01','2023-05-30',594,NULL),(595,'V','EF',258,'B20',1,'R01','2024-04-05',595,NULL),(596,'V','EF',259,'B20',1,'R01','2022-05-14',596,NULL),(597,'V','EF',260,'B20',1,'R01','2024-03-01',597,NULL),(598,'V','EF',261,'B20',1,'R01','2022-07-02',598,NULL),(599,'V','EF',262,'B20',4,'R01','2022-12-02',599,NULL),(600,'V','EF',263,'B20',3,'R01','2023-03-07',600,NULL),(601,'V','TR',264,'B20',1,'R01','2022-09-24',601,NULL),(602,'V','EF',265,'B20',4,'R01','2024-06-07',602,NULL),(603,'V','EF',267,'B20',3,'R01','2022-10-30',603,NULL),(604,'V','EF',268,'B20',1,'R01','2023-05-06',604,NULL),(605,'V','EF',269,'B20',1,'R01','2022-12-14',605,NULL),(606,'V','EF',270,'B20',1,'R01','2023-10-05',606,NULL),(607,'V','EF',271,'B20',2,'R01','2022-07-14',607,NULL),(608,'V','EF',272,'B20',2,'R01','2023-09-20',608,NULL),(609,'V','EF',273,'B20',1,'R01','2022-08-19',609,NULL),(610,'V','EF',274,'B20',2,'R01','2024-05-02',610,NULL),(611,'V','EF',275,'B20',2,'R01','2023-01-19',611,NULL),(612,'V','EF',276,'B20',3,'R01','2024-01-25',612,NULL),(613,'V','EF',277,'B20',1,'R01','2023-07-08',613,NULL),(614,'V','EF',278,'B20',2,'R01','2024-05-25',614,NULL),(615,'V','EF',279,'B20',4,'R01','2022-10-23',615,NULL),(616,'V','EF',280,'B20',1,'R01','2022-06-15',616,NULL),(617,'V','EF',281,'B20',3,'R01','2023-10-10',617,NULL),(618,'V','TR',282,'B20',3,'R01','2023-08-26',618,NULL),(619,'V','EF',283,'B20',1,'R01','2024-01-19',619,NULL),(620,'V','EF',284,'B20',3,'R01','2022-03-21',620,NULL),(621,'V','EF',285,'B20',1,'R01','2023-08-17',621,NULL),(622,'V','EF',286,'B20',4,'R01','2023-07-30',622,NULL),(623,'V','EF',287,'B20',4,'R01','2023-08-12',623,NULL),(624,'V','EF',288,'B20',3,'R01','2022-04-11',624,NULL),(625,'V','EF',289,'B20',1,'R01','2023-03-11',625,NULL),(626,'V','EF',290,'B20',1,'R01','2024-03-31',626,NULL),(627,'V','EF',291,'B20',4,'R01','2023-08-20',627,NULL),(628,'V','EF',292,'B20',4,'R01','2023-11-15',628,NULL),(629,'V','EF',293,'B20',4,'R01','2022-10-06',629,NULL),(630,'V','EF',294,'B20',4,'R01','2023-01-15',630,NULL),(631,'V','EF',295,'B20',2,'R01','2024-07-18',631,NULL),(632,'V','EF',296,'B20',3,'R01','2022-12-15',632,NULL),(633,'V','EF',297,'B20',1,'R01','2023-03-20',633,NULL),(634,'V','EF',298,'B20',1,'R01','2022-09-13',634,NULL),(635,'V','TR',299,'B20',1,'R01','2022-06-28',635,NULL),(636,'V','EF',300,'B20',2,'R01','2023-01-26',636,NULL),(637,'V','EF',301,'B20',2,'R01','2023-06-26',637,NULL),(638,'V','EF',302,'B20',1,'R02','2023-12-21',638,NULL),(639,'V','EF',303,'B20',2,'R02','2024-04-24',639,NULL),(640,'V','EF',304,'B20',2,'R02','2023-06-16',640,NULL),(641,'V','EF',305,'B20',3,'R02','2023-05-09',641,NULL),(642,'V','EF',306,'B20',1,'R02','2024-06-28',642,NULL),(643,'V','EF',307,'B20',2,'R02','2023-07-07',643,NULL),(644,'V','EF',308,'B20',1,'R02','2023-04-25',644,NULL),(645,'V','EF',309,'B20',4,'R02','2023-06-26',645,NULL),(646,'V','EF',310,'B20',4,'R02','2022-07-04',646,NULL),(647,'V','EF',311,'B20',2,'R02','2024-05-11',647,NULL),(648,'V','EF',312,'B20',1,'R02','2022-02-20',648,NULL),(649,'V','EF',313,'B20',4,'R02','2024-04-09',649,NULL),(650,'V','EF',315,'B20',1,'R02','2023-11-28',650,NULL),(651,'V','EF',316,'B20',3,'R02','2023-03-07',651,NULL),(652,'V','TR',317,'B20',3,'R02','2022-01-19',652,NULL),(653,'V','EF',318,'B20',3,'R02','2024-04-18',653,NULL),(654,'V','EF',319,'B20',3,'R02','2023-09-27',654,NULL),(655,'V','EF',320,'B20',3,'R02','2023-07-29',655,NULL),(656,'V','EF',321,'B20',3,'R02','2023-04-02',656,NULL),(657,'V','EF',322,'B20',4,'R02','2024-04-03',657,NULL),(658,'V','EF',323,'B20',3,'R02','2023-03-22',658,NULL),(659,'V','EF',324,'B20',4,'R02','2023-09-09',659,NULL),(660,'V','EF',325,'B20',4,'R02','2023-02-14',660,NULL),(661,'V','EF',326,'B20',3,'R11','2022-09-22',661,NULL),(662,'V','EF',327,'B20',1,'R11','2023-03-27',662,NULL),(663,'V','EF',328,'B20',3,'R11','2022-12-16',663,NULL),(664,'V','EF',329,'B20',2,'R11','2023-07-16',664,NULL),(665,'V','EF',330,'B20',1,'R11','2023-10-22',665,NULL),(666,'V','EF',331,'B20',3,'R11','2023-06-12',666,NULL),(667,'V','EF',332,'B20',3,'R11','2023-08-15',667,NULL),(668,'V','EF',333,'B20',1,'R11','2023-09-16',668,NULL),(669,'V','TR',334,'B20',1,'R11','2024-07-13',669,NULL),(670,'V','EF',335,'B20',4,'R11','2022-06-01',670,NULL),(671,'V','EF',336,'B20',2,'R11','2022-12-15',671,NULL),(672,'V','EF',337,'B20',2,'R11','2023-11-01',672,NULL),(673,'V','EF',338,'B20',1,'R11','2022-06-10',673,NULL),(674,'V','EF',339,'B20',1,'R11','2024-06-09',674,NULL),(675,'V','TR',340,'B20',2,'R11','2023-12-18',675,NULL),(676,'V','TR',341,'B20',2,'R11','2024-05-20',676,NULL),(677,'V','TR',342,'B20',3,'R11','2024-04-08',677,NULL),(678,'V','TR',343,'B20',4,'R11','2022-04-09',678,NULL),(679,'V','EF',344,'B20',1,'R11','2024-07-21',679,NULL),(680,'V','TR',345,'B20',2,'R11','2022-11-16',680,NULL),(681,'V','TR',346,'B20',4,'R11','2023-12-02',681,NULL),(682,'V','EF',347,'B20',4,'R11','2023-06-28',682,NULL),(683,'V','EF',2,'B20',2,'R01','2024-07-28',1,NULL),(684,'V','EF',256,'B20',1,'R01','2024-07-28',2,NULL),(685,'V','EF',2,'B20',2,'R01','2024-07-30',1,NULL),(686,'V','EF',256,'B20',1,'R01','2024-07-30',2,NULL),(687,'V','EF',2,'B20',4,'R01','2023-06-28',100,NULL),(688,'V','EF',2,'B20',4,'R01','2023-06-02',200,NULL),(689,'V','EF',2,'B20',7,'R01','2023-06-15',200,NULL);
/*!40000 ALTER TABLE `transacciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculos` (
  `id_patente` varchar(7) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `anio` int NOT NULL,
  `color` varchar(15) NOT NULL,
  `fecha_compra` date NOT NULL,
  `fecha_venta` date DEFAULT NULL,
  PRIMARY KEY (`id_patente`),
  UNIQUE KEY `id_patente` (`id_patente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
INSERT INTO `vehiculos` VALUES ('AA351EF','Ford','Ranger',1996,'Blanco','2017-03-14',NULL),('AC688WR','Iveco','Daily',2008,'Blanco','2019-06-19',NULL),('LED887','Ford','Ranger',2003,'Gris','2013-09-02','2015-01-05'),('OTR896','Ford','Ranger',1996,'Verde','2015-01-14',NULL);
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_b20_vendidos_cliente_mes`
--

DROP TABLE IF EXISTS `vw_b20_vendidos_cliente_mes`;
/*!50001 DROP VIEW IF EXISTS `vw_b20_vendidos_cliente_mes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_b20_vendidos_cliente_mes` AS SELECT 
 1 AS `periodo`,
 1 AS `operacion`,
 1 AS `medio_pago`,
 1 AS `id_cliente`,
 1 AS `apellido_nombre`,
 1 AS `id_producto`,
 1 AS `cantidad_vendida`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_clientes_activos`
--

DROP TABLE IF EXISTS `vw_clientes_activos`;
/*!50001 DROP VIEW IF EXISTS `vw_clientes_activos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_clientes_activos` AS SELECT 
 1 AS `id_cliente`,
 1 AS `apellido_nombre`,
 1 AS `telefono`,
 1 AS `email`,
 1 AS `localidad`,
 1 AS `id_reparto`,
 1 AS `dia_asignado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_clientes_por_localidad`
--

DROP TABLE IF EXISTS `vw_clientes_por_localidad`;
/*!50001 DROP VIEW IF EXISTS `vw_clientes_por_localidad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_clientes_por_localidad` AS SELECT 
 1 AS `id_localidad`,
 1 AS `localidad`,
 1 AS `provincia`,
 1 AS `cantidad_clientes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_empleados_activos`
--

DROP TABLE IF EXISTS `vw_empleados_activos`;
/*!50001 DROP VIEW IF EXISTS `vw_empleados_activos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_empleados_activos` AS SELECT 
 1 AS `id_repartidor`,
 1 AS `apellido_nombre`,
 1 AS `DNI`,
 1 AS `CUIT`,
 1 AS `fecha_nacimiento`,
 1 AS `genero`,
 1 AS `id_domicilio`,
 1 AS `estado_civil`,
 1 AS `fecha_ingreso`,
 1 AS `fecha_baja`,
 1 AS `telefono`,
 1 AS `email`,
 1 AS `calle`,
 1 AS `altura`,
 1 AS `barrio`,
 1 AS `localidad`,
 1 AS `antiguedad`,
 1 AS `clientes_asignados`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_total_clientes_por_reparto`
--

DROP TABLE IF EXISTS `vw_total_clientes_por_reparto`;
/*!50001 DROP VIEW IF EXISTS `vw_total_clientes_por_reparto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_total_clientes_por_reparto` AS SELECT 
 1 AS `id_reparto`,
 1 AS `ruta`,
 1 AS `cantidad_clientes`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'reparto_agua'
--

--
-- Dumping routines for database 'reparto_agua'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_buscardor_id_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_buscardor_id_cliente`(p_buscador_nombre varchar(100), p_buscador_dnicuit INT ) RETURNS int
    READS SQL DATA
BEGIN
	/*
    Función que busca el número de cliente, dado un nombre, dni o cuit.
    Criterios de búsqueda:
    p_buscador_nombre
		ingresar una parte o total del nombre
        Si no se busca por este criterio, ingresar NULL
	p_buscador_dnicuit
		Ingresar DNI o CUIT
        Si no se busca por este criterio, ingresar NULL
    */
    
  	DECLARE v_resultado INT;
        
    SET v_resultado = 	(
						SELECT 	id_cliente
						FROM 	clientes
						WHERE 	apellido_nombre LIKE CONCAT('%',p_buscador_nombre,'%')
						OR 		DNI =  p_buscador_dnicuit 
						OR		CUIT = p_buscador_dnicuit 
                        ); 
        
	RETURN v_resultado;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_precio_abono` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_precio_abono`(	p_id_operacion VARCHAR(1), 
									p_id_cliente INT, 
									p_fecha DATE, 
                                    p_producto VARCHAR(3),
                                    p_fecha_inicio DATE,
                                    p_fecha_fin DATE) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
	/*
    Obtiene el valor del abono mensual, según los B20 consumidos en cada mes.
		p_id_operacion: 'A'
		p_tipo_cliente: se obtiene de la tabla clientes. Se aplica a los clientes A.
		p_fecha: fecha de la transacción
		p_producto: producto vendido
    */
    
	DECLARE v_bidones_incluidos INT;
    
    DECLARE v_tipo_cliente VARCHAR(1);

	DECLARE v_precio_B20 NUMERIC(10,2);
    DECLARE v_bidones_consumidos INT;
	
    DECLARE v_valor_abono NUMERIC(10,2);
    
    SET v_bidones_incluidos = 6;
    
    SET v_tipo_cliente = (
							SELECT 	c.id_tipo_cliente
                            FROM	clientes c
                            WHERE	p_id_cliente = c.id_cliente
                            );
                            
	SET	v_precio_B20 = (
				SELECT 	p.precio  -- este valor necesito setear
				FROM 	precios p
				WHERE 	p.id_producto = 'B20'
				AND 	p.id_tipo_cliente = v_tipo_cliente
				AND		p.fecha_inicio = (
									select	max(pr.fecha_inicio) 
									FROM 	precios pr 
									WHERE 	pr.fecha_inicio <= p_fecha_fin
                                    AND		pr.id_producto = 'B20'
                                    AND		pr.id_tipo_cliente = v_tipo_cliente 
									) );
	
    SET	v_bidones_consumidos = (
									SELECT 	SUM(t.cantidad)  
									FROM 	transacciones t
									WHERE 	t.id_cliente = p_id_cliente
									AND 	t.id_producto = 'B20'
									AND		t.fecha >= p_fecha_inicio
									AND		t.fecha <= p_fecha_fin 
                                    AND		t.id_operacion = 'V'
                                    GROUP BY	p_id_cliente
								);
	    
        
	IF	v_bidones_consumidos > v_bidones_incluidos 
		THEN	SET v_valor_abono = v_bidones_consumidos * v_precio_B20;
        ELSE	SET v_valor_abono = v_bidones_incluidos * v_precio_B20;
	END IF;
                 
                 
RETURN v_valor_abono; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_precio_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_precio_venta`(	p_id_operacion VARCHAR(1), 
									p_id_cliente INT, 
									p_fecha DATE, 
                                    p_producto VARCHAR(3) ) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
	/*
    Obtiene el precio de una operación de venta
    p_id_operacion: 'V'
	p_tipo_cliente: se obtiene de la tabla clientes. Los clientes A, se facturan al finalizar el mes (consumos en $0)
    p_fecha: fecha de la transacción
    p_producto: producto vendido
    */
    
    DECLARE v_tipo_cliente VARCHAR(1);
	DECLARE v_precio_obtenido NUMERIC(10,2);
    
    SET v_tipo_cliente = (
							SELECT 	c.id_tipo_cliente
                            FROM	clientes c
                            WHERE	p_id_cliente = c.id_cliente
                            );
                            
	SET	v_precio_obtenido = (
				SELECT 	if(v_tipo_cliente = 'A' AND p_producto = 'B20', 0, p.precio)  -- este valor necesito setear
				FROM 	precios p
				WHERE 	p.id_producto = p_producto
				AND 	p.id_tipo_cliente = v_tipo_cliente
				AND		p.fecha_inicio = (
									select	max(pr.fecha_inicio) 
									FROM 	precios pr 
									WHERE 	pr.fecha_inicio <= p_fecha
                                    AND		pr.id_producto = p_producto
                                    AND		pr.id_tipo_cliente = v_tipo_cliente 
                                    AND 	p_id_operacion = 'V'
									)
							);
                            
RETURN v_precio_obtenido; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_saldos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_saldos`(p_id_cliente INT ) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
	/*
    Obtiene saldo de deuda de un cliente, ingresando su id_cliente
    p_id_cliente
		Ingresar el id_cliente, o campo id_cliente de la tabla clientes.
    */
    
  	DECLARE v_saldo INT;
        
    SET v_saldo = 	(
						SELECT 	sum(t.cantidad * t.precio) as saldo
						FROM 	transacciones t
                        ,		clientes c
						WHERE 	c.id_cliente = t.id_cliente
                        AND		p_id_cliente = t.id_cliente
                        );
        
	RETURN v_saldo;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_asignacion_repartidor_vehiculo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_asignacion_repartidor_vehiculo`(IN p_id_reparto VARCHAR(3), IN p_id_repartidor INT, IN p_id_patente VARCHAR(7))
BEGIN
	/*
    Inserta en la tabla repartos, el repartidor y el vehículo asignados.
    Se utiliza cada vez que se producza una modificación en el empeleado responsable o el vehículo asignado.
		p_id_reparto: id del reparto en el cual se harán las asignaciones.
		p_id_repartidor: id del empleado asignado como responsable del reparto.
		p_id_patente: id (patente) del vehículo asignado para el reparto.
    */

	-- declaracion de variables
    DECLARE reparto_existe INT;
    
    DECLARE repartidor_existe INT;
    DECLARE repartidor_ya_asignado INT;
    
    DECLARE	vehiculo_existe INT;
    DECLARE vehiculo_ya_asignado INT;
    
    START TRANSACTION;
        
        
	UPDATE	repartos
	SET		id_repartidor = p_id_repartidor
	WHERE	id_reparto = p_id_reparto;
	
	
	UPDATE	repartos
	SET		id_patente = p_id_patente
	WHERE	id_reparto = p_id_reparto;
        
    
	-- controlar si el reparto existe
    SELECT 	count(*) 			
    INTO	reparto_existe			-- si da 1, existe. Si da 0, no existe
    FROM	repartos
    WHERE	id_reparto = p_id_reparto;
    
    
    -- controlar si el repartidor existe y si no se encuentra encargado de otro reparto previamente.
    SELECT 	count(*) 			
    INTO	repartidor_existe			-- si da 1, existe. Si da 0, no existe
    FROM	repartidores
    WHERE	id_repartidor = p_id_repartidor
    AND		fecha_baja IS NULL;
    
	SELECT 	count(*) 
    INTO	repartidor_ya_asignado		-- si da 1, no está asignado, si da más, está ocupado.
    FROM	repartos
    WHERE	id_repartidor = p_id_repartidor;
    
    
	-- controlar si el vehículo existe y si no se encuentra en uno por otro reparto.
	SELECT 	count(*)			
	INTO 	vehiculo_existe				-- si da 1, existe. Si da 0, no existe
	FROM	vehiculos
	WHERE 	id_patente = p_id_patente
    AND		fecha_venta IS NULL;
    
	SELECT 	count(*) 			
    INTO	vehiculo_ya_asignado		-- si da 1, no está asignado, si da más, está ocupado.
    FROM	repartos
    WHERE	id_patente = p_id_patente;
    
    
    IF 	(	reparto_existe = 1
		AND	repartidor_existe = 1 
		AND	repartidor_ya_asignado = 1
        AND	vehiculo_existe = 1
    	AND	vehiculo_ya_asignado = 1 )
	THEN 			
		-- asignar el repartidor y el vehículo
		SELECT 'Hizo commit' as msg_error;
        COMMIT;
	
    ELSE	
        SELECT CONCAT('Rollback:' 
						'reparto_existe: ',reparto_existe, 
                        ' - ',
                        'repartidor_existe: ',repartidor_existe, 
                        ' - ',
                        'repartidor_ya_asignado: ',reparto_existe, 
                        ' - ',
                        'vehiculo_existe: ',reparto_existe, 
                        ' - ',
                        'vehiculo_ya_asignado: ',reparto_existe
					) as msg_error;
        ROLLBACK;
        
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_facturacion_abonos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_facturacion_abonos`( IN p_fecha_inicio_abono DATE, IN p_fecha_fin_abono DATE )
BEGIN
	/*
    Inserta en la tabla transacciones, la facturación de los abonos mensuales, sumando los consumos del mes.
    Se invoca cada vez que finaliza un mes, para cada cliente "Abono".
		p_fecha_inicio: fecha de inicio de facturación.
		p_fecha_fin: fecha límite de facturación.
    */
 
-- Insertar fila de abono en tabla Transacciones, para cada cliente de abono.

	INSERT INTO transacciones (	id_transaccion
	,							id_operacion
	,							id_medio_pago
	,							id_cliente
	,							id_producto
	,							cantidad
	,							id_reparto
	,							fecha
	,							nro_comprobante
	,							precio )
    (SELECT NULL, 'A', 'CC', id_cliente, NULL, 1, NULL,  date_add(p_fecha_fin_abono, INTERVAL 1 DAY ), NULL, 0
    FROM 	clientes c
	WHERE 	c.id_tipo_cliente = 'A'
    AND		(c.fecha_baja IS NULL OR  c.fecha_baja >= p_fecha_inicio_abono )  
    );
    
    
-- Insertar precio calculado del abono en tabla Transacciones, para cada abono insertado.

	SET SQL_SAFE_UPDATES = 0;

	UPDATE transacciones t
	SET t.precio = fn_precio_abono(t.id_operacion, t.id_cliente, t.fecha, t.id_producto, p_fecha_inicio_abono, p_fecha_fin_abono )
	WHERE t.id_operacion = 'A'
	;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_facturacion_ventas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_facturacion_ventas`()
BEGIN
	/*
    Inserta en la tabla transacciones, el precio de cada producto vendido.
    Debe llamarse luego de cada venta insertada.
		p_fecha_inicio: fecha de inicio de facturación.
		p_fecha_fin: fecha límite de facturación.
    */
    
    SET SQL_SAFE_UPDATES = 0;

		UPDATE transacciones t
		SET t.precio = fn_precio_venta(t.id_operacion, t.id_cliente, t.fecha, t.id_producto)
        WHERE t.id_operacion = 'V'
	;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rutas_del_dia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_rutas_del_dia`(IN p_reparto VARCHAR(3), IN p_dia VARCHAR(1))
BEGIN
	/*
    Permite obtener las rutas del día para todos o para el reparto seleccionado.
    p_reparto
		Ingresar un reparto en particular:
			R01
            R02
            R11
		NULL: obtiene la lista de todos los repartos.
    p_dia
		Código del día que se quiere obtener la ruta:
			A: lunes
            B: martes
            C: miércoles
            D: jueves
            E: viernes
            F: sábado
		NULL: se obtiene la ruta del día actual.
    */
    
    DECLARE v_existe_reparto BOOL;
    DECLARE v_existe_dia BOOL;
    
    DECLARE v_dia VARCHAR(1);
    DECLARE v_reparto VARCHAR(3);
    
    -- control existencia
	IF	p_reparto IS NOT NULL	
	AND	p_reparto NOT IN (SELECT id_reparto FROM rutas)
		THEN	SET v_existe_reparto = False;
		ELSE	SET v_existe_reparto = True;
	END IF;

	IF	p_dia IS NULL
	OR	p_dia IN ((select left(ruta,1) FROM rutas))
		THEN	SET v_existe_dia = True;
		ELSE	SET v_existe_dia = False;
	END IF;
    
    -- Variable día de reparto
    IF	v_existe_dia = False    
		THEN (SELECT 'Día ingresado incorrecto' as msg_error_dia);
        SET v_dia = '0';
	ELSE 
		IF p_dia IS NULL
			THEN
				CASE	dayofweek(current_date())
				WHEN	1	THEN  SET v_dia = 'G';
				WHEN	2	THEN  SET v_dia = 'A';
				WHEN	3	THEN  SET v_dia = 'B';
				WHEN	4	THEN  SET v_dia = 'C';
				WHEN	5	THEN  SET v_dia = 'D';
				WHEN	6	THEN  SET v_dia = 'E';
				WHEN	7	THEN  SET v_dia = 'F';
				END CASE;
			ELSE SET v_dia = p_dia;
		END IF;
	END IF;
    
	IF	v_existe_reparto = False
		THEN (SELECT 'Reparto ingresado incorrecto' as msg_error_reparto); 
        SET v_reparto = '0';
	ELSE SET v_reparto = p_reparto;
	END IF;
    
	CASE 
		WHEN v_reparto IS NULL AND v_dia != '0'
			THEN (	SELECT	r.ruta
                    ,		r.id_reparto
                    ,		r.orden
                    , 		r.id_cliente
                    , 		c.apellido_nombre
                    ,		d.calle
                    ,		d.altura
                    ,		d.barrio
                    ,		l.localidad
                    ,		fn_saldos(r.id_cliente) AS deuda_cliente
					FROM 	rutas r
                    ,		clientes c
                    , 		clientes_domicilios cd
                    ,		domicilios d
                    ,		localidades l
                    WHERE	c.id_cliente = r.id_cliente
					AND		c.id_cliente = cd.id_cliente
                    AND		cd.id_tipo_domicilio = 'A'
                    AND		cd.id_domicilio = d.id_domicilio
                    AND		d.id_localidad = l.id_localidad
					AND 	left(ruta,1) = v_dia)
                    ORDER BY r.id_reparto ASC, r.orden ASC;
		WHEN v_reparto != '0' AND v_dia != '0'
			THEN (	SELECT	r.ruta
                    ,		r.id_reparto
                    ,		r.orden
                    , 		r.id_cliente
                    , 		c.apellido_nombre
                    ,		d.calle
                    ,		d.altura
                    ,		d.barrio
                    ,		l.localidad
                    ,		fn_saldos(r.id_cliente) AS deuda_cliente
					FROM 	rutas r
                    ,		clientes c
                    , 		clientes_domicilios cd
                    ,		domicilios d
                    ,		localidades l
                    WHERE	c.id_cliente = r.id_cliente
					AND		c.id_cliente = cd.id_cliente
                    AND		cd.id_tipo_domicilio = 'A'
                    AND		cd.id_domicilio = d.id_domicilio
                    AND		d.id_localidad = l.id_localidad
					AND 	left(ruta,1) = v_dia
					AND		id_reparto = v_reparto)
                    ORDER BY r.orden ASC;
		ELSE SELECT NULL;
	END CASE;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_b20_vendidos_cliente_mes`
--

/*!50001 DROP VIEW IF EXISTS `vw_b20_vendidos_cliente_mes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_b20_vendidos_cliente_mes` AS select last_day(`t`.`fecha`) AS `periodo`,`o`.`operacion` AS `operacion`,`mp`.`medio_pago` AS `medio_pago`,`c`.`id_cliente` AS `id_cliente`,`c`.`apellido_nombre` AS `apellido_nombre`,`t`.`id_producto` AS `id_producto`,sum(`t`.`cantidad`) AS `cantidad_vendida` from (((`transacciones` `t` join `operaciones` `o`) join `medios_pago` `mp`) join `clientes` `c`) where ((`t`.`id_operacion` = `o`.`id_operacion`) and (`t`.`id_medio_pago` = `mp`.`id_medio_pago`) and (`t`.`id_cliente` = `c`.`id_cliente`) and (`o`.`id_operacion` = 'V') and (`t`.`id_producto` = 'B20')) group by last_day(`t`.`fecha`),`o`.`operacion`,`mp`.`medio_pago`,`c`.`id_cliente` order by `periodo`,`cantidad_vendida` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_clientes_activos`
--

/*!50001 DROP VIEW IF EXISTS `vw_clientes_activos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_clientes_activos` AS select `c`.`id_cliente` AS `id_cliente`,`c`.`apellido_nombre` AS `apellido_nombre`,`c`.`telefono` AS `telefono`,`c`.`email` AS `email`,`l`.`localidad` AS `localidad`,`r`.`id_reparto` AS `id_reparto`,left(`ru`.`ruta`,1) AS `dia_asignado` from (((((`clientes` `c` join `domicilios` `d`) join `clientes_domicilios` `cd`) join `localidades` `l`) join `repartos` `r`) join `rutas` `ru`) where ((`c`.`fecha_baja` is null) and (`c`.`id_cliente` = `cd`.`id_cliente`) and (`cd`.`id_tipo_domicilio` = 'A') and (`cd`.`id_domicilio` = `d`.`id_domicilio`) and (`d`.`id_localidad` = `l`.`id_localidad`) and (`ru`.`id_reparto` = `r`.`id_reparto`) and (`c`.`id_cliente` = `ru`.`id_cliente`)) order by `l`.`localidad`,`c`.`apellido_nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_clientes_por_localidad`
--

/*!50001 DROP VIEW IF EXISTS `vw_clientes_por_localidad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_clientes_por_localidad` AS select `l`.`id_localidad` AS `id_localidad`,`l`.`localidad` AS `localidad`,`l`.`provincia` AS `provincia`,count(`c`.`id_cliente`) AS `cantidad_clientes` from (((`localidades` `l` join `clientes` `c`) join `domicilios` `d`) join `clientes_domicilios` `cd`) where ((`l`.`id_localidad` = `d`.`id_localidad`) and (`d`.`id_domicilio` = `cd`.`id_domicilio`) and (`c`.`id_cliente` = `cd`.`id_cliente`) and (`cd`.`id_tipo_domicilio` = 'A') and (`c`.`fecha_baja` is null)) group by `l`.`id_localidad` order by `cantidad_clientes` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_empleados_activos`
--

/*!50001 DROP VIEW IF EXISTS `vw_empleados_activos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_empleados_activos` AS select `r`.`id_repartidor` AS `id_repartidor`,`r`.`apellido_nombre` AS `apellido_nombre`,`r`.`DNI` AS `DNI`,`r`.`CUIT` AS `CUIT`,`r`.`fecha_nacimiento` AS `fecha_nacimiento`,`r`.`genero` AS `genero`,`r`.`id_domicilio` AS `id_domicilio`,`r`.`estado_civil` AS `estado_civil`,`r`.`fecha_ingreso` AS `fecha_ingreso`,`r`.`fecha_baja` AS `fecha_baja`,`r`.`telefono` AS `telefono`,`r`.`email` AS `email`,`d`.`calle` AS `calle`,`d`.`altura` AS `altura`,`d`.`barrio` AS `barrio`,`l`.`localidad` AS `localidad`,timestampdiff(YEAR,`r`.`fecha_ingreso`,curdate()) AS `antiguedad`,(select count(`ru`.`id_reparto`) from (`rutas` `ru` join `repartos` `re`) where ((`re`.`id_repartidor` = `r`.`id_repartidor`) and (`re`.`id_reparto` = `ru`.`id_reparto`))) AS `clientes_asignados` from ((`repartidores` `r` join `domicilios` `d`) join `localidades` `l`) where ((`d`.`id_domicilio` = `r`.`id_domicilio`) and (`d`.`id_localidad` = `l`.`id_localidad`) and (`r`.`fecha_baja` is null)) order by `r`.`fecha_ingreso` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_total_clientes_por_reparto`
--

/*!50001 DROP VIEW IF EXISTS `vw_total_clientes_por_reparto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_total_clientes_por_reparto` AS select `ru`.`id_reparto` AS `id_reparto`,`ru`.`ruta` AS `ruta`,count(0) AS `cantidad_clientes` from `rutas` `ru` group by `ru`.`id_reparto`,`ru`.`ruta` order by `ru`.`id_reparto`,`ru`.`ruta` */;
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

-- Dump completed on 2024-08-22  7:27:06
