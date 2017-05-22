/* SQL Manager Lite for MySQL                              5.6.3.49012 */
/* ------------------------------------------------------------------- */
/* Host     : localhost                                                */
/* Port     : 3306                                                     */
/* Database : so_2016                                                  */


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES 'utf8' */;

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `so_2016`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `so_2016`;

/* Struktur für die Tabelle `kunde`:  */

CREATE TABLE `kunde` (
  `kundenid` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `Nachname` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `Vorname` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`kundenid`)
) ENGINE=InnoDB
AUTO_INCREMENT=10 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Struktur für die Tabelle `kundekurs`:  */

CREATE TABLE `kundekurs` (
  `kundenid` INTEGER(11) NOT NULL,
  `kursid` INTEGER(11) NOT NULL
) ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Struktur für die Tabelle `kursart`:  */

CREATE TABLE `kursart` (
  `kursartid` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `bezeichnung` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `teilnehmermax` INTEGER(11) NOT NULL,
  PRIMARY KEY USING BTREE (`kursartid`)
) ENGINE=InnoDB
AUTO_INCREMENT=4 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Struktur für die Tabelle `kurs`:  */

CREATE TABLE `kurs` (
  `Kursid` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `kursartid` INTEGER(11) DEFAULT NULL,
  `datumUhrzeitBeginn` DATETIME DEFAULT NULL,
  `Preis` DOUBLE DEFAULT NULL,
  PRIMARY KEY USING BTREE (`Kursid`),
  KEY `kursartid` USING BTREE (`kursartid`),
  CONSTRAINT `kurs_ibfk_1` FOREIGN KEY (`kursartid`) REFERENCES `kursart` (`kursartid`)
) ENGINE=InnoDB
AUTO_INCREMENT=5 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Data for the `kunde` table  (LIMIT 0,500) */

INSERT INTO `kunde` (`kundenid`, `Nachname`, `Vorname`) VALUES
  (1,'Steinam','Karl'),
  (2,'Zobel','Christoph'),
  (3,'Wallner','Renate'),
  (4,'Sych','Gerd'),
  (5,'Zilles','Matthias'),
  (6,'Wiesinger','Silke'),
  (7,'Tröster','Karla'),
  (8,'Schellenberger','Mario'),
  (9,'Söllner','Katja');
COMMIT;

/* Data for the `kundekurs` table  (LIMIT 0,500) */

INSERT INTO `kundekurs` (`kundenid`, `kursid`) VALUES
  (1,1),
  (2,1),
  (3,1),
  (4,1),
  (5,1),
  (6,1),
  (7,2),
  (8,2),
  (9,3);
COMMIT;

/* Data for the `kursart` table  (LIMIT 0,500) */

INSERT INTO `kursart` (`kursartid`, `bezeichnung`, `teilnehmermax`) VALUES
  (1,'Handball',10),
  (2,'Fussball',10),
  (3,'Völkerball',10);
COMMIT;

/* Data for the `kurs` table  (LIMIT 0,500) */

INSERT INTO `kurs` (`Kursid`, `kursartid`, `datumUhrzeitBeginn`, `Preis`) VALUES
  (1,1,'2017-03-27 18:45:29',100),
  (2,2,'2017-03-27 18:45:29',100),
  (3,3,'2017-03-27 18:45:29',100),
  (4,1,NULL,100);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;