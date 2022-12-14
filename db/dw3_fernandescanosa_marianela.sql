CREATE DATABASE  IF NOT EXISTS `dw3_fernandescanosa_marianela` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `dw3_fernandescanosa_marianela`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dw3_fernandescanosa_marianela
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

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
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrito` (
  `id_carrito` int(11) NOT NULL AUTO_INCREMENT,
  `producto` varchar(45) DEFAULT NULL,
  `precio` decimal(6,2) DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `imagen_descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_carrito`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `categoria_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compras` (
  `compra_id` int(11) NOT NULL AUTO_INCREMENT,
  `productos` text NOT NULL,
  `cliente` varchar(45) NOT NULL,
  `total` smallint(6) NOT NULL,
  `mail_cliente` varchar(150) NOT NULL,
  `Usuarios_usuario_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`compra_id`),
  KEY `fk_Compras_Usuarios1_idx` (`Usuarios_usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (13,'B??lsamo Labial de Frambuesa','pedro',260,'pedro@gmail.com',0),(14,'Crema Facial Antiage','pedro',1030,'pedro@gmail.com',0),(15,'Exfoliante Facial, Crema Corporal Fluida, Detergente S??lido 115 Gr.','Pedro',1865,'pedro@gmail.com',0);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiquetas`
--

DROP TABLE IF EXISTS `etiquetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etiquetas` (
  `etiqueta_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`etiqueta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiquetas`
--

LOCK TABLES `etiquetas` WRITE;
/*!40000 ALTER TABLE `etiquetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `etiquetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiquetas_has_posteos`
--

DROP TABLE IF EXISTS `etiquetas_has_posteos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etiquetas_has_posteos` (
  `Etiquetas_etiqueta_id` tinyint(3) unsigned NOT NULL,
  `Posteos_posteo_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Etiquetas_etiqueta_id`,`Posteos_posteo_id`),
  KEY `fk_Etiquetas_has_Posteos_Posteos1_idx` (`Posteos_posteo_id`),
  KEY `fk_Etiquetas_has_Posteos_Etiquetas1_idx` (`Etiquetas_etiqueta_id`),
  CONSTRAINT `fk_Etiquetas_has_Posteos_Etiquetas1` FOREIGN KEY (`Etiquetas_etiqueta_id`) REFERENCES `etiquetas` (`etiqueta_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Etiquetas_has_Posteos_Posteos1` FOREIGN KEY (`Posteos_posteo_id`) REFERENCES `posteos` (`posteo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiquetas_has_posteos`
--

LOCK TABLES `etiquetas_has_posteos` WRITE;
/*!40000 ALTER TABLE `etiquetas_has_posteos` DISABLE KEYS */;
/*!40000 ALTER TABLE `etiquetas_has_posteos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posteos`
--

DROP TABLE IF EXISTS `posteos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posteos` (
  `posteo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `texto` text NOT NULL,
  `imagen` varchar(45) NOT NULL,
  `imagen_descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`posteo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posteos`
--

LOCK TABLES `posteos` WRITE;
/*!40000 ALTER TABLE `posteos` DISABLE KEYS */;
INSERT INTO `posteos` VALUES (1,'??Qu?? no vas a encontrar en nuestros B??lsamos Naturales?','Siliconas: con este ingrediente consiguen texturas muy suaves pero proporcionan una falsa hidrataci??n. En el INCI (Nomenclatura Internacional de Ingredientes de Cosm??ticos) pueden aparecer como: Dimethicone, Cyclomethicone, Vinil Dimethicone Crosspolymer, Cyclotetra, penta o hexa ??? xiloxane.\nParafinas o aceites minerales: Son derivados del petr??leo y producen un efecto de falsa hidrataci??n. Adem??s se ha descubierto que se acumulan en el h??gado y los ganglios linf??ticos.\nCeras minerales: Este ingrediente como el ozokerite, se utiliza para dar consistencia y tambi??n procede de la industria petroqu??mica.\nPlomo: Se trata de un metal pesado que se ha encontrado en muchas marcas conocidas de cosm??ticos. Es un ingrediente peligroso para la salud, porque es neurot??xico (Puedes conocer m??s sobre ello en el art??culo: Al rico pintalabios)\nConservantes sint??ticos: como parabenes,  phenoxiethanol y  methylchloroisothiazolinone  (Kathon).\nPerfumes sint??ticos: Estos ingredientes son mucho m??s alerg??nicos que los naturales.\nFiltros solares qu??micos: muchos de estos act??an como disruptores endocrinos, fotosensibilizantes, etc???\nLos labiales naturales sustituyen ??stos ingredientes por alternativas naturales. Al utilizar ingredientes naturales o vegetales, estos aportan beneficios a tus labios. Estos son algunos de los ingredientes y sus beneficios.','slide1.jpg','B??lsamos Naturales'),(2,'Beneficios del Aceite de Coco','El aceite de coco es uno de esos productos que es beneficioso para tantas cosas, que uno no sabe por donde arrancar! Cuando me preguntan, yo siempre recomiendo su aplicaci??n en el pelo y la piel corporal (??No facial!) ???\n???\nEl aceite de coco natural se solidifica por debajo de los 24 grados. Para retirarlo del envase les recomendamos ponerlo unos segundos debajo de agua caliente o ba??o mar??a. Debido a su gran riqueza nutricional, el aceite de coco ha sido muy utilizado en la industria de la fabricaci??n de cosm??ticos como jabones, cremas hidratantes y otros cosm??ticos destinados a embellecer la piel. De hecho, el aceite de coco es m??s eficaz que las cremas hidratantes gracias a su efecto de hidrataci??n profunda y duradera. Adem??s, ayuda a reforzar las capas internas de la piel y a promover la eliminaci??n de las c??lulas muertas, torn??ndola m??s suave y tersa.','slide2.jpg','Aceite de Coco'),(3,'Jabon Natural VS Industrial','La cosm??tica industrial utiliza miles de ingredientes, de los cuales muchos no han sido investigados en sus efectos a largo plazo, la mayor??a de fabricantes se escudan en el argumento de que son dosis muy bajas, pero no se considera su uso contin??o y su combinaci??n con otros productos con el mismo componente, los jabones artesanales por su lado, est??n fabricados en distintas bases, las m??s comunes, son glicerina vegetal, miel, extractos de plantas y aceites esenciales.Los productos industriales tienen muchas veces productos derivados del petr??leo, que taponan los poros de la piel, generando una falsa sensaci??n de humectaci??n, que a la larga genera todo lo contrario: resequedad, con los jabones artesanales, obtienes un beneficio natural, si utilizas el correcto para tu tipo de piel.Los jabones artesanales, son en su mayor??a elaborados por peque??as iniciativas familiares o comunitarias, cuando elijes este tipo de jab??n apoyas la econom??a local, aunque a veces el precio sea m??s alto, esto se debe principalmente a la calidad de los insumos, (los jabones artesanales tienen insumos org??nicos y naturales) lo detallado del proceso de elaboraci??n (un jab??n artesanal puede tardar hasta 4 semanas en se elaborado) y la peque??a escala en la que son fabricados.','slide4.jpg','Jabones Naturales'),(4,'Desodorantes Naturales','Hechos con alumbre, glicerina vegetal y aceites esenciales. La piedra de alumbre es conocida por tener propiedades astringentes, antis??pticas y desodorantes. \nAct??a sobre las bacterias que generan el mal olor y es amigo de las pieles sensibles \n\nEs desodorante, no antitranspirante. \nTranspirar es una necesidad fisiol??gica esencial para que nuestro organismo pueda eliminar toxinas y mantener buenos niveles de hidrataci??n, temperatura corporal y PH. Para que los desodorantes industriales sean \"antitranspirantes\" se utilizan muchos componentes que son da??inos. Cuando el cuerpo suda, en ciertos lugares del cuerpo como las axilas o los pies, fermenta junto con las bacterias causando mal olor. \nLos desodorantes en la cosm??tica natural buscan disminuir la proliferaci??n de esas bacterias sin da??arla.','slide3.jpg','Desodorantes Naturales'),(5,'Ventajas del shampoo y acondicionador s??lido','Reduce la huella de carbono, es vegano, dura m??s que el shampoo tradicional y es muy c??modo para llevar de viaje. La clave est??, por un lado, en su durabilidad: la cosm??tica s??lida dura m??s y ocupa menos volumen. Requiere menos agua en su elaboraci??n. Por lo que no es necesario a??adirle parabenos, emulsionantes, siliconas ni sulfatos, que en cambio s?? contienen muchos productos de cosm??tica convencional y que pueden irritar o da??ar la piel.Es m??s f??cil de envasar sin usar pl??sticos. Usualmente, vienen con envoltorios biodegradables que tienen un impacto ambiental nulo.El pelo dura limpio mucho m??s tiempo gracias a la ausencia de sulfatos y parabenos, que sos qu??micos que barren con la barrera protectora del cuero cabelludo. En su elaboraci??n, se usan ingredientes naturales y cruelty free. ??Q??e estas esperando para probarlos?','slide6.jpg','Ventajas del Shampoo y Acondicionador s??lido.'),(6,'Menstruaci??n Ec??logica','??Alguna vez has encontrado basura menstrual en la naturaleza y has pensado ???que asco???? Yo s??, muchas veces. Despu??s cuando descubr?? la copa menstrual y las compresas de tela pens?? ?????y por qu?? seguimos usando estos productos que tanto rechazo nos generan???? Una de las formas m??s sencillas de vivir tu menstruaci??n de forma sostenible es pasarte a la copa menstrual. Compuesta 100% de silicona m??dica, un material natural no contaminante, y reutilizable hasta 10 a??os, se trata de la alternativa m??s ecol??gica. Por otro lado, el uso de la copa menstrual va m??s all????? Y es que no solo es buena para el medioambiente, sino tambi??n para nuestra salud. ??Por qu??? La mayor??a de tampones convencionales (de los que venden en el super) contienen algod??n no ecol??gico y pesticidas, pl??stico, cloro??? Pero, ??y si no me siento c??moda usando la copa menstrual? ??es esta la ??nica soluci??n????\n                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     \n                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Para nada, existen muchas maneras de vivir tu menstruaci??n en positivo. La copa es la m??s extendida por su versatilidad, sin embargo las compresas de tela o las bragas menstruales son tambi??n opciones sostenibles y saludables.','slide5.jpg','Menstruaci??n Ecol??gica');
/*!40000 ALTER TABLE `posteos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `producto_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(6,2) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `imagen_descripcion` varchar(255) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `Categorias_categoria_id` tinyint(3) unsigned DEFAULT NULL,
  `Usuarios_usuario_id` int(10) unsigned DEFAULT NULL,
  `Carrito_id_carrito` int(11) NOT NULL,
  PRIMARY KEY (`producto_id`,`Carrito_id_carrito`),
  KEY `fk_Productos_Categorias1_idx` (`Categorias_categoria_id`),
  KEY `fk_Productos_Usuarios1_idx` (`Usuarios_usuario_id`),
  CONSTRAINT `fk_Productos_Categorias1` FOREIGN KEY (`Categorias_categoria_id`) REFERENCES `categorias` (`categoria_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_Usuarios1` FOREIGN KEY (`Usuarios_usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Jabonera de Madera','Tratadas con aceites vegetales que nutren, protege y otorga brillo a la madera sin afectar a nuestro medioambiente. Tama??o: 13x7 cm aproximadamente.',800.00,'20220616101740_jabonera.png','Jabonera de Madera','cocina-sustentable',NULL,NULL,0),(2,'Crema Facial Antiage','Crema facial para acompa??ar el paso de la edad. Ayuda a nutrir, hidratar y darle vida a u piel. Formulada a base de potentes antioxidantes como el aceite de rosa mosqueta que regenera, manteca de mango que regenera las c??lulas y mejora la elasticidad, vitamina c para la reparaci??n de tejidos y acido hialur??nico capaz de retener grandes cantidades de agua en la piel y aportar volumen. Contenido neto: 50cc',1030.00,'crema-antiage.png','Crema Facial Antiage','cuidado-facial',NULL,NULL,0),(3,'Leche de Limpieza','Emulsi??n formulada con extracto de aloe vera que ayuda a limpiar la piel desde sus capas m??s profundas, lo que favorece la desobstrucci??n de poros y la eliminaci??n de la suciedad y alantoina un activo que deja la piel suave y humectada. Presentaci??n: 125 cc.',510.00,'leche-de-limpieza.png','Leche de Limpieza','cuidado-facial',NULL,NULL,0),(4,'Exfoliante Facial','Exfoliante facial formulado a base de aceite de almendras para hidratar, contiene cascara de nuez, unas peque??as part??culas que exfolian eliminando la piel muerta y dej??ndola suave. Presentaci??n: 100cc.',480.00,'exfoliante-facial.png','Exfoliante Facial','cuidado-facial',NULL,NULL,0),(5,'B??lsamo Labial de Frambuesa','Con manteca de karite, repara los labios secos. Efecto hidratante, reparador. Aplicar en los labios y dejar actuar.',260.00,'balsamo-frambuesa.png','B??lsamo Labial de Frambuesa','maquillaje-natural',NULL,NULL,0),(6,'Aceite de Coco Neutro','El aceite de coco es uno de esos productos que es beneficioso para tantas cosas, que uno no sabe por donde arrancar! Cuando me preguntan, yo siempre recomiendo su aplicaci??n en el pelo y la piel corporal (??No facial!). Presentaci??n: Botella de vidrio color ??mbar, para una mejor conservaci??n, de 250cc. Reutilizable!',540.00,'aceite-coco.png','Aceite de Coco Neutro','aceites-oleos',NULL,NULL,0),(7,'Crema Corporal Fluida','Crema corporal aroma rosa mosqueta y bergamota. Formulaci??n fluida y liviana, hidrata y nutre la piel en profundidad. Presentaci??n de 250gr.',1015.00,'crema-corporal-fluida.png','Crema Corporal Fluida','ba??o-sustentable',NULL,NULL,0),(8,'Agua Micelar','Producto de limpieza facial diaria formulada a base de de glicerina vegetal que act??a como el agente hidratante, y coco glucosido que tiene la funci??n de limpiar las impurezas que se encuentren en la superficie de la piel.',510.00,'agua-micelar.png','Agua Micelar','cuidado-facial',NULL,NULL,0),(9,'Shampoo Matizador','Shampoo que contiene violeta de genciana, un pigmento intenso que logra contrarrestar las tonalidades naranjas/amarillentas, es el shampoo ideal para mantener cabellos te??idos de tonalidades fr??as o para tonalizar canas y al mismo tiempo reparar da??os o hidratar con el aceite de coco.',570.00,'shampoo-matizador.png','Shampoo Matizador','ba??o-sustentable',NULL,NULL,0),(10,'Crema para Manos','Nuestra crema es una emulsi??n concentrada regeneradora hecha a base de aceite de coco y manteca de karit?? , aceites esenciales de lavanda (regeneradora de c??lulas e hidratante) y s??ndalo (calmante y antis??ptico)??? para que puedas cuidarlas de forma natural y tenerlas siempre hidratadas. Contenido neto: 50cc.',390.00,'crema-manos.png','Crema para Manos','ba??o-sustentable',NULL,NULL,0),(11,'Labiales','Labiales con acabado tipo matte creados a base de cera vegetal y oxidos naturales, super suaves en los labios, colores intensos.',650.00,'labiales.png','Labiales','maquillaje-natural',NULL,NULL,0),(12,'Jab??n Vainilla y Neroli','VAINILLA y NEROLI: Con el dulzor de la vainilla y de la flor de Azahar, este jab??n a??ade cualidades antibacterianas y regeneradoras para nuestra piel. A base de aceite de coco, aceite de oliva y manteca de karit??, quienes hidratan, regeneran y nutren la piel en profundidad, generando un efecto suavizante.',280.00,'jabon-vainilla-neroli.png','Jab??n Vainilla y Neroli','ba??o-sustentable',NULL,NULL,0),(13,'Detergente S??lido 115 Gr.','DETERGENTE SO??LIDO PARA VAJILLA - 100% BIODEGRADABLE - 115 GR. No tiene envase pl??stico. Los ingredientes son biodegradables y de fuentes renovables. M??s brillo y menos grasa en tu cocina.Econ??mico y rendidor. Te deja las manos m??s suaves. Origen vegetal - Libre de crueldad animal. Muy f??cil de usar. Con aceites esenciales que otorgan un riqui??simo aroma a limo??n y menta.',370.00,'detergente-solido.png','Detergente S??lido 115 Gr.','cocina-sustentable',NULL,NULL,0),(14,'Cepillo de Dientes Bamb??','Al estar hechos de bamb?? son m??s que amigables con el medioambiente: 97% biodegradables y 3% reciclables. Tardan 180 d??as en descomponerse y formar parte del suelo.???Eleg?? entre cerdas SUAVES y MEDIAS para adultos o cerda SUAVES KIDS.',215.00,'cepillo-bambu.png','Cepillo de Dientes Bamb??','cuidado-bucal',NULL,NULL,0),(15,'Enjuague Bucal','Enjuague bucal natural con mentol, eucalipto, lim??n y agua oxigenada 10%. PRODUCTO CONCENTRADO PARA DILUIR EN AGUA POTABLE. RINDE M??S DE 50 LAVADOS.',510.00,'enjuague-bucal.png','Enjuague Bucal','cuidado-bucal',NULL,NULL,0),(16,'Crema Facial Regeneradora','Crema facial de aceites esenciales de lavanda e incienso, de r??pida absorci??n, y apropiada para todo tipo de pieles. Se aplica en peque??as cantidades, es muy rendidora ! Posee propiedades antis??pticas, con efectos equilibrantes, cicatrizantes, tonificantes y calmantes al mismo tiempo. Presentaci??n: 50cc.',510.00,'crema-regeneradora.png','Crema Facial Regeneradora','cuidado-facial',NULL,NULL,0),(17,'Gel para Granitos','Gel de teatree concentrado para tratar granitos puntuales. Su concentraci??n permite secarlos aplicando directa y ??nicamente en la zona que se quiere tratar. Contenido neto: 30g',320.00,'gel-granitos.png','Gel para Granitos','cuidado-facial',NULL,NULL,0),(18,'Ba??o de Crema con Keratina Vegetal','Crema aroma mango-pitanga a base de queratina vegetal, aceite de s??samo, gel de ch??a, manteca de cacao y karit?? que penetran en profundidad y nutren el cabello dej??ndolo mucho mas suave e hidratado. Ideal para cualquier tipo de pelo, principalmente lo mas da??ados. MODO DE USO: Aplicar de medias a puntas y dejar actuar sobre el pelo seco por aproximadamente 20 minutos. Puede utilizarse hasta tres veces por semana. Contenido neto: 250cc',650.00,'ba??o-crema.png','Ba??o de Crema con Keratina Vegetal','ba??o-sustentable',NULL,NULL,0),(19,'Gel Dental con Carb??n Activado','Geles dentales de textura suave compuesto por ingredientes %100 naturales. Con aceites esenciales antibacteriales, desinflamatorios y antis??pticos. Carb??n activado, menta, eucalipto y lim??n. Tiene un efecto aclarador. Amigables con el esmalte dental, no da??an la estructura de los dientes o la mucosa oral. De uso diario como reemplazo de la pasta o complementario. Frasco oscuro con dosificador: no toma contacto con el exterior, se conserva y rinde mucho m??s. Apto para ni??xs a partir de los 3 a??os de edad.',440.00,'gel-dental.png','Gel Dental con Carb??n Activado','cuidado-bucal',NULL,NULL,0),(20,'Pasta Dental','Pasta de dientes de Menta, Lim??n y Eucalipto. Se encuentra hecha a base de arcilla blanca la cu??l es alcalinizante, ayuda a neutralizar los ??cidos en la boca, cuida el esmalte natural de los dientes, cuida las enc??as ayudando a remineralizarlas y hacerlas m??s resistentes y fuertes.???Esta pasta de dientes es libre de bicarbonato???. Envase de 125cc.',440.00,'pasta-dental.png','Pasta Dental','cuidado-bucal',NULL,NULL,0),(21,'Jab??n Neutro','Jab??n libre de fragancias o aceites esenciales adicionales, especialmente pensado para la limpieza de toallitas ecol??gicas sin crueldad animal. A base de aceite de coco, aceite de oliva y manteca de karit?? libre de grasa animal. Es apto para todo tipo de piel. Peso aproximado: 100gr.',230.00,'jabon-neutro.png','Jab??n Neutro','ba??o-sustentable',NULL,NULL,0),(22,'Esponja de Loofa','Medidas entre 25 a 30 cm, var??a ya que el producto es 100% natural. Puede traer semillas en su interior. Recomendaciones: La podes cortar para darle un tiempo de vida mayor. Dejar secar luego de cada uso. ??La terminas de usar y va directamente al compost!',350.00,'esponja.png','Esponja de Loofa','cocina-sustentable',NULL,NULL,0),(23,'Correctores de ojeras-bases','Cremosos de cobertura media a alta. Como todo, son creados con productos naturales que no tapan tus poros, cuidando tu piel. Se pueden utilizar para disimular ojeras, granitos, manchas o tambi??n como base poniendo varios puntos en la cara y difuminando con los dedos o una esponjita. Tonos: claro, medio y oscuro',650.00,'correctores.png','Correctores de ojeras-bases','maquillaje-natural',NULL,NULL,0),(24,'Body Splash','Los body splash son perfumes aptas para el cuerpo, ambientes o telas. Tienen la particularidad que mientras m??s tiempo pasa, m??s intenso es el aroma. Est??n formulados con alcohol, agua y aromas naturales, les presentamos nuestros dos aromas: VAINILLA Y COCO, JAZM??N, LAVANDA Y PATCHOULI',680.00,'body-splash.png','Body Splash','varios',NULL,NULL,0),(25,'??leo Descongentivo','Mix de aceites esenciales que ayudan a abrir nuestras v??as respiratorias, ideal para los d??as de resfr??o y alergias. Presentaci??n roll on, para una aplicaci??n m??s pr??ctica.',370.00,'oleo-des.png','??leo Descongentivo','aceites-oleos',NULL,NULL,0),(26,'??leo Menstrual','Combinaci??n de aceites esenciales  de s??ndalo, menta, lavanda y ??rnica, cuyas propiedades otorgan alivio muscular. Es ideal para los per??odos menstruales, donde la zona de los ovarios y las lumbares generan grandes molestias. Tambi??n puede utilizarse para cualquier otro d0l0r muscular focalizado, como pueden ser las tensiones de cuello. Presentaci??n roll on, para una aplicaci??n m??s pr??ctica. Contenido neto: 12cc',370.00,'oleo-mens.png','??leo Menstrual','gestion-mentrual',NULL,NULL,0),(27,'??leo Menstrual','Combinaci??n de aceites esenciales  de s??ndalo, menta, lavanda y ??rnica, cuyas propiedades otorgan alivio muscular. Es ideal para los per??odos menstruales, donde la zona de los ovarios y las lumbares generan grandes molestias. Tambi??n puede utilizarse para cualquier otro dolor muscular focalizado, como pueden ser las tensiones de cuello. Presentaci??n roll on, para una aplicaci??n m??s pr??ctica. Contenido neto: 12cc',370.00,'oleo-mens.png','??leo Menstrual','gestion-menstrual',NULL,NULL,0),(28,'Desodorante en Crema','DESODORANTE en CREMA LIM??N y TEA TREE. Desodorante hecho con componentes naturales, libre de parabenos y bicarbonato de sodio. Combaten la proliferaci??n de las bacterias que producen malos olores sin da??ar la piel ni la flora natural de las axilas. Apto para pieles sensibles.',370.00,'desodorante-crema.png','Desodorante en Crema','ba??o-sustentable',NULL,NULL,0),(29,'Shampoo S??lido','Disponible para caballo seco, mixto, graso o para prevenir la ca??da del mismo. Puede sufrir alteraciones si se lo expone a temperaturas elevadas, cambios bruscos de temperatura, ambientes h??medos, sol directo. Utilizar jabonera o recipiente con buen drenaje para evitar la acumulaci??n de agua. Peso aproximado: 95gr.',570.00,'shampoo-solido.png','Shampoo S??lido','ba??o-sustentable',NULL,NULL,0),(30,'Shampoo S??lido para Mascotas','El shampoo s??lido para mascotas est?? formulado espec??ficamente para el ph de la piel de los animales, con aceites naturales que evitan la irritaci??n y previenen las pulgas. Lo pod??s aplicar directamente sobre la piel del animal y masajear con las manos, o crear la espuma en la mano y luego masajear en casos de pieles muy sensibles.',510.00,'shampoo-mascotas.png','Shampoo S??lido para Mascotas','varios',NULL,NULL,0),(31,'Exfoliante Labial de Chocolate','As?? es, chocolate. Posee esencia natural de cacao, que les juro, es irresistible no querer comerlo! La principal funci??n del exfoliante labial es eliminar c??lulas muertas, lo que aporta grandes beneficios, como la reducci??n de imperfecciones y manchas. El resultado de su uso son labios suaves y lisos, m??s que listos para ser hidratados. Su f??rmula posee Vitamina E y Aceite de almendras. Se recomienda su uso entre 10 a 15 d??as.',230.00,'exfoliante-chocolate.png','Exfoliante Labial de Chocolate','cuidado-facial',NULL,NULL,0),(32,'Bruma Facial Agua de Rosas 125cc','Formulada a base de agua de rosas que act??a como un t??nico antioxidante y agua termal que tiene un efecto refrescante y cicatrizante, tambi??n contiene glicerina vegetal la cual mantiene la humectaci??n de la piel. Tiempo de estado ??ptimo conserv??ndolo en buenas condiciones: 6 meses.',570.00,'bruma-facial.png','Bruma Facial Agua de Rosas 125cc','cuidado-facial',NULL,NULL,0),(33,'Acondicionador S??lido','Aplicar suavemente de medias a puntas. Preferiblemente, repetir el proceso sobre las puntas para una mayor hidrataci??n. Dejar actuar y enjuagar. Aromas: Vainilla y Coco / Manzana y Flores Blancas / Gardenia y Oleato de Aloe Vera. Peso aproximado: 85gr.',520.00,'acondicionador.png','Acondicionador S??lido','ba??o-sustentable',NULL,NULL,0),(34,'Rubores','Hechos con cera vegetal y ??xidos de colores. Se aplica con la mano y se difumina f??cilmente. S??per cremoso en dos tonalidades: rosa y melocot??n.',650.00,'rubores.png','Rubores','maquillaje-natural',NULL,NULL,0),(35,'Limpiador Facil - Piel seca o Mixta','Para pieles secas o mixtas: Con arcilla roja, aceite de palta, neroli y lavanda, ayuda a regenerar y nutrir la piel. MODO DE USO: Si se quiere aplicar directamente en la piel utilizar 1 vez por d??a, ya que el contacto de la arcilla directo con la piel tiene cierta exfoliaci??n.',535.00,'limpiador-facial.png','Limpiador Facil - Piel seca o Mixta','cuidado-facial',NULL,NULL,0),(36,'Jab??n L??quido para Manos','Con aroma a jazm??n y geranio, con propiedades purificantes, refrescantes y astringentes. Jab??n l??quido completamente natural en envase retornable de 125cc.',310.00,'jabon-liquido-manos.png','Jab??n L??quido para Manos','ba??o-sustentable',NULL,NULL,0),(37,'Jab??n Eucalipto y Arcilla Verde','Ambos ingredientes generan una linda sensaci??n de frescor y relajaci??n. A base de aceite de coco, aceite de oliva y manteca de karit??, quienes hidratan, regeneran y nutren la piel en profundidad, generando un efecto suavizante. Peso aproximado: 140gr.',310.00,'jabon-euca-arcilla.png','Jab??n Eucalipto y Arcilla Verde','ba??o-sustentable',NULL,NULL,0),(38,'Jab??n Rosa Mosqueta y Arcilla Roja','Con el aroma caracter??stico de la rosa mosqueta, aporta propiedades cicatrizantes y astringentes, especialmente recomendado para pieles delicadas. A base de aceite de coco, aceite de oliva y manteca de karit??, quienes hidratan, regeneran y nutren la piel en profundidad, generando un efecto suavizante.',310.00,'jabon-rosa-roja.png','Jab??n Rosa Mosqueta y Arcilla Roja','ba??o-sustentable',NULL,NULL,0),(39,'Jab??n Exfoliante Carb??n Activado','Jab??n exfoliante para limpiar las c??lulas muertas de la piel corporal, con carb??n activado que elimina bacterias, suciedad y todo tipo de impurezas. Ideal para prevenir y combatir el acn??. MODO DE USO: Utilizar de 2 a 3 d??as por semana. Para una exfoliaci??n facial, te recomendamos la Mascarilla de Carb??n Activado. Peso: 100gr.',320.00,'jabon-carbon.png','Jab??n Exfoliante Carb??n Activado','ba??o-sustentable',NULL,NULL,0),(40,'Hilo Dental Biodegradable','Hilo dental natural hecho de un material biopl??stico de origen vegetal con base de ma??z conocido como PLA, recubierto con cera candelilla (vegana), carb??n activado y aceite de menta. Ecol??gico - Sustentable - Biodegradable - Vegano. Contiene: 30 Metros.',580.00,'hilo-dental.png','Hilo Dental Biodegradable','cuidado-bucal',NULL,NULL,0),(41,'Copa Menstrual Maggacup','La copa MaggaCup es un dispositivo de silicona reutilizable que contiene el sangrado menstrual. ECOAMABLE - SALUDABLE - ECON??MICA - C??MODA - PR??CTICA - SEGURA. Consultar por talle 0, talle 1 y talle 2.',1500.00,'copa-menstrual.png','Copa Menstrual Maggacup','gestion-menstrual',NULL,NULL,0),(42,'Desodorante en Spray Jazmin y Salvia','Tiene propiedades antimicrobiales, antibacteriales, antif??ngicas, antis??pticas, compa??ado del aroma fresco a jazm??n. Hecho con Alumbre, glicerina vegetal y aceites esenciales.',410.00,'desodorante-jazmin.png','Desodorante en Spray Jazmin y Salvia','ba??o-sustentable',NULL,NULL,0),(43,'Desodorante en Spray Limon y Tea Tree','LIM??N: Tiene propiedades desodorante y desinfectante, y aroma refrescante. TEA TREE: Tiene propiedades antibacterianas, antiinflamatorias, antis??pticas, desinfectantes. Hecho con Alumbre, glicerina vegetal y aceites esenciales.',410.00,'desodorante-limon.png','Desodorante en Spray Limon y Tea Tree','ba??o-sustentable',NULL,NULL,0),(44,'Combo N??1 Sorbetes','COMBO N??1 INCLUYE: Sorbete de acero 20CM, Sorbete de bamb?? 18CM, Cepillito limpiador, Bolsita de lienzo',600.00,'combo1sorbetes.png','Combo N??1 Sorbetes','cocina-sustentable',NULL,NULL,0),(45,'Combo N??2 Sorbetes','COMBO N??2 INCLUYE: Sorbete de acero 14.5CM, Sorbete de bamb?? 18CM, Cepillito limpiador, Bolsita de lienzo',500.00,'combo2sorbetes.png','Combo N??2 Sorbetes','cocina-sustentable',NULL,NULL,0),(46,'Bolsa de Lienzo','Bolsa de lienzo de algod??n, fabricada artesanalmente. Ideal para preparar leches vegetales caseras, y hacer compras a granel. Tama??o: 20*30cm.',280.00,'bolsa-lienzo.png','Bolsa de Lienzo','varios',NULL,NULL,0),(47,'Serum ??cido Hialur??nico','Un serum es un tratamiento que se caracteriza por tener una alta concentraci??n de un activo principal y una textura l??quida que favorece una r??pida y m??s profunda absorci??n. En este serum el ??cido hialur??nico es el activo principal, contiene tanto el de alto como el de bajo peso molecular, esto significa que penetra en las capas m??s superficiales pero tambi??n m??s profundas de la piel, hidratando en profundidad y facilitando la regeneraci??n celular. Apto para todo tipo de pieles. Modo de uso: Poner no m??s de dos veces al d??a 1 o 2 gotitas y aplicar masajeando ascendentemente. No apoyar la pipeta sobre la piel. Contenido neto: 30 ml',915.00,'serum.jpg','Serum ??cido Hialur??nico','cuidado-facial',NULL,NULL,0),(48,'Repelente Natural en Spray','Repelente formulado con un blend de aceites esenciales: Citronella, lavanda y eucalipto que act??an como barrera y asegura una protecci??n ideal para el disfrute al aire libre. No apto para menores de 3 a??os. Presentaci??n: 125 cc.',380.00,'repelente-natural.png','Repelente Natural en Spray','varios',NULL,NULL,0),(49,'Saco para Jab??n','Disponible en color ladrillo o blanco. Ideal para rellenar los restos de jab??n y utilizar como esponja suave. Realizado 100% a mano. Medida: 11*8 cm.',350.00,'saco-jabon.png','Saco para Jab??n','varios',NULL,NULL,0),(50,'Repasador %100 Algod??n','Repasador de algod??n blanco, con dos l??neas roja y azul. Medidas: 50*51 cm.',340.00,'repasador.png','Repasador %100 Algod??n','cocina-sustentable',NULL,NULL,0),(51,'Cepillo para Limpieza de Sorbetes','Cepillos finas cerdas s??per angostos para limpiar sorbetes de acero y de bamb??',180.00,'cepillo-limpieza.png','Cepillo para Limpieza de Sorbetes','cocina-sustentable',NULL,NULL,0),(52,'Sorbete Acero Inoxidable 14.5CM','Sorbete de acero inoxidable 14.5CM',190.00,'sorbete-acero.png','Sorbete Acero Inoxidable 14.5CM','cocina-sustentable',NULL,NULL,0),(53,'Sorbete Bamb??','Sorbete de bamb?? 18CM.',210.00,'sorbete-bambu.png','Sorbete Bamb??','cocina-sustentable',NULL,NULL,0),(54,'Sorbete Acero Inoxidable 21CM','Sorbete Acero Inoxidable 21CM',210.00,'sorbete-acero2.png','Sorbete Acero Inoxidable 21CM','cocina-sustentable',NULL,NULL,0),(55,'Esponja de Yute Simple','Ideal para espacios reducidos y utensilios de cocina. Hecho 100% a mano. Medida: 12*9 cm',360.00,'esponja-yute.png','Esponja de Yute Simple','cocina-sustentable',NULL,NULL,0),(56,'Serum Niacinamida','Un serum es un tratamiento que se caracteriza por tener una alta concentraci??n de un activo principal y una textura l??quida que favorece una r??pida y m??s profunda absorci??n. En este serum la Niacinamida o vitamina B3 es el activo principal, tiene un efecto reparador ya que es un gran antiinflamatorio y aliado de las pieles m??s sensibles, refuerza la barrera protectora de la piel y reduce la producci??n de sebo siendo ideal para pieles mixtas/grasas tambi??n y adem??s promueve la producci??n de col??geno. Modo de uso: Poner no m??s de dos veces al d??a 1 o 2 gotitas y aplicar masajeando ascendentemente. No apoyar la pipeta sobre la piel. Contenido neto: 30 ml',785.00,'serum.jpg','Serum Niacinamida','cuidado-facial',NULL,NULL,0),(57,'Serum ??cido Glic??lico','Un serum es un tratamiento que se caracteriza por tener una alta concentraci??n de un activo principal y una textura l??quida que favorece una r??pida y m??s profunda absorci??n. En este serum el ??cido glic??lico es el activo principal, es un exfoliante qu??mico que acompa??ado de acido m??lico y c??trico, act??a como tratamiento para manchas de acn??, sol, puntos negros entre otras cosas, ayuda a que la piel quede suave sin da??arla. Destruye aquello que adhiere la piel muerta en la superficie, y el resultado es un acabado mucho m??s uniforme y un tono homog??neo. Modo de uso: Aplicar con la piel limpia m??ximo 3 veces por semana 1 o 2 gotas durante la noche lejos de otra exfoliaci??n, retirar al otro d??a con agua y aplicar crema. Contenido neto: 30 ml.',785.00,'serum.jpg','Serum ??cido Glic??lico','cuidado-facial',NULL,NULL,0),(58,'Aceite de Tea Tree','Aceite de Tea Tree, presentaci??n de 15cc.',550.00,'aceite-teatree.png','Aceite de Tea Tree','aceites-oleos',NULL,NULL,0),(59,'Limpiador Efervesente Multiuso','Apto para limpiar las siguientes superficies: Metales, Vidrios, Cer??micos, Porcelana, Pl??sticos. De origen vegetal, Producto Cruelty Free, 100% biodegradable. Con envase compostable. Con aceites esenciales de pino y lim??n que aportan aromas riqu??simos. ?? Rinde 20 baldes ! Recomendaci??n: Una vez abierto, guardar en envase herm??tico para que no se pierda el aroma.',380.00,'limpiador-efervesente.png','Limpiador Efervesente Multiuso','cocina-sustentable',NULL,NULL,0),(60,'Aceite Esencial','Los aceites esenciales son el alma de las plantas, los principios activos que act??an a trav??s del olfato, el tacto o el gusto. Cada aceite tiene su car??cter, su propia personalidad y transmite la vitalidad, la energ??a y la vibraci??n de la planta de la que se extraen. Disponibles en: LIM??N - MENTA - ROMERO.',480.00,'aceites-esenciales.png','Aceite Esencial','aceites-oleos',NULL,NULL,0),(61,'Protector Diario','Mide 15 cm doble capa de tela algodo??n. Es para uso cotidiano, di??as sin sangrado. RECOMENDACIONES DE LAVADO: -Pon?? tu toallita en remojo antes que la sangre llegue a secarse. -Luego de algunas horas, lleg?? el momento de lavarla a mano o en lavarropas, usando agua fr??a y jab??n neutro. - Colgala para que se seque antes de volver a usarla. Si es al sol, mucho mejor! - Para blanquearla pod??s lavarla con bicarbonato de sodio o vinagre. - El agua con tu sangre es muy nutritiva para las plantas, pod??s volcarla en ellas.',220.00,'protector-diario.png','Protector Diario','gestion-menstrual',NULL,NULL,0),(62,'Toallita S Tanga','Mide 15 cm. Una capa de tela absorbente y otra capa de tela impermeable. Forma tanga. Para un sangrado leve, ideal para acompan??ar tu copita. Absorci??n de 3 a 4 ml. RECOMENDACIONES DE LAVADO: -Pon?? tu toallita en remojo antes que la sangre llegue a secarse. -Luego de algunas horas, lleg?? el momento de lavarla a mano o en lavarropas, usando agua fr??a y jab??n neutro. - Colgala para que se seque antes de volver a usarla. Si es al sol, mucho mejor! - Para blanquearla pod??s lavarla con bicarbonato de sodio o vinagre. - El agua con tu sangre es muy nutritiva para las plantas, pod??s volcarla en ellas.',350.00,'toallita-s-tanga.png','Toallita S Tanga','gestion-menstrual',NULL,NULL,0),(63,'Toallita S','Mide 15 cm. Una capa de tela absorbente y otra capa de tela impermeable. Para un sangrado leve, ideal para acompan??ar tu copita. Absorci??n de 3 a 4 ml. RECOMENDACIONES DE LAVADO: -Pon?? tu toallita en remojo antes que la sangre llegue a secarse. -Luego de algunas horas, lleg?? el momento de lavarla a mano o en lavarropas, usando agua fr??a y jab??n neutro. - Colgala para que se seque antes de volver a usarla. Si es al sol, mucho mejor! - Para blanquearla pod??s lavarla con bicarbonato de sodio o vinagre. - El agua con tu sangre es muy nutritiva para las plantas, pod??s volcarla en ellas.',350.00,'toallita-s.png','Toallita S','gestion-menstrual',NULL,NULL,0),(64,'Toallita M','Mide 19 cm. Una capa de tela absorbente, un capa de tela aislante y tela aislante reforzada. Para sangrado de leve a moderado. Absorci??n 8 a 10 ml. RECOMENDACIONES DE LAVADO: -Pon?? tu toallita en remojo antes que la sangre llegue a secarse. - Luego de algunas horas, lleg?? el momento de lavarla a mano o en lavarropas, usando agua fr??a y jab??n neutro. - Colgala para que se seque antes de volver a usarla. Si es al sol, mucho mejor! - Para blanquearla pod??s lavarla con bicarbonato de sodio o vinagre. - El agua con tu sangre es muy nutritiva para las plantas, pod??s volcarla en ellas.',435.00,'toallita-m.png','Toallita M','gestion-menstrual',NULL,NULL,0),(65,'Toallita M Tanga','Mide 19 cm. Una capa de tela absorbente, un capa de tela aislante y tela aislante reforzada. Para sangrado de leve a moderado. Absorci??n 8 a 10 ml. RECOMENDACIONES DE LAVADO: -Pon?? tu toallita en remojo antes que la sangre llegue a secarse. - Luego de algunas horas, lleg?? el momento de lavarla a mano o en lavarropas, usando agua fr??a y jab??n neutro. - Colgala para que se seque antes de volver a usarla. Si es al sol, mucho mejor! - Para blanquearla pod??s lavarla con bicarbonato de sodio o vinagre. - El agua con tu sangre es muy nutritiva para las plantas, pod??s volcarla en ellas.',435.00,'toallita-m-tanga.png','Toallita M Tanga','gestion-menstrual',NULL,NULL,0),(66,'Toallita L','Mide 21,5 cm. Doble capa de toalla para absorcio??n, m??s tela aislante e impermeable reforzada. Ideal para los primeros di??as de la menstruacio??n, resistentes. Para un sangrado de moderado a abundante. Absorci??n de 14 ml. RECOMENDACIONES DE LAVADO: -Pon?? tu toallita en remojo antes que la sangre llegue a secarse. - Luego de algunas horas, lleg?? el momento de lavarla a mano o en lavarropas, usando agua fr??a y jab??n neutro. - Colgala para que se seque antes de volver a usarla. Si es al sol, mucho mejor! - Para blanquearla pod??s lavarla con bicarbonato de sodio o vinagre. - El agua con tu sangre es muy nutritiva para las plantas, pod??s volcarla en ellas.',520.00,'toallita-l.png','Toallita L','gestion-menstrual',NULL,NULL,0),(67,'Toallita XL','Mide 24 cm. Tres capas de toalla para absorcio??n, m??s tela aislante e impermeable reforzada. Tipo nocturna. Tiene ma??s capacidad de absorcio??n y contencio??n. Para un sangrado abundante. Absorci??n de 18 ml.RECOMENDACIONES DE LAVADO: -Pon?? tu toallita en remojo antes que la sangre llegue a secarse. - Luego de algunas horas, lleg?? el momento de lavarla a mano o en lavarropas, usando agua fr??a y jab??n neutro. - Colgala para que se seque antes de volver a usarla. Si es al sol, mucho mejor! - Para blanquearla pod??s lavarla con bicarbonato de sodio o vinagre. - El agua con tu sangre es muy nutritiva para las plantas, pod??s volcarla en ellas.',580.00,'toallita-xl.png','Toallita XL','gestion-menstrual',NULL,NULL,0),(68,'Rasuradora Met??lica','Incluye: Rasuradora met??lica reutilizable - Estuche para guardado con espejo - Cepillito - 1 hoja Gillete - Buen filo e inoxidable.',730.00,'rasuradora-metalica.png','Rasuradora Met??lica','varios',NULL,NULL,0),(69,'5 Hojas de Afeitar - Repuesto','Hojas de afeitar inoxidables. Cada hoja tiene un uso aproximado de 2 a 3 meses.',350.00,'repuestos-gillette.png','5 Hojas de Afeitar - Repuesto','varios',NULL,NULL,0),(70,'Delineador en Gel','Est??n hechos a base de manteca de karite y cera vegetal. ??C??MO SE USAN? Simplemente se aplican con una brocha o pincel de punta peque??a. ??????Tip: para lograr una mayor duraci??n sellar con sombra arriba. Adem??s , se pueden utilizar tambi??n como sombras de ojos cremosas. ??Vienen en diferentes colores! Tenemos en stock en color negro, pero si te interesa podes encargar tambi??n en violeta, azul y marr??n.',290.00,'delineador-gel.png','Delineador en Gel','maquillaje-natural',NULL,NULL,0);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `rol_id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador'),(2,'Usuario');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `usuario_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `rol_fk` int(11) NOT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'mari@gmail.com','$2y$10$wTUlS/tQgxtCRX/qVi95POS84HYGixZEGTeyYq7Ri75VH54cEII2S','Marianela','Fernandes',1),(9,'pedro@gmail.com','$2y$10$idY/MfIa3UfKOJ3Wfkok7OjRW0G7wABTZ.OZ8l6dshnItWl5p3Bn2','Pedro','Lopez',2),(10,'lucia@gmail.com','$2y$10$q2S5k7YpR7myAVVqKnJCGeueEHz/HzmX0qsd3dRHLBlRMbWBLsZBC','Lucia','Gonzalez',2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-02 15:56:00
