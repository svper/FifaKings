-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Machine: 127.0.0.1
-- Gegenereerd op: 28 feb 2015 om 23:53
-- Serverversie: 5.6.17
-- PHP-versie: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databank: `fifav2`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `match_id` int(50) NOT NULL,
  `user_id` int(50) NOT NULL,
  `date` datetime NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `league`
--

CREATE TABLE IF NOT EXISTS `league` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Gegevens worden geëxporteerd voor tabel `league`
--

INSERT INTO `league` (`id`, `name`, `password`) VALUES
(1, 'Test League Robin', 'test');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `match`
--

CREATE TABLE IF NOT EXISTS `match` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `home_id` int(50) NOT NULL,
  `home_score` int(5) NOT NULL,
  `away_id` int(50) NOT NULL,
  `away_score` int(5) NOT NULL,
  `admin_id` int(50) NOT NULL,
  `tournament_id` int(50) NOT NULL,
  `date` datetime NOT NULL,
  `version` int(11) NOT NULL,
  `random` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Gegevens worden geëxporteerd voor tabel `match`
--

INSERT INTO `match` (`id`, `home_id`, `home_score`, `away_id`, `away_score`, `admin_id`, `tournament_id`, `date`, `version`, `random`) VALUES
(1, 1, 2, 2, 3, 1, 1, '2014-10-10 00:00:00', 15, b'1'),
(2, 2, 1, 1, 1, 1, 1, '2014-10-24 00:00:00', 15, b'1'),
(3, 1, 3, 2, 5, 1, 2, '2014-10-11 00:00:00', 15, b'1'),
(4, 1, 3, 3, 1, 1, 2, '2014-10-10 00:00:00', 15, b'1'),
(5, 2, 0, 4, 1, 1, 2, '2014-10-10 00:00:00', 15, b'1');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `match_elo`
--

