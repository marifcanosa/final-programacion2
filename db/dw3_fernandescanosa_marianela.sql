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
INSERT INTO `compras` VALUES (13,'Bálsamo Labial de Frambuesa','pedro',260,'pedro@gmail.com',0),(14,'Crema Facial Antiage','pedro',1030,'pedro@gmail.com',0),(15,'Exfoliante Facial, Crema Corporal Fluida, Detergente Sólido 115 Gr.','Pedro',1865,'pedro@gmail.com',0);
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
INSERT INTO `posteos` VALUES (1,'¿Qué no vas a encontrar en nuestros Bálsamos Naturales?','Siliconas: con este ingrediente consiguen texturas muy suaves pero proporcionan una falsa hidratación. En el INCI (Nomenclatura Internacional de Ingredientes de Cosméticos) pueden aparecer como: Dimethicone, Cyclomethicone, Vinil Dimethicone Crosspolymer, Cyclotetra, penta o hexa – xiloxane.\nParafinas o aceites minerales: Son derivados del petróleo y producen un efecto de falsa hidratación. Además se ha descubierto que se acumulan en el hígado y los ganglios linfáticos.\nCeras minerales: Este ingrediente como el ozokerite, se utiliza para dar consistencia y también procede de la industria petroquímica.\nPlomo: Se trata de un metal pesado que se ha encontrado en muchas marcas conocidas de cosméticos. Es un ingrediente peligroso para la salud, porque es neurotóxico (Puedes conocer más sobre ello en el artículo: Al rico pintalabios)\nConservantes sintéticos: como parabenes,  phenoxiethanol y  methylchloroisothiazolinone  (Kathon).\nPerfumes sintéticos: Estos ingredientes son mucho más alergénicos que los naturales.\nFiltros solares químicos: muchos de estos actúan como disruptores endocrinos, fotosensibilizantes, etc…\nLos labiales naturales sustituyen éstos ingredientes por alternativas naturales. Al utilizar ingredientes naturales o vegetales, estos aportan beneficios a tus labios. Estos son algunos de los ingredientes y sus beneficios.','slide1.jpg','Bálsamos Naturales'),(2,'Beneficios del Aceite de Coco','El aceite de coco es uno de esos productos que es beneficioso para tantas cosas, que uno no sabe por donde arrancar! Cuando me preguntan, yo siempre recomiendo su aplicación en el pelo y la piel corporal (¡No facial!) ⁣\n⁣\nEl aceite de coco natural se solidifica por debajo de los 24 grados. Para retirarlo del envase les recomendamos ponerlo unos segundos debajo de agua caliente o baño maría. Debido a su gran riqueza nutricional, el aceite de coco ha sido muy utilizado en la industria de la fabricación de cosméticos como jabones, cremas hidratantes y otros cosméticos destinados a embellecer la piel. De hecho, el aceite de coco es más eficaz que las cremas hidratantes gracias a su efecto de hidratación profunda y duradera. Además, ayuda a reforzar las capas internas de la piel y a promover la eliminación de las células muertas, tornándola más suave y tersa.','slide2.jpg','Aceite de Coco'),(3,'Jabon Natural VS Industrial','La cosmética industrial utiliza miles de ingredientes, de los cuales muchos no han sido investigados en sus efectos a largo plazo, la mayoría de fabricantes se escudan en el argumento de que son dosis muy bajas, pero no se considera su uso continúo y su combinación con otros productos con el mismo componente, los jabones artesanales por su lado, están fabricados en distintas bases, las más comunes, son glicerina vegetal, miel, extractos de plantas y aceites esenciales.Los productos industriales tienen muchas veces productos derivados del petróleo, que taponan los poros de la piel, generando una falsa sensación de humectación, que a la larga genera todo lo contrario: resequedad, con los jabones artesanales, obtienes un beneficio natural, si utilizas el correcto para tu tipo de piel.Los jabones artesanales, son en su mayoría elaborados por pequeñas iniciativas familiares o comunitarias, cuando elijes este tipo de jabón apoyas la economía local, aunque a veces el precio sea más alto, esto se debe principalmente a la calidad de los insumos, (los jabones artesanales tienen insumos orgánicos y naturales) lo detallado del proceso de elaboración (un jabón artesanal puede tardar hasta 4 semanas en se elaborado) y la pequeña escala en la que son fabricados.','slide4.jpg','Jabones Naturales'),(4,'Desodorantes Naturales','Hechos con alumbre, glicerina vegetal y aceites esenciales. La piedra de alumbre es conocida por tener propiedades astringentes, antisépticas y desodorantes. \nActúa sobre las bacterias que generan el mal olor y es amigo de las pieles sensibles \n\nEs desodorante, no antitranspirante. \nTranspirar es una necesidad fisiológica esencial para que nuestro organismo pueda eliminar toxinas y mantener buenos niveles de hidratación, temperatura corporal y PH. Para que los desodorantes industriales sean \"antitranspirantes\" se utilizan muchos componentes que son dañinos. Cuando el cuerpo suda, en ciertos lugares del cuerpo como las axilas o los pies, fermenta junto con las bacterias causando mal olor. \nLos desodorantes en la cosmética natural buscan disminuir la proliferación de esas bacterias sin dañarla.','slide3.jpg','Desodorantes Naturales'),(5,'Ventajas del shampoo y acondicionador sólido','Reduce la huella de carbono, es vegano, dura más que el shampoo tradicional y es muy cómodo para llevar de viaje. La clave está, por un lado, en su durabilidad: la cosmética sólida dura más y ocupa menos volumen. Requiere menos agua en su elaboración. Por lo que no es necesario añadirle parabenos, emulsionantes, siliconas ni sulfatos, que en cambio sí contienen muchos productos de cosmética convencional y que pueden irritar o dañar la piel.Es más fácil de envasar sin usar plásticos. Usualmente, vienen con envoltorios biodegradables que tienen un impacto ambiental nulo.El pelo dura limpio mucho más tiempo gracias a la ausencia de sulfatos y parabenos, que sos químicos que barren con la barrera protectora del cuero cabelludo. En su elaboración, se usan ingredientes naturales y cruelty free. ¿Qúe estas esperando para probarlos?','slide6.jpg','Ventajas del Shampoo y Acondicionador sólido.'),(6,'Menstruación Ecólogica','¿Alguna vez has encontrado basura menstrual en la naturaleza y has pensado “que asco”? Yo sí, muchas veces. Después cuando descubrí la copa menstrual y las compresas de tela pensé “¿y por qué seguimos usando estos productos que tanto rechazo nos generan?” Una de las formas más sencillas de vivir tu menstruación de forma sostenible es pasarte a la copa menstrual. Compuesta 100% de silicona médica, un material natural no contaminante, y reutilizable hasta 10 años, se trata de la alternativa más ecológica. Por otro lado, el uso de la copa menstrual va más allá… Y es que no solo es buena para el medioambiente, sino también para nuestra salud. ¿Por qué? La mayoría de tampones convencionales (de los que venden en el super) contienen algodón no ecológico y pesticidas, plástico, cloro… Pero, ¿y si no me siento cómoda usando la copa menstrual? ¿es esta la única solución?”\n                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     \n                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Para nada, existen muchas maneras de vivir tu menstruación en positivo. La copa es la más extendida por su versatilidad, sin embargo las compresas de tela o las bragas menstruales son también opciones sostenibles y saludables.','slide5.jpg','Menstruación Ecológica');
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
INSERT INTO `productos` VALUES (1,'Jabonera de Madera','Tratadas con aceites vegetales que nutren, protege y otorga brillo a la madera sin afectar a nuestro medioambiente. Tamaño: 13x7 cm aproximadamente.',800.00,'20220616101740_jabonera.png','Jabonera de Madera','cocina-sustentable',NULL,NULL,0),(2,'Crema Facial Antiage','Crema facial para acompañar el paso de la edad. Ayuda a nutrir, hidratar y darle vida a u piel. Formulada a base de potentes antioxidantes como el aceite de rosa mosqueta que regenera, manteca de mango que regenera las células y mejora la elasticidad, vitamina c para la reparación de tejidos y acido hialurónico capaz de retener grandes cantidades de agua en la piel y aportar volumen. Contenido neto: 50cc',1030.00,'crema-antiage.png','Crema Facial Antiage','cuidado-facial',NULL,NULL,0),(3,'Leche de Limpieza','Emulsión formulada con extracto de aloe vera que ayuda a limpiar la piel desde sus capas más profundas, lo que favorece la desobstrucción de poros y la eliminación de la suciedad y alantoina un activo que deja la piel suave y humectada. Presentación: 125 cc.',510.00,'leche-de-limpieza.png','Leche de Limpieza','cuidado-facial',NULL,NULL,0),(4,'Exfoliante Facial','Exfoliante facial formulado a base de aceite de almendras para hidratar, contiene cascara de nuez, unas pequeñas partículas que exfolian eliminando la piel muerta y dejándola suave. Presentación: 100cc.',480.00,'exfoliante-facial.png','Exfoliante Facial','cuidado-facial',NULL,NULL,0),(5,'Bálsamo Labial de Frambuesa','Con manteca de karite, repara los labios secos. Efecto hidratante, reparador. Aplicar en los labios y dejar actuar.',260.00,'balsamo-frambuesa.png','Bálsamo Labial de Frambuesa','maquillaje-natural',NULL,NULL,0),(6,'Aceite de Coco Neutro','El aceite de coco es uno de esos productos que es beneficioso para tantas cosas, que uno no sabe por donde arrancar! Cuando me preguntan, yo siempre recomiendo su aplicación en el pelo y la piel corporal (¡No facial!). Presentación: Botella de vidrio color ámbar, para una mejor conservación, de 250cc. Reutilizable!',540.00,'aceite-coco.png','Aceite de Coco Neutro','aceites-oleos',NULL,NULL,0),(7,'Crema Corporal Fluida','Crema corporal aroma rosa mosqueta y bergamota. Formulación fluida y liviana, hidrata y nutre la piel en profundidad. Presentación de 250gr.',1015.00,'crema-corporal-fluida.png','Crema Corporal Fluida','baño-sustentable',NULL,NULL,0),(8,'Agua Micelar','Producto de limpieza facial diaria formulada a base de de glicerina vegetal que actúa como el agente hidratante, y coco glucosido que tiene la función de limpiar las impurezas que se encuentren en la superficie de la piel.',510.00,'agua-micelar.png','Agua Micelar','cuidado-facial',NULL,NULL,0),(9,'Shampoo Matizador','Shampoo que contiene violeta de genciana, un pigmento intenso que logra contrarrestar las tonalidades naranjas/amarillentas, es el shampoo ideal para mantener cabellos teñidos de tonalidades frías o para tonalizar canas y al mismo tiempo reparar daños o hidratar con el aceite de coco.',570.00,'shampoo-matizador.png','Shampoo Matizador','baño-sustentable',NULL,NULL,0),(10,'Crema para Manos','Nuestra crema es una emulsión concentrada regeneradora hecha a base de aceite de coco y manteca de karité , aceites esenciales de lavanda (regeneradora de células e hidratante) y sándalo (calmante y antiséptico)⁣ para que puedas cuidarlas de forma natural y tenerlas siempre hidratadas. Contenido neto: 50cc.',390.00,'crema-manos.png','Crema para Manos','baño-sustentable',NULL,NULL,0),(11,'Labiales','Labiales con acabado tipo matte creados a base de cera vegetal y oxidos naturales, super suaves en los labios, colores intensos.',650.00,'labiales.png','Labiales','maquillaje-natural',NULL,NULL,0),(12,'Jabón Vainilla y Neroli','VAINILLA y NEROLI: Con el dulzor de la vainilla y de la flor de Azahar, este jabón añade cualidades antibacterianas y regeneradoras para nuestra piel. A base de aceite de coco, aceite de oliva y manteca de karité, quienes hidratan, regeneran y nutren la piel en profundidad, generando un efecto suavizante.',280.00,'jabon-vainilla-neroli.png','Jabón Vainilla y Neroli','baño-sustentable',NULL,NULL,0),(13,'Detergente Sólido 115 Gr.','DETERGENTE SÓLIDO PARA VAJILLA - 100% BIODEGRADABLE - 115 GR. No tiene envase plástico. Los ingredientes son biodegradables y de fuentes renovables. Más brillo y menos grasa en tu cocina.Económico y rendidor. Te deja las manos más suaves. Origen vegetal - Libre de crueldad animal. Muy fácil de usar. Con aceites esenciales que otorgan un riquísimo aroma a limón y menta.',370.00,'detergente-solido.png','Detergente Sólido 115 Gr.','cocina-sustentable',NULL,NULL,0),(14,'Cepillo de Dientes Bambú','Al estar hechos de bambú son más que amigables con el medioambiente: 97% biodegradables y 3% reciclables. Tardan 180 días en descomponerse y formar parte del suelo.⁣Elegí entre cerdas SUAVES y MEDIAS para adultos o cerda SUAVES KIDS.',215.00,'cepillo-bambu.png','Cepillo de Dientes Bambú','cuidado-bucal',NULL,NULL,0),(15,'Enjuague Bucal','Enjuague bucal natural con mentol, eucalipto, limón y agua oxigenada 10%. PRODUCTO CONCENTRADO PARA DILUIR EN AGUA POTABLE. RINDE MÁS DE 50 LAVADOS.',510.00,'enjuague-bucal.png','Enjuague Bucal','cuidado-bucal',NULL,NULL,0),(16,'Crema Facial Regeneradora','Crema facial de aceites esenciales de lavanda e incienso, de rápida absorción, y apropiada para todo tipo de pieles. Se aplica en pequeñas cantidades, es muy rendidora ! Posee propiedades antisépticas, con efectos equilibrantes, cicatrizantes, tonificantes y calmantes al mismo tiempo. Presentación: 50cc.',510.00,'crema-regeneradora.png','Crema Facial Regeneradora','cuidado-facial',NULL,NULL,0),(17,'Gel para Granitos','Gel de teatree concentrado para tratar granitos puntuales. Su concentración permite secarlos aplicando directa y únicamente en la zona que se quiere tratar. Contenido neto: 30g',320.00,'gel-granitos.png','Gel para Granitos','cuidado-facial',NULL,NULL,0),(18,'Baño de Crema con Keratina Vegetal','Crema aroma mango-pitanga a base de queratina vegetal, aceite de sésamo, gel de chía, manteca de cacao y karité que penetran en profundidad y nutren el cabello dejándolo mucho mas suave e hidratado. Ideal para cualquier tipo de pelo, principalmente lo mas dañados. MODO DE USO: Aplicar de medias a puntas y dejar actuar sobre el pelo seco por aproximadamente 20 minutos. Puede utilizarse hasta tres veces por semana. Contenido neto: 250cc',650.00,'baño-crema.png','Baño de Crema con Keratina Vegetal','baño-sustentable',NULL,NULL,0),(19,'Gel Dental con Carbón Activado','Geles dentales de textura suave compuesto por ingredientes %100 naturales. Con aceites esenciales antibacteriales, desinflamatorios y antisépticos. Carbón activado, menta, eucalipto y limón. Tiene un efecto aclarador. Amigables con el esmalte dental, no dañan la estructura de los dientes o la mucosa oral. De uso diario como reemplazo de la pasta o complementario. Frasco oscuro con dosificador: no toma contacto con el exterior, se conserva y rinde mucho más. Apto para niñxs a partir de los 3 años de edad.',440.00,'gel-dental.png','Gel Dental con Carbón Activado','cuidado-bucal',NULL,NULL,0),(20,'Pasta Dental','Pasta de dientes de Menta, Limón y Eucalipto. Se encuentra hecha a base de arcilla blanca la cuál es alcalinizante, ayuda a neutralizar los ácidos en la boca, cuida el esmalte natural de los dientes, cuida las encías ayudando a remineralizarlas y hacerlas más resistentes y fuertes.⁣Esta pasta de dientes es libre de bicarbonato⁣. Envase de 125cc.',440.00,'pasta-dental.png','Pasta Dental','cuidado-bucal',NULL,NULL,0),(21,'Jabón Neutro','Jabón libre de fragancias o aceites esenciales adicionales, especialmente pensado para la limpieza de toallitas ecológicas sin crueldad animal. A base de aceite de coco, aceite de oliva y manteca de karité libre de grasa animal. Es apto para todo tipo de piel. Peso aproximado: 100gr.',230.00,'jabon-neutro.png','Jabón Neutro','baño-sustentable',NULL,NULL,0),(22,'Esponja de Loofa','Medidas entre 25 a 30 cm, varía ya que el producto es 100% natural. Puede traer semillas en su interior. Recomendaciones: La podes cortar para darle un tiempo de vida mayor. Dejar secar luego de cada uso. ¡La terminas de usar y va directamente al compost!',350.00,'esponja.png','Esponja de Loofa','cocina-sustentable',NULL,NULL,0),(23,'Correctores de ojeras-bases','Cremosos de cobertura media a alta. Como todo, son creados con productos naturales que no tapan tus poros, cuidando tu piel. Se pueden utilizar para disimular ojeras, granitos, manchas o también como base poniendo varios puntos en la cara y difuminando con los dedos o una esponjita. Tonos: claro, medio y oscuro',650.00,'correctores.png','Correctores de ojeras-bases','maquillaje-natural',NULL,NULL,0),(24,'Body Splash','Los body splash son perfumes aptas para el cuerpo, ambientes o telas. Tienen la particularidad que mientras más tiempo pasa, más intenso es el aroma. Están formulados con alcohol, agua y aromas naturales, les presentamos nuestros dos aromas: VAINILLA Y COCO, JAZMÍN, LAVANDA Y PATCHOULI',680.00,'body-splash.png','Body Splash','varios',NULL,NULL,0),(25,'Óleo Descongentivo','Mix de aceites esenciales que ayudan a abrir nuestras vías respiratorias, ideal para los días de resfrío y alergias. Presentación roll on, para una aplicación más práctica.',370.00,'oleo-des.png','Óleo Descongentivo','aceites-oleos',NULL,NULL,0),(26,'Óleo Menstrual','Combinación de aceites esenciales  de sándalo, menta, lavanda y árnica, cuyas propiedades otorgan alivio muscular. Es ideal para los períodos menstruales, donde la zona de los ovarios y las lumbares generan grandes molestias. También puede utilizarse para cualquier otro d0l0r muscular focalizado, como pueden ser las tensiones de cuello. Presentación roll on, para una aplicación más práctica. Contenido neto: 12cc',370.00,'oleo-mens.png','Óleo Menstrual','gestion-mentrual',NULL,NULL,0),(27,'Óleo Menstrual','Combinación de aceites esenciales  de sándalo, menta, lavanda y árnica, cuyas propiedades otorgan alivio muscular. Es ideal para los períodos menstruales, donde la zona de los ovarios y las lumbares generan grandes molestias. También puede utilizarse para cualquier otro dolor muscular focalizado, como pueden ser las tensiones de cuello. Presentación roll on, para una aplicación más práctica. Contenido neto: 12cc',370.00,'oleo-mens.png','Óleo Menstrual','gestion-menstrual',NULL,NULL,0),(28,'Desodorante en Crema','DESODORANTE en CREMA LIMÓN y TEA TREE. Desodorante hecho con componentes naturales, libre de parabenos y bicarbonato de sodio. Combaten la proliferación de las bacterias que producen malos olores sin dañar la piel ni la flora natural de las axilas. Apto para pieles sensibles.',370.00,'desodorante-crema.png','Desodorante en Crema','baño-sustentable',NULL,NULL,0),(29,'Shampoo Sólido','Disponible para caballo seco, mixto, graso o para prevenir la caída del mismo. Puede sufrir alteraciones si se lo expone a temperaturas elevadas, cambios bruscos de temperatura, ambientes húmedos, sol directo. Utilizar jabonera o recipiente con buen drenaje para evitar la acumulación de agua. Peso aproximado: 95gr.',570.00,'shampoo-solido.png','Shampoo Sólido','baño-sustentable',NULL,NULL,0),(30,'Shampoo Sólido para Mascotas','El shampoo sólido para mascotas está formulado específicamente para el ph de la piel de los animales, con aceites naturales que evitan la irritación y previenen las pulgas. Lo podés aplicar directamente sobre la piel del animal y masajear con las manos, o crear la espuma en la mano y luego masajear en casos de pieles muy sensibles.',510.00,'shampoo-mascotas.png','Shampoo Sólido para Mascotas','varios',NULL,NULL,0),(31,'Exfoliante Labial de Chocolate','Así es, chocolate. Posee esencia natural de cacao, que les juro, es irresistible no querer comerlo! La principal función del exfoliante labial es eliminar células muertas, lo que aporta grandes beneficios, como la reducción de imperfecciones y manchas. El resultado de su uso son labios suaves y lisos, más que listos para ser hidratados. Su fórmula posee Vitamina E y Aceite de almendras. Se recomienda su uso entre 10 a 15 días.',230.00,'exfoliante-chocolate.png','Exfoliante Labial de Chocolate','cuidado-facial',NULL,NULL,0),(32,'Bruma Facial Agua de Rosas 125cc','Formulada a base de agua de rosas que actúa como un tónico antioxidante y agua termal que tiene un efecto refrescante y cicatrizante, también contiene glicerina vegetal la cual mantiene la humectación de la piel. Tiempo de estado óptimo conservándolo en buenas condiciones: 6 meses.',570.00,'bruma-facial.png','Bruma Facial Agua de Rosas 125cc','cuidado-facial',NULL,NULL,0),(33,'Acondicionador Sólido','Aplicar suavemente de medias a puntas. Preferiblemente, repetir el proceso sobre las puntas para una mayor hidratación. Dejar actuar y enjuagar. Aromas: Vainilla y Coco / Manzana y Flores Blancas / Gardenia y Oleato de Aloe Vera. Peso aproximado: 85gr.',520.00,'acondicionador.png','Acondicionador Sólido','baño-sustentable',NULL,NULL,0),(34,'Rubores','Hechos con cera vegetal y óxidos de colores. Se aplica con la mano y se difumina fácilmente. Súper cremoso en dos tonalidades: rosa y melocotón.',650.00,'rubores.png','Rubores','maquillaje-natural',NULL,NULL,0),(35,'Limpiador Facil - Piel seca o Mixta','Para pieles secas o mixtas: Con arcilla roja, aceite de palta, neroli y lavanda, ayuda a regenerar y nutrir la piel. MODO DE USO: Si se quiere aplicar directamente en la piel utilizar 1 vez por día, ya que el contacto de la arcilla directo con la piel tiene cierta exfoliación.',535.00,'limpiador-facial.png','Limpiador Facil - Piel seca o Mixta','cuidado-facial',NULL,NULL,0),(36,'Jabón Líquido para Manos','Con aroma a jazmín y geranio, con propiedades purificantes, refrescantes y astringentes. Jabón líquido completamente natural en envase retornable de 125cc.',310.00,'jabon-liquido-manos.png','Jabón Líquido para Manos','baño-sustentable',NULL,NULL,0),(37,'Jabón Eucalipto y Arcilla Verde','Ambos ingredientes generan una linda sensación de frescor y relajación. A base de aceite de coco, aceite de oliva y manteca de karité, quienes hidratan, regeneran y nutren la piel en profundidad, generando un efecto suavizante. Peso aproximado: 140gr.',310.00,'jabon-euca-arcilla.png','Jabón Eucalipto y Arcilla Verde','baño-sustentable',NULL,NULL,0),(38,'Jabón Rosa Mosqueta y Arcilla Roja','Con el aroma característico de la rosa mosqueta, aporta propiedades cicatrizantes y astringentes, especialmente recomendado para pieles delicadas. A base de aceite de coco, aceite de oliva y manteca de karité, quienes hidratan, regeneran y nutren la piel en profundidad, generando un efecto suavizante.',310.00,'jabon-rosa-roja.png','Jabón Rosa Mosqueta y Arcilla Roja','baño-sustentable',NULL,NULL,0),(39,'Jabón Exfoliante Carbón Activado','Jabón exfoliante para limpiar las células muertas de la piel corporal, con carbón activado que elimina bacterias, suciedad y todo tipo de impurezas. Ideal para prevenir y combatir el acné. MODO DE USO: Utilizar de 2 a 3 días por semana. Para una exfoliación facial, te recomendamos la Mascarilla de Carbón Activado. Peso: 100gr.',320.00,'jabon-carbon.png','Jabón Exfoliante Carbón Activado','baño-sustentable',NULL,NULL,0),(40,'Hilo Dental Biodegradable','Hilo dental natural hecho de un material bioplástico de origen vegetal con base de maíz conocido como PLA, recubierto con cera candelilla (vegana), carbón activado y aceite de menta. Ecológico - Sustentable - Biodegradable - Vegano. Contiene: 30 Metros.',580.00,'hilo-dental.png','Hilo Dental Biodegradable','cuidado-bucal',NULL,NULL,0),(41,'Copa Menstrual Maggacup','La copa MaggaCup es un dispositivo de silicona reutilizable que contiene el sangrado menstrual. ECOAMABLE - SALUDABLE - ECONÓMICA - CÓMODA - PRÁCTICA - SEGURA. Consultar por talle 0, talle 1 y talle 2.',1500.00,'copa-menstrual.png','Copa Menstrual Maggacup','gestion-menstrual',NULL,NULL,0),(42,'Desodorante en Spray Jazmin y Salvia','Tiene propiedades antimicrobiales, antibacteriales, antifúngicas, antisépticas, compañado del aroma fresco a jazmín. Hecho con Alumbre, glicerina vegetal y aceites esenciales.',410.00,'desodorante-jazmin.png','Desodorante en Spray Jazmin y Salvia','baño-sustentable',NULL,NULL,0),(43,'Desodorante en Spray Limon y Tea Tree','LIMÓN: Tiene propiedades desodorante y desinfectante, y aroma refrescante. TEA TREE: Tiene propiedades antibacterianas, antiinflamatorias, antisépticas, desinfectantes. Hecho con Alumbre, glicerina vegetal y aceites esenciales.',410.00,'desodorante-limon.png','Desodorante en Spray Limon y Tea Tree','baño-sustentable',NULL,NULL,0),(44,'Combo N°1 Sorbetes','COMBO N°1 INCLUYE: Sorbete de acero 20CM, Sorbete de bambú 18CM, Cepillito limpiador, Bolsita de lienzo',600.00,'combo1sorbetes.png','Combo N°1 Sorbetes','cocina-sustentable',NULL,NULL,0),(45,'Combo N°2 Sorbetes','COMBO N°2 INCLUYE: Sorbete de acero 14.5CM, Sorbete de bambú 18CM, Cepillito limpiador, Bolsita de lienzo',500.00,'combo2sorbetes.png','Combo N°2 Sorbetes','cocina-sustentable',NULL,NULL,0),(46,'Bolsa de Lienzo','Bolsa de lienzo de algodón, fabricada artesanalmente. Ideal para preparar leches vegetales caseras, y hacer compras a granel. Tamaño: 20*30cm.',280.00,'bolsa-lienzo.png','Bolsa de Lienzo','varios',NULL,NULL,0),(47,'Serum Ácido Hialurónico','Un serum es un tratamiento que se caracteriza por tener una alta concentración de un activo principal y una textura líquida que favorece una rápida y más profunda absorción. En este serum el ácido hialurónico es el activo principal, contiene tanto el de alto como el de bajo peso molecular, esto significa que penetra en las capas más superficiales pero también más profundas de la piel, hidratando en profundidad y facilitando la regeneración celular. Apto para todo tipo de pieles. Modo de uso: Poner no más de dos veces al día 1 o 2 gotitas y aplicar masajeando ascendentemente. No apoyar la pipeta sobre la piel. Contenido neto: 30 ml',915.00,'serum.jpg','Serum Ácido Hialurónico','cuidado-facial',NULL,NULL,0),(48,'Repelente Natural en Spray','Repelente formulado con un blend de aceites esenciales: Citronella, lavanda y eucalipto que actúan como barrera y asegura una protección ideal para el disfrute al aire libre. No apto para menores de 3 años. Presentación: 125 cc.',380.00,'repelente-natural.png','Repelente Natural en Spray','varios',NULL,NULL,0),(49,'Saco para Jabón','Disponible en color ladrillo o blanco. Ideal para rellenar los restos de jabón y utilizar como esponja suave. Realizado 100% a mano. Medida: 11*8 cm.',350.00,'saco-jabon.png','Saco para Jabón','varios',NULL,NULL,0),(50,'Repasador %100 Algodón','Repasador de algodón blanco, con dos líneas roja y azul. Medidas: 50*51 cm.',340.00,'repasador.png','Repasador %100 Algodón','cocina-sustentable',NULL,NULL,0),(51,'Cepillo para Limpieza de Sorbetes','Cepillos finas cerdas súper angostos para limpiar sorbetes de acero y de bambú',180.00,'cepillo-limpieza.png','Cepillo para Limpieza de Sorbetes','cocina-sustentable',NULL,NULL,0),(52,'Sorbete Acero Inoxidable 14.5CM','Sorbete de acero inoxidable 14.5CM',190.00,'sorbete-acero.png','Sorbete Acero Inoxidable 14.5CM','cocina-sustentable',NULL,NULL,0),(53,'Sorbete Bambú','Sorbete de bambú 18CM.',210.00,'sorbete-bambu.png','Sorbete Bambú','cocina-sustentable',NULL,NULL,0),(54,'Sorbete Acero Inoxidable 21CM','Sorbete Acero Inoxidable 21CM',210.00,'sorbete-acero2.png','Sorbete Acero Inoxidable 21CM','cocina-sustentable',NULL,NULL,0),(55,'Esponja de Yute Simple','Ideal para espacios reducidos y utensilios de cocina. Hecho 100% a mano. Medida: 12*9 cm',360.00,'esponja-yute.png','Esponja de Yute Simple','cocina-sustentable',NULL,NULL,0),(56,'Serum Niacinamida','Un serum es un tratamiento que se caracteriza por tener una alta concentración de un activo principal y una textura líquida que favorece una rápida y más profunda absorción. En este serum la Niacinamida o vitamina B3 es el activo principal, tiene un efecto reparador ya que es un gran antiinflamatorio y aliado de las pieles más sensibles, refuerza la barrera protectora de la piel y reduce la producción de sebo siendo ideal para pieles mixtas/grasas también y además promueve la producción de colágeno. Modo de uso: Poner no más de dos veces al día 1 o 2 gotitas y aplicar masajeando ascendentemente. No apoyar la pipeta sobre la piel. Contenido neto: 30 ml',785.00,'serum.jpg','Serum Niacinamida','cuidado-facial',NULL,NULL,0),(57,'Serum Ácido Glicólico','Un serum es un tratamiento que se caracteriza por tener una alta concentración de un activo principal y una textura líquida que favorece una rápida y más profunda absorción. En este serum el ácido glicólico es el activo principal, es un exfoliante químico que acompañado de acido málico y cítrico, actúa como tratamiento para manchas de acné, sol, puntos negros entre otras cosas, ayuda a que la piel quede suave sin dañarla. Destruye aquello que adhiere la piel muerta en la superficie, y el resultado es un acabado mucho más uniforme y un tono homogéneo. Modo de uso: Aplicar con la piel limpia máximo 3 veces por semana 1 o 2 gotas durante la noche lejos de otra exfoliación, retirar al otro día con agua y aplicar crema. Contenido neto: 30 ml.',785.00,'serum.jpg','Serum Ácido Glicólico','cuidado-facial',NULL,NULL,0),(58,'Aceite de Tea Tree','Aceite de Tea Tree, presentación de 15cc.',550.00,'aceite-teatree.png','Aceite de Tea Tree','aceites-oleos',NULL,NULL,0),(59,'Limpiador Efervesente Multiuso','Apto para limpiar las siguientes superficies: Metales, Vidrios, Cerámicos, Porcelana, Plásticos. De origen vegetal, Producto Cruelty Free, 100% biodegradable. Con envase compostable. Con aceites esenciales de pino y limón que aportan aromas riquísimos. ¡ Rinde 20 baldes ! Recomendación: Una vez abierto, guardar en envase hermético para que no se pierda el aroma.',380.00,'limpiador-efervesente.png','Limpiador Efervesente Multiuso','cocina-sustentable',NULL,NULL,0),(60,'Aceite Esencial','Los aceites esenciales son el alma de las plantas, los principios activos que actúan a través del olfato, el tacto o el gusto. Cada aceite tiene su carácter, su propia personalidad y transmite la vitalidad, la energía y la vibración de la planta de la que se extraen. Disponibles en: LIMÓN - MENTA - ROMERO.',480.00,'aceites-esenciales.png','Aceite Esencial','aceites-oleos',NULL,NULL,0),(61,'Protector Diario','Mide 15 cm doble capa de tela algodón. Es para uso cotidiano, días sin sangrado. RECOMENDACIONES DE LAVADO: -Poné tu toallita en remojo antes que la sangre llegue a secarse. -Luego de algunas horas, llegó el momento de lavarla a mano o en lavarropas, usando agua fría y jabón neutro. - Colgala para que se seque antes de volver a usarla. Si es al sol, mucho mejor! - Para blanquearla podés lavarla con bicarbonato de sodio o vinagre. - El agua con tu sangre es muy nutritiva para las plantas, podés volcarla en ellas.',220.00,'protector-diario.png','Protector Diario','gestion-menstrual',NULL,NULL,0),(62,'Toallita S Tanga','Mide 15 cm. Una capa de tela absorbente y otra capa de tela impermeable. Forma tanga. Para un sangrado leve, ideal para acompañar tu copita. Absorción de 3 a 4 ml. RECOMENDACIONES DE LAVADO: -Poné tu toallita en remojo antes que la sangre llegue a secarse. -Luego de algunas horas, llegó el momento de lavarla a mano o en lavarropas, usando agua fría y jabón neutro. - Colgala para que se seque antes de volver a usarla. Si es al sol, mucho mejor! - Para blanquearla podés lavarla con bicarbonato de sodio o vinagre. - El agua con tu sangre es muy nutritiva para las plantas, podés volcarla en ellas.',350.00,'toallita-s-tanga.png','Toallita S Tanga','gestion-menstrual',NULL,NULL,0),(63,'Toallita S','Mide 15 cm. Una capa de tela absorbente y otra capa de tela impermeable. Para un sangrado leve, ideal para acompañar tu copita. Absorción de 3 a 4 ml. RECOMENDACIONES DE LAVADO: -Poné tu toallita en remojo antes que la sangre llegue a secarse. -Luego de algunas horas, llegó el momento de lavarla a mano o en lavarropas, usando agua fría y jabón neutro. - Colgala para que se seque antes de volver a usarla. Si es al sol, mucho mejor! - Para blanquearla podés lavarla con bicarbonato de sodio o vinagre. - El agua con tu sangre es muy nutritiva para las plantas, podés volcarla en ellas.',350.00,'toallita-s.png','Toallita S','gestion-menstrual',NULL,NULL,0),(64,'Toallita M','Mide 19 cm. Una capa de tela absorbente, un capa de tela aislante y tela aislante reforzada. Para sangrado de leve a moderado. Absorción 8 a 10 ml. RECOMENDACIONES DE LAVADO: -Poné tu toallita en remojo antes que la sangre llegue a secarse. - Luego de algunas horas, llegó el momento de lavarla a mano o en lavarropas, usando agua fría y jabón neutro. - Colgala para que se seque antes de volver a usarla. Si es al sol, mucho mejor! - Para blanquearla podés lavarla con bicarbonato de sodio o vinagre. - El agua con tu sangre es muy nutritiva para las plantas, podés volcarla en ellas.',435.00,'toallita-m.png','Toallita M','gestion-menstrual',NULL,NULL,0),(65,'Toallita M Tanga','Mide 19 cm. Una capa de tela absorbente, un capa de tela aislante y tela aislante reforzada. Para sangrado de leve a moderado. Absorción 8 a 10 ml. RECOMENDACIONES DE LAVADO: -Poné tu toallita en remojo antes que la sangre llegue a secarse. - Luego de algunas horas, llegó el momento de lavarla a mano o en lavarropas, usando agua fría y jabón neutro. - Colgala para que se seque antes de volver a usarla. Si es al sol, mucho mejor! - Para blanquearla podés lavarla con bicarbonato de sodio o vinagre. - El agua con tu sangre es muy nutritiva para las plantas, podés volcarla en ellas.',435.00,'toallita-m-tanga.png','Toallita M Tanga','gestion-menstrual',NULL,NULL,0),(66,'Toallita L','Mide 21,5 cm. Doble capa de toalla para absorción, más tela aislante e impermeable reforzada. Ideal para los primeros días de la menstruación, resistentes. Para un sangrado de moderado a abundante. Absorción de 14 ml. RECOMENDACIONES DE LAVADO: -Poné tu toallita en remojo antes que la sangre llegue a secarse. - Luego de algunas horas, llegó el momento de lavarla a mano o en lavarropas, usando agua fría y jabón neutro. - Colgala para que se seque antes de volver a usarla. Si es al sol, mucho mejor! - Para blanquearla podés lavarla con bicarbonato de sodio o vinagre. - El agua con tu sangre es muy nutritiva para las plantas, podés volcarla en ellas.',520.00,'toallita-l.png','Toallita L','gestion-menstrual',NULL,NULL,0),(67,'Toallita XL','Mide 24 cm. Tres capas de toalla para absorción, más tela aislante e impermeable reforzada. Tipo nocturna. Tiene más capacidad de absorción y contención. Para un sangrado abundante. Absorción de 18 ml.RECOMENDACIONES DE LAVADO: -Poné tu toallita en remojo antes que la sangre llegue a secarse. - Luego de algunas horas, llegó el momento de lavarla a mano o en lavarropas, usando agua fría y jabón neutro. - Colgala para que se seque antes de volver a usarla. Si es al sol, mucho mejor! - Para blanquearla podés lavarla con bicarbonato de sodio o vinagre. - El agua con tu sangre es muy nutritiva para las plantas, podés volcarla en ellas.',580.00,'toallita-xl.png','Toallita XL','gestion-menstrual',NULL,NULL,0),(68,'Rasuradora Metálica','Incluye: Rasuradora metálica reutilizable - Estuche para guardado con espejo - Cepillito - 1 hoja Gillete - Buen filo e inoxidable.',730.00,'rasuradora-metalica.png','Rasuradora Metálica','varios',NULL,NULL,0),(69,'5 Hojas de Afeitar - Repuesto','Hojas de afeitar inoxidables. Cada hoja tiene un uso aproximado de 2 a 3 meses.',350.00,'repuestos-gillette.png','5 Hojas de Afeitar - Repuesto','varios',NULL,NULL,0),(70,'Delineador en Gel','Están hechos a base de manteca de karite y cera vegetal. ¿CÓMO SE USAN? Simplemente se aplican con una brocha o pincel de punta pequeña. ‼️Tip: para lograr una mayor duración sellar con sombra arriba. Además , se pueden utilizar también como sombras de ojos cremosas. ¡Vienen en diferentes colores! Tenemos en stock en color negro, pero si te interesa podes encargar también en violeta, azul y marrón.',290.00,'delineador-gel.png','Delineador en Gel','maquillaje-natural',NULL,NULL,0);
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
