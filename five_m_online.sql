-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 19. Sep 2017 um 18:15
-- Server Version: 5.5.57-0+deb8u1
-- PHP-Version: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `five_m_online`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bans`
--

CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(10) unsigned NOT NULL,
  `banned` varchar(50) NOT NULL DEFAULT '0',
  `banner` varchar(50) NOT NULL,
  `reason` varchar(150) NOT NULL DEFAULT '0',
  `expires` datetime NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `businesses`
--

CREATE TABLE IF NOT EXISTS `businesses` (
  `id` int(11) NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '0',
  `owner` varchar(255) NOT NULL DEFAULT '0',
  `price` int(255) NOT NULL DEFAULT '0',
  `income` int(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `crews`
--

CREATE TABLE IF NOT EXISTS `crews` (
  `owner` varchar(255) CHARACTER SET utf8 NOT NULL,
  `members` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `invitations` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `flags` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `level` int(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `garages`
--

CREATE TABLE IF NOT EXISTS `garages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `x` decimal(10,2) NOT NULL,
  `y` decimal(10,2) NOT NULL,
  `z` decimal(10,2) NOT NULL,
  `price` int(11) NOT NULL,
  `blip_colour` int(255) NOT NULL,
  `blip_id` int(255) NOT NULL,
  `slot` int(255) NOT NULL,
  `available` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `garages`
--

INSERT INTO `garages` (`id`, `name`, `x`, `y`, `z`, `price`, `blip_colour`, `blip_id`, `slot`, `available`) VALUES
(1, 'GreenWich 1', -1087.14, -2232.71, 12.23, 120000, 3, 369, 10, 'on'),
(2, 'GreenWich 2', -1096.78, -2222.89, 12.23, 120000, 3, 369, 10, 'on'),
(3, 'Exceptionalists 1', -666.51, -2379.42, 12.89, 120000, 3, 369, 10, 'on'),
(4, 'Exceptionalists 2', -673.16, -2391.26, 12.90, 120000, 3, 369, 10, 'on'),
(5, 'South Shambles', 1027.35, -2398.38, 28.87, 120000, 3, 369, 10, 'on'),
(6, 'Olympic Freeway 1', -221.11, -1162.51, 22.02, 120000, 3, 369, 10, 'on'),
(7, 'Olympic Freeway 2', -41.88, -1235.24, 28.38, 25000, 3, 369, 2, 'on'),
(8, 'Olympic Freeway 3', -41.79, -1242.01, 28.34, 25000, 3, 369, 2, 'on'),
(9, 'Olympic Freeway 4', -42.16, -1252.35, 28.27, 25000, 3, 369, 2, 'on'),
(10, 'Olympic Fury', 841.65, -1162.91, 24.27, 70000, 3, 369, 6, 'on'),
(11, 'Murrieta Heights 1', 964.78, -1031.05, 39.84, 150000, 3, 369, 10, 'on'),
(12, 'Murrieta Heights 2', 964.77, -1025.43, 39.85, 150000, 3, 369, 10, 'on'),
(13, 'Murrieta Heights 3', 964.75, -1019.79, 39.85, 150000, 3, 369, 10, 'on'),
(14, 'Murrieta Heights 4', 964.70, -1014.04, 39.85, 150000, 3, 369, 10, 'on'),
(15, 'Popular Street 1', 815.13, -923.22, 25.14, 200000, 3, 369, 15, 'on'),
(16, 'Popular Street 2', 819.65, -922.89, 25.12, 200000, 3, 369, 15, 'on'),
(17, 'Golden Garages', -791.74, 333.14, 84.70, 1500000, 3, 369, 99, 'off'),
(18, 'Joshua Road', 190.31, 2787.02, 44.61, 60000, 3, 369, 6, 'on'),
(19, 'Route 68 1', 639.22, 2773.21, 41.02, 30000, 3, 369, 2, 'on'),
(20, 'Route 68 2', 644.25, 2791.79, 40.95, 30000, 3, 369, 2, 'on'),
(21, 'Paleto Blvd', -244.24, 6238.69, 30.49, 35000, 3, 369, 2, 'on'),
(22, 'Public Garage', 214.12, -791.38, 29.65, 0, 3, 357, 1, 'on'),
(1, 'GreenWich 1', -1087.14, -2232.71, 12.23, 120000, 3, 369, 10, 'on'),
(2, 'GreenWich 2', -1096.78, -2222.89, 12.23, 120000, 3, 369, 10, 'on'),
(3, 'Exceptionalists 1', -666.51, -2379.42, 12.89, 120000, 3, 369, 10, 'on'),
(4, 'Exceptionalists 2', -673.16, -2391.26, 12.90, 120000, 3, 369, 10, 'on'),
(5, 'South Shambles', 1027.35, -2398.38, 28.87, 120000, 3, 369, 10, 'on'),
(6, 'Olympic Freeway 1', -221.11, -1162.51, 22.02, 120000, 3, 369, 10, 'on'),
(7, 'Olympic Freeway 2', -41.88, -1235.24, 28.38, 25000, 3, 369, 2, 'on'),
(8, 'Olympic Freeway 3', -41.79, -1242.01, 28.34, 25000, 3, 369, 2, 'on'),
(9, 'Olympic Freeway 4', -42.16, -1252.35, 28.27, 25000, 3, 369, 2, 'on'),
(10, 'Olympic Fury', 841.65, -1162.91, 24.27, 70000, 3, 369, 6, 'on'),
(11, 'Murrieta Heights 1', 964.78, -1031.05, 39.84, 150000, 3, 369, 10, 'on'),
(12, 'Murrieta Heights 2', 964.77, -1025.43, 39.85, 150000, 3, 369, 10, 'on'),
(13, 'Murrieta Heights 3', 964.75, -1019.79, 39.85, 150000, 3, 369, 10, 'on'),
(14, 'Murrieta Heights 4', 964.70, -1014.04, 39.85, 150000, 3, 369, 10, 'on'),
(15, 'Popular Street 1', 815.13, -923.22, 25.14, 200000, 3, 369, 15, 'on'),
(16, 'Popular Street 2', 819.65, -922.89, 25.12, 200000, 3, 369, 15, 'on'),
(17, 'Golden Garages', -791.74, 333.14, 84.70, 1500000, 3, 369, 99, 'off'),
(18, 'Joshua Road', 190.31, 2787.02, 44.61, 60000, 3, 369, 6, 'on'),
(19, 'Route 68 1', 639.22, 2773.21, 41.02, 30000, 3, 369, 2, 'on'),
(20, 'Route 68 2', 644.25, 2791.79, 40.95, 30000, 3, 369, 2, 'on'),
(21, 'Paleto Blvd', -244.24, 6238.69, 30.49, 35000, 3, 369, 2, 'on'),
(22, 'Public Garage', 214.12, -791.38, 29.65, 0, 3, 357, 1, 'on');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `modelmenu`
--

