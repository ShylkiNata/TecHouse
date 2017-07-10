-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Май 18 2015 г., 08:39
-- Версия сервера: 5.6.17
-- Версия PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `online_shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `fan_heater`
--

CREATE TABLE IF NOT EXISTS `fan_heater` (
  `Number` int(5) NOT NULL AUTO_INCREMENT,
  `Code` int(5) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Picture` tinytext CHARACTER SET cp1251 NOT NULL,
  `Name` tinytext NOT NULL,
  `Price` mediumint(6) NOT NULL,
  `Guarantee` tinyint(2) NOT NULL,
  `Power` smallint(4) NOT NULL,
  `Dimensions` varchar(25) CHARACTER SET cp1251 NOT NULL,
  `Modes` tinyint(2) NOT NULL,
  `Heating_element` varchar(20) CHARACTER SET cp1251 NOT NULL,
  PRIMARY KEY (`Number`,`Code`),
  UNIQUE KEY `Number` (`Number`,`Code`),
  UNIQUE KEY `Number_2` (`Number`,`Code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `fan_heater`
--

INSERT INTO `fan_heater` (`Number`, `Code`, `Status`, `Picture`, `Name`, `Price`, `Guarantee`, `Power`, `Dimensions`, `Modes`, `Heating_element`) VALUES
(1, 1000, 0, '<img src="/Appliance/src/View/fen_heater/1.jpg" height="150"/>', 'Тепловентилятор MYSTERY MCH-1012', 280, 12, 2000, '22.3 х 13 х 26 см', 4, 'нихромовая спираль'),
(2, 1001, 0, '<img src="/Appliance/src/View/fen_heater/2.jpg" height="150"/>', 'Тепловентилятор BALLU BFH/C-30', 599, 12, 1500, '18 х 26 х16.5 см', 1, 'керамические пластин'),
(3, 1002, 1, '<img src="/Appliance/src/View/fen_heater/3.jpg" height="150"/>', 'Тепловентилятор DELONGHI HVK 1010 ', 429, 12, 2000, '23 x 16 х 24 см', 2, 'ТЭН'),
(4, 7003, 1, '<img src="/Appliance/src/View/fen_heater/4.jpg" height="150"/>', 'Тепловентилятор VES ELECTRIC V-FH8', 759, 12, 2000, '22 х 17 х 9 см', 2, 'спираль'),
(5, 7004, 0, '<img src="/Appliance/src/View/fen_heater/5.jpg" height="150"/>', 'http://bt.rozetka.com.ua/mystery-mch-1009/p319941/', 499, 12, 1500, '25 х 25 х31.3 см', 2, 'керамический');

-- --------------------------------------------------------

--
-- Структура таблицы `fen`
--

CREATE TABLE IF NOT EXISTS `fen` (
  `Number` int(5) NOT NULL AUTO_INCREMENT,
  `Code` int(5) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Picture` tinytext CHARACTER SET cp1251 NOT NULL,
  `Name` tinytext CHARACTER SET cp1251 NOT NULL,
  `Price` mediumint(6) NOT NULL,
  `Guarantee` tinyint(2) NOT NULL,
  `Power` smallint(4) NOT NULL,
  `Speed_modes` tinyint(1) NOT NULL,
  `Temperature_modes` tinyint(1) NOT NULL,
  `Hub` tinytext CHARACTER SET latin1 NOT NULL,
  `Cold_air` tinytext CHARACTER SET latin1 NOT NULL,
  `Ion` tinytext CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`Number`,`Code`),
  UNIQUE KEY `Number` (`Number`,`Code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `fen`
--

INSERT INTO `fen` (`Number`, `Code`, `Status`, `Picture`, `Name`, `Price`, `Guarantee`, `Power`, `Speed_modes`, `Temperature_modes`, `Hub`, `Cold_air`, `Ion`) VALUES
(1, 2000, 0, '<img src="/Appliance/src/View/fen/1.jpg" height="150"/>', 'Фен BRAUN Satin Hair 7 HD780', 1499, 24, 2000, 2, 4, '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>'),
(2, 2001, 1, '<img src="/Appliance/src/View/fen/2.jpg" height="150"/>', 'Фен ROWENTA CV4731', 399, 24, 2200, 5, 6, '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>'),
(3, 2002, 0, '<img src="/Appliance/src/View/fen/3.jpg" height="150"/>', 'Фен PHILIPS BHD006/00', 299, 24, 1600, 3, 3, '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', ''),
(4, 2003, 0, '<img src="/Appliance/src/View/fen/4.jpg" height="150"/>', 'Фен ROWENTA CV7730D0', 599, 24, 2300, 6, 6, '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>'),
(5, 2004, 0, '<img src="/Appliance/src/View/fen/5.jpg" height="150"/>', 'Фен BOSCH PHD 5987', 699, 24, 2200, 2, 3, '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>');

-- --------------------------------------------------------

--
-- Структура таблицы `iron`
--

CREATE TABLE IF NOT EXISTS `iron` (
  `Number` int(5) NOT NULL AUTO_INCREMENT,
  `Code` int(5) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Picture` tinytext CHARACTER SET cp1251 NOT NULL,
  `Name` tinytext CHARACTER SET cp1251 NOT NULL,
  `Price` mediumint(6) NOT NULL,
  `Guarantee` tinyint(2) NOT NULL,
  `Capacity` smallint(4) NOT NULL,
  `Steam_boost` smallint(3) NOT NULL,
  `Sole` tinytext CHARACTER SET cp1251 NOT NULL,
  `Water_tank` smallint(3) NOT NULL,
  `Cord_length` float NOT NULL,
  `Feature` longtext CHARACTER SET cp1251 NOT NULL,
  PRIMARY KEY (`Number`,`Code`),
  UNIQUE KEY `Number` (`Number`,`Code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `iron`
--

INSERT INTO `iron` (`Number`, `Code`, `Status`, `Picture`, `Name`, `Price`, `Guarantee`, `Capacity`, `Steam_boost`, `Sole`, `Water_tank`, `Cord_length`, `Feature`) VALUES
(1, 3000, 0, '<img src="/Appliance/src/View/iron/1.jpg" height="150"/>', 'Утюг PHILIPS GC-4870', 1999, 24, 2600, 170, 'Steam Glide', 350, 2, '- индикатор нагрева; \r\n- система "капля-стоп"; \r\n- система anticalc; \r\n- автоматическое отключение'),
(2, 3001, 1, '<img src="/Appliance/src/View/iron/2.jpg" height="150"/>', 'Утюг BRAUN TS 345 SI', 499, 24, 2000, 100, 'керамика', 300, 2.5, '- самоочистка от накипи; \r\n- система anticalc'),
(3, 3002, 1, '<img src="/Appliance/src/View/iron/3.jpg" height="150"/>', 'Утюг PHILIPS GC4520/30', 1999, 24, 2600, 190, 'T-ionicGlide', 300, 2, '- система "капля-стоп"; \r\n- самоочистка от накипи; \r\n- автоматическое отключение'),
(4, 3003, 0, '<img src="/Appliance/src/View/iron/4.jpg" height="150"/>', 'Утюг POLARIS PIR 2464', 399, 12, 2400, 110, 'нержавеющая сталь', 300, 1.8, '- индикатор нагрева; \r\n- система "капля-стоп"; \r\n- самоочистка от накипи; \r\n- регулятор подачи пара; \r\n- вращение шнура на 360 градусов'),
(5, 3004, 1, '<img src="/Appliance/src/View/iron/5.jpg" height="150"/>', 'Утюг TEFAL FV5356', 1299, 24, 2400, 170, 'керамика', 350, 2, '- самоочистка от накипи; \r\n- регулятор подачи пара ; \r\n- автоматическое отключение');

-- --------------------------------------------------------

--
-- Структура таблицы `microwave`
--

CREATE TABLE IF NOT EXISTS `microwave` (
  `Number` int(5) NOT NULL AUTO_INCREMENT,
  `Code` int(5) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Picture` tinytext CHARACTER SET cp1251 NOT NULL,
  `Name` tinytext CHARACTER SET cp1251 NOT NULL,
  `Price` mediumint(6) NOT NULL,
  `Guarantee` tinyint(2) NOT NULL,
  `Camera` smallint(2) NOT NULL,
  `Color` tinytext CHARACTER SET cp1251 NOT NULL,
  `Control` tinytext CHARACTER SET cp1251 NOT NULL,
  `Height` smallint(3) NOT NULL,
  `Width` smallint(3) NOT NULL,
  `Depth` smallint(3) NOT NULL,
  `Power` smallint(4) NOT NULL,
  PRIMARY KEY (`Number`,`Code`),
  UNIQUE KEY `Number` (`Number`,`Code`),
  UNIQUE KEY `Number_2` (`Number`,`Code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `microwave`
--

INSERT INTO `microwave` (`Number`, `Code`, `Status`, `Picture`, `Name`, `Price`, `Guarantee`, `Camera`, `Color`, `Control`, `Height`, `Width`, `Depth`, `Power`) VALUES
(1, 4000, 1, '<img src="/Appliance/src/View/microwave/1.jpg" height="150"/>', 'Микроволновая печь LG MS2353HAJ', 2899, 12, 23, 'серебристо-черный', 'тактовое', 49, 28, 37, 800),
(2, 4001, 0, '<img src="/Appliance/src/View/microwave/2.jpg" height="150"/>', 'Микроволновая печь GORENJE MMO 20 MGW (XY820Z)', 1599, 12, 20, 'белый', 'механическое', 45, 26, 36, 700),
(3, 4002, 1, '<img src="/Appliance/src/View/microwave/3.jpg" height="150"/>', 'Микроволновая печь LG MG6343BMR', 3599, 12, 23, 'зеркальный', 'сенсорное', 48, 28, 36, 800),
(4, 4003, 1, '<img src="/Appliance/src/View/microwave/4.jpg" height="150"/>', 'Микроволновая печь DELFA D20MGW', 1000, 12, 20, 'белый', 'механическое', 49, 32, 38, 700),
(5, 4004, 0, '<img src="/Appliance/src/View/microwave/5.jpg" height="150"/>', 'Микроволновая печь ERGO EMW-2576', 1499, 12, 20, 'белый', 'сенсорное', 26, 45, 32, 700);

-- --------------------------------------------------------

--
-- Структура таблицы `oil_heater`
--

CREATE TABLE IF NOT EXISTS `oil_heater` (
  `Number` int(5) NOT NULL AUTO_INCREMENT,
  `Code` int(5) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Picture` tinytext CHARACTER SET cp1251 NOT NULL,
  `Name` tinytext CHARACTER SET cp1251 NOT NULL,
  `Price` mediumint(6) NOT NULL,
  `Guarantee` tinyint(2) NOT NULL,
  `Sections` tinyint(2) NOT NULL,
  `Power` smallint(4) NOT NULL,
  `Square` tinyint(2) NOT NULL,
  `Protection` tinytext NOT NULL,
  PRIMARY KEY (`Number`,`Code`),
  UNIQUE KEY `Number` (`Number`,`Code`),
  UNIQUE KEY `Number_2` (`Number`,`Code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `oil_heater`
--

INSERT INTO `oil_heater` (`Number`, `Code`, `Status`, `Picture`, `Name`, `Price`, `Guarantee`, `Sections`, `Power`, `Square`, `Protection`) VALUES
(1, 5000, 0, '<img src="/Appliance/src/View/oil_heater/1.jpg" height="150"/>', 'Масляный обогреватель SATURN ST-OH1671', 399, 24, 7, 1500, 15, '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>'),
(2, 5001, 1, '<img src="/Appliance/src/View/oil_heater/2.jpg" height="150"/>', 'Масляный обогреватель ERGO HO-0920', 999, 12, 9, 2000, 20, '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>'),
(3, 5002, 0, '<img src="/Appliance/src/View/oil_heater/3.jpg" height="150"/>', 'Масляный обогреватель POLARIS PRE M 1125', 1299, 12, 11, 2500, 24, '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>'),
(4, 5003, 0, '<img src="/Appliance/src/View/oil_heater/4.jpg" height="150"/>', 'Масляный обогреватель DELFA FOH-11', 659, 12, 11, 2500, 25, '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>'),
(5, 2004, 1, '<img src="/Appliance/src/View/oil_heater/5.jpg" height="150"/>', 'Масляный радиатор AEG RA 5520', 769, 15, 7, 1500, 15, '<img src="/Appliance/src/View/Storage/ok.jpg" height="20"/>');

-- --------------------------------------------------------

--
-- Структура таблицы `phones`
--

CREATE TABLE IF NOT EXISTS `phones` (
  `Number` int(5) NOT NULL AUTO_INCREMENT,
  `Code` int(5) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Picture` tinytext CHARACTER SET cp1251 NOT NULL,
  `Name` tinytext CHARACTER SET cp1251 NOT NULL,
  `Price` mediumint(6) NOT NULL,
  `Guarantee` tinyint(2) NOT NULL,
  `Type` tinytext CHARACTER SET cp1251 NOT NULL,
  `Shell` tinytext CHARACTER SET cp1251 NOT NULL,
  `Diagonal` float NOT NULL,
  `Display_resolution` tinytext CHARACTER SET cp1251 NOT NULL,
  `Camera` tinyint(4) NOT NULL,
  `OMD` tinytext CHARACTER SET cp1251 NOT NULL,
  `Micro_USB` tinytext CHARACTER SET cp1251 NOT NULL,
  `Chipset` tinytext CHARACTER SET cp1251 NOT NULL,
  `Bluetooth` tinytext CHARACTER SET cp1251 NOT NULL,
  `Wi-Fi` tinytext CHARACTER SET cp1251 NOT NULL,
  `Size` tinytext CHARACTER SET cp1251 NOT NULL,
  `Color` tinytext CHARACTER SET cp1251 NOT NULL,
  PRIMARY KEY (`Number`,`Code`),
  UNIQUE KEY `Number` (`Number`,`Code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `phones`
--

INSERT INTO `phones` (`Number`, `Code`, `Status`, `Picture`, `Name`, `Price`, `Guarantee`, `Type`, `Shell`, `Diagonal`, `Display_resolution`, `Camera`, `OMD`, `Micro_USB`, `Chipset`, `Bluetooth`, `Wi-Fi`, `Size`, `Color`) VALUES
(1, 6000, 0, '<img src="/Appliance/src/View/phone/1.jpg" height="150"/>', 'Смартфон SAMSUNG SM-A300H Galaxy A3 Duos ZWD', 5499, 12, 'смартфон для 2 SIM карт', 'моноблок', 4.5, '960 х 540', 5, '', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', 'MSM8216', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', '130.1 х 65.5 х 6.9', 'белый'),
(2, 6001, 0, '<img src="/Appliance/src/View/phone/2.jpg" height="150"/>', 'Смартфон BRAVIS ULTRA', 3599, 12, 'смартфон для 2 SIM карт', 'моноблок', 5, '1280 х 720', 5, '1024', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', 'MTK6582 ARM cortex- A7 1.3 ГГц', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', '130.1 х 65.5 х 6.9', 'чёрный'),
(3, 6002, 0, '<img src="/Appliance/src/View/phone/3.jpg" height="150"/>', 'Смартфон LENOVO S580 Dual Sim ', 3299, 12, 'смартфон для 2 SIM карт', 'моноблок', 5, '1280 х 720', 8, '1024', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', 'Qualcomm Snapdragon', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', '139.8 х 69.9 х 8.1', 'серебристый'),
(4, 6003, 0, '<img src="/Appliance/src/View/phone/4.jpg" height="150"/>', 'Смартфон BRAVIS AIR Black ', 899, 12, 'смартфон для 2 SIM карт', 'моноблок', 5, '1280 х 720', 2, '256', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', 'Qualcomm Snapdragon', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', '123.8 х 63 х 10', 'чёрный'),
(5, 6004, 1, '<img src="/Appliance/src/View/phone/5.jpg" height="150"/>', 'Телефон BRAVIS LEO', 299, 12, 'смартфон для 2 SIM карт', 'моноблок', 1.8, '176 х 144', 1, '32', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', 'SC6531D', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', '<img src="/Appliance/src/Storage/ok.jpg" height="20"/>', '110 х 46 х 13.6', 'чёрный');

-- --------------------------------------------------------

--
-- Структура таблицы `refrigerator`
--

CREATE TABLE IF NOT EXISTS `refrigerator` (
  `Number` int(5) NOT NULL AUTO_INCREMENT,
  `Code` int(5) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Picture` tinytext NOT NULL,
  `Name` tinytext NOT NULL,
  `Price` mediumint(6) NOT NULL,
  `Guarantee` tinytext NOT NULL,
  `Type` tinytext NOT NULL,
  `Freezer_location` tinytext NOT NULL,
  `Total_volume` smallint(3) NOT NULL,
  `Refrigerator_volume` smallint(3) NOT NULL,
  `Freezer_volume` smallint(3) NOT NULL,
  `Color` tinytext NOT NULL,
  `Height` smallint(3) NOT NULL,
  `Width` smallint(3) NOT NULL,
  `Depth` smallint(3) NOT NULL,
  `Energy_class` tinytext NOT NULL,
  `Compressors` tinyint(1) NOT NULL,
  `Climatic_class` tinytext NOT NULL,
  `Control` tinytext NOT NULL,
  `Refrigerator_defrosting` tinytext NOT NULL,
  `Freezer_defrosting` tinytext NOT NULL,
  `Shelves` tinytext NOT NULL,
  PRIMARY KEY (`Number`,`Code`),
  UNIQUE KEY `Number` (`Number`,`Code`)
) ENGINE=InnoDB  DEFAULT CHARSET=cp1251 AUTO_INCREMENT=20 ;

--
-- Дамп данных таблицы `refrigerator`
--

INSERT INTO `refrigerator` (`Number`, `Code`, `Status`, `Picture`, `Name`, `Price`, `Guarantee`, `Type`, `Freezer_location`, `Total_volume`, `Refrigerator_volume`, `Freezer_volume`, `Color`, `Height`, `Width`, `Depth`, `Energy_class`, `Compressors`, `Climatic_class`, `Control`, `Refrigerator_defrosting`, `Freezer_defrosting`, `Shelves`) VALUES
(1, 7000, 0, '<img src="/Appliance/src/View/refrigerator/1.jpg" height="150"/>', 'Холодильник WHIRPOOL WTV 4125 NF TS', 14299, '12', 'двухкамерный', 'верхнее', 435, 297, 109, 'техносталь', 175, 71, 75, 'А+', 1, 'N;T', '', 'No Frost', 'No Frost', '3'),
(2, 7001, 0, '<img src="/Appliance/src/View/refrigerator/2.jpg" height="150"/>', 'Холодильник SAMSUNG RT-35 FDJCDSA', 8527, '12', 'двухкамерный', 'верхнее', 363, 276, 87, 'серебристый', 179, 68, 72, 'А+', 2, '', 'электронное', 'No Frost', 'No Frost ', '3'),
(3, 7002, 0, '<img src="/Appliance/src/View/refrigerator/3.jpg" height="150"/>', 'Холодильник Samsung RT-22 FARADWW', 4225, '36', 'двухкамерный', 'верхнее', 243, 181, 53, 'белый', 155, 55, 64, 'А+', 1, 'N; SN; T; ST', 'электронное', 'No Frost', 'No Frost ', '2'),
(4, 7003, 0, '<img src="/Appliance/src/View/refrigerator/4.jpg" height="150"/>', 'Холодильник NORD 271-030', 4025, '36', 'двухкамерный', 'верхнее', 255, 209, 46, 'белый', 145, 57, 63, 'А+', 1, 'N; ST', 'электронное', 'No Frost', 'No Frost ', '2'),
(5, 7004, 0, '<img src="/Appliance/src/View/refrigerator/5.jpg" height="150"/>', 'Холодильник LG GR-M802 GAHW', 11099, '36', 'двухкамерный', 'верхнее', 639, 426, 176, 'нержавеющая сталь', 184, 86, 73, 'А+', 1, 'N; T', 'электронное', 'No Frost', 'No Frost ', '2'),
(6, 7005, 0, '<img src="/Appliance/src/View/refrigerator/6.jpg" height="150"/>', 'Холодильник LG GN-V262 RCS', 7800, '12', 'двухкамерный', 'верхнее', 213, 154, 59, 'белый', 152, 54, 64, 'А+', 1, 'SN; T', 'электронное', 'No Frost', 'No Frost ', '3'),
(7, 7006, 0, '<img src="/Appliance/src/View/refrigerator/7.jpg" height="150"/>', 'Холодильник LG GN-M 702 GAHW', 8800, '12', 'двухкамерный', 'верхнее', 507, 378, 129, 'нержавеющая сталь', 180, 78, 73, 'А+', 1, 'T', 'электронное', 'No Frost', 'No Frost ', '3'),
(8, 7007, 0, '<img src="/Appliance/src/View/refrigerator/8.jpg" height="150"/>', 'Холодильник LG GN-B392 RQCW', 5300, '36', 'двухкамерный', 'верхнее', 349, 238, 81, 'белый', 171, 61, 71, 'А+', 1, 'N', 'электронное', 'No Frost', 'No Frost ', '3'),
(9, 7008, 0, '<img src="/Appliance/src/View/refrigerator/9.jpg" height="150"/>', 'Холодильник Indesit TIAA 14', 5700, '12', 'двухкамерный', 'верхнее', 245, 194, 51, 'белый', 145, 60, 67, 'А+', 1, 'N; SN; ST', 'механическое', 'No Frost', 'No Frost ', '3'),
(10, 7009, 0, '<img src="/Appliance/src/View/refrigerator/10.jpg" height="150"/>', 'Холодильник Indesit NTS 14 AA', 4800, '12', 'двухкамерный', 'верхнее', 249, 194, 51, 'белый', 145, 60, 62, 'А+', 1, 'N; SN; ST', 'механическое', 'статическая', 'статическая', '4'),
(11, 7010, 0, '<img src="/Appliance/src/View/refrigerator/11.jpg" height="150"/>', 'Холодильник Electrolux EJ 1800 AOW', 5600, '12', 'двухкамерный', 'верхнее', 173, 132, 41, 'белый', 121, 50, 61, 'А+', 1, 'N; SN; ST; T', 'механическое', 'ручное', 'No Frost', '3'),
(12, 7011, 0, '<img src="/Appliance/src/View/refrigerator/12.jpg" height="150"/>', 'Холодильник Saturn ST-CF2952', 3999, '12', 'однокамерный', 'верхнее', 102, 88, 14, 'белый', 84, 50, 56, 'А+', 1, 'N', 'механическое', 'статическое', 'статическое', '2'),
(13, 7012, 0, '<img src="/Appliance/src/View/refrigerator/13.jpg" height="150"/>', 'Холодильник Profycool BC-65 A', 2999, '12', 'однокамерный', 'отсутствует', 65, 65, 0, 'белый', 74, 46, 54, 'А+', 0, 'N; SN', 'механическое', 'статическое', '', '2'),
(14, 7013, 0, '<img src="/Appliance/src/View/refrigerator/14.jpg" height="150"/>', 'Холодильник Profycool BC-50 B', 2999, '12', 'однокамерный', 'отсутствует', 50, 50, 0, 'белый', 51, 50, 42, 'А+', 0, 'N; SN', 'механическое', 'статическое', '', '2'),
(15, 7014, 0, '<img src="/Appliance/src/View/refrigerator/15.jpg" height="150"/>', 'Холодильник LIEBHERR T 1514', 7799, '12', 'однокамерный', 'верхнее', 134, 117, 17, 'белый', 56, 63, 42, 'А+', 1, 'SN; T', 'механическое', 'автоматическая (капельная)', 'ручная', '2'),
(16, 7015, 0, '<img src="/Appliance/src/View/refrigerator/16.jpg" height="150"/>', 'Холодильник LG GC-B207GLQV', 19999, '12', 'Side-by-side', 'слева', 28, 348, 180, 'серебристый', 175, 89, 73, 'А+', 1, 'N', 'электронное', 'No Frost', 'No Frost', '3'),
(17, 7016, 0, '<img src="/Appliance/src/View/refrigerator/17.jpg" height="150"/>', 'Холодильник Samsung RL 50 RLCMG1/BWT', 8999, '36', 'двухкамерный', 'нижнее', 366, 255, 111, 'серебристый', 200, 60, 64, 'А+', 1, 'N; SN; ST; T', 'электронное', 'No Frost', 'No Frost', '3'),
(18, 7017, 0, '<img src="/Appliance/src/View/refrigerator/18.jpg" height="150"/>', 'Холодильник Samsung RB-29 FEJNDSA', 10999, '36', 'двухкамерный', 'нижнее', 311, 192, 98, 'серебристый', 178, 60, 67, 'А+', 1, 'N; SN; ST; T', 'электронное', 'No Frost', 'No Frost', '4'),
(19, 7018, 0, '<img src="/Appliance/src/View/refrigerator/19.jpg" height="150"/>', 'Холодильник LG GN-V262 SCS', 4699, '36', 'двухкамерный', 'верхнее', 213, 154, 59, 'белый', 152, 54, 60, 'А+', 1, 'SN; T', 'электронное', 'No Frost', 'No Frost', '3');

-- --------------------------------------------------------

--
-- Структура таблицы `tv`
--

CREATE TABLE IF NOT EXISTS `tv` (
  `Number` int(5) NOT NULL AUTO_INCREMENT,
  `Code` int(5) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Picture` tinytext CHARACTER SET cp1251 NOT NULL,
  `Name` tinytext CHARACTER SET cp1251 NOT NULL,
  `Price` mediumint(6) NOT NULL,
  `Diagonal` tinyint(2) NOT NULL,
  `Resolution` tinytext CHARACTER SET cp1251 NOT NULL,
  `Frequency` tinyint(3) NOT NULL,
  `Screen_format` varchar(5) CHARACTER SET cp1251 NOT NULL,
  `Built-in_tuner` varchar(50) CHARACTER SET cp1251 NOT NULL,
  `Dynamics_power` tinyint(3) NOT NULL,
  `Jacks` varchar(100) CHARACTER SET cp1251 NOT NULL,
  `Dimensions` varchar(11) CHARACTER SET cp1251 NOT NULL,
  `Sound_system` varchar(50) CHARACTER SET cp1251 NOT NULL,
  `Optionals` longtext CHARACTER SET cp1251 NOT NULL,
  PRIMARY KEY (`Number`,`Code`),
  UNIQUE KEY `Number` (`Number`,`Code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `tv`
--

INSERT INTO `tv` (`Number`, `Code`, `Status`, `Picture`, `Name`, `Price`, `Diagonal`, `Resolution`, `Frequency`, `Screen_format`, `Built-in_tuner`, `Dynamics_power`, `Jacks`, `Dimensions`, `Sound_system`, `Optionals`) VALUES
(1, 8000, 1, '<img src="/Appliance/src/View/tv/1.jpg" height="150"/>', 'Телевизор SAMSUNG UE40HU7000U', 9699, 40, '3840x2160', 127, '16:9', 'DVB-T; DVB-C; DVB-T2; DVB-S2 ', 20, 'SCART; HDMIx4; Ethernet (LAN); Y, PB, PR (РєРѕРјРїРѕРЅРµРЅС‚РЅС‹Р№); AV РІС…РѕРґ; USBС…3; MHL ', '91.69 x 53.', 'DTS Studio Sound; DTS Premium Audio ', 'С‚РµР»РµС‚РµРєСЃС‚; С‚Р°Р№РјРµСЂ "РЎРѕРЅ"; С‚Р°Р№РјРµСЂ РІРєР»СЋС‡РµРЅРёСЏ; С‚Р°Р№РјРµСЂ РІС‹РєР»СЋС‡РµРЅРёСЏ; Р°РІС‚РѕРїРѕРёСЃРє РєР°РЅР°Р»РѕРІ; Р°РІС‚РѕСЂРµРіСѓР»СЏС‚РѕСЂ СѓСЂРѕРІРЅСЏ Р·РІСѓРєР°; Anynet+ (HDMI-CEC); РїРѕРґРґРµСЂР¶РєР° Skype (РІРёРґРµРѕРІС‹Р·РѕРІС‹); SMART TV (РёРЅС‚РµСЂРЅРµС‚-СЃРµСЂРІРёСЃС‹) '),
(2, 8001, 0, '<img src="/Appliance/src/View/tv/2.jpg" height="150"/>', 'Телевизор BRAVIS LED-32C2000B', 3999, 32, '1366x768', 60, '16:9', '-', 16, '', '73,5С…44С…8', 'AVI; MP3;WMA; JPEG; BMP ', '');

-- --------------------------------------------------------

--
-- Структура таблицы `washers`
--

CREATE TABLE IF NOT EXISTS `washers` (
  `Number` int(5) NOT NULL AUTO_INCREMENT,
  `Code` int(5) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Name` tinytext CHARACTER SET cp1251 NOT NULL,
  `Picture` tinytext CHARACTER SET cp1251 NOT NULL,
  `Price` mediumint(6) NOT NULL,
  `Guarantee` tinyint(2) NOT NULL,
  `Color` tinytext CHARACTER SET cp1251 NOT NULL,
  `Rotation number` smallint(4) NOT NULL,
  `Max_load` smallint(4) NOT NULL,
  `Height` tinyint(3) NOT NULL,
  `Width` tinyint(3) NOT NULL,
  `Depth` tinyint(3) NOT NULL,
  `Noise_level` text CHARACTER SET cp1251 NOT NULL,
  `Control` tinytext CHARACTER SET cp1251 NOT NULL,
  `Programs_number` tinyint(2) NOT NULL,
  `Modes` longtext NOT NULL,
  PRIMARY KEY (`Number`,`Code`),
  UNIQUE KEY `Number` (`Number`,`Code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `washers`
--

INSERT INTO `washers` (`Number`, `Code`, `Status`, `Name`, `Picture`, `Price`, `Guarantee`, `Color`, `Rotation number`, `Max_load`, `Height`, `Width`, `Depth`, `Noise_level`, `Control`, `Programs_number`, `Modes`) VALUES
(1, 9000, 1, 'Стиральная машина GORENJE W 7503/S1', '<img src="/Appliance/src/View/washer/1.jpg" height="150"/>', 5999, 12, 'белый', 1000, 7, 85, 60, 44, '68', 'электронное', 23, ''),
(2, 9001, 0, 'Стиральная машина BEKO WMY 71083 PTLM W2', '<img src="/Appliance/src/View/washer/2.jpg" height="150"/>', 7999, 24, 'бежевый', 1000, 7, 60, 50, 53, '74', 'электронное', 16, ''),
(3, 9002, 0, 'Стиральная машина SAMSUNG WW90H7410EW/LP', '<img src="/Appliance/src/View/washer/3.jpg" height="150"/>', 18333, 36, 'бежевый', 1400, 9, 85, 60, 60, '72', 'электронное', 14, ''),
(4, 9003, 1, 'Стиральная машина BOSCH WAE20469BY', '<img src="/Appliance/src/View/washer/4.jpg" height="150"/>', 11999, 24, 'белый', 1000, 7, 84, 60, 60, '58', 'электронное', 9, ''),
(5, 9004, 1, 'Стиральная машина INDESIT IWSD 71051 B UA', '<img src="/Appliance/src/View/washer/5.jpg" height="150"/>', 5999, 12, 'белый', 1000, 7, 85, 60, 42, '58', 'электронное', 16, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
