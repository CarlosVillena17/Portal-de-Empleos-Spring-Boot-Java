CREATE DATABASE  IF NOT EXISTS `empleosdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `empleosdb`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: empleosdb
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES ('luis','SUPERVISOR'),('marisol','ADMINISTRADOR');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (3,'Computa','Una buen trabajo'),(4,'Ingenieria electronica','Trabajos con aplicación en la industria, telecomunicaciones, en el diseño y análisis de instrumentación electrónica, microcontroladores y microprocesadores. '),(5,'Recursos Humanos','Administración de nóminas, pagas extra de los empleados, supervisar el trabajo de los empleados, determinar las necesidades del personal.'),(6,'Servicio y atencion al cliente','Actividades relacionadas con ofrecer servicios y atencion a los clientes de forma efectiva.'),(7,'Logistica/transportes','Trabajos relacionados con capacidad de observación, buena memoria, habilidad numérica y verbal, razonamiento concreto y abstracto, imaginación e inventiva, habilidad para el manejo de instrumentos y material de laboratorio, capacidad de adaptación social y trabajo de campo.'),(8,'Desarrollo de software','Profesionistas capaces de analizar, diseñar y mejorar estratégicamente proyectos de sistemas de software mediante la aplicación de procesos, modelos, herramientas y estándares de calidad en su desarrollo.'),(9,'Diseño','Crear conceptos visuales para publicidad, reunirse con clientes para conocer el presupuesto del proyecto, asesorar a los clientes para crear estrategias de publicidad visual, liderar equipos de trabajo, diseñar logotipos.'),(10,'Comunicaciones','Profesionales que se encargan de escribir las noticias que usualmente vemos en las revistas, periódicos e incluso en la televisión, muchos incluso, se dedican a escribir historias en Blogs y en los diferentes medios de comunicación escrita.'),(11,'Mercadotecnia','Investigación de mercados, programación y desarrollo del producto, fijación de precios, canales de distribución y logística. Comunicación integral: publicidad, comunicación e imagen, relaciones públicas, marketing directo, promoción, etc.'),(12,'Ventas','Habilidades para supervisar y dirigir las actividades de una oficina o de un departamento de Ventas. Coordinar y monitorear el trabajo de los empleados a su cargo.'),(13,'Publicidad','Habilidadeds para planificar, dirigir y coordinar las actividades de publicidad y relaciones públicas de la empresa u organización. Diseñar y planificar campañas publicitarias. Dirigir y gestionar las actividades del personal de publicidad y relaciones públicas.'),(14,'Gerencia/Administracion','Profesionistas capaces para programar, organizar, dirigir, controlar y supervisar las actividades de personal, tesorería, contabilidad y costos, logística y servicios internos y de mantenimiento.'),(15,'Educación','Funciones de docencia de carácter profesional que implica la realización directa de los procesos sistemáticos de enseñanza - aprendizaje, lo cual incluye el diagnóstico, la planificación, la ejecución y la evaluación de los mismos procesos y sus resultados.'),(16,'CriptoMonedas','Habilidades para desarrollar analisis de criptomonedas ');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `perfil` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfiles`
--

LOCK TABLES `perfiles` WRITE;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` VALUES (1,'SUPERVISOR'),(2,'ADMINISTRADOR'),(3,'USUARIO');
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudes`
--

DROP TABLE IF EXISTS `solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitudes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `archivo` varchar(250) NOT NULL,
  `comentarios` text,
  `idVacante` int NOT NULL,
  `idUsuario` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Vacante_Usuario_UNIQUE` (`idVacante`,`idUsuario`),
  KEY `fk_Solicitudes_Vacantes1_idx` (`idVacante`),
  KEY `fk_Solicitudes_Usuarios1_idx` (`idUsuario`),
  CONSTRAINT `fk_Solicitudes_Usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_Solicitudes_Vacantes1` FOREIGN KEY (`idVacante`) REFERENCES `vacantes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudes`
--