CREATE TABLE IF NOT EXISTS `match_elo` (
  `match_id` int(50) NOT NULL,
  `home_points` int(5) NOT NULL,
  `away_points` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `match_team`
--

CREATE TABLE IF NOT EXISTS `match_team` (
  `match_id` int(50) NOT NULL,
  `user_id` int(50) NOT NULL,
  `team_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Gegevens worden geëxporteerd voor tabel `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'god'),
(2, 'jesus'),
(3, 'user');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `locale` varchar(100) NOT NULL,
  `att` int(3) NOT NULL,
  `mid` int(3) NOT NULL,
  `def` int(3) NOT NULL,
  `quality` float NOT NULL,
  `version` int(11) NOT NULL,
  `abbreviation` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=280 ;

--
-- Gegevens worden geëxporteerd voor tabel `team`
--

INSERT INTO `team` (`id`, `name`, `locale`, `att`, `mid`, `def`, `quality`, `version`, `abbreviation`) VALUES
(2, 'Arsenal', 'ENG', 81, 80, 80, 4, 15, ''),
(3, 'Aston Villa', 'ENG', 76, 72, 72, 4, 15, ''),
(4, 'Blackburn Rovers', 'ENG', 72, 72, 70, 3, 15, ''),
(5, 'Bolton', 'ENG', 70, 72, 71, 3, 15, ''),
(6, 'Chelsea', 'ENG', 81, 81, 81, 5, 15, ''),
(7, 'Everton', 'ENG', 76, 75, 77, 4, 15, ''),
(8, 'Fulham', 'ENG', 78, 77, 75, 4, 15, ''),
(9, 'Liverpool', 'ENG', 79, 80, 79, 4, 15, ''),
(10, 'Manchester City', 'ENG', 85, 83, 81, 5, 15, ''),
(11, 'Manchester United', 'ENG', 86, 82, 83, 5, 15, ''),
(12, 'Newcastle United', 'ENG', 82, 77, 76, 4, 15, ''),
(13, 'Norwich City', 'ENG', 72, 72, 73, 3, 15, ''),
(14, 'QPR', 'ENG', 79, 74, 74, 4, 15, ''),
(15, 'Stoke City', 'ENG', 75, 76, 75, 4, 15, ''),
(16, 'Sunderland', 'ENG', 77, 75, 74, 4, 15, ''),
(17, 'Swansea City', 'ENG', 73, 73, 73, 4, 15, ''),
(18, 'Tottenham Spurs', 'ENG', 81, 80, 79, 4, 15, ''),
(19, 'West Brom', 'ENG', 74, 75, 71, 4, 15, ''),
(20, 'Wigan Athletic', 'ENG', 72, 70, 74, 3, 15, ''),
(21, 'Wolverhampton', 'ENG', 73, 70, 71, 3, 15, ''),
(22, 'Athletic Bilbao', 'ES', 77, 75, 77, 4, 15, ''),
(23, 'Athletico Madrid', 'ES', 81, 79, 78, 4, 15, ''),
(24, 'CA Osasuna', 'ES', 72, 73, 74, 4, 15, ''),
(25, 'FC Barcelona', 'ES', 87, 84, 84, 5, 15, ''),
(26, 'Getafe CF', 'ES', 73, 74, 75, 4, 15, ''),
(27, 'Granada CF', 'ES', 73, 72, 72, 3, 15, ''),
(28, 'Levante UD', 'ES', 73, 73, 73, 3, 15, ''),
(29, 'Malaga CF', 'ES', 75, 77, 76, 4, 15, ''),
(30, 'Racing Club', 'ES', 70, 71, 70, 3, 15, ''),
(31, 'Rayo Vallecano', 'ES', 72, 71, 72, 3, 15, ''),
(32, 'RCD Espanyol', 'ES', 73, 73, 75, 4, 15, ''),
(33, 'RCD Mallorca', 'ES', 72, 73, 73, 3, 15, ''),
(34, 'Real Betis', 'ES', 74, 72, 72, 3, 15, ''),
(35, 'Real Madrid', 'ES', 86, 85, 83, 5, 15, ''),
(36, 'Real Sociedad', 'ES', 76, 74, 72, 4, 15, ''),
(37, 'Real Sporting', 'ES', 72, 73, 74, 3, 15, ''),
(38, 'Real Zaragoza', 'ES', 73, 71, 71, 3, 15, ''),
(39, 'Sevilla FC', 'ES', 80, 76, 76, 4, 15, ''),
(40, 'Valencia CF', 'ES', 80, 79, 79, 4, 15, ''),
(41, 'Villareal CF', 'ES', 74, 74, 72, 3, 15, ''),
(42, 'Atalanta', 'IT', 77, 76, 74, 4, 15, ''),
(43, 'Bologna', 'IT', 76, 71, 75, 4, 15, ''),
(44, 'Cagliari', 'IT', 74, 76, 74, 4, 15, ''),
(45, 'Catania', 'IT', 76, 73, 75, 4, 15, ''),
(46, 'Cesena', 'IT', 74, 73, 71, 3, 15, ''),
(47, 'Chievo Verona', 'IT', 75, 74, 74, 4, 15, ''),
(48, 'Fiorentina', 'IT', 76, 75, 73, 4, 15, ''),
(49, 'Genoa', 'IT', 76, 74, 74, 4, 15, ''),
(50, 'Inter', 'IT', 83, 80, 80, 5, 15, ''),
(51, 'Juventus', 'IT', 80, 81, 82, 5, 15, ''),
(52, 'Lazio', 'IT', 78, 79, 78, 4, 15, ''),
(53, 'Lecce', 'IT', 73, 69, 71, 3, 15, ''),
(54, 'Milan', 'IT', 81, 79, 79, 4, 15, ''),
(55, 'Napoli', 'IT', 80, 78, 78, 4, 15, ''),
(56, 'Novara', 'IT', 71, 68, 66, 3, 15, ''),
(57, 'Palermo', 'IT', 77, 74, 72, 4, 15, ''),
(58, 'Roma', 'IT', 78, 78, 75, 4, 15, ''),
(59, 'Siena', 'IT', 73, 71, 72, 3, 15, ''),
(60, 'Udinese', 'IT', 79, 75, 78, 4, 15, ''),
(61, 'Academica', 'PT', 70, 67, 67, 3, 15, ''),
(62, 'C. Funchal', 'PT', 69, 69, 70, 3, 15, ''),
(63, 'CD Nacional', 'PT', 71, 65, 69, 3, 15, ''),
(64, 'Santa Maria', 'PT', 67, 66, 63, 2, 15, ''),
(65, 'FC Porto', 'PT', 79, 80, 77, 4, 15, ''),
(66, 'Pacos Ferreira', 'PT', 67, 66, 68, 3, 15, ''),
(67, 'Rio Ave FC', 'PT', 71, 67, 69, 3, 15, ''),
(68, 'SC Olhanese', 'PT', 68, 66, 65, 3, 15, ''),
(69, 'SC Beria Mar', 'PT', 68, 61, 65, 2, 15, ''),
(70, 'SC Braga', 'PT', 77, 74, 73, 4, 15, ''),
(71, 'SL Benfica', 'PT', 80, 79, 77, 4, 15, ''),
(72, 'Sporting CP', 'PT', 78, 76, 75, 4, 15, ''),
(73, 'UD Levia', 'PT', 67, 66, 66, 3, 15, ''),
(74, 'V Barcelos', 'PT', 65, 66, 66, 3, 15, ''),
(75, 'Guinaraes', 'PT', 72, 68, 70, 3, 15, ''),
(76, 'Vitoria FC', 'PT', 68, 68, 67, 3, 15, ''),
(77, 'CSKA Moskva', 'RU', 79, 75, 75, 4, 15, ''),
(78, 'Dinamo Moskva', 'RU', 81, 75, 72, 4, 15, ''),
(79, 'Lokomotiv', 'RU', 76, 74, 72, 4, 15, ''),
(80, 'Rubin Kazan', 'RU', 74, 76, 73, 4, 15, ''),
(81, 'Spartak Moskva', 'RU', 79, 77, 73, 4, 15, ''),
(82, 'Terek Grozny', 'RU', 70, 69, 67, 3, 15, ''),
(83, 'Zenit', 'RU', 77, 79, 79, 4, 15, ''),
(84, 'A. Makhachkala', 'RU', 81, 74, 72, 4, 15, ''),
(85, 'FC Kaiserslautern', 'DE', 72, 69, 71, 3, 15, ''),
(86, 'FC Koln', 'DE', 74, 73, 73, 4, 15, ''),
(87, 'FC Nurnberg', 'DE', 71, 71, 71, 3, 15, ''),
(88, 'FSV Mainz 05', 'DE', 74, 73, 72, 3, 15, ''),
(89, '1899 Hoffenheim', 'DE', 78, 73, 73, 4, 15, ''),
(90, 'Bayer', 'DE', 76, 76, 75, 4, 15, ''),
(91, 'FC Bayern', 'DE', 83, 84, 81, 5, 15, ''),
(92, 'Borussia Dortmund', 'DE', 79, 79, 80, 4, 15, ''),
(93, 'Borussia Mon'' Gladbach', 'DE', 75, 74, 74, 4, 15, ''),
(94, 'FC Augsburg', 'DE', 74, 71, 70, 3, 15, ''),
(95, 'FC Shalke 04', 'DE', 85, 78, 76, 4, 15, ''),
(96, 'Hamburger SV', 'DE', 73, 74, 73, 4, 15, ''),
(97, 'Hannover 96', 'DE', 77, 75, 74, 4, 15, ''),
(98, 'Hertha BSC', 'DE', 73, 71, 71, 3, 15, ''),
(99, 'SC Freiburg', 'DE', 71, 73, 71, 3, 15, ''),
(100, 'VfB Stuttgart', 'DE', 77, 76, 75, 4, 15, ''),
(101, 'VfL Wolfsburg', 'DE', 76, 75, 75, 4, 15, ''),
(102, 'Werder Bremen', 'DE', 75, 73, 74, 4, 15, ''),
(103, 'AJ Ajaccio', 'FR', 72, 68, 67, 3, 15, ''),
(104, 'AJ Auxerre', 'FR', 66, 65, 67, 3, 15, ''),
(105, 'AS Nancy', 'FR', 69, 65, 70, 3, 15, ''),
(106, 'Bordeaux', 'FR', 75, 74, 75, 4, 15, ''),
(107, 'Djion FCO', 'FR', 70, 68, 66, 3, 15, ''),
(108, 'Evian Thonon FC', 'FR', 71, 70, 69, 3, 15, ''),
(109, 'FC Lorient', 'FR', 73, 71, 71, 3, 15, ''),
(110, 'FC Sochaux', 'FR', 71, 70, 69, 3, 15, ''),
(111, 'LOSC Lille', 'FR', 77, 79, 76, 4, 15, ''),
(112, 'Marseille', 'FR', 77, 76, 73, 4, 15, ''),
(113, 'Montpellier HSC', 'FR', 73, 75, 76, 4, 15, ''),
(114, 'OGS Nice', 'FR', 72, 68, 69, 3, 15, ''),
(115, 'Olympique Lyon', 'FR', 82, 76, 75, 4, 15, ''),
(116, 'PSG', 'FR', 82, 78, 80, 5, 15, ''),
(117, 'Saint Etienne', 'FR', 75, 73, 72, 4, 15, ''),
(118, 'SM Caen', 'FR', 71, 70, 68, 3, 15, ''),
(119, 'Stade Brest', 'FR', 69, 70, 69, 3, 15, ''),
(120, 'Stade Rennais', 'FR', 75, 75, 73, 4, 15, ''),
(121, 'Toulouse FC', 'FR', 73, 73, 73, 3, 15, ''),
(122, 'Valenciennes FC', 'FR', 74, 70, 70, 3, 15, ''),
(123, 'AEK Athens', 'Rest of the World', 65, 64, 62, 3, 15, ''),
(124, 'Boca Juniors', 'Rest of the World', 71, 70, 71, 3, 15, ''),
(125, 'Galatasaray SK', 'Rest of the World', 77, 77, 75, 4, 15, ''),
(126, 'Kaiser Chiefs', 'Rest of the World', 65, 68, 66, 3, 15, ''),
(127, 'Olympiakos CFP', 'Rest of the World', 72, 73, 71, 4, 15, ''),
(128, 'Orlando Pirates', 'Rest of the World', 67, 70, 66, 3, 15, ''),
(129, 'Panathinaikos', 'Rest of the World', 70, 71, 71, 3, 15, ''),
(130, 'PAOK', 'Rest of the World', 73, 72, 68, 3, 15, ''),
(131, 'Racing Club', 'Rest of the World', 71, 69, 69, 3, 15, ''),
(132, 'River Plate', 'Rest of the World', 72, 70, 69, 3, 15, ''),
(133, 'Beerschot AC', 'BE', 67, 65, 64, 3, 15, ''),
(134, 'Cercle Brugge', 'BE', 67, 66, 66, 3, 15, ''),
(135, 'Club Brugge', 'BE', 71, 71, 71, 3, 15, ''),
(136, 'KAA Gent', 'BE', 69, 67, 71, 3, 15, ''),
(137, 'KRC Genk', 'BE', 71, 69, 68, 3, 15, ''),
(138, 'KV Kortrijk', 'BE', 67, 66, 65, 3, 15, ''),
(139, 'KV Mechelen', 'BE', 69, 65, 67, 3, 15, ''),
(140, 'KVC Westerlo', 'BE', 66, 64, 64, 2, 15, ''),
(141, 'Lierse SK', 'BE', 65, 62, 64, 2, 15, ''),
(142, 'OHL', 'BE', 65, 63, 64, 2, 15, ''),
(143, 'RAEC Mons', 'BE', 68, 64, 65, 2, 15, ''),
(144, 'RSC Anderlecht', 'BE', 74, 71, 71, 3, 15, ''),
(145, 'Sporting Lokeren', 'BE', 67, 67, 68, 3, 15, ''),
(146, 'Standard Liege', 'BE', 69, 69, 71, 3, 15, ''),
(147, 'Zulte Waregem', 'BE', 67, 67, 66, 3, 15, ''),
(148, 'Sint-Truiden', 'BE', 66, 64, 63, 2, 15, ''),
(149, 'ADO Den Haag', 'NL', 65, 66, 65, 3, 15, ''),
(150, 'Ajax', 'NL', 76, 72, 73, 4, 15, ''),
(151, 'AZ Alkmaar', 'NL', 72, 71, 69, 3, 15, ''),
(152, 'De Graafschap', 'NL', 67, 63, 64, 2, 15, ''),
(153, 'FC Groningen', 'NL', 67, 69, 68, 3, 15, ''),
(154, 'FC Twente', 'NL', 74, 73, 72, 4, 15, ''),
(155, 'FC Utrecht', 'NL', 69, 67, 66, 3, 15, ''),
(156, 'Feyenoord', 'NL', 69, 72, 71, 3, 15, ''),
(157, 'Heracles Almelo', 'NL', 68, 69, 65, 3, 15, ''),
(158, 'NEC', 'NL', 66, 68, 66, 3, 15, ''),
(159, 'NAC Breda', 'NL', 66, 65, 66, 3, 15, ''),
(160, 'PSV', 'NL', 76, 77, 72, 4, 15, ''),
(161, 'RKC Waalwijk', 'NL', 65, 64, 64, 2, 15, ''),
(162, 'Roda JC', 'NL', 71, 66, 67, 3, 15, ''),
(163, 'SC Heerevenveen', 'NL', 68, 72, 69, 3, 15, ''),
(164, 'SBC Excelsior', 'NL', 62, 62, 63, 2, 15, ''),
(165, 'Vitesse', 'NL', 72, 70, 70, 3, 15, ''),
(166, 'VVV Venlo', 'NL', 67, 66, 62, 3, 15, ''),
(167, 'Cote d''Ivoire', 'International', 79, 77, 72, 4, 15, ''),
(168, 'Chile', 'International', 80, 77, 72, 4, 15, ''),
(169, 'Sweden', 'International', 80, 75, 74, 4, 15, ''),
(170, 'Portugal', 'International', 83, 80, 81, 5, 15, ''),
(171, 'Poland', 'International', 78, 73, 70, 4, 15, ''),
(172, 'Parma', 'IT', 73, 73, 75, 4, 15, ''),
(173, 'Italy', 'International', 81, 81, 81, 5, 15, ''),
(174, 'Leicester City', 'ENG', 69, 66, 69, 3, 15, ''),
(175, 'Ireland', 'International', 76, 75, 72, 4, 15, ''),
(176, 'Cruzeiro', 'Brazil', 75, 71, 72, 4, 15, ''),
(177, 'Atl. Mineiro', 'Brazil', 73, 75, 74, 4, 15, ''),
(178, 'Atl. Paranaense', 'Brazil', 71, 70, 70, 3, 15, ''),
(179, 'Bahia', 'Brazil', 70, 69, 68, 3, 15, ''),
(180, 'Botafogo', 'Brazil', 75, 74, 70, 3, 15, ''),
(181, 'C. Nordeste', 'Brazil', 69, 70, 69, 3, 15, ''),
(182, 'Corinthians', 'Brazil', 78, 74, 73, 4, 15, ''),
(183, 'Corithika', 'Brazil', 73, 72, 70, 3, 15, ''),
(184, 'Flamengo', 'Brazil', 76, 73, 72, 4, 15, ''),
(185, 'Fluminese', 'Brazil', 78, 75, 71, 4, 15, ''),
(186, 'Gremio', 'Brazil', 75, 74, 73, 4, 15, ''),
(187, 'Porto Alegre', 'Brazil', 74, 69, 73, 4, 15, ''),
(188, 'Palmeiras', 'Brazil', 74, 72, 74, 3, 15, ''),
(189, 'Santos', 'Brazil', 77, 74, 71, 4, 15, ''),
(190, 'Sao Paolo', 'Brazil', 77, 74, 73, 4, 15, ''),
(191, 'Vasco Da Gama', 'Brazil', 72, 72, 68, 4, 15, ''),
(192, 'Korea Republic', 'International', 75, 69, 68, 3, 15, ''),
(193, 'Hungary', 'International', 69, 71, 67, 3, 15, ''),
(194, 'Birmingham City', 'ENG', 71, 70, 71, 3, 15, ''),
(195, 'Brazil', 'International', 85, 80, 84, 5, 15, ''),
(196, 'Russia', 'International', 79, 78, 78, 4, 15, ''),
(197, 'Coritiba', 'Brazil', 70, 70, 72, 3, 15, ''),
(198, 'Finland', 'International', 70, 69, 68, 3, 15, ''),
(199, 'Spain', 'International', 86, 86, 84, 5, 15, ''),
(200, 'Norway', 'International', 77, 73, 76, 4, 15, ''),
(201, 'Nottingham Forest', 'ENG', 70, 67, 67, 3, 15, ''),
(202, 'Croatia', 'International', 77, 79, 75, 4, 15, ''),
(203, 'Argentina', 'International', 87, 79, 78, 5, 15, ''),
(204, 'France', 'International', 83, 82, 82, 5, 15, ''),
(205, 'Kobenhavn FC', 'Denmark', 71, 70, 69, 3, 15, ''),
(206, 'NY Red Bulls', 'USA', 72, 70, 65, 3, 15, ''),
(207, 'Ecuador', 'International', 76, 74, 64, 3, 15, ''),
(208, 'Germany', 'International', 82, 80, 82, 5, 15, ''),
(209, 'Santa Catarina', 'Brazil', 72, 67, 65, 3, 15, ''),
(210, 'Australia', 'International', 71, 70, 69, 3, 15, ''),
(211, 'Austria', 'International', 74, 73, 72, 3, 15, ''),
(212, 'Belgium', 'International', 80, 77, 78, 4, 15, ''),
(213, 'Bulgaria', 'International', 70, 71, 66, 3, 15, ''),
(214, 'Cameroon', 'International', 81, 73, 75, 4, 15, ''),
(215, 'Colombia', 'International', 76, 76, 76, 4, 15, ''),
(216, 'Denmark', 'International', 76, 74, 74, 4, 15, ''),
(217, 'Egypt', 'International', 68, 68, 68, 3, 15, ''),
(218, 'England', 'International', 86, 82, 81, 5, 15, ''),
(219, 'Greece', 'International', 73, 72, 74, 4, 15, ''),
(220, 'Mexico', 'International', 83, 75, 75, 4, 15, ''),
(221, 'Netherlands', 'International', 84, 80, 77, 5, 15, ''),
(222, 'Northern Ireland', 'International', 70, 67, 69, 3, 15, ''),
(223, 'Peru', 'International', 72, 71, 69, 3, 15, ''),
(224, 'Romania', 'International', 73, 69, 71, 3, 15, ''),
(225, 'Scotland', 'International', 74, 74, 74, 4, 15, ''),
(226, 'Slovenia', 'International', 74, 71, 72, 3, 15, ''),
(227, 'South Africa', 'International', 69, 70, 67, 3, 15, ''),
(228, 'Switzerland', 'International', 73, 75, 76, 4, 15, ''),
(229, 'Turkey', 'International', 75, 77, 74, 4, 15, ''),
(230, 'United States', 'International', 74, 74, 70, 4, 15, ''),
(231, 'Uruguay', 'International', 82, 74, 77, 4, 15, ''),
(232, 'FC Basel', 'Switzerland', 74, 70, 68, 3, 15, ''),
(233, 'Monterrey', 'Mexico', 72, 71, 70, 3, 15, ''),
(234, 'Tigres', 'Mexico', 70, 70, 70, 3, 15, ''),
(235, 'America', 'Mexico', 70, 70, 71, 3, 15, ''),
(236, 'Cruz Azul', 'Mexico', 70, 70, 68, 3, 15, ''),
(237, 'Rangers', 'Rest of the World', 61, 63, 65, 2, 15, ''),
(238, 'Rosenborg BK', 'Norway', 70, 68, 70, 3, 15, ''),
(239, 'RC Deportivo', 'ES', 73, 73, 72, 3, 15, ''),
(240, 'Bosnia-herze.', 'International', 78, 73, 74, 4, 15, ''),
(241, 'Ukraine', 'International', 77, 76, 71, 4, 15, ''),
(242, 'Reading', 'ENG', 73, 70, 70, 3, 15, ''),
(243, 'Southampton', 'ENG', 73, 70, 72, 3, 15, ''),
(244, 'West Ham', 'ENG', 75, 73, 71, 3, 15, ''),
(245, 'Blackpool', 'ENG', 71, 68, 69, 3, 15, ''),
(246, 'Sp. Charleroi', 'BE', 63, 61, 61, 2, 15, ''),
(247, 'Waasl.-Beveren', 'BE', 63, 64, 62, 2, 15, ''),
(248, 'A. Goiania', 'Brazil', 68, 68, 67, 3, 15, ''),
(249, 'N. Recife', 'Brazil', 71, 68, 68, 3, 15, ''),
(250, 'P. Campinas', 'Brazil', 69, 66, 67, 3, 15, ''),
(251, 'Portuguesa', 'Brazil', 71, 70, 69, 3, 15, ''),
(252, 'S. Recife', 'Brazil', 70, 66, 68, 3, 15, ''),
(253, 'P. Soa Paulo', 'Brazil', 72, 72, 71, 3, 15, ''),
(254, 'V. R de Janeiro', 'Brazil', 72, 72, 70, 3, 15, ''),
(255, 'ES Troyes', 'FR', 67, 67, 67, 3, 15, ''),
(256, 'SC Bastia', 'FR', 68, 67, 67, 3, 15, ''),
(257, 'Stade Reims', 'FR', 69, 66, 68, 3, 15, ''),
(258, 'AS Monaco', 'FR', 69, 69, 69, 3, 15, ''),
(259, 'FC Nuremberg', 'DE', 74, 72, 72, 3, 15, ''),
(260, 'Eint. Frankfurt', 'DE', 72, 73, 72, 3, 15, ''),
(261, 'F. Dusseldorf', 'DE', 68, 70, 68, 3, 15, ''),
(262, 'Greuther Furth', 'DE', 70, 70, 70, 3, 15, ''),
(263, 'Pescara', 'IT', 72, 70, 68, 3, 15, ''),
(264, 'Sampdoria', 'IT', 75, 72, 72, 3, 15, ''),
(265, 'Torino', 'IT', 74, 73, 73, 4, 15, ''),
(266, 'Santos Laguna', 'Mexico', 73, 70, 69, 3, 15, ''),
(267, 'PEC Zwolle', 'NL', 65, 65, 65, 2, 15, ''),
(268, 'Willem II', 'NL', 64, 63, 63, 2, 15, ''),
(269, 'Molde FK', 'Norway', 71, 71, 71, 3, 15, ''),
(270, 'Estoril', 'PT', 65, 67, 66, 3, 15, ''),
(271, 'Moreira Conegos', 'PT', 66, 64, 64, 3, 15, ''),
(272, 'Vit. Guimaraes', 'PT', 70, 68, 69, 3, 15, ''),
(273, 'MLS All Stars', 'Rest of the World', 74, 73, 67, 3, 15, ''),
(274, 'Celtic', 'Scotland', 74, 72, 73, 3, 15, ''),
(275, 'Celta Vigo', 'ES', 72, 72, 71, 3, 15, ''),
(276, 'Real Valladolid', 'ES', 72, 72, 71, 3, 15, ''),
(277, 'Sporting Gijon', 'ES', 69, 70, 71, 3, 15, ''),
(278, 'LA Galaxy', 'USA', 74, 67, 67, 3, 15, ''),
(279, 'Czech Republic', 'International', 73, 75, 75, 4, 15, '');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tournament`
--

CREATE TABLE IF NOT EXISTS `tournament` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `host_id` int(50) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `closed` bit(1) NOT NULL DEFAULT b'0',
  `version` int(11) DEFAULT NULL,
  `league_id` int(50) NOT NULL,
  `elo` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Gegevens worden geëxporteerd voor tabel `tournament`
--

INSERT INTO `tournament` (`id`, `name`, `host_id`, `date`, `closed`, `version`, `league_id`, `elo`) VALUES
(1, 'Test Cup', 1, '2014-10-10 00:00:00', b'0', 15, 1, b'0'),
(2, 'Second Cup', 1, '2014-10-17 00:00:00', b'0', 15, 1, b'0'),
(3, 'qsd', 0, NULL, b'0', NULL, 0, b'0'),
(4, '', 1, NULL, b'0', NULL, 1, b'0');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `last_login` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Gegevens worden geëxporteerd voor tabel `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `password`, `last_login`) VALUES
(1, 'Robin', 'Verhulst', 'test@verhulst.be', 'test', '2014-10-20 17:00:00'),
(2, 'Frederik', 'Bouillon', 'test@verhulst.be', 'test', '2014-10-20 17:00:00'),
(3, 'Nielsen', 'Stassyns', 'test@verhulst.be', 'test', '2014-10-20 17:00:00'),
(4, 'Yinan', 'Ma', 'test@verhulst.be', 'test', '2014-10-20 17:00:00'),
(5, 'Sven', 'Stassyns', 'test@verhulst.be', 'test', '2014-10-20 17:00:00'),
(6, 'Philip', 'Hermans', 'test@verhulst.be', 'test', '2014-10-20 17:00:00');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user_league`
--

CREATE TABLE IF NOT EXISTS `user_league` (
  `user_id` int(50) NOT NULL,
  `league_id` int(50) NOT NULL,
  `role_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `user_league`
--

INSERT INTO `user_league` (`user_id`, `league_id`, `role_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(3, 1, 3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
