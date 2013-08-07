-- MySQL dump 10.11
--
-- Host: localhost    Database: testapp
-- ------------------------------------------------------
-- Server version	5.0.67-community-nt

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `customer` (
  `number` int(11) NOT NULL,
  `name` varchar(40) default NULL,
  `photo` tinyblob,
  PRIMARY KEY  (`number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `images` (
  `ID` varchar(255) NOT NULL,
  `GALLERY` varchar(255) default NULL,
  `IMAGE` mediumblob,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `invoice` (
  `id` varchar(32) NOT NULL,
  `date` datetime default NULL,
  `number` int(11) default NULL,
  `remarks` varchar(255) default NULL,
  `vatPercentage` int(11) default NULL,
  `year` int(11) default NULL,
  `customer_number` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FKD80EDB0D3D6769C9` (`customer_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoicedetail`
--

DROP TABLE IF EXISTS `invoicedetail`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `invoicedetail` (
  `id` varchar(32) NOT NULL,
  `quantity` int(11) NOT NULL,
  `invoice_id` varchar(32) default NULL,
  `product_number` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK33BEA1BE48069759` (`invoice_id`),
  KEY `FK33BEA1BE475FCE47` (`product_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `invoicedetail`
--

LOCK TABLES `invoicedetail` WRITE;
/*!40000 ALTER TABLE `invoicedetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoicedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_sku_change`
--

DROP TABLE IF EXISTS `log_sku_change`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `log_sku_change` (
  `id` varchar(32) NOT NULL,
  `action` varchar(255) default NULL,
  `changeTime` datetime default NULL,
  `skuId` varchar(255) default NULL,
  `skuName` varchar(255) default NULL,
  `userName` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `log_sku_change`
--

LOCK TABLES `log_sku_change` WRITE;
/*!40000 ALTER TABLE `log_sku_change` DISABLE KEYS */;
INSERT INTO `log_sku_change` VALUES ('ff8081814056b771014056b909150001','Insert','2013-08-07 11:01:38','ff8081814056b771014056b8e43f0000','测试01','tester'),('ff8081814056b771014056b95f470002','Update','2013-08-07 11:02:03','ff8081814056b771014056b8e43f0000','测试01-修改后','tester'),('ff8081814056b771014056b9a09a0003','Remove','2013-08-07 11:02:20','ff8081814056b771014056b8e43f0000','测试01-修改后','tester');
/*!40000 ALTER TABLE `log_sku_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `md_sku`
--

DROP TABLE IF EXISTS `md_sku`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `md_sku` (
  `id` varchar(32) NOT NULL,
  `code` varchar(32) default NULL,
  `descr` varchar(255) default NULL,
  `enabled` bit(1) default NULL,
  `name` varchar(255) default NULL,
  `version` datetime default NULL,
  `photo` mediumblob,
  `price` decimal(19,2) default NULL,
  `uom_id` varchar(32) NOT NULL,
  `vendor_id` varchar(32) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`),
  KEY `FK874FD655B6473876` (`vendor_id`),
  KEY `FK874FD655B1DEBE9E` (`uom_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `md_sku`
--

LOCK TABLES `md_sku` WRITE;
/*!40000 ALTER TABLE `md_sku` DISABLE KEYS */;
INSERT INTO `md_sku` VALUES ('ff8081813f91c906013f91cff0840002','1746A2S','IBM DS3512 单控制器存储 1746A2S (单控制器,标配12个硬盘位,无硬盘,每控制器1GB缓存)','','IBM DS3512 单控制器存储 1746A2S','2013-06-30 05:21:31','����\0JFIF\0\0\0d\0d\0\0��\0Ducky\0\0\0\0\0d\0\0��\0Adobe\0d�\0\0\0��\0�\0��\0\0l\0�\0��\0�\0\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!1AQ\"	a2#\nqBRr�3$%�����C4D&\0\0\0\0\0!1A�Qaq����\"2��B�#�Rb3r���\0\0\0?\0��\Z�\Z�\Z�\Z�\Z�\Z�\Z�\Z�\Z�\Z�\Z�\Z�\Z�\Z�\Z�\Z�\Z�\Z�\Z�\Z�\Z�\Z�8^�2�e��ܭ�P�\0��-I\0h6Ó�ڥJM� ��G�D쪊+���P��/�j��ވ��c�OT���[�˸Wz|S�g��\"f禣ԧy�\\�bYz���^������?��ɦ���Z?��z��U�ƹ�l�_�@��C�r�R��\"�\nR����XEpo�ê��\\dz�|$��~��R�.Qb���\"U��*]n9#��#�C�%\'pڝl+ڡ��U��4rd��?U#ʋ�\n�1�S�>R��e�����Ԡ�<k\"-���a�oH�u�<��}�_Ez�2Dkb�@4@4@4@4@4@4@p�\"<V˲_f;I�_u����[�JGO�F��Fǒ8�\nr�=�+���a�RCoy�9��5Wz.-{�3Yz���R�.g2q�;�Ƞٹ��-V�-��\0�Q�¸��,}r�a�J�9%N\'���s)��Ϲ�ʹ��}^�}������w������\0n�+�Ñ�@�S*�;��E�b��%m��e��THR�rT���k�WӤ��_�NC�:�������2˰���]Ri�k�i=���y�\'aӹ����> ���Ӣ^�#�-	����s��O��r�K��p~�ll�����?�!�~�kꗟ��\ri�lR���ڔ�X�91�IBO��U�<��8�ۭ��	�`wU�������Է�i��.Y�ټ��/�[���)��J�c�=�P�]�\0&U���;,��mB~y�W�X�D����+q��;S��Wt�v+���ɓ���=oh����ku8�8�v� \0|I#�����X�XX���f��䅙븗1�>�ju��R@�{6BwV���]D�*v�r��58�@��bbXï\'m�R]�[*G��+�:,����v�4J{�q>\Zz��X����Mb*�ݧ������)r�ȥ.^Cx� ����;�H �}�nEbţ\"�D���Fb�l���8��\n+Wr����@����eY�o�K:��]����{��mA��Qݶ��	Ya=;�J�#��R��!7��|o��x���1�oF�bF;�y�%BZF�3�}6�M�\r�cJeǴ�+�>7r���/\n>x���t#A��v����v�/��,���m2�������R	���}uS���\"u��ȹ��qLڵ��EM�V�\'i�����+}�{��Z��\nH(XJ�q�]U�l��4^g�rj�h�h�h�h�h��Ȟ����X����bnI��u��ʑ���e������QR��b}0�l�Ag�k`�N�Q�F�fԽ�n��	�\\�7��Ų��c���u%�,G˳-�L8��8۬��ZJU��U\\�.��p/��-��xv=	r�܈��4�V�	)|<����k��X\nu�i�D�]1���?+�5@��\0�b�-8�u%.�[8�?���甖�I���3�\0d���U�P���3��%��)�F�t�����uq�������un���J�Y>;�)J\'���~�6ܢ�u�	0b��R�)\r��;�		[�؄�}�\0���בcī��Ȏ�F�C!�XpKq��z<�(�4�\0v�0�W� �\0���\Zmi���APYm@�K{�x�l���\0=F���������,w�YO����|�gq�\0�n�k�ϤTH�k^Sg��o��\'�(3���e+���W.Mx�#1��rl�O{5r`Ã��\0\'j�2{�%�Occ�I���u\"R��6�7;��}}��E$�z���`�}���iP;��BR<}��\r�G/ҚN�E��l:{Ҕ����_`����\\i�-����}�j�S�����|Q�5VS҆�K�1�A�&K����Km�jm���Gk5�0�*��;|R��M�v���yWN����7�o��t��T6�Sݦ.o�`nz��~�xx�����R��V�7�ݾ9l����I�����ۮF[~{c���z�j6Z�k��#U�Q/8�֯)��Y�enV�JW=�*�&i�ڝ�ј4�+BA;.;Z�3��m^�-4�ܿSZ�|���}P��\"-�p�Dc�o\0X�RMS�\'v��u���Wq�$8�{�Տ�œ����6$  �A�#� �}��pt@4@4@4�1�F�2c�E��dʒ��i���mN��ά�\r��H*R�\0�����{�[�Z^�o1��۪K�oͧ�]TL�kSm�b�C�_>�ßc�m�֤-$lu縵��3��P8K��\Z���8𰩳y��b)4ס�	T�H�U7!�Hn[)$��\\Gì�G�%_k7��\\���<oq�<����Cw����%�@��Җ�y2[+a�7B��)���:)enr�	@u=z���w����8�����HrRQ*)m����f3���=�����\Z���A2��DjK����@���st��^����P�tU�3̸�~m���\'�\0ُ9%i��.�a	�l6�ZVӫrDw鎮��B���x����U������<v=v$\rIV��f?v�7㿏�����Uվ)��A���\0��դ�c�>~���w#��?a�H���Uq�q�P\nyĴ�<�4�K�J�u҆�l(�R��Ԑ4�Μ�;8\r�B�6m�8c���B�,��,���JC�#�\0�)$�Pu/N-.�V;�-��g��� �u��k,��I�N�$���c�J{�r�u�$�$���[��J+�/v�\'\r�ߡ��W)0q�m��A��H�hL��\n>aK���S��l��S����LI��%ү���m�]�����Zư��fY1���\n��*�1�CR��]S�6��&�{{B�+RQ�;nu^�/!�S�`ZGN�#��{�Z\r�؟�*�J�$��g��Ԧ�F��@a�-m���uC���(u�l�+^\0�K�<�4��ZIO���\0�N�o�n���D�t�:��;� �l����:��;⥔�M�#\"`��˼^cˬ~�ǆ=x�wB�n��5j����w�\0H�r}�ιs��\\׹�oX�\r4p/]���3��xĕv%W���wH��A%��Bn`6I!f�x�_��dP�\0BΖ^$��s�7=��nKO����9W5�GR�Pjd`�*�(n��B��F��z]M\Zh�vj�h�h���Df��������}�� <̘o2�Eh��B��u��>q?2�aE�\"5{�+#Z=������M��3�2�o�6���E �5�WO3)S���f�w$���RzuI�(�[��jCR�3e�V�D˱L�U�S5�!��SM���u�u�ťu��.�y+l��N1������������x1i�Llo���\\]*��\0l��ܙ8��U�Ji*iE�n*6���3\\�V�ׁ֯>���x��n����o��N�]��,$��b7��t;CU|���:#n�$�|��{\n��a����of�t=��u�51����IR�y���5.8�%%զL�J�W�S�	�t魖O>�Y-c�|]�_�.�K�$H�Qz��iu�n5c�ZrV4��6ڙ�)H+aJ��͛�ApR�Ʊ���1ߧ�e�<�\r�P�հ��ָ�����U���8WéWȮX.FOĥo�ߴ��|:i�!�.+No���F�m��Eu�*�/S�T�,%)�����N�\0�j7��	�ݡD��l�\'�gS�&d�$Dm�І��d���^C�:䔸�{��j7��t|y�aQo[�UkoYn�nsi��\n�����#p���{�z\0����껊:��q>oT��L�UQ&iSgC�	��$)�S{]W�\"��O��Y	�ݯ��\0*�\07�\0\Z�\0���~�t}L�l��w�J���;ŭf�f77S��O�?)�����\0���Z�[�X\\��j�\\bc�n��x4��c���v*dÀ�y,[��c�P�ï��7L�&ԑ.yix�;+c��/��\0�#�\0[t]}����}oQL�-n��˗Z��Z�4��4����\'��>��W�U��]^J��q:�K&j�کIUK��8�>c�f|��#a��,$VdT1\\q�!8\r�u��.��x�$Kl)*���o��\0��)��C�;�E���:g�e�ݒ�Ou-i����Ò\Zpہ��V��,�O��\0\\�M�*���q}�e��oY���:��mN�1�j\\�4�rqER�)1����a�������:.���.>�<�閊ʹily++�;%jYpu��ς͂�2�\r�K:6�����l�4����iD#:���\"?��\r��r�	u o�w���6�|ja8��ţ}q��W���K�3�U���W��Y��@\ntl�o����������Of:�}C�s�S�\0蹳�*��u�s6��5�m���m�͸7ꝵu��\0;\r�ⵓ�p_G[c���\\AP��Ա�%Uq᨟f�Ya�ĶO�_\n�F�����_s�EW �R��h�\'��%J߳��\"e6���E��j˥�zR�NNv�\"~Q�����1z�|^�)\n�s/�bØ��J�$�uIq=�I(C���F>��sJC�pf�|o>H�q�\0���)\'�R���E�uu���&ZF�,~t&��J��Ej��ZS�\Z�\0�����|z��;�\0ly��J���N�Gߺo\r�9Ľ[q�\Z��Y&?M����H��Q��r��W(��oa& ȟY!N0���K)*Օ2D��iS�^z�F�h�@��Az�B��4�?��ڞ�ҕ���N���}6��I��h���pm���<�̹��츾T�ȍ=��j�ĵ)�܃Ǜ��^mmr�|\r5@����l<G]�����k:�B42%D�-�����<F�q�=zm���T�L�J\'Nߡz�Z��}cOG�N\\��z�� Ώ`ӊ�ɇ29K�d�B���H!j��z�����]8�捵�n��ݧ�p^j�����\Z.G|7��{�ه���Ǭ�Y!\"h	���\r(�������w��6f�V��\\J�jvإ)))\nB���Oa\Z�cWD�hT�C��(h��u-��\0�J�H\0$�]+[�M���Y���OZ�\n�+HJ����Iدr����G��Wke,���T�L	\r-m�Z����ZS�}�n[)e�Ow�@֔�:��y�Q������K�)�7R�3�ɘl^O�nC�K��������!�9��K�eD�A%In�<�[���?��e/#�:��\"��֌��t=��#ͯ���.�tw\Z�[5��B���X��̝.��\n%ͩ�*�>c�K�F{����%��fp��I[�W2��n���sQ^(&���6�جXDY�[\rJ�-����w�i��l��@�BH��wՕ,�世��S�c���F�\0�]��(���nw3\'G�S�pB�z)0�C���>&�&띸�N$lX��FE �ӷ��[�Y�j}5͢~�¬ܧ�^=܆�k�	���7�e;{�\\�L��5j��a�\'$��y[��n$(�S�˯nj��q�4��(0�����)���DK2�@��l�s�����C���Z�i�י�J]^�+[�SM��tԍ7?~\Z�d�lK���*��EU�qa���y��I��n\'^�T�[I��\n+%D�פ�I�%^�����\0�:G�\0T���f�}OQ�\"��l�����r|T��J�u�j��./e%�61����n:���	o~��Y�}d}n�{Y�[t��M�k�����9~CX��V�7�>��WG�)�r�,(�\0 ��U�J$��yE�7)>^�3�s�#G|R���Zu��>���LȪ�+���s�Q(*I�]�L2�:��WbOqۧ���=���	Yq�4T�\Z��/V������u7��I�5�d5U�W��%�r�~]}0����|@\0����`u]�jg�_�,ֶ����c�y?\'�NG��l�~����rz�A��z�s�3c3KQa2\n�H~qI%i\\;|c�F���e�������r�;�{��xq,~[ɲ���yM�K�ց�e��tqb��-���]�K�����J@^��GS��z|x���ƺ�Ǚ��=Vk]�O��8���/N2��b���V\\f�QZ�ٕ*��Io	��e�ޗ*D�\",6ʔ��\0�G�Ms�8v�Q>gc͚f�<���zX�2�Q�8�	�^������r��TZ&5Y)���N)I=z�k�������5��:�2�q�Z�w�}\r{5*�\'�rD3l�e1g)���1����?&�+�� �\Z�����V���k�{�>�II�������A��d�\0�{��}�x#?�nA���w�.x�!�7��7i񬮍籔�6��y\' L�>JXv(_�������ߪ�]<;�Z�ي��%Ue������Մn\0��v�y���)��\r\0�K\n��&��B�eYeM}�u�ff@��1�Ǚ\nl9r<������mĩB�T$hu?�埦Y��M��-�:̒�o�Ai�֜����T���%[���g�;�W���ˇ�P���r���?���ҝU��!ĩ*JJV�$�ऐ{HV�>Ѭ+n�ܼṢTY�մ%�~*�ejK���q�5��u��RF��S�f���u宱�Qf����>�}������&�0��1Ҵ:�J�O�i�ˁZ��Z^4�I��օ��W�����8�Jj,�>����ֲ�FC�U�}�a�^c ~�y*��ֳ�v��S�M����zQ~��^o�2�2\"G�ë/�v�2ʖϔ�����:�w�Z��-%+����]GQE��Zi�_ihmMS0����F��R��)Ρ���`������z�)ܖ����\'���jVn�~�[�U��շ�FC���n6���S\r��n���+cUN�N�$� ��q͐��}.�������)8֛�Ĉg�F�:���S�SL%��BT;�[�u1=�*)I�jWI����h�ػ�����?p�\'_S\\�a�����\0�r���b3;8��E�`����`���ܤ��P֫���R��&ʻ��N�B_��ɗ�ƨ.9y�����qnN�1�\Z����؉\n��a���Z7�D\0N����qk��Fv�J�TQ�`��\0s�Pܩ�r/ =yw�=�L��w-��l���vF���u���\rb�C�4�{A�OP����v��+~��Z*ϑ��\rϲ�21��\Z�]����q:���)��9i&���ad+[��wO���&㜿��>�5�s�yG�t��]��Ii�k���J\'��HMt5���K�\\u�����@ m��Jt�NIy\"/�7�^��|�ʟvϐ�\'���L$տ�n�Ò��8Q/�0`��PJC�^ê�A��5K*7+�g\\��t$�?r+�s�[P�l�E���hTI�v��VA�g�[�E��gI����C�R�Z<�(w��-T��qF�m��K�NX�缳�$!?���x��c�ޗ����3�V��*IIq8���$����+����ي�Z�N�U��w#�G\"=N\n����m��ӡ��l��Y1�!�2Q$\"+�R�\nR����k���u����|�^������<L����[Y\ZU�$�ļ�D����5���! )��9�Id�\0�Y���w���Ui���l�����I&0�T���΁���\\C����y-�k���jm�\Z��� +��\\�		�3ɷ%�����\0B����Ν�٭�Y��͹bNQaN�ۜ�����)�C���m��F܁\r^X��!�Pw]7�R��v�������IO�|��;��&V�?���sK�qwCieeKO��E�M|�#I�y�jS1�v��JJ��%�ĿU���Ȥi6�Ľ�|�A���gH�,��g_�=*��gb�S��\nj�5	,e�N�w���@%#�>\Z����[4����V�j���\\X�$�2*_�9�L#Ob-7\Z�\Z\Z�#)JPi�rd�,�R�U�;BO]c~����;yK�Y���+Wp�B@c�|�c�1+��g6��[GI5�ߐ]�Xn�d��&N��	߮�c��{ydmD/������ur[N]�eq�(RaY�l&�޽��L]S��j\nIl�w�k������q�8�|L�n<��w~�\\�����I�vQE����^i���(o��^�\0�:��;g�:����\0->駪�4@4@pI�\Zli�Gb\\Il;\ZTY-6�i1�mM?C�m<��,�hP)RIm�<������x\"FC�cҶ7*ǅ^v]�(q%$w���7qrg�=lv��0N�rm{aNP�]`*\0Z!�e����������O��vFDe���?j����D���R�PP�pF�����/\n�7�\Z*$��$Ylv��-)yh}��)��WV�Ī���Y��c�̆���6�-�K\Z�Y�_v�v�u��[���GzS�¢��uՋ<�u�N��ժ��u̷y����r;�ť�H�D\\�*\\J�R.e4rp���U0�`��t��J@��u���tKN�~&Nֻ��E��b\'-S��_6�i8�?iV�p�� -ɋ�i\",�)���T�E��\0���Ɠ�z%�9����*��s��\"j�VW�]��|Z�+���G�\Z\\�\'�^�6��>8�o����>����ۼ �N[\\�$��Kr��+$2�7Qq���;��;}��[s7�3�$�$z��v�>g�js>�(��VV|�%�^�kr+��$N�\Zh�;��8:�X�M�&��=�\r3W�G`�9�4��B�m\r�4�)�@\'�f��]��=)��8�)+[�	ke\0�jo�<?cK��u��H�<�*��>��\n�<��K��,rʆ�{�bʪ�b���aP`�yӺ����$l�	��*���y\\0�T�9����N:�X�FMClB�]�H�]�\0RaI���R�;\n�r1�P�6�ݛM�|��I�OY%N�8�*z�4|9��q�N(Z²fE��\0,Ga�f���=�c��N�\n��=�\'�K�~�_m]a��xA{��|�\0�nJ��[q�ռ$�C�jq:�$���,��N�e���)M��&�λ��숥q��G��5���.WM��F�N���9DJ���_Wl�<��e�vr��hwu%�#����M����%.��I�-�/�o�]K|~����\\K�dI����q�Z����	���p%	ZBPD�k�b�޾�f���sKO{1-bYv%S�\n���j��ˮƫ�CM���#˔�q���Wr]Z������HI$�4rrt��{;]���G30q�3}��Y��b��X��5�D~.�@���m�2���(���X�ĭ�%���s�\'o�Gq�G��\'���%/���N���?QU�2�6#�D���Yf�[^�G�8��/�L����|�%�8d�����_g�nY�uH�]�j\n����dˈڒ�(����ۇ�B\ne�U<k۸Ғ��o�@q����J˲�kc�Rd�EmU%#1dA���ǠL�d��1���вZ�e�����)��vWzw�H��-ݯ!�W�Z����#�9���m��2��A����+Xi�~{��h��ڣ�GA�܎�;�e��s�����I%V���2ND�,�4�3\n����%�̉��_��H���a2��ŵ��ϵ)�m���n�cO��ռ)�<�im�p�ڟ��+#L┆�a�\n�+�F\r��:����y-��!�:��+��_��.[�м1�l�{r��D�Q영mU\ZG�}Q��J�m��(�k!(��v�b\n豻�����_�����/z��?�rESY69��!�̗2*�0���%d_&ﮟ!�jb*S.-�B�:���u6�QcN|wҳ�^ӳ�꺋[��{7����$�g��I��oX�4@4@4�Ї��B\\mĩB���@�HZT\nT�$�A�F��u�\\�B��5e>�}!��K��d<��X�\"�\'�\\�L���#�{*\n~څ�)u��T��dvy����W�1u����滼W�y٦�b�)ќ�<�ѥ��z����Pz�_��\'�d���רƘ��|��J�E}C��R�)�i��RJTAk�����M���M�e���8����wWu��n�Mĕ�W�&��\"�\"����X�.(�v+ҪZ�c��N\"���U�0�N#�K�\"�.�%��1�)���\Z�2ݎ�������f��I�U�����]�o�4���\"�/�-�ً\\�j� 8��au�qd���X!*�Ko��FR�I��;�NJ����V��pfzX�s�c42��(�e*c�4J��P��!��m��Lf�m�ڂG��[S���/�����\\�~Ã�,k�9?#�}���T�e�AV�\nH4ȳ�e�Fz\\Vj�zC-|Û�d6ڒz�\'jd���w�8�ˈ��Y�N��2�5�V\\^;�2�A\n�*y�3ږ\r��C�Cj�|�:�+%�#�Y�S_�=�\\����W�ȕ<	G\"6�Q2����8ªq����E����:�}��a�eO!N{��;�|8��]��C,�*����هr�61�R�AyM1�\ZDIHr3����&;���J	l�	|�E[8�![���ik��mY��36+���0�/�~>�!�r��Ǭ#�<�ېa�������DnF�����&���w.fv�=I�Om~9KO|�h�y/[d��3-��)��i�ѪQ�\'���PT�� �4�jYi1<�WN6p߁�N}����3%���f����/˂�ח[\nJ�vC�:�䶀��VV��ed�R���.=�RU����WKo��Ȝ�s��s��h�d�;�\"KC)�R�RIW��u�6�j�no��yzI�N��K���[��9��i�9u�>��K�44PʣE���4��M*���;������T��\0CW��*�����ۑ��9fEr�\0a��jF�0�R\"VO���*<���]-��3�IzS��$)\'~����[w��j��Ԝ�G��Ś�ʹ�s��s�y�X�f\'�|� :���R庇�A	q$��eW�R�^hc������	�4��7�%<(S\"�@�*�&S*$ٌ���$�nL�\Z�˛1S�S��P#��mv�]��Q��FW�aO��%揹O]6q�YH��\nq����0�e*��K�S�2�$TI�kV�n\\���m,.�u_7�a)��[�k0���\0#ܽm,L���T�6��Ge%�����?!k%��O�ou�\Z�c�Ε��;)Sᡱ~���[��X��މ�XrT��q��\"����[w{(RTc���v�H���ۤ~�O��ɴ>0�L���\n�0���W�+�|��Mt���ޱY��ҟ��㶲��Zۜ�+�\'O#%���\n��X���P�L�m�q�:�����h��$��m���}R%�T��%��hq;���]����ݳ��������k�5Y_���+�8:�ȩ�0n:���ak�Z�k�:�1��Ɖ`Z,<�>^�-I%]�~Jz���m�P֑\Z8�ޓ;r�Ǘ)��W���w7\rk-�4K�>��&#@4@4@4@y[�����T�����w��D\'^��s?cp��m�Te[r/��\0w��H���G��0Q�y���.�}����O�������˒���%!jS�.��YCќH�.��QBң���t>:ۦQ��]��V���y�5�	�b_On�ʮ�4�,�Α.]�k�k��~�c��^���c�Z� ��g�jlz9��3����G��yc���\'+�����v���Һ�꼌�5ջ��)�(y�!�)N(��A��F*Sj�׷��%��f\n��x����R��Y��k��d�+��GqE-.K���~R���&Ɏ�6(�k�i�=��ݸ�ܳ�E۷ ^r�P̄bx�����A�����C\r<Љ!�̓��o�YPAq\nl�m�Iֹ>�����硛ē�	~�&V&Y�va���;�S�*Z���D)5��KTА��_��q�Jq1����Gb��K���)\"+J\'\r-���H�Ʊ���ܝ�l���R������.��CHbHSn�u)!������A�4�k�9�M�*�u�=����9�x�Qd�I���W5.Ѹ�5�	�.ulyIM�ň�Kl���wA:ۧ���R�)�����J}�C�<��V<݌)5Ur\"=�%\'��(��8K2�����D{<u�z�Ң�z[�ˍ��2Aa��Y��;lz�W��(�eK�R���͍\Z���;�~�x�&�(�o�#�Iq����|t�e9�aHmN��}:l�^\0��$Io�@��7m��q�۷�SvO��u��O/7���(���f�˳W2G���X����*�.�U��1Emw�,������ӫ���˚qۙ�/Jo�R��$��A�Cվ]eQ�<�xofSq{���JK;)6��*��uj��,��A-�����ݛJ��UcT�fV�\Z��\n��\0}������}\ndx\"�ݦ�ۮj�\'���fK.�9�S��qj�	BkT��@	V�Z�D��>�#Oeii%�I,��������b���K*B~+S�r�T�7Q�^���%�h���$��k7����.|M�q��\0���揹\'=e�7��S��-����VYNL@�&v�O���\0��1�jN���}�q�F6��̲�[n�<���$HsB��r\n	mjGy?���d|�,t�G#bX_�G�Y�Z.���d7���oy\"�ӕ�e�j<h�ȕ/����\"Be���[i)$�;��l��WOL��K�#��xw�x�+��/�x�-y`v7AS	)\0l@�Uz�,eM\0�\r\0�\r\0�\r\0�\r\0�\r\0�\r�Y��¸���ێ�p�4��[E�Xc���Q�Re��\'��FH�#,����.U%�Ka���.lI:��U+���n������U��{����p~E�\n�������Q?zn{�\Z����gq�c\\D��b�8��7�h�SHZe���b�G@u��s:��a�U8��ӕ,�lbڢN*�L~33L�r\"ע<�Ѣ��F<g���������{�P�Zޕ��$\\�Ɨr%.<�<b�	R�ܛ��6���G��V�\0	e��{7�.�\\t5ޟ����c���|��O=O$�1lz��o,��6�R�@��*��-�Ӌ-)H�Lr��zDg��O��k\0���~z��Q�b�����9�mT5^B\\4�H�+0<����7�mZ���DcJdY7>FM��#���nk�	^���i;$6�G�8���\r��n�K�mm֨��6�z�Jv):�MV�:V�V�ۯ\n����x�en]���x}׫k��O���B�$�#]�nL\n\\_��T>��,��)�ֵΫXKS7���ޓ$��ٻ�=�3y���$_M���vq\'��ߝ���w�_r\r�y-����Ӡx+U�wnE���n83a\\�Q��x�qqQϜ�1��J�9��Ʀ��̵��Uc�B����{�wmɢ��\r	���\0c���\n�Č�oq����;3�%)�lC�9�Y_z���~\Zo�	Н��3a87p�4�8׈x��@	C86�bM!#�%�\n��$�j�x�FPБ�\Z�\Z�\Z�\Z�\Z�\Z�\Z�\Z�\Z�<���?m�����m�2�ԖAù&iAS_���ί����v����-��18��Z�G���B��y��Sz�\\�-��4ײ���ڛO̦Lt�]��S���~Ɠ0��\0i7��et���}F?q\"D.ޚ���`*i�ɗ\Z-4�f���JC=�us�I��^�i�[�\r���8��������K�8~�9���o���ֶ�ݎ㺟��ptv�O���5%�7�Ur��_����<,[w���\0:ڒ�����\Z�ť]� ���*�RA�j�Ɏ\\������Z\Ze�|W�~B�?��{�be�\'nԶhj ���Ba[@4@4@4@4@4@4@4@4@4@4@4@4@4@4@4@4@4@4@4@4@4@4@4@4@4@4��','29999.00','ff8081813f91b1cc013f91b68f0b0001','ff8081813f91b1cc013f91bcbfae0005'),('ff8081813f91c906013f91d20d540003','Z220SFF','惠普(HP) Z220SFF C7T03PA工作站(i7-3770 2G 500G DVD 键鼠 Linux 三年上门服务)','','惠普(HP) Z220SFF C7T03PA工作站','2013-06-30 05:23:49','����\0JFIF\0\0`\0`\0\0��\0C\0		\n\n\r\n\n	\r��\0C��\0\0�\0�\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n	��\0I\0\n\n\0\0\0\0!1	A\n\"2Qq����#BRa�$��3Cbdr�����%&EV������\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0!1��\0\0\0?\0��\0�@ \0\'@\0�@ \0�@	���oIokD:7j��e?L���\r�Qv�PD�1�K�`-)q��8�1��o�^~eRm��L�y���Y`ZP��4b�Պ���X���\n��&f��(�%fu����Z�^��B�i���$����x���LåĴ�v ��IJA�eM����]�-N���NZC���1,���m�\\!,!)[c�B�\n\nE�����ֹo���~ni����.�i�.�+j�#	�`̻�s(PR UG��\0�@ \0v��_��Wjt.��j���K�����[�!K#��t�\0F�#z�]�w[��ב&���vr��G�D�D����~�Pbv�:Ԫ!(u,�+�9�����A���L��̺ꖢ��Y�0��l_�,R(��a�t!�)-�%JZJ��\" �7�}y�!���س�N�D^˄�j����ʾ��4�F�J��%$�]_}<쾱N�4�A�_-�\0f�R�p*j�:��쳸�FAJ�IP���\0�@ \0�@p���ӏ�Fd�:�u}�}�b�x�����U\'O)�����rק���] y���8~p�щ��#Ι��z��n��w�W�:`(������/����G�]t��V֫pI�\0�\n*��gd̵����*A�V`6��=w��Mh�������f�L��Ge��R��J�J�wJ��w�\0�@ ¹{D��d�>�=��{_��윓�9;����dR\06�6�>Z�![Ԃ��Į��}��� �-OLT22<l�ݷ�u�LK��^<�SR=�t�Zm&j\\o�7����{��V>�]��3:;wM�U\Z�ϫ�J�~�e<�0\0y	��*F.P�rw-\ZR�N�����e2�2�Y�ii\nBС����AD�\0�@ ��=���ӓ��.=�oQ]G�U�00���vgw��4g[�Q�)�RYm@��5Ekz�Q�r9N2�򭟜>�@�EA�s�Y�@a^��^/h0{�UC�\0��Kx��.�PzJ�s�}��x��գ��N��UIFЫ�&ZЪ�,�D�qXL��<��Y�3ɷ��,pݐr \0�@ 3�?L�D�\0K�Ft��6�Ҹ�0\\����G��Z|�:mM��`H=�z�Bʷh�rj�q8uD�zĜ���m�賊R�S\'����TS���\'��+��ť��#K��h\n�8a��@e����K���:��]t���1�~o���� \0�@B�ťs8��U��i��^]uޓڂ[rՓl)j�H.�ʝ������K�q1J��(��TK�8�R�JS�q��\'�\"�[N�n�N��yJ�-Kra����Q��v;`\r�&l\Zf�sd�������:jJ��2�S�UL���L��f\Z�`&����<S]�WA�grR��d�n$ߛ�?�0\0�@ ��lH��g��fM��ц�`4����/�N�=�r�B��q��S���qɏs�`���c;ڶ�ߟ2��^�ۖa)��ԉ$�c�d)^O~����e�nz]�Ruy��:�\'g�7V���N&�lJ!I��!@�;�?8%��X���y\0@E�O�΋�x��Z��U����0��a�?�0\0�@ ��������q��9�s��w�Rƴ�Z����m��4�T�Q�-4�u8|a�V\'Y��⥔�?w9��%��1�b�ө�E\"b~�N��I0̔�\\q�4�$-��	Jw_����\Z�ѦН�Ui��4�\'�ao4��ky�ЇY㗙s�y	o%�8V<���n����Ϯ�Ou3�M�C%űRO\n*Q�D(d���zL]�_ZEC��	\"����[\r�F\\8�R��RBF1Z7��M�e�ni��\0\Z�~0��\0nM��e��NQ���~/{P��n�*�s�0����\0�@ :�>)}5Bd�ťUs>�I��M�4S�N:=H�?�h��AT�_q.���=�S)\'>m[J�Y2�s+�bd7?0�[�!m\'�$��[���\0J�;\\�N�#g�L����i��I�g�+Z��%���e?h��G+$a(\0� ��\0hD�i8�Y�Z�b�u}���vU����w�A��\'h.�[W�%^�L4���2�)Ji�� ����vY\r�u�b��+>��;j�@>��\0�@ u��>������T\0��\\8�j�l��%x<�?��M�U��i~c;E�>�����B�Ĳ�Qe��Y�0��S$��+\0����l�]z�&���Q��L��Ѧ$�Lʛ/N�aN�@B\0NI$�G\0sr��P�$�5h\r�N3�o����;� j�ݶ�[�9��R<��U�Z���Ă�R�R�xI�;@O��M5+AhE��D��oh��ո�����}FZVzK���`��H\rЩnv����I��\0�@ x�d�\nOV޴��I�ǭI	�(\rU��V���$���$ʈ\0�xF}�=���4�V�q�:�2ڤ�(�fP�aYO�xVG��Qq��z�9���Q��E*�l94��Sػ�8@m�{�(œ����o��m����ܶH�E���Em�`d�*+�y���\0x\n!N��Ft󓋙CHV�\nR��R�rO��F�/*��1 ����7K�]�z�\0�Gށ?\0�@ �κ��N��7�\r�i����\0�����K��t����X�2����HemKl��`���{����%=T���imy�r+�YipՃ�C��O\Z�{�<��Ac�ܪc�\n}����#��������ϵ�	r�*�h�$���G[��j�[�K�&I֐�\0��H8�#�tM>{�,J+��A�{�Lb\0�@ ��}_���uW|������)Q�W����o�JPQ����JH�^�e$��f�bR��=��i�%s�e����Q��ylyĢ��)mUh�]V~�=3:�R�L�jS+X	�+#9;�S�H ��F,m��vn���0y��ʜw���hw�s���xH�ɓ��x�`\'8_��[c�f�@T��٘�*u��S)+B��J�bq=%W�[��K�?�D�\0�@ ����dz��T�������\0�X?(\r[��?RЯM���>����f�Rxx�V�U������N~�n���d��[B�.�auR�\\q¥�{�)c���>n=R\\+��]J>��K�-F�zyo���__�I����t��LyY������VS&��&������9�����U\"L��4\0�@ ��	z��VEǍ��v�x�+�\ra�-؍l��٥n3�N�\"mm^+JO���	�xҙNG�;Rvj�Qukt�@+�E\\K3<<G\'�� *SO��\n<(��g��/��/�����9�R`.WY�)����`(��#:�D�ǣ�_�L�\Z�m�6z�\0D�\0�n�@ \0����I��V�=9�b����34��5�bI�,�B[q\\V�P0�r\\���\"��e�]�}��\"�2�xN0�l�Fv�r�\"�	-�\nh2� ��*��=�Nq���G\n��U�;��8	�cJ���-:0� ��y�\n�j�E:Yj�$w��,�S��+N�8Ԩ<D3�A^;��������s��T�S1;N���J\0e~Rr{�t�:�gCl�+I�ȃ���}�cw@ \0�@y��/�\r����l[�v�L�n�-S����)��y���� RB���A��`@|���2�h\"���ԳIi(B�ȼ�v��\0Z���͗ԩ-v�q�@�ڌ(�����s=��O���P�L��� 	�Qh�Rr��y^�~����.Jꮝ�(8�kH�h�yGn-��o����\'\'Ze��ML�0�j��ے;���x,�-q��a�ˤ��!By�=�<����ޞ\nev�Ꜵ���㭫�(�P\\`�~Ka����Y�GP�J{\\�9�m��N�	W��&l퀽z.���\Z���(�y#�p����so�����,�J�?8�=z7���V2����U\nI�֦����\r�6Q桰HB@0:\0�@ �zI��7À���j�Jǚ?�#��\rV�.�(���e���G��-/�$$��� :S-���M�?(\r�a3*q@+\' c��՜��\n��o�H�e1��@ ��','5699.00','ff8081813f91b1cc013f91b68f0b0001','ff8081813f91b1cc013f91bdd8470006'),('ff8081813f91c906013f91d339c60004','846053','戴尔（DELL） PowerEdge T310服务器 (X3430 2G 500GB DVD 三年上门服务）','','戴尔（DELL） PowerEdge T310服务器','2013-06-30 05:25:06','����\0JFIF\0\0`\0`\0\0��\0C\0		\n\n\r\n\n	\r��\0C��\0\0�\0�\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\n	��\0Q\0			\0\0\0\0!1\"AQq	\n2a����#Rr���$3BS����4Cb�����%&cfu���7DV��\0\Z\0\0\0\0\0\0\0\0\0\0\0\0��\0,\0\0\0\0\0\0\01!AQa2\"q�3BR����\0\0\0?\0�������&��X�۷�\0+l�叕Y$ˊ�y���jk�jf��xfV}��[��F����7��,���պ�1�n�)��Q�oŽ\"�_\'�F�f��B��E��L4���Er�VT\0\'�m% �w���<��x(�K�<g��9��}\'/dT����oBP��A����]�������=�Q甂g�&WU\0⦄�*>����>���x���YC�J�f@�u澥6�_�sD��ґU�E,��T�y���)���~�FHx�Bz~u��˚�)���I�ɛ*E�K�<[��z��kje�B�9/��x�~&k��Ӌ���h�a�;�^#Juf�)�WT��ͻ�2G������f̪̥>��X\r����/.���L�\\Z�R�Jw$�;�>2��@@��|\0F��s���[ؓ�(-�.L��R���P&	�,���\Z�N�R�co��\r��Ѥܚ$���z�Cԉ�y��7a�Rke�Z��l��Zy�>������<\Z��1~}c��(na�.�����M�� �-��,����YൌQ�®��v�8����=��M�ܧ*�f�Rֵ-j;�I��bH����� ��:{y��\0��G#h\r�%�4�V��c��\\~E�pJ>��:zR���$��[PX�=K�ve���J%�RBA\ZI;�1����m\"�)�w8�b�6�G��O	ٔK���L��:��(\'�V�`w)WԁŕbF��/��P��4��|W5�d��\niO��:m~�=G�\n��\r��e���6�R��J��nI,��*��$P�ByIf�Sr~Ƹ������$�BY/$���M)i���0g�^xxO3�4ff��؉�g�����Fͻ4�m�ZH�v�x�x⣈fT�������N>�R��&\Z|Dr~}kV�솼��\r�/8�%��e�Gh\0N���q.@1��\0E�ʫ�/�&*9s(��I)�!	���(�#k��8BY)L�T��\'���B��L>��%Zn�*�H�� m{��l�J�\'�*r����i�P�t�O�e�{���V�]\rk�a;��������U�\'��=n���KCB\n��@�}wۥ?t.C�j�$SB�|,����]�	�?/�VdU����`-dI턝��{$��d�P�<��ݸ�4$�W��G9��4Gn�}�p	����՘�桂ewE�����%�̋v 78�Ezpm\0��\r��0\09:Vlm�W�LTry(�M��%\n@�Y:�#�I퍣�3)$�B��E���$�	������e��A\0 [ro\n�rz�6Ui���7�\0� �c��(�G��7��ot�X;�i6��t�>1��):l�격�re�E��}hueIl�k#��7\"�Y�\\�y>r#�3=W�<��؃J�eM�M�6��+{C�R$�J��+��b-c�)F7�3N}�іA�Y���hr?fn8V�[\nӖju�F���\0*T���x9��j+|��F�\'(��v�Q`O���\na7��3���	�0	!���I�Ǯ\0R��ԅ{�5�j������!K�P�$#d��,��B�[˛@n�Hf�-�]�6��a-<ˊ�Q%*R�!)P\Z��6\"�~����}��zrt�����fRڔ���z�ZA@�՘)������S\Z5H�y�}�A�u(\\0�r���C~��/����;��>����v+���{ pB���z����\"5y&P��^�/��f�ׅjdv�̥u�&�Q�G-�	��C+����	`3#�\\\0�]�\0& ���\0�٧O�5{�5�>��g�Y�V��o50�T�e��u$�k�vGN�wE�I�#5�E^�,fR%�R#��\0�*ۤ�!KM�\rIa�\r⤧gXy�zŖ#;���\n&�%2R�*�IOH��\nՃN���m�>�\\�a�#Ri�z��W�AV���Y�i�+p%\0El~�t������6���]m��d�\0mrF��l\"%Q��v!ɍ�w��\0Y�V���\Z�D�\'0��r�o�䵙I��Z�?tv<�׍��Dktr��#q�\Z����c,e7@]�ȃ������`\0	ޓ.��5{��A�}�$��Mʴ��$��l��t�J�-�\":�g�[�n��3�;�uǗ2W���c5(�C�z��.B�qS�t�����f�!]����5�\Z�JqA��\n��A;�$�$^3��I��?�Xi����C���*J���uȰ)LUR�e�7=4�j�lUr=F\'|���}�p�jmOL0���V����qu\\���GRI��5F3���u]�7�wd\r���\0\0u�V��%`^����)~�ˮ,웒��ɣ/n���\Z����0 ��S�rh�D��1R�;9��4]p	�G\Z��f�e_5^ȥ�ha�|�{!�`O�����N��U��� b@n˫}��B\nP;�����Q@�2�͋����t!��/�4�#���\'~�b4\n}B���ۦ8�S�y��n#ZR���t���	5db�X�S\\[S8҃*�~r�����X1��%���Ϊg�V�ۚZ�p��N�:u���;�T��9cD������+�q��+�s�l(�G\r�����;备���zn�8y�\nT��H$����ݷb�3lm�E�s��P�e-��$龠�哩�짒[�g��Z�89�ij�6�O%�D\'������9Q�+����5V\\s�е�Jm( ����+9X�4�\'�_�(��&󗷦��0/�^���a$~w�	�W���o�0����I���`eLK!\'����2�u�\n?T0ʵ��6GQI��_O�N���<�~f�*�)�jmIaAK�-��}=��M���Dk�|%�G�&����a��!ajL���CdX���ċB��VR�1�|^U�k����̲��5��Nߤ?�:~\r(�ĩ���Sm0/�\n�W�N�O|m�L��d�~�ؒ9@����b�6�m^q���4��y�_$L�#�����1\0Y��r�G9��\'�a�����sPS;Oɩ��@I���Z6M#���i���n\Z�2��D�1��L+�M@KzeC����]�W��Ac�A��[������O����w,ho����JV�����+�벧$\\\'�ZY2#��N�/U�чf��V\0e�[�C�����F����<�IgQ�2�Siq<*gq�$�\r���Z���.�]�}� ��䴤���T����$��J���-�)ŸRm�:R�	:TM�ߞ\Zi�c������N+u,�0$����������v�87E�\\i�|`.�����o\Z�a�������{�t��Yf����\"����R��G�1\0Y�����|�E�4|����9����L�6��\ZJ���=V���d�F5L��|����\0c@3\nh���\0w��C���a�&X#�m_�7�� wGS���}�P����?�G�\n�?$U��c���v6U,K��\r*@P#��C<��nL���~1ѡܙP\n�r� \'�VX,��2%=.�o�P>�qMqe��c��m�j74K!ۜ�j�׆��;�L����R}�%��.Qgr��E!�C?C�5�m�B���V����\\��o�@�a���	�۶X̶��&\\�<�&�e�ӭ���Х��\r�!)p��x�+�\0�!t �6��ch�QV�2�����;�#��ٔv�q�\0)�W���*�qf3�\ne��y\rY-��mw��@���Ϻ���ӭ-�E$�mk^:���7.�	��@����삆3,�pP�ޓD6�@t��(\r��{Y>�` ���!�I�d�G��H�z�˒��D�P�I<M����Ք�������L��u��I��TP��?mKS�P��O_Ϩ�W4\\��&|���ܛ<�;��A$��LR�����YBWn\ZH��1ŕh���=ͫ��k�	&YL�����K���	OI;���W�5�|�X\'���Z�#- b��A`���<Hp�%�c;���rɵ���o�5��,�!������X;hӃ�\0�bx9p����,�j����x�`�\Z&�HH�v�*��Sbl�\\\0�;�u7��\\2D54�����`�Bm\'u�}���9Rxy�K/����[�\n ��%RR���aߢ����5�ܷ�E7�*_4��@�{�}!|�}��2��&LשS��w�\'ͺ��D���\0J�G̳�w�T�\Zy_)u�,���\0��!����+ʻk�>�L\n�3.��\0:����1�ɿ�-&K�ǂ�P�\0��:P�����\0�5�|�R�<`����ݢ/���B�Ow	��排xF���u���V�A9.�?ؚ�x�\\�@F��_(�H�M�\0���r�9����n��RD��Ѽpr��ny�$]M�n\nl�1�����Җ�Wp#�D;`�h���E��>	rjS�4߱_�\0wU$��eh?�o�1_���rl��&�=�I�Cڼ� Ӕ�)�����t|mcX�P�SR�Rt�-�z��$X�J_6��J~1��LۗvvfH�L��T��*p 5�wZo�F�-R����$T��!m�ʒ�m�t#~\0���=�����\n�\n�4�����T�����ܑe����FT]�Y,��S��_�4��,�T\0�GKVf4a�uc���WȎ����9�v�;|x7���(��H�#q΍u��1|����\0��l��f`2��-��)PW�h�^�V17(��L�5�B�j�X�F����ݽ�\n����J�A�u���|R��!i/u6W�W��/�3\"�������P\r��6��{���C�)�sa����F\r���j*.KL�D��I�������Z~1q��F�ݒSg�vK�L��tn�:�;�].-B��\Z�t��.K)�̸IS{���p�P��;�7x�b+$oѦ�}*q[�xF�.[S5�K�.\n%G��N�tm���<��ݼt�\r�qey�6�r�\0\"�y��9�ލ��N��Y&�o��҇�U9�k�\0��n�VUbQ�J��W\r	��u�[����-��\'��펴�r�>A��%���9��?\\k?7P�!�\'SEC�\rBҗ�܆ي[a[��m�`�S�y�u�W���e��q�sK�P�NkM!��t�.�x��t��T@g*$$� �P~����/`���$����sK���������зZ>褋!Y���*���8���7cr#\rw��Q�isSKKum�^�;md_���닂�S�}��v�U�y�qVf}�s�-�=����$9m.\Z�*Re]`5�I��n�\0Dk��l,�c���T�u7��:R:Ctq6����sx.�FI_�\0�S>Θ�y5E�\0���\0��G�\0K��\0%pО]+-�������8;�W�(�	���P|k���\0y�4Ai���mC����%�Π[�m�ش��ڈ�ݫ:	�%R�҂?��x�xb�%I:��?HA�<k�y�ɾ�n���*k ��t	IJ��0=68�y�cE:j��]�\0d�UE\\?.���K4D1�3.̴̥m�X���ok�;��՗4��2�����)�\0**Z�z�s���lkp\\�����������k!UӹJ\r����_�t�̵SKĤ�f�K+\Z������\ZhV�\'�hrc��>�l�8��� Q��K�5��֋�	E�6����o�gY�t�꣩BI����ն��M�V�\0����\0����=Yh���J������7�.���I�3�	��!aNYג@���m���u.3���1:��TL	��H,��i��G,�6j��0�Л��v~��j�K-H���h)$_��\0g�v��X�Iwf-��\'�-\\�rI�n�k�A>�	���H疇�iG*��ur7��a\'�$T�?Z��bnI�kF�%Z���I�\Zz�r�2��k�+mM�8��:ڿ9\n\nO�mf�>\\���Kq�G���#�*P#�4��M�8\'�Rl\nnQ)IS��n�;���v-3��?#1���W\r�6p>�ѧ�-\r�O����>����TTJڦ��%�&W\r2���Kw��I�$j�$�ĭ�N.�VV�Y�6�O�kwGF���x��zh�����D\n�	�#KL���<c��ɰ���yX�Z�&�J\ZU��� ^���Q��n^I�\r��n\\x�\'r��%BU�sN��~@�2��J�^�nI���z/�m���R�S[�\r�ۻi��|:�W�x��,z�/�[R1u�g�)]>��(,U��?���]K��s*Y��H콯nG����U�ރ:��A�yW�#Wۃ�G��G,���86B$f@@~$�t�eHzB�M��H̍.��ˡ���J��\r6�&�5�5�\n��sv����WP�U��>�)@��Kd!@�pSb#X�����>|[��ǎ?3��SXbe˔4���Op6��k����A�f���l\"GI�r��>���:I>��U���ɦ���{32q�1~��.l�\\�����\0oN��7RO�K�\\�SC����b���s��&�53�U��ҽ�Gj(/��Y\0�\"�b��3��4�N`�&`L�ʡn���*�\0[���V�.�4���j5��8\n�R��%)�)�5��_hNht�R�m�~�������\n(�YB��\0$��Td�!O�	���2}-Ѩuں�v4��J����oZ,{�]�g�����	̑�*����34�jI�%>���<6%�/N�l���r�3��#6��5�%d��e�q<u7��)��F�č�ΛNM�d��$f@@@@@@\0�:D�jMR���l,YM��q\n�\r6�&�|�O�\'�Q�+pϖ=�r�ǐ�ۭ�;�Ʊ�5r^�M;�?�-1K3�y���®Zb}(��$�qһz�eվ菋��������(V���WJ��)4�|�lJ�oܨ�L^Y.�XS�^�U���e�-MP*vj�,�5g��*]D;	A�e�|T�Qx�䮱^��P�!s�|�Ԅ��}E�����>��B�pRX���}5n�Q�ձ����(�TSd���b�����.�r�O�r=�%�����+?%�)�U	Lg�O,��%]�	�F=���G��&y7a�Jn��3 ēa��r�����:���I�D��\rZ�.Y\Zd�2U,�2ԻI�����46,-��o` ��','6499.00','ff8081813f91b1cc013f91b68f0b0001','ff8081813f91b1cc013f91be91180007');
/*!40000 ALTER TABLE `md_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `md_uom`
--

DROP TABLE IF EXISTS `md_uom`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `md_uom` (
  `id` varchar(32) NOT NULL,
  `code` varchar(32) default NULL,
  `descr` varchar(255) default NULL,
  `enabled` bit(1) default NULL,
  `name` varchar(255) default NULL,
  `version` datetime default NULL,
  `category` varchar(2) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `md_uom`
--

LOCK TABLES `md_uom` WRITE;
/*!40000 ALTER TABLE `md_uom` DISABLE KEYS */;
INSERT INTO `md_uom` VALUES ('ff8081813f91b1cc013f91b5ee950000','M','1米 = 100厘米','','米','2013-06-30 04:54:01','L'),('ff8081813f91b1cc013f91b68f0b0001','PIC','片、台、个...','','台','2013-06-30 04:54:07','Q'),('ff8081813f91b1cc013f91b754070002','KG','1 公斤 = 1000 克','','公斤','2013-06-30 04:54:38','W'),('ff8081813f91b1cc013f91b7db380003','L','1 升 = 1000 毫升 = 0.001 立方米','','升','2013-06-30 04:55:12','V');
/*!40000 ALTER TABLE `md_uom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `md_vendor`
--

DROP TABLE IF EXISTS `md_vendor`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `md_vendor` (
  `id` varchar(32) NOT NULL,
  `code` varchar(32) default NULL,
  `descr` varchar(255) default NULL,
  `enabled` bit(1) default NULL,
  `name` varchar(255) default NULL,
  `version` datetime default NULL,
  `leadTimeDays` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `md_vendor`
--

LOCK TABLES `md_vendor` WRITE;
/*!40000 ALTER TABLE `md_vendor` DISABLE KEYS */;
INSERT INTO `md_vendor` VALUES ('ff8081813f91b1cc013f91bcbfae0005','IBM','International Business Machines Corporation, or IBM, is an American multinational technology and consulting corporation, with headquarters in Armonk, New York, United States.','','International Business Machines Corporation','2013-06-30 05:00:33',30),('ff8081813f91b1cc013f91bdd8470006','HP','The Hewlett-Packard Company or HP is an American multinational information technology corporation headquartered in Palo Alto, California, United States.','','The Hewlett-Packard Company','2013-06-30 05:01:45',21),('ff8081813f91b1cc013f91be91180007','DELL','Dell Inc. (formerly Dell Computer) is an American multinational computer technology corporation based in Round Rock, Texas, United States, that develops, sells, repairs and supports computers and related products and services.','','Dell Inc. (formerly Dell Computer)','2013-06-30 05:02:32',15);
/*!40000 ALTER TABLE `md_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ox_sys_dummy`
--

DROP TABLE IF EXISTS `ox_sys_dummy`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ox_sys_dummy` (
  `DTYPE` varchar(31) NOT NULL,
  `id` varchar(31) NOT NULL default 'OK',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ox_sys_dummy`
--

LOCK TABLES `ox_sys_dummy` WRITE;
/*!40000 ALTER TABLE `ox_sys_dummy` DISABLE KEYS */;
/*!40000 ALTER TABLE `ox_sys_dummy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `po_prd`
--

DROP TABLE IF EXISTS `po_prd`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `po_prd` (
  `dtlid` varchar(32) NOT NULL,
  `qty` decimal(19,2) default NULL,
  `requireDate` datetime default NULL,
  `billHead_id` varchar(32) default NULL,
  `sku_id` varchar(32) NOT NULL,
  PRIMARY KEY  (`dtlid`),
  KEY `FK8D095842AE404A5E` (`sku_id`),
  KEY `FK8D095842437CC488` (`billHead_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `po_prd`
--

LOCK TABLES `po_prd` WRITE;
/*!40000 ALTER TABLE `po_prd` DISABLE KEYS */;
INSERT INTO `po_prd` VALUES ('ff8081813f91d7ac013f91d842b40000','1.00','2013-08-05 00:00:00','ff8081813f91c906013f91d4f98c0005','ff8081813f91c906013f91cff0840002'),('ff8081813f91d7ac013f91d884ed0001','5.00','2013-07-24 00:00:00','ff8081813f91c906013f91d4f98c0005','ff8081813f91c906013f91d20d540003'),('ff8081813f91d7ac013f91d8b8860002','2.00','2013-07-18 00:00:00','ff8081813f91c906013f91d4f98c0005','ff8081813f91c906013f91d339c60004');
/*!40000 ALTER TABLE `po_prd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `po_prh`
--

DROP TABLE IF EXISTS `po_prh`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `po_prh` (
  `id` varchar(32) NOT NULL,
  `billNo` varchar(32) default NULL,
  `version` datetime default NULL,
  `applicant` varchar(64) default NULL,
  `applyDate` datetime default NULL,
  `department` varchar(64) default NULL,
  `reason` varchar(64) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `billNo` (`billNo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `po_prh`
--

LOCK TABLES `po_prh` WRITE;
/*!40000 ALTER TABLE `po_prh` DISABLE KEYS */;
INSERT INTO `po_prh` VALUES ('ff8081813f91c906013f91d4f98c0005','RQ2013001','2013-06-30 05:27:01','Tiger','2013-06-20 00:00:00','DEV','TEST Devide');
/*!40000 ALTER TABLE `po_prh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `po_prr`
--

DROP TABLE IF EXISTS `po_prr`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `po_prr` (
  `dtlid` varchar(32) NOT NULL,
  `remark` varchar(255) default NULL,
  `type` int(11) default NULL,
  `billHead_id` varchar(32) default NULL,
  PRIMARY KEY  (`dtlid`),
  KEY `FK8D095850437CC488` (`billHead_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `po_prr`
--

LOCK TABLES `po_prr` WRITE;
/*!40000 ALTER TABLE `po_prr` DISABLE KEYS */;
INSERT INTO `po_prr` VALUES ('ff8081813f91d7ac013f91d90a090003','空运',1,'ff8081813f91c906013f91d4f98c0005'),('ff8081813f91d7ac013f91d9677d0004','符合部门年度预算',3,'ff8081813f91c906013f91d4f98c0005'),('ff8081813f91d7ac013f91d9a81c0005','供应商零售价',0,'ff8081813f91c906013f91d4f98c0005');
/*!40000 ALTER TABLE `po_prr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `product` (
  `number` int(11) NOT NULL,
  `description` varchar(40) default NULL,
  `unitPrice` decimal(19,2) default NULL,
  PRIMARY KEY  (`number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-07  3:03:26