LOCK TABLES `solicitudes` WRITE;
/*!40000 ALTER TABLE `solicitudes` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitudes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('luis','{noop}luis123',1),('marisol','{noop}mari123',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarioperfil`
--

DROP TABLE IF EXISTS `usuarioperfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarioperfil` (
  `idUsuario` int NOT NULL,
  `idPerfil` int NOT NULL,
  UNIQUE KEY `Usuario_Perfil_UNIQUE` (`idUsuario`,`idPerfil`),
  KEY `fk_Usuarios1_idx` (`idUsuario`),
  KEY `fk_Perfiles1_idx` (`idPerfil`),
  CONSTRAINT `fk_Perfiles1` FOREIGN KEY (`idPerfil`) REFERENCES `perfiles` (`id`),
  CONSTRAINT `fk_Usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarioperfil`
--

LOCK TABLES `usuarioperfil` WRITE;
/*!40000 ALTER TABLE `usuarioperfil` DISABLE KEYS */;
INSERT INTO `usuarioperfil` VALUES (5,1);
/*!40000 ALTER TABLE `usuarioperfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `estatus` int NOT NULL DEFAULT '1',
  `fechaRegistro` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (4,'mari','ccolca@gmail.com','maryluz','123456789',1,'2021-12-12'),(5,'Carlos','cvillenacabrejos@gmail.com','Boomybear','123456789',1,'2021-12-12');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacantes`
--

DROP TABLE IF EXISTS `vacantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacantes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` date NOT NULL,
  `salario` double NOT NULL,
  `estatus` enum('Creada','Aprobada','Eliminada') NOT NULL,
  `destacado` int NOT NULL,
  `imagen` varchar(250) NOT NULL,
  `detalles` text,
  `idCategoria` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vacantes_categorias1_idx` (`idCategoria`),
  CONSTRAINT `fk_vacantes_categorias1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacantes`
--

LOCK TABLES `vacantes` WRITE;
/*!40000 ALTER TABLE `vacantes` DISABLE KEYS */;
INSERT INTO `vacantes` VALUES (2,'Administrador de datos en la nube ','Únete al Socio Logístico con mayor presencia en México, Soft Technologies te invita a formar parte de su gran equipo de trabajo como Administrador de datos en la nube.','2022-12-12',14000,'Aprobada',1,'logo2.png','<p><span style=\"color: #0000ff;\"><strong>REQUISITOS</strong></span></p>\r\n<p>Escolaridad: Lic. trunca o pasante en Ing en Sistemas Computacionales o afin.<br />Experiencia de 2 a&ntilde;os en:</p>\r\n<ul>\r\n<li>2 a&ntilde;os como ingeniero de infraestructura en tecnolog&iacute;as Microsoft, experiencia en soluciones de Infraestructura (Hardware/Software).</li>\r\n<li>2 a&ntilde;os administrando servidores en centros de datos.</li>\r\n</ul>\r\n<p><span style=\"color: #0000ff;\"><strong>ESPEC&Iacute;FICOS</strong></span></p>\r\n<ul>\r\n<li>Administraci&oacute;n monitoreo y mantenimiento de servicios en la nube Microsoft Azure.</li>\r\n<li>Administraci&oacute;n de servicios y proveedores de nube ITIL Foundations.</li>\r\n<li>Herramientas y Tecnolog&iacute;as de Virtualizaci&oacute;n Autoestudio.</li>\r\n<li>Herramientas de Monitoreo para servicios en la Nube o en Sitio.</li>\r\n<li>Esquemas de alta disponibilidad para nubes, cluster dispersos geogr&aacute;ficamente.</li>\r\n<li>Servicios de Nube: SaaS, PaaS, IaaS.</li>\r\n<li>Conocimientos b&aacute;sicos de Redes.</li>\r\n<li>Administraci&oacute;n de bases de datos en la nube SQL Azure.</li>\r\n<li>Conocimiento de consumo de costos de servicios en la nube.</li>\r\n<li>Herramientas de Monitoreo para nube.</li>\r\n<li>VPN.</li>\r\n<li>Almacenamiento en Nube.</li>\r\n</ul>\r\n<p>&nbsp;<span style=\"color: #0000ff;\"><strong>OFRECEMOS</strong></span></p>\r\n<ul>\r\n<li>ATRACTIVO SUELDO + prestaciones superiores a las de ley.</li>\r\n<li>Excelente ambiente de trabajo.</li>\r\n<li>Zonas de trabajo: Condesa.</li>\r\n<li>Horario Tiempo Completo: Lunes a Viernes: 09:00-06:00 con disponibilidad de horario.</li>\r\n</ul>\r\n<p><span style=\"color: #0000ff;\"><strong>ADICIONALES</strong></span></p>\r\n<ul>\r\n<li>Disponibilidad de viajar: No</li>\r\n<li>Disponibilidad de cambio de residencia: No</li>\r\n</ul>',3),(3,'Coordinador de Marketing','TE INVITAMOS A UNIRTE A MARKETING TEC2000 COMO COORDINADOR O COORDINADORA DE MARKETING. SOMOR UNA EMPRESA DE INNOVACION EN EL SECTOR METALMECANICO E IMPORTACIONES, EXCELENTE OPORTUNIDAD DE DESARROLLO Y APLICACION DE CONOCIMIENTOS.','2019-05-06',7900,'Aprobada',0,'logo3.png','<p><strong><span style=\"background-color: #ccffcc;\">BUSCAMOS LIDER QUE GUSTE DE RETOS PARA:</span></strong></p>\r\n<ul>\r\n<li>DISE&Ntilde;AR, PLANIFICAR ELABORAR E INSTAURAR LOS PLANES DE MARKETING DE LA EMPRESA.</li>\r\n<li>DESARROLLAR PLAN PARA IMAGEN CORPORATIVA.</li>\r\n<li>PLANEACI&Oacute;N, EJECUCI&Oacute;N Y CONTROL DE CAMPA&Ntilde;AS 360&deg; (IMPLEMENTACI&Oacute;N, EJECUCI&Oacute;N, M&Eacute;TRICAS, AN&Aacute;LISIS, RESULTADOS, PRESENTACIONES EJECUTIVAS, PRESUPUESTOS).</li>\r\n<li>DAR SOPORTE AL &Aacute;REA DE VENTAS EN CUANTO A ESTRATEGIAS, POL&Iacute;TICAS, CANALES, PUBLICIDAD, M&Aacute;NEJO DE REDES SOCIALES, INVESTIGACI&Oacute;N DE MERCADOS, SEGUIMIENTO A RESULTADOS DE &Aacute;REA COMERCIAL.</li>\r\n<li>HACER INVESTIGACIONES COMERCIALES DE LOS PRODUCTOS EXISTENTES O NUEVOS, REALIZANDO EL ESTUDIO DE LAS DEBILIDADES, AMENAZAS, FORTALEZAS Y OPORTUNIDADES DE LOS MISMOS EN EL MERCADO.</li>\r\n<li>SE ENCARGAR&Aacute; DE CAPTAR NUEVOS CLIENTES Y DE MANTENER LOS QUE YA EXISTEN.</li>\r\n<li>DESARROLLAR E IMPLANTAR UNA ESTRATEGIA DE COMUNICACI&Oacute;N INTEGRAL DE CONFORMIDAD CON LA MISI&Oacute;N Y PLAN DE MARKETING.</li>\r\n<li>LLEVAR A CABO LA PRESENTACI&Oacute;N DE LA COMPA&Ntilde;&Iacute;A.</li>\r\n<li>COORDINAR SU ACTIVIDAD CON OTROS DEPARTAMENTOS.</li>\r\n<li>ORGANIZAR Y DEFINIR LOS EVENTOS DE LA EMPRESA.</li>\r\n<li>INTRODUCCI&Oacute;N DE NUEVOS PRODUCTOS</li>\r\n</ul>\r\n<p><strong><span style=\"background-color: #ccffcc;\">REQUERIMIENTOS</span></strong></p>\r\n<ul>\r\n<li>EDUCACI&Oacute;N M&Iacute;NIMA: EDUCACI&Oacute;N SUPERIOR - LICENCIATURA</li>\r\n<li>A&Ntilde;OS DE EXPERIENCIA: 1</li>\r\n<li>EDAD: ENTRE 23 Y 40 A&Ntilde;OS</li>\r\n<li>CONOCIMIENTOS: LIBREOFFICE</li>\r\n<li>LICENCIAS DE CONDUCIR: AUTOMOVIL</li>\r\n<li>DISPONIBILIDAD DE VIAJAR: NO</li>\r\n<li>DISPONIBILIDAD DE CAMBIO DE RESIDENCIA: NO</li>\r\n</ul>\r\n<p><strong><span style=\"background-color: #ccffcc;\">COMPETENCIAS</span></strong></p>\r\n<ol>\r\n<li>ENFOCADO A RESULTADOS</li>\r\n<li>ENFOQUE ESTRAT&Eacute;GICO</li>\r\n<li>TOMA DE DECISIONES</li>\r\n<li>APEGO A NORMAS</li>\r\n<li>TRABAJO EN EQUIPO</li>\r\n</ol>\r\n<p><span style=\"color: #ff0000;\">SUELDO COMPETITIVO.</span><br /><span style=\"color: #ff0000;\">HORARIO DE 9:00 A 7:00 DE LUNES A VIERNES</span><br /><span style=\"color: #ff0000;\">ZONA DE TRABAJO: VALLEJO</span><br /><span style=\"color: #ff0000;\">INTERESADOS POSTULARSE POR ESTE MEDIO</span></p>',11),(4,'Gerente de Recursos Humanos','Importante empresa líder en su giro solicita por expansión Gerente de Recursos Humanos para llevar el control de personal, supervisión del reclutamiento y los programas de capacitación.','2019-05-06',17000,'Aprobada',0,'logo4.png','<p><strong>IMPORTANTE EMPRESA L&Iacute;DER EN SU GIRO SOLICITA POR EXPANSI&Oacute;N</strong><br /><br />EJECUTIVO DE RECLUTAMIENTO BILING&Uuml;E<br /><br /><span style=\"color: #ff0000;\"><strong>REQUISITOS:</strong></span></p>\r\n<ol>\r\n<li>LIC. EN PSICOLOGIA, ADMINISTRACI&Oacute;N O AFIN</li>\r\n<li>EDAD 22 A 35 A&Ntilde;OS</li>\r\n<li>EXPERIENCIA MINIMA DE 2 A&Ntilde;OS EN PUESTO SIMILAR</li>\r\n<li>INGLES AVANZADO</li>\r\n<li>MANEJO DE OFFICE</li>\r\n<li>DISPONIBILIDAD INMEDIATA</li>\r\n<li>EXCELENTE PRESENTACION</li>\r\n</ol>\r\n<p><span style=\"color: #ff0000;\"><strong><span style=\"color: #ff0000;\">FUNCIONES:</span></strong></span></p>\r\n<ul>\r\n<li><span style=\"color: #ff0000;\"><span style=\"color: #000000;\">ADMINISTRACI&Oacute;N DE PERSONAL</span></span></li>\r\n<li><span style=\"color: #ff0000;\"><span style=\"color: #000000;\">ALTAS, BAJAS, MODIFICACI&Oacute;N DE SALARIO</span></span></li>\r\n<li><span style=\"color: #ff0000;\"><span style=\"color: #000000;\">ELABORACI&Oacute;N Y GESTI&Oacute;N DE INCIDENCIAS</span></span></li>\r\n<li><span style=\"color: #ff0000;\"><span style=\"color: #000000;\">ELABORACI&Oacute;N Y REVISI&Oacute;N DE CONTRATOS</span></span></li>\r\n<li><span style=\"color: #ff0000;\"><span style=\"color: #000000;\">PROCESO, ELABORACI&Oacute;N Y C&Aacute;LCULO DE PRE-N&Oacute;MINA</span></span></li>\r\n<li><span style=\"color: #ff0000;\"><span style=\"color: #000000;\">SEGUIMIENTO Y OBLIGACIONES ANTE EL IMSS, INFONAVIT, ISR</span></span></li>\r\n<li><span style=\"color: #ff0000;\"><span style=\"color: #000000;\">CONTROL Y ENTREGA DE CREDENCIALES</span> </span></li>\r\n<li><span style=\"color: #ff0000;\"><span style=\"color: #000000;\">GESTIONAR FIRMAS DE CONTRATOS.</span></span></li>\r\n<li><span style=\"color: #ff0000;\"><span style=\"color: #000000;\">ELABORACI&Oacute;N Y REVISI&Oacute;N DE REPORTES.</span></span></li>\r\n<li><span style=\"color: #ff0000;\"><span style=\"color: #000000;\">CONTROL DE KPI&acute;S</span></span></li>\r\n<li><span style=\"color: #ff0000;\"><span style=\"color: #000000;\">GESTIONAR Y DAR SEGUIMIENTO EN FORMA Y TIEMPO A CUALQUIER SOLICITUD RELACIONADA A LOS CLIENTES Y COLABORADORES.</span><strong><br /></strong></span></li>\r\n</ul>\r\n<p><span style=\"color: #ff0000;\"><strong>OFRECEMOS:</strong></span></p>\r\n<ul>\r\n<li>PRESTACIONES DE LEY</li>\r\n<li>VALES DE DESPENSA</li>\r\n<li>DIAS Y HORARIO DE TRABAJO:LUNES A VIERNES DE 9:00 HRS A 18:00 HRS</li>\r\n<li>ZONA DE TRABAJO: ALVARO OBREGON, CDMX</li>\r\n</ul>\r\n<p><em><strong><span style=\"color: #0000ff;\">INTERESADOS QUE CUMPLAN CON EL PERFIL SOLICITADO:</span></strong></em><br /><em><strong><span style=\"color: #0000ff;\">ENVIAR CV ACTUALIZADO AL CORREO POR ESTE MISMO MEDIO Y EN BREVE ESTAREMOS AGENDADO UNA ENTREVISTA. EN ASUNTO PONER NOMBRE DE LA VACANTE.</span></strong></em></p>\r\n<p>&nbsp;</p>',5),(5,'Jefe de Almacén','Se requiere Jefe de Almacén y logística en empresa líder a nivel nacional dedicada a la distribución de medicamentos de alta especialidad en el sector gobierno, organismos descentralizados y hospitales privados.','2019-05-07',12400,'Eliminada',0,'logo5.png','<p><span style=\"background-color: #00ccff;\"><em>Requisitos:</em></span></p>\r\n<ol>\r\n<li>Titulado en Ing. Industrial, Ing. Qu&iacute;mico, Q.F.B., Q.F.I., Lic. En Farmacia y/o carrera af&iacute;n.</li>\r\n<li>5 a&ntilde;os Experiencia en posici&oacute;n similar: Manejo de almacenes en Red Fr&iacute;a y distribuci&oacute;n de insumos para la salud.</li>\r\n<li>Trato con clientes, proveedores y con personal a cargo.</li>\r\n</ol>\r\n<p><span style=\"background-color: #00ccff;\"><em>Actividades:</em></span></p>\r\n<ul>\r\n<li>Cumplir con los requisitos Normativos y de los Clientes en la recepci&oacute;n, almacenamiento, reabasto, etiquetado, surtido y embarque de los insumos para la salud.</li>\r\n<li>Reportar continuamente el desempe&ntilde;o de los procesos a su cargo para asegurar el cumplimiento en cantidad, calidad, costo y tiempo de la operaci&oacute;n.</li>\r\n<li>Garantizar el ingreso de los insumos para la salud en el sistema SAP y su revisi&oacute;n f&iacute;sica, verificando los reportes de ingresos, as&iacute; como las desviaciones que se presenten para garantizar la efectividad del proceso.</li>\r\n<li>Garantizar la confiabilidad de inventario del stock almacenado, de los insumos y/o materiales requeridos; solicitando reportes de inventario peri&oacute;dicos para disminuir gradualmente las diferencias de inventario y control de costos.</li>\r\n<li>Garantizar que el &Aacute;rea de mantenimiento lleve a cabo el programa de mantenimiento preventivo y correctivo de los equipos e instalaciones del almac&eacute;n, solicitando los reportes correspondientes para asegurar el funcionamiento eficiente y &oacute;ptimo de los equipos.</li>\r\n</ul>\r\n<p><em><span style=\"background-color: #00ccff;\">Ofrecemos:</span></em></p>\r\n<ul>\r\n<li>Sueldo competitivo</li>\r\n<li>Prestaciones de ley</li>\r\n<li>Prestaciones Superiores: Seguro de Vida, Seguro de Gastos M&eacute;dicos Mayores, Fondo y Caja de Ahorro, comedor</li>\r\n<li>Zona para laborar en Tlalpan, se requiere disponibilidad de horario</li>\r\n</ul>\r\n<p><span style=\"background-color: #00ccff;\"><em>Requerimientos:</em></span></p>\r\n<ul>\r\n<li>Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura</li>\r\n<li>A&ntilde;os de experiencia: 3</li>\r\n<li>Edad: entre 31 y 48 a&ntilde;os</li>\r\n<li>Disponibilidad de viajar: No</li>\r\n<li>Disponibilidad de cambio de residencia: No</li>\r\n</ul>\r\n<p><span style=\"background-color: #00ccff;\"><em>Funciones:</em></span></p>\r\n<p>&bull; Entradas y salidas de material <br />&bull; Conteos c&iacute;clicos <br />&bull; Acomodo de material y Surtido de pedidos <br />&bull; Manejo de inventarios <br /><br />Competencias/Habilidades<br />Din&aacute;mico, comunicaci&oacute;n efectiva, responsable, trabajo en equipo.</p>',7),(7,'Diseñador grafico - Técnico o superior','Estamos solicitando personal, \"diseñador\" para sus puntos de venta localizados en la zona, debe tener conocimientos en alguno de los diferentes softwares de diseño, Corel, Photoshop o Illustrator.','2019-05-07',7200,'Aprobada',1,'logo3.png','<p><strong><span style=\"color: #0000ff;\">DESCRIPCION</span></strong></p>\r\n<p><span style=\"color: #ff0000;\"><em><strong>Consultor&iacute;a de Imagen est&aacute; en b&uacute;squeda del talento de un Dise&ntilde;ador Gr&aacute;fico</strong></em></span><br /><br /><span style=\"color: #0000ff;\"><em><strong>REQUISITOS:</strong></em></span><br /><br /><span style=\"color: #000000;\">- Licenciatura en Dise&ntilde;o</span><br /><span style=\"color: #000000;\">- Experiencia m&iacute;nima de dos a&ntilde;os desarrollando actividades de dise&ntilde;o publicitario, y de identidad corporativa.</span><br /><span style=\"color: #000000;\">- Manejo de paqueter&iacute;a: Photo shop, Illustrator, Adobe InDesign, Dreamweaver, HTML</span><br /><span style=\"color: #000000;\">- Desarrollo de mensajes visuales, informativos, de identidad y de persuasi&oacute;n</span><br /><span style=\"color: #000000;\">- Estrategia digital, uso de medios digitales audio, v&iacute;deo e imagen</span></p>\r\n<p><span style=\"color: #0000ff;\"><em><strong>FUNCIONES:</strong></em></span></p>\r\n<p><span style=\"color: #000000;\">- Dise&ntilde;ar papeler&iacute;a institucional, estrategias digitales, presentaciones corporativas. Crear y editar fotograf&iacute;as y gr&aacute;ficos - Preparar archivos para impresi&oacute;n digital y offset</span><br /><span style=\"color: #000000;\">- Dise&ntilde;o, construcci&oacute;n y mantenimiento de p&aacute;ginas web, as&iacute; como campa&ntilde;as de mailing-newsletter etc.</span><br /><span style=\"color: #000000;\">- Dise&ntilde;o de material gr&aacute;fico para redes sociales y p&aacute;ginas web</span><br /><span style=\"color: #000000;\">- Desarrollo y dise&ntilde;o de eventos como ferias, exposiciones, festejos, aniversarios etc.</span><br /><br /><span style=\"color: #0000ff;\"><em><strong>OFRECEMOS:</strong></em></span></p>\r\n<p><span style=\"color: #000000;\">- Pago semanal</span><br /><span style=\"color: #000000;\">- Prestaciones de Ley</span><br /><span style=\"color: #000000;\">- Contrataci&oacute;n directa por la empresa Horario 9:00 AM&ndash; 7:00 PM de Lunes a Viernes</span></p>\r\n<p><span style=\"color: #0000ff;\"><em><strong>REQUERIMIENTOS:</strong></em></span></p>\r\n<p><span style=\"color: #000000;\">- Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura</span><br /><span style=\"color: #000000;\">- A&ntilde;os de experiencia: 2</span><br /><span style=\"color: #000000;\">- Edad: entre 24 y 40 a&ntilde;os</span><br /><span style=\"color: #000000;\">- Conocimientos: Microsoft Office</span><br /><span style=\"color: #000000;\">- Disponibilidad de viajar: No</span><br /><span style=\"color: #000000;\">- Disponibilidad de cambio de residencia: No</span></p>',9),(8,'Gerente de Recursos Humanos','Reclutamos para una empresa líder de transporte especializado un Gerente de Recursos Humanos con buen liderazgo, dinámico, negociador, pro activo, enfocado a resultados.','2019-05-08',22000,'Eliminada',1,'logo1.png','<p><span style=\"color: #ff0000;\"><strong>Funciones:</strong></span></p>\r\n<ul>\r\n<li>Responsable de las &aacute;reas de Reclutamiento, Capcitaci&oacute;n, N&oacute;mina, Laboral, Compensaciones, Seguridad Patrimonial.</li>\r\n<li>Promover la cultura organizacional</li>\r\n<li>Asegurar el cumplimiento de pol&iacute;ticas, normas y procedimientos.</li>\r\n<li>Desarrollar el talento.</li>\r\n<li>Asegurar el reclutamiento en tiempo y forma, cuidando las pol&iacute;ticas establecidas.</li>\r\n<li>Garantizar la equidad interna, competitividad externa y pago oportuno.</li>\r\n<li>Asegurar el cumplimiento del Reglamento Interior de Trabajo.</li>\r\n</ul>\r\n<p><span style=\"color: #ff0000;\"><strong>Requisitos:</strong></span></p>\r\n<ul>\r\n<li>Carrera profesional (LAE, LRH, af&iacute;n)</li>\r\n<li>5 a&ntilde;os de experiencia como Gerente de Recursos Humanos</li>\r\n<li>Experiencia en empresas de transporte</li>\r\n<li>Conocimiento en esquemas de desarrollo, compensaciones, reclutamiento.</li>\r\n<li>Preferentemente con buen nivel de ingl&eacute;s</li>\r\n</ul>\r\n<p><span style=\"color: #ff0000;\"><strong>Se ofrece:</strong></span></p>\r\n<ul>\r\n<li>Sueldo competitivo</li>\r\n<li>Prestaciones de ley</li>\r\n<li>Bonos de despensa</li>\r\n</ul>\r\n<p><span style=\"color: #ff0000;\"><strong>Requerimientos</strong></span></p>\r\n<ul>\r\n<li>Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura</li>\r\n<li>A&ntilde;os de experiencia: 5</li>\r\n<li>Idiomas: Ingl&eacute;s</li>\r\n<li>Edad: entre 30 y 50 a&ntilde;os</li>\r\n<li>Conocimientos: Microsoft Office</li>\r\n<li>Disponibilidad de viajar: Si</li>\r\n<li>Disponibilidad de cambio de residencia: No</li>\r\n</ul>\r\n<p><span style=\"color: #0000ff;\"><strong>Interesados enviar su CV por este medio.</strong></span></p>',5),(10,'Administrador de redes y Sistema Operativo Red Hat','Empresa importante del sector financiero solicita Ing. de Sistemas para monitorear y administrar el desempeño de los servidores Linux.','2019-05-09',25000,'Aprobada',1,'logo14.png','<p style=\"text-align: center;\"><span style=\"color: #0000ff;\">&iexcl;&iexcl;INT&Eacute;GRATE A NUESTRO GRAN EQUIPO!!</span><br /><span style=\"color: #0000ff;\">EMPRESA IMPORTANTE SOLICITA ADMINISTRADOR DE SO RED HAT ENTERPRISE LINUX.</span></p>\r\n<p><span style=\"color: #ff0000;\"><strong>Requisitos:</strong></span></p>\r\n<ul>\r\n<li>Ingeniero en computaci&oacute;n o carrera af&iacute;n (Titulado)</li>\r\n<li>Promedio m&iacute;nimo de 8.0</li>\r\n<li>Sexo: Indistinto</li>\r\n</ul>\r\n<p><span style=\"color: #ff0000;\"><strong>Experiencia m&iacute;nima de 2 a 3 a&ntilde;os en:</strong></span></p>\r\n<ul>\r\n<li>Instalaci&oacute;n, configuraci&oacute;n, aplicaci&oacute;n de parches y actualizaci&oacute;n del software mencionado.</li>\r\n<li>Implementaci&oacute;n de recomendaciones de seguridad inform&aacute;tica y buenas pr&aacute;cticas.</li>\r\n<li>Resoluci&oacute;n de problemas a nivel Sistema Operativo.</li>\r\n<li>Monitoreo y an&aacute;lisis de desempe&ntilde;o de los servidores Linux.</li>\r\n<li>Atenci&oacute;n de reportes de Soporte t&eacute;cnico, atenci&oacute;n y asesor&iacute;as a usuarios finales asignados por el Centro de Soporte Institucional (Mesa de Ayuda).</li>\r\n<li>Alta, baja y modificaci&oacute;n de cuentas de usuario.</li>\r\n</ul>\r\n<p><span style=\"color: #ff0000;\"><strong>Contar con alguno de los siguientes cursos:</strong></span></p>\r\n<ul>\r\n<li>Red Hat System Administration I version 6 o superior</li>\r\n<li>Red Hat System Administration II</li>\r\n<li>Certificaci&oacute;n Red Hat Certified System Administrator (RHCSA) para versi&oacute;n 6 o superior</li>\r\n<li>Red Hat Certified Engineer (RHCE) para versi&oacute;n 6 o superior</li>\r\n</ul>\r\n<p><span style=\"color: #ff0000;\"><strong>Propuesta de trabajo:</strong></span></p>\r\n<ul>\r\n<li>Sueldo seg&uacute;n experiencia y conocimientos</li>\r\n<li>Prestaciones de Ley</li>\r\n<li>Zona de trabajo: Legar&iacute;a</li>\r\n<li>Horario propuesto: lunes a viernes de 9 &ndash; 18 horas</li>\r\n</ul>\r\n<p><span style=\"color: #ff0000;\"><strong>Requerimientos</strong></span></p>\r\n<ol>\r\n<li>Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura</li>\r\n<li>A&ntilde;os de experiencia: 2</li>\r\n<li>Disponibilidad de viajar: No</li>\r\n<li>Disponibilidad de cambio de residencia: No</li>\r\n</ol>\r\n<p><span style=\"color: #008000;\"><strong>SI CUMPLES CON LOS REQUISITOS MENCIONADOS NO DUDES EN ENVIARNOS TU CV POR ESTE MEDIO.</strong> </span></p>',3),(11,'Programador de Software','Empresa con presencia a nivel nacional, te invita a formar parte de su equipo de trabajo para diseñar, crear y realizar mantenimiento a páginas y aplicaciones web.','2019-05-09',19700,'Creada',1,'logo15.png','<p><span style=\"color: #ff0000;\"><strong>PROGRAMADOR DE SOFTWARE</strong></span><br /><br /><strong>OBJETIVO:</strong> DISE&Ntilde;AR, CREAR Y REALIZAR MANTENIMIENTO A P&Aacute;GINAS Y APLICACIONES WEB<br /><br /><strong><span style=\"color: #0000ff;\">REQUISITOS:</span></strong></p>\r\n<p>* EDAD: 25 A 35 A&Ntilde;OS<br />* LICENCIATURA: DESARROLLO DE SOFTWARE, INFORM&Aacute;TICA, INGENIER&Iacute;A EN SISTEMAS COMPUTACIONALES O AF&Iacute;N<br />* INGLES T&Eacute;CNICO<br />* EXPERIENCIA EN PUESTO SIMILAR M&Iacute;NIMA 3 A&Ntilde;OS (ESTAR EJERCIENDO ACTUALMENTE)<br />* MANEJO DE ERP<br />* EXPERIENCIA EN VISUAL C# (2 A&Ntilde;OS)<br />* EXPERIENCIA EN JAVA (2 A&Ntilde;OS)<br />* EXPERIENCIA EN MICROSOFT SQL SERVER (2 A&Ntilde;OS)<br />* EXPERIENCIA DE MVC Y POO (1 A&Ntilde;O)<br /><br /><strong><span style=\"color: #0000ff;\">FUNCIONES: (EXPERIENCIA EN ESTAS ACTIVIDADES)</span></strong></p>\r\n<p>* MANEJO DE C&Oacute;DIGO EN DISTINTOS LENGUAJES DE PROGRAMACI&Oacute;N, TALES COMO HTML, XML PHP Y JAVASCRIPT.<br />* DISE&Ntilde;AR NUEVAS APLICACIONES Y SITIOS DE INTERNET<br />* DETECTAR Y SOLUCIONAR ERRORES O PROBLEMAS EN LA EJECUCI&Oacute;N DE LAS APLICACIONES Y SITIOS WEB.<br />* AGREGAR NUEVAS FUNCIONES A LA EJECUCI&Oacute;N DE LOS SITIOS DE INTERNET Y LAS APLICACIONES<br />* ESTAR AL CORRIENTE CON LOS NUEVOS LENGUAJES DE PROGRAMACI&Oacute;N, TECNOLOG&Iacute;AS Y TENDENCIAS EN EL MERCADO<br />* COLABORAR EN LA ATENCI&Oacute;N Y CAPACITACI&Oacute;N DE LOS USUARIOS EN LOS SISTEMAS IMPLEMENTADOS<br />* DOCUMENTAR ADECUADAMENTE LOS PROGRAMAS DESARROLLADOS<br /><br /><strong><span style=\"color: #0000ff;\">OFERTA:</span></strong></p>\r\n<p>* PERCEPCI&Oacute;N MENSUAL $10,000 NETOS (PAGO QUINCENAL, INCLUYE VALES DE DESPENSA)<br />* PRESTACIONES DE LEY<br />* HORARIO: L-V 9:00 A 7:00 Y S&Aacute;BADO MEDIO D&Iacute;A<br /><br /><span style=\"color: #0000ff;\"><strong>REQUERIMIENTOS</strong></span></p>\r\n<p>* EDUCACI&Oacute;N M&Iacute;NIMA: EDUCACI&Oacute;N SUPERIOR - LICENCIATURA<br />* A&Ntilde;OS DE EXPERIENCIA: 3<br />* IDIOMAS: INGL&Eacute;S<br />* EDAD: ENTRE 25 Y 35 A&Ntilde;OS<br />* CONOCIMIENTOS: SQL SERVER, C#, JAVA, ASP.NET MVC, MYSQL<br />* DISPONIBILIDAD DE VIAJAR: NO<br />* DISPONIBILIDAD DE CAMBIO DE RESIDENCIA: NO</p>\r\n<p><em><strong>SI CUMPLES CON EL PERFIL. POR FAVOR ENVIANOS TU CV POR ESTE MEDIO EN FORMATO PDF, DOCX.</strong></em></p>\r\n<p>&nbsp;</p>',8),(14,'Profesor de Matematicas','Escuela primaria solicita profesor para curso de Matematicas','2021-12-10',8500,'Aprobada',0,'escuela.png','<h1>Los requisitos para profesor de Matematicas</h1>',15),(23,'Ingeniero Software','Se solicita Arquitecto sin experiencia ','2021-12-18',50000,'Aprobada',1,'ILOPCBQVWhatsApp-Image-2021-12-07-at-11.18.04-PM.jpeg','<p>HOLA ESTA OFERTA ES DE BITCOIND</p>',16),(24,'Administrador de datos en la nube ','Únete al Socio Logístico con mayor presencia en México, Soft Technologies te invita a formar parte de su gran equipo de trabajo como Administrador de datos en la nube.','2019-05-05',14200,'Aprobada',0,'no-image.png','<p><span style=\"color: #0000ff;\"><strong>REQUISITOS</strong></span></p>\r\n<p>Escolaridad: Lic. trunca o pasante en Ing en Sistemas Computacionales o afin.<br />Experiencia de 2 a&ntilde;os en:</p>\r\n<ul>\r\n<li>2 a&ntilde;os como ingeniero de infraestructura en tecnolog&iacute;as Microsoft, experiencia en soluciones de Infraestructura (Hardware/Software).</li>\r\n<li>2 a&ntilde;os administrando servidores en centros de datos.</li>\r\n</ul>\r\n<p><span style=\"color: #0000ff;\"><strong>ESPEC&Iacute;FICOS</strong></span></p>\r\n<ul>\r\n<li>Administraci&oacute;n monitoreo y mantenimiento de servicios en la nube Microsoft Azure.</li>\r\n<li>Administraci&oacute;n de servicios y proveedores de nube ITIL Foundations.</li>\r\n<li>Herramientas y Tecnolog&iacute;as de Virtualizaci&oacute;n Autoestudio.</li>\r\n<li>Herramientas de Monitoreo para servicios en la Nube o en Sitio.</li>\r\n<li>Esquemas de alta disponibilidad para nubes, cluster dispersos geogr&aacute;ficamente.</li>\r\n<li>Servicios de Nube: SaaS, PaaS, IaaS.</li>\r\n<li>Conocimientos b&aacute;sicos de Redes.</li>\r\n<li>Administraci&oacute;n de bases de datos en la nube SQL Azure.</li>\r\n<li>Conocimiento de consumo de costos de servicios en la nube.</li>\r\n<li>Herramientas de Monitoreo para nube.</li>\r\n<li>VPN.</li>\r\n<li>Almacenamiento en Nube.</li>\r\n</ul>\r\n<p>&nbsp;<span style=\"color: #0000ff;\"><strong>OFRECEMOS</strong></span></p>\r\n<ul>\r\n<li>ATRACTIVO SUELDO + prestaciones superiores a las de ley.</li>\r\n<li>Excelente ambiente de trabajo.</li>\r\n<li>Zonas de trabajo: Condesa.</li>\r\n<li>Horario Tiempo Completo: Lunes a Viernes: 09:00-06:00 con disponibilidad de horario.</li>\r\n</ul>\r\n<p><span style=\"color: #0000ff;\"><strong>ADICIONALES</strong></span></p>\r\n<ul>\r\n<li>Disponibilidad de viajar: No</li>\r\n<li>Disponibilidad de cambio de residencia: No</li>\r\n</ul>',4);
/*!40000 ALTER TABLE `vacantes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-15 21:58:05
