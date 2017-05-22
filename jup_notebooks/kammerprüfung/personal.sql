/*
MySQL Data Transfer
Source Host: localhost
Source Database: testmdb
Target Host: localhost
Target Database: testmdb
Date: 13.03.2006 21:36:11
*/

create database if not exists personal;
use personal;


SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for abteilung
-- ----------------------------
CREATE TABLE `abteilung` (
  `AbtNr` int(11) NOT NULL,
  `AbtName` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`AbtNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for gehalt
-- ----------------------------
CREATE TABLE `gehalt` (
  `MNr` int(11) NOT NULL,
  `Monatsgehalt` double default NULL,
  PRIMARY KEY  (`MNr`),
  CONSTRAINT `gehalt_ibfk_1` FOREIGN KEY (`MNr`) REFERENCES `mitarbeiter` (`MNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for kunden
-- ----------------------------
CREATE TABLE `kunden` (
  `KundenNr` int(11) NOT NULL,
  `Firma` varchar(30) collate latin1_general_ci default NULL,
  `Ansprechpartner` varchar(30) collate latin1_general_ci default NULL,
  `Strasse` varchar(30) collate latin1_general_ci default NULL,
  `Postleitzahl` varchar(20) collate latin1_general_ci default NULL,
  `Ort` varchar(30) collate latin1_general_ci default NULL,
  `Telefonnummer` varchar(20) collate latin1_general_ci default NULL,
  `Telefax` varchar(20) collate latin1_general_ci default NULL,
  `Email` varchar(30) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`KundenNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for mitarbeiter
-- ----------------------------
CREATE TABLE `mitarbeiter` (
  `MNr` int(11) NOT NULL,
  `MName` varchar(30) collate latin1_general_ci default NULL,
  `MVorname` varchar(20) collate latin1_general_ci default NULL,
  `MGeburtsdatum` datetime default NULL,
  `MGeschlecht` varchar(1) collate latin1_general_ci default NULL,
  `AbtNr` int(11) default NULL,
  `StundensatzNr` tinyint(4) default NULL,
  PRIMARY KEY  (`MNr`),
  KEY `fi0` (`AbtNr`),
  KEY `fi1` (`StundensatzNr`),
  CONSTRAINT `mitarbeiter_ibfk_1` FOREIGN KEY (`AbtNr`) REFERENCES `abteilung` (`AbtNr`),
  CONSTRAINT `mitarbeiter_ibfk_2` FOREIGN KEY (`StundensatzNr`) REFERENCES `stundensatz` (`StundensatzNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for projektbearbeitung
-- ----------------------------
CREATE TABLE `projektbearbeitung` (
  `MNr` int(11) NOT NULL,
  `ProjNr` varchar(3) collate latin1_general_ci NOT NULL,
  `Stunden` double default NULL,
  PRIMARY KEY  (`MNr`,`ProjNr`),
  KEY `fi0` (`MNr`),
  KEY `fi1` (`ProjNr`),
  CONSTRAINT `projektbearbeitung_ibfk_1` FOREIGN KEY (`MNr`) REFERENCES `mitarbeiter` (`MNr`),
  CONSTRAINT `projektbearbeitung_ibfk_2` FOREIGN KEY (`ProjNr`) REFERENCES `projekte` (`ProjektNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for projekte
-- ----------------------------
CREATE TABLE `projekte` (
  `ProjektNr` varchar(3) collate latin1_general_ci NOT NULL,
  `Projektname` varchar(20) collate latin1_general_ci default NULL,
  `KundenCode` int(11) default NULL,
  `Auftragsdatum` datetime default NULL,
  `Projektbeginn` datetime default NULL,
  `Projektende` datetime default NULL,
  `Rechnung` tinyint(4) default NULL,
  PRIMARY KEY  (`ProjektNr`),
  KEY `fi0` (`KundenCode`),
  CONSTRAINT `projekte_ibfk_1` FOREIGN KEY (`KundenCode`) REFERENCES `kunden` (`KundenNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for stundensatz
-- ----------------------------
CREATE TABLE `stundensatz` (
  `StundensatzNr` tinyint(4) NOT NULL,
  `Stundensatz` double default NULL,
  PRIMARY KEY  (`StundensatzNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `abteilung` VALUES ('1', 'Geschäftsleitung');
INSERT INTO `abteilung` VALUES ('2', 'Marketing');
INSERT INTO `abteilung` VALUES ('3', 'Verwaltung');
INSERT INTO `abteilung` VALUES ('4', 'Projektierung Produktionsplanung und -steuerung');
INSERT INTO `abteilung` VALUES ('5', 'Projektierung Kosten- und Leistungsrechnung');
INSERT INTO `gehalt` VALUES ('1', '15000');
INSERT INTO `gehalt` VALUES ('2', '10000');
INSERT INTO `gehalt` VALUES ('3', '12000');
INSERT INTO `gehalt` VALUES ('4', '10000');
INSERT INTO `gehalt` VALUES ('5', null);
INSERT INTO `gehalt` VALUES ('6', '5000');
INSERT INTO `gehalt` VALUES ('7', '10000');
INSERT INTO `gehalt` VALUES ('8', '9000');
INSERT INTO `gehalt` VALUES ('9', '9800');
INSERT INTO `gehalt` VALUES ('10', '4000');
INSERT INTO `gehalt` VALUES ('13', '8000');
INSERT INTO `gehalt` VALUES ('15', '3800');
INSERT INTO `gehalt` VALUES ('18', '4200');
INSERT INTO `gehalt` VALUES ('19', '3400');
INSERT INTO `gehalt` VALUES ('20', '9800');
INSERT INTO `gehalt` VALUES ('21', '8000');
INSERT INTO `kunden` VALUES ('1', 'FOSBOS', 'Lehmer', 'Kärnerstr. 6', '95448', 'Bayreuth', '0921/792080', '0921/34567', 'fosbos@.bayreuth.baynet.de');
INSERT INTO `kunden` VALUES ('2', 'Orgasys', 'Müller', 'Frankenstr. 45', '89745', 'Lauf', '0831/56342', '0831/56349', 'orgasys@.lauf.de');
INSERT INTO `kunden` VALUES ('3', 'Multidata', 'Konrad', 'Hofer Str. 23', '92345', 'Noringen', '0763/93261', '0763/93269', 'multidata@.noringen.de');
INSERT INTO `kunden` VALUES ('4', 'FOSPROD GmbH', 'Schuler', 'Kerschensteinerstr. 4', '95448', 'Bayreuth', '0921/758320', '0921/758290', 'fosprod@.bayreuth.de');
INSERT INTO `mitarbeiter` VALUES ('1', 'Kölbel', 'Konrad', '1950-01-29 00:00:00', 'm', '4', '3');
INSERT INTO `mitarbeiter` VALUES ('2', 'Bayerlein', 'Heinz', '1950-08-10 00:00:00', 'm', '1', '3');
INSERT INTO `mitarbeiter` VALUES ('3', 'Lorbeer', 'Werner', '1945-04-05 00:00:00', 'm', '2', '3');
INSERT INTO `mitarbeiter` VALUES ('4', 'Wiedemann', 'Albert', '1954-05-10 00:00:00', 'm', '2', '3');
INSERT INTO `mitarbeiter` VALUES ('5', 'Weishaupt', 'Paul', '1948-04-08 00:00:00', 'm', '3', '3');
INSERT INTO `mitarbeiter` VALUES ('6', 'Amann', 'Klaus', '1965-12-10 00:00:00', 'm', '4', '1');
INSERT INTO `mitarbeiter` VALUES ('7', 'Matzke', 'Wolfgang', '1953-01-08 00:00:00', 'm', '4', '3');
INSERT INTO `mitarbeiter` VALUES ('8', 'Gutfrau', 'Ursulua', '1970-09-09 00:00:00', 'w', '3', '2');
INSERT INTO `mitarbeiter` VALUES ('9', 'Müller', 'Sabine', '1975-10-01 00:00:00', 'w', '2', '1');
INSERT INTO `mitarbeiter` VALUES ('10', 'Meier', 'Monika', '1975-04-02 00:00:00', 'w', '2', '1');
INSERT INTO `mitarbeiter` VALUES ('11', 'Fromm', 'Erich', '1960-09-03 00:00:00', 'm', '2', '2');
INSERT INTO `mitarbeiter` VALUES ('12', 'Meier', 'Andrea', '1975-04-02 00:00:00', 'w', '1', '2');
INSERT INTO `mitarbeiter` VALUES ('13', 'Kaiser', 'Hans', '1974-12-10 00:00:00', 'm', '4', '1');
INSERT INTO `mitarbeiter` VALUES ('14', 'Bund', 'Karin', '1975-11-11 00:00:00', 'w', '3', '3');
INSERT INTO `mitarbeiter` VALUES ('15', 'Stubenrauch', 'Martin', '1970-01-09 00:00:00', 'm', '2', '1');
INSERT INTO `mitarbeiter` VALUES ('16', 'Zimmermann', 'Ludwig', '1966-12-12 00:00:00', 'm', '2', '2');
INSERT INTO `mitarbeiter` VALUES ('17', 'Umbrecher', 'Jochen', '1974-05-04 00:00:00', 'm', '2', '1');
INSERT INTO `mitarbeiter` VALUES ('18', 'Grüner', 'Bernd', '1972-09-09 00:00:00', 'm', '3', '2');
INSERT INTO `mitarbeiter` VALUES ('19', 'Sieber', 'Daniela', '1978-04-02 00:00:00', 'w', '3', '1');
INSERT INTO `mitarbeiter` VALUES ('20', 'Wunsch', 'Werner', '1959-03-09 00:00:00', 'm', '5', '1');
INSERT INTO `mitarbeiter` VALUES ('21', 'Riem', 'Gerhard', '1968-01-02 00:00:00', 'm', '5', '2');
INSERT INTO `mitarbeiter` VALUES ('22', 'Senso', 'Chen', null, null, null, '2');
INSERT INTO `projektbearbeitung` VALUES ('1', 'A1', '3');
INSERT INTO `projektbearbeitung` VALUES ('1', 'A2', '3');
INSERT INTO `projektbearbeitung` VALUES ('2', 'A10', '2');
INSERT INTO `projektbearbeitung` VALUES ('2', 'A11', '5');
INSERT INTO `projektbearbeitung` VALUES ('2', 'A2', '3');
INSERT INTO `projektbearbeitung` VALUES ('6', 'A10', '5');
INSERT INTO `projektbearbeitung` VALUES ('6', 'A2', '6');
INSERT INTO `projektbearbeitung` VALUES ('7', 'A11', '30');
INSERT INTO `projektbearbeitung` VALUES ('11', 'A10', '15');
INSERT INTO `projektbearbeitung` VALUES ('11', 'A11', '3');
INSERT INTO `projektbearbeitung` VALUES ('14', 'A1', '10');
INSERT INTO `projektbearbeitung` VALUES ('15', 'A1', '10');
INSERT INTO `projektbearbeitung` VALUES ('15', 'A2', '20');
INSERT INTO `projektbearbeitung` VALUES ('18', 'A2', '2');
INSERT INTO `projektbearbeitung` VALUES ('22', 'A10', '3');
INSERT INTO `projekte` VALUES ('A1', 'PKR', '2', '1998-08-16 00:00:00', '1998-08-17 00:00:00', '1998-09-13 00:00:00', '1');
INSERT INTO `projekte` VALUES ('A10', 'Unternehmensmodell_B', '3', '1998-02-18 00:00:00', '1998-02-24 00:00:00', '1998-07-30 00:00:00', '1');
INSERT INTO `projekte` VALUES ('A11', 'PKR', '1', '1998-02-17 00:00:00', '1998-02-18 00:00:00', '1998-05-30 00:00:00', '1');
INSERT INTO `projekte` VALUES ('A2', 'DBR mehrstufig', '3', '1998-02-20 00:00:00', '1998-02-25 00:00:00', '1998-04-28 00:00:00', '0');
INSERT INTO `projekte` VALUES ('A3', 'PPS_MX', null, null, null, null, '0');
INSERT INTO `projekte` VALUES ('A4', 'PPS_XL', null, null, null, null, '0');
INSERT INTO `projekte` VALUES ('A5', 'BAB', null, null, null, null, '0');
INSERT INTO `projekte` VALUES ('A6', 'KTRZ', null, null, null, null, '0');
INSERT INTO `projekte` VALUES ('A7', 'BDE', null, null, null, null, '0');
INSERT INTO `projekte` VALUES ('A8', 'PPS_BAT', null, null, null, null, '0');
INSERT INTO `projekte` VALUES ('A9', 'PPS_FOS', '4', '1998-02-28 00:00:00', '1998-03-02 00:00:00', null, '0');
INSERT INTO `stundensatz` VALUES ('1', '150');
INSERT INTO `stundensatz` VALUES ('2', '180');
INSERT INTO `stundensatz` VALUES ('3', '200');