CREATE TABLE IF NOT EXISTS `modelmenu` (
  `identifier` varchar(50) DEFAULT NULL,
  `model` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT 'a_m_m_acult_01',
  `percing` int(11) NOT NULL DEFAULT '1',
  `percing_txt` int(11) NOT NULL DEFAULT '1',
  `glasses` int(11) NOT NULL DEFAULT '1',
  `glasses_txt` int(11) NOT NULL DEFAULT '1',
  `helmet` int(11) NOT NULL DEFAULT '1',
  `helmet_txt` int(11) NOT NULL DEFAULT '1',
  `mask` int(11) NOT NULL DEFAULT '0',
  `mask_txt` int(11) NOT NULL DEFAULT '0',
  `head` int(11) NOT NULL DEFAULT '0',
  `hair` int(11) NOT NULL DEFAULT '0',
  `hair_colour` int(11) NOT NULL DEFAULT '0',
  `shirt` int(11) NOT NULL DEFAULT '0',
  `shirt_txt` int(11) NOT NULL DEFAULT '0',
  `hand` int(11) NOT NULL DEFAULT '0',
  `shoe` int(11) NOT NULL DEFAULT '0',
  `shoe_txt` int(11) NOT NULL DEFAULT '0',
  `pants` int(11) NOT NULL DEFAULT '0',
  `pants_txt` int(11) NOT NULL DEFAULT '0',
  `undershirt` int(11) NOT NULL DEFAULT '0',
  `undershirt_txt` int(11) NOT NULL DEFAULT '0',
  `armour` int(11) NOT NULL DEFAULT '0',
  `armour_txt` int(11) NOT NULL DEFAULT '0',
  `mpmodel` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `outfits`
--

CREATE TABLE IF NOT EXISTS `outfits` (
  `identifier` varchar(30) NOT NULL,
  `skin` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT 'mp_m_freemode_01',
  `face` int(11) NOT NULL DEFAULT '0',
  `face_text` int(11) NOT NULL DEFAULT '0',
  `hair` int(11) NOT NULL DEFAULT '0',
  `hair_text` int(11) NOT NULL DEFAULT '0',
  `pants` int(11) NOT NULL DEFAULT '0',
  `pants_text` int(11) NOT NULL DEFAULT '0',
  `shoes` int(11) NOT NULL DEFAULT '0',
  `shoes_text` int(11) NOT NULL DEFAULT '0',
  `torso` int(11) NOT NULL DEFAULT '0',
  `torso_text` int(11) NOT NULL DEFAULT '0',
  `shirt` int(11) NOT NULL DEFAULT '0',
  `shirt_text` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `robbables`
--

CREATE TABLE IF NOT EXISTS `robbables` (
  `id` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `name` varchar(250) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `jackpot` int(200) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `stationaryradar`
--

CREATE TABLE IF NOT EXISTS `stationaryradar` (
  `x` double(8,2) NOT NULL,
  `y` double(8,2) NOT NULL,
  `z` double(8,2) NOT NULL,
  `maxspeed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `stationaryradar_permissions`
--

CREATE TABLE IF NOT EXISTS `stationaryradar_permissions` (
  `steamid` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `permission_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(255) NOT NULL,
  `identifier` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `group` varchar(50) NOT NULL DEFAULT '0',
  `permission_level` int(255) NOT NULL,
  `money` int(255) NOT NULL,
  `weapons` varchar(5000) NOT NULL,
  `personalvehicle` varchar(10000) NOT NULL,
  `personalair` varchar(535) NOT NULL,
  `withdraw_cost` int(10) NOT NULL,
  `lastpos` varchar(255) DEFAULT '{-887.48388671875, -2311.68872070313,  -3.50776553153992, 142.503463745117}',
  `bankbalance` int(32) DEFAULT '0',
  `player_state` int(255) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `banned` int(255) DEFAULT NULL,
  `admin` int(255) DEFAULT NULL,
  `kills` int(255) NOT NULL,
  `deaths` int(255) NOT NULL,
  `pv_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_garage`
--

CREATE TABLE IF NOT EXISTS `user_garage` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `garage_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_heli`
--

CREATE TABLE IF NOT EXISTS `user_heli` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `heli_name` varchar(255) DEFAULT NULL,
  `heli_model` varchar(255) DEFAULT NULL,
  `heli_price` int(60) DEFAULT NULL,
  `heli_plate` varchar(255) DEFAULT NULL,
  `heli_state` varchar(255) DEFAULT NULL,
  `heli_colorprimary` varchar(255) DEFAULT NULL,
  `heli_colorsecondary` varchar(255) DEFAULT NULL,
  `heli_pearlescentcolor` varchar(255) DEFAULT NULL,
  `heli_wheelcolor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_vehicle`
--

CREATE TABLE IF NOT EXISTS `user_vehicle` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `garage_id` int(255) DEFAULT NULL,
  `vehicle_name` varchar(60) DEFAULT NULL,
  `vehicle_model` varchar(60) DEFAULT NULL,
  `vehicle_price` int(60) DEFAULT NULL,
  `vehicle_plate` varchar(60) DEFAULT NULL,
  `vehicle_state` varchar(60) DEFAULT NULL,
  `vehicle_colorprimary` varchar(60) DEFAULT NULL,
  `vehicle_colorsecondary` varchar(60) DEFAULT NULL,
  `vehicle_pearlescentcolor` varchar(60) DEFAULT NULL,
  `vehicle_wheelcolor` varchar(60) DEFAULT NULL,
  `vehicle_plateindex` varchar(255) DEFAULT NULL,
  `vehicle_neoncolor1` varchar(255) DEFAULT NULL,
  `vehicle_neoncolor2` varchar(255) DEFAULT NULL,
  `vehicle_neoncolor3` varchar(25) DEFAULT NULL,
  `vehicle_windowtint` varchar(255) DEFAULT NULL,
  `vehicle_wheeltype` varchar(255) DEFAULT NULL,
  `vehicle_mods0` varchar(255) DEFAULT NULL,
  `vehicle_mods1` varchar(255) DEFAULT NULL,
  `vehicle_mods2` varchar(255) DEFAULT NULL,
  `vehicle_mods3` varchar(255) DEFAULT NULL,
  `vehicle_mods4` varchar(255) DEFAULT NULL,
  `vehicle_mods5` varchar(255) DEFAULT NULL,
  `vehicle_mods6` varchar(255) DEFAULT NULL,
  `vehicle_mods7` varchar(255) DEFAULT NULL,
  `vehicle_mods8` varchar(255) DEFAULT NULL,
  `vehicle_mods9` varchar(255) DEFAULT NULL,
  `vehicle_mods10` varchar(255) DEFAULT NULL,
  `vehicle_mods11` varchar(255) DEFAULT NULL,
  `vehicle_mods12` varchar(255) DEFAULT NULL,
  `vehicle_mods13` varchar(255) DEFAULT NULL,
  `vehicle_mods14` varchar(255) DEFAULT NULL,
  `vehicle_mods15` varchar(255) DEFAULT NULL,
  `vehicle_mods16` varchar(255) DEFAULT NULL,
  `vehicle_turbo` varchar(255) NOT NULL DEFAULT 'off',
  `vehicle_tiresmoke` varchar(255) NOT NULL DEFAULT 'off',
  `vehicle_xenon` varchar(255) NOT NULL DEFAULT 'off',
  `vehicle_mods23` varchar(255) DEFAULT NULL,
  `vehicle_mods24` varchar(255) DEFAULT NULL,
  `vehicle_neon0` varchar(255) DEFAULT NULL,
  `vehicle_neon1` varchar(255) DEFAULT NULL,
  `vehicle_neon2` varchar(255) DEFAULT NULL,
  `vehicle_neon3` varchar(255) DEFAULT NULL,
  `vehicle_bulletproof` varchar(255) DEFAULT NULL,
  `vehicle_smokecolor1` varchar(255) DEFAULT NULL,
  `vehicle_smokecolor2` varchar(255) DEFAULT NULL,
  `vehicle_smokecolor3` varchar(255) DEFAULT NULL,
  `vehicle_modvariation` varchar(255) NOT NULL DEFAULT 'off',
  `insurance` varchar(255) DEFAULT 'off',
  `instance` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_vehicles`
--

CREATE TABLE IF NOT EXISTS `user_vehicles` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `vehicles_name` varchar(255) DEFAULT NULL,
  `vehicles_model` varchar(255) DEFAULT NULL,
  `vehicles_price` int(60) DEFAULT NULL,
  `vehicles_plate` varchar(255) DEFAULT NULL,
  `vehicles_state` varchar(255) DEFAULT NULL,
  `tyresmoke` varchar(45) DEFAULT '255,255,255',
  `mod0` varchar(45) DEFAULT '-1',
  `mod1` varchar(45) DEFAULT '-1',
  `mod2` varchar(45) DEFAULT '-1',
  `mod3` varchar(45) DEFAULT '-1',
  `mod4` varchar(45) DEFAULT '-1',
  `mod5` varchar(45) DEFAULT '-1',
  `mod6` varchar(45) DEFAULT '-1',
  `mod7` varchar(45) DEFAULT '-1',
  `mod8` varchar(45) DEFAULT '-1',
  `mod9` varchar(45) DEFAULT '-1',
  `mod10` varchar(45) DEFAULT '-1',
  `mod11` varchar(45) DEFAULT '-1',
  `mod12` varchar(45) DEFAULT '-1',
  `mod13` varchar(45) DEFAULT '-1',
  `mod14` varchar(45) DEFAULT '-1',
  `mod15` varchar(45) DEFAULT '-1',
  `mod16` varchar(45) DEFAULT '-1',
  `mod17` varchar(45) DEFAULT '-1',
  `mod18` varchar(45) DEFAULT '-1',
  `mod19` varchar(45) DEFAULT '-1',
  `mod20` varchar(45) DEFAULT '-1',
  `mod21` varchar(45) DEFAULT '-1',
  `mod22` varchar(45) DEFAULT '-1',
  `mod23` varchar(45) DEFAULT '-1',
  `mod24` varchar(45) DEFAULT '-1',
  `vehicles_colorprimary` varchar(60) DEFAULT NULL,
  `vehicles_colorsecondary` varchar(60) DEFAULT NULL,
  `vehicles_pearlescentcolor` varchar(60) DEFAULT NULL,
  `vehicles_wheelcolor` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_weapons`
--

CREATE TABLE IF NOT EXISTS `user_weapons` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `weapon_model` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `withdraw_cost` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
