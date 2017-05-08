/* SQL Manager Lite for MySQL                              5.6.3.49012 */
/* ------------------------------------------------------------------- */
/* Host     : localhost                                                */
/* Port     : 3306                                                     */
/* Database : winter_2015                                              */


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES 'utf8' */;

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `winter_2015`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `winter_2015`;

/* Struktur für die Tabelle `kunde`:  */

CREATE TABLE `kunde` (
  `Kd_ID` VARCHAR(20) COLLATE utf8_general_ci NOT NULL,
  `Kd_Name` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `Kd_Zb_ID` INTEGER(11) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`Kd_ID`)
) ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Struktur für die Tabelle `rechnung`:  */

CREATE TABLE `rechnung` (
  `Rg_ID` INTEGER(11) NOT NULL,
  `Rg_KD_ID` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `Rg_Datum` DATE DEFAULT NULL,
  PRIMARY KEY USING BTREE (`Rg_ID`),
  KEY `Rg_KD_ID` USING BTREE (`Rg_KD_ID`),
  CONSTRAINT `rechnung_ibfk_1` FOREIGN KEY (`Rg_KD_ID`) REFERENCES `kunde` (`Kd_ID`)
) ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Struktur für die Tabelle `zahlungsbedingung`:  */

CREATE TABLE `zahlungsbedingung` (
  `Zb_ID` INTEGER(11) NOT NULL,
  `Zb_Text` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `Zb_SkontoProzent` DOUBLE DEFAULT NULL,
  PRIMARY KEY USING BTREE (`Zb_ID`)
) ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Data for the `kunde` table  (LIMIT 0,500) */

INSERT INTO `kunde` (`Kd_ID`, `Kd_Name`, `Kd_Zb_ID`) VALUES
  ('K002351','Peters',1),
  ('K006423','Mustermann',1),
  ('K007654','Hinkel',3);
COMMIT;

/* Data for the `rechnung` table  (LIMIT 0,500) */

INSERT INTO `rechnung` (`Rg_ID`, `Rg_KD_ID`, `Rg_Datum`) VALUES
  (1,'K006423','2015-03-10'),
  (2,'K006423','2015-04-10'),
  (3,'K006423','2015-05-10'),
  (4,'K006423','2015-06-10'),
  (5,'K006423','2016-03-10'),
  (6,'K002351','2015-03-10'),
  (7,'K002351','2015-03-10'),
  (8,'K002351','2016-03-10'),
  (9,'K007654','2015-03-10'),
  (10,'K007654','2016-03-10');
COMMIT;

/* Data for the `zahlungsbedingung` table  (LIMIT 0,500) */

INSERT INTO `zahlungsbedingung` (`Zb_ID`, `Zb_Text`, `Zb_SkontoProzent`) VALUES
  (1,NULL,3.4),
  (2,NULL,3.2),
  (3,NULL,1.5);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;