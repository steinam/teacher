/* SQL Manager Lite for MySQL                              5.6.3.49012 */
/* ------------------------------------------------------------------- */
/* Host     : localhost                                                */
/* Port     : 3306                                                     */
/* Database : sommer_2014                                              */


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES 'utf8' */;

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `sommer_2014`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `sommer_2014`;

/* Struktur für die Tabelle `artikel`:  */

CREATE TABLE `artikel` (
  `Art_ID` INTEGER(11) NOT NULL,
  `Art_Nummer` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `Art_Bezeichnung` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `Art_Preis` DOUBLE DEFAULT NULL,
  PRIMARY KEY USING BTREE (`Art_ID`)
) ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Struktur für die Tabelle `kunde`:  */

CREATE TABLE `kunde` (
  `Kd_ID` INTEGER(11) NOT NULL,
  `Kd_Firma` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `Kd_Strasse` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `Kd_PLZ` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `Kd_Ort` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`Kd_ID`)
) ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Struktur für die Tabelle `rechnung`:  */

CREATE TABLE `rechnung` (
  `Rg_ID` INTEGER(11) NOT NULL,
  `Rg_Kd_ID` INTEGER(11) DEFAULT NULL,
  `Rg_Datum` DATE DEFAULT NULL,
  `Rg_Nummer` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`Rg_ID`),
  KEY `Rg_Kd_ID` USING BTREE (`Rg_Kd_ID`),
  CONSTRAINT `rechnung_ibfk_1` FOREIGN KEY (`Rg_Kd_ID`) REFERENCES `kunde` (`Kd_ID`)
) ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Struktur für die Tabelle `rechnungsposition`:  */

CREATE TABLE `rechnungsposition` (
  `RgPos_ID` INTEGER(11) NOT NULL,
  `RgPos_RgID` INTEGER(11) DEFAULT NULL,
  `RgPos_ArtID` INTEGER(11) DEFAULT NULL,
  `RgPos_Menge` INTEGER(11) DEFAULT NULL,
  `RgPos_Preis` DOUBLE DEFAULT NULL,
  PRIMARY KEY USING BTREE (`RgPos_ID`),
  KEY `RgPos_RgID` USING BTREE (`RgPos_RgID`),
  KEY `RgPos_ArtID` USING BTREE (`RgPos_ArtID`),
  CONSTRAINT `rechnungsposition_fk1` FOREIGN KEY (`RgPos_RgID`) REFERENCES `rechnung` (`Rg_ID`),
  CONSTRAINT `rechnungsposition_fk2` FOREIGN KEY (`RgPos_ArtID`) REFERENCES `artikel` (`Art_ID`)
) ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Data for the `artikel` table  (LIMIT 0,500) */

INSERT INTO `artikel` (`Art_ID`, `Art_Nummer`, `Art_Bezeichnung`, `Art_Preis`) VALUES
  (1,'IB767126','Bosko_Schmerzmittel',10.5),
  (2,'HM67C7','Lidor Kamillentee',3.2),
  (3,'87876234-IK','Schnarr Rachendrops',4);
COMMIT;

/* Data for the `kunde` table  (LIMIT 0,500) */

INSERT INTO `kunde` (`Kd_ID`, `Kd_Firma`, `Kd_Strasse`, `Kd_PLZ`, `Kd_Ort`) VALUES
  (1,'STE AG',NULL,'98765',NULL),
  (2,'SYC AG',NULL,'87654',NULL),
  (3,'SMA AG',NULL,'76543',NULL),
  (4,'ZOB AG',NULL,'65432',NULL);
COMMIT;

/* Data for the `rechnung` table  (LIMIT 0,500) */

INSERT INTO `rechnung` (`Rg_ID`, `Rg_Kd_ID`, `Rg_Datum`, `Rg_Nummer`) VALUES
  (1,1,'2017-05-02','r-0815'),
  (2,1,'2017-05-02','r-0816'),
  (3,2,'2017-05-02','r-0817'),
  (4,3,'2017-05-02','r-0818'),
  (5,4,'2017-05-02','r-0819');
COMMIT;

/* Data for the `rechnungsposition` table  (LIMIT 0,500) */

INSERT INTO `rechnungsposition` (`RgPos_ID`, `RgPos_RgID`, `RgPos_ArtID`, `RgPos_Menge`, `RgPos_Preis`) VALUES
  (1,1,1,234,10.8),
  (2,1,2,200,11.8),
  (3,2,1,100,1.8),
  (4,4,2,100,1.8),
  (5,3,3,100,3.8),
  (6,5,3,150,4.8);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;