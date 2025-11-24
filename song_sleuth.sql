-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 24, 2025 at 04:03 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `song_sleuth`
--

-- --------------------------------------------------------

--
-- Table structure for table `affiliations`
--

CREATE TABLE `affiliations` (
  `Group_id` int(11) NOT NULL COMMENT 'The group the artist is a member of. References ARTISTS.Artist_id\r\n',
  `Artist_id` int(11) NOT NULL COMMENT 'The artist in question. References ARTISTS.Artist_id',
  `Info` mediumtext DEFAULT NULL COMMENT 'Stores information about the relationship between the artist and the group\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `affiliations`
--

INSERT INTO `affiliations` (`Group_id`, `Artist_id`, `Info`) VALUES
(132, 143, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `Album_id` int(11) NOT NULL COMMENT 'Auto-generated integer to serve as the primary key for this entity. This method was chosen because it is not uncommon for different artists to have albums using the same name, and even sometimes a single artist will have multiple albums with the same name.\n',
  `Album_artist` int(11) DEFAULT NULL,
  `Album_name` varchar(255) DEFAULT NULL COMMENT 'The name of the album.',
  `Release_date` varchar(10) DEFAULT NULL COMMENT 'The original release date of an album'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`Album_id`, `Album_artist`, `Album_name`, `Release_date`) VALUES
(1, 1, 'Of Fracture And Failure', '2007-02-01'),
(2, 1, 'Everything Is Fire', '2009-04-07'),
(3, 1, 'The Destroyers of All', '2011-01-25'),
(4, 1, 'Vermis', '2013-09-17'),
(5, 1, 'Shrines of Paralysis', '2016-10-28'),
(6, 1, 'Stare Into Death And Be Still', '2020-04-24'),
(7, 1, 'Cutting The Throat of God', '2024-06-14'),
(44, 14, 'Blue Train', '1958-02-01'),
(45, 14, 'Giant Steps', '1960-01-27'),
(46, 14, 'My Favorite Things', '1961-03-01'),
(47, 14, 'Africa Brass', '1961-09-01'),
(48, 14, 'Ole', '1961-11-01'),
(49, 14, 'Crescent', '1964-07-01'),
(50, 14, 'A Love Supreme', '1965-01-01'),
(51, 14, 'Ascension', '1966-02-02'),
(52, 14, 'Meditations', '1966-08-01'),
(53, 14, 'Interstellar Space', '1974-09-01'),
(54, 14, 'Both Directions At Once: The Lost Album', '2018-06-29'),
(55, 17, 'Aethiopes', '2022-04-08'),
(58, 8, 'Dirt', '1992-09-29'),
(59, 8, 'Jar of Flies', '1994-01-25'),
(61, 49, '2001', '1999-11-16'),
(63, 49, 'The Chronic', NULL),
(64, 49, 'Compton', NULL),
(82, 157, 'Jazz In Silhouette', '1959-05'),
(83, 157, 'Lanquidity', '1978'),
(84, 158, 'Heaven And Hell', '1980-04-25'),
(85, 158, 'Black Sabbath', '1970-02-13'),
(86, 158, 'Paranoid', '1970-09-18'),
(87, 158, 'Master of Reality', '1971-07-21'),
(88, 158, 'Black Sabbath Vol. 4', '1972-09-25'),
(89, 158, 'Sabbath Bloody Sabbath', '1973-12-28'),
(90, 158, 'Sabotage', '1975-07-28'),
(91, 158, 'Never Say Die!', '1978-09-28'),
(92, 158, 'Technical Ecstasy', '1976-10-01'),
(93, 74, 'Goldstar', '2025-03-21'),
(94, 78, 'The Blueprint', '2001-09-11'),
(95, 56, 'The Marshall Mathers LP', '2000-05-23'),
(96, 56, 'The Eminem Show', '2002-05-28');

-- --------------------------------------------------------

--
-- Table structure for table `album_genres`
--

CREATE TABLE `album_genres` (
  `Album_id` int(11) NOT NULL COMMENT 'The album in question. Serves as the primary key. Entity serves to link albums and the genres that appear on the album. References ALBUMS.Album_id',
  `Genre_id` int(11) NOT NULL COMMENT 'The genre in question. References GENRES.Genre_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `album_genres`
--

INSERT INTO `album_genres` (`Album_id`, `Genre_id`) VALUES
(1, 187),
(2, 48),
(2, 187),
(3, 48),
(3, 187),
(4, 48),
(4, 187),
(5, 48),
(5, 187),
(6, 48),
(6, 187),
(7, 48),
(7, 187),
(44, 87),
(44, 104),
(45, 87),
(45, 120),
(46, 120),
(46, 141),
(47, 120),
(47, 141),
(48, 120),
(48, 141),
(49, 87),
(49, 120),
(49, 141),
(50, 16),
(50, 175),
(51, 64),
(51, 72),
(51, 175),
(52, 16),
(52, 72),
(52, 175),
(53, 72),
(54, 87),
(54, 120),
(54, 141),
(55, 1),
(55, 65),
(58, 86),
(61, 77),
(61, 91),
(61, 198),
(88, 93),
(89, 93),
(90, 88),
(90, 93),
(91, 88),
(91, 93),
(92, 88),
(92, 93),
(93, 17),
(93, 47),
(94, 57),
(95, 91),
(96, 91);

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `Artist_id` int(11) NOT NULL COMMENT 'Auto-generated integer to serve as the primary key for this entity. This method was chosen because there are multiple artists with the same name, as well as to account for artist name changes.\n',
  `Artist_name` varchar(255) NOT NULL COMMENT 'Holds the artists name\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`Artist_id`, `Artist_name`) VALUES
(1, 'Ulcerate'),
(2, 'Gorguts'),
(3, '2Pac'),
(4, 'A Tribe Called Quest'),
(5, 'Ad Nauseam'),
(6, 'Death'),
(7, 'Alice Coltrane'),
(8, 'Alice In Chains'),
(9, 'Anthrax'),
(10, 'Archspire'),
(11, 'Defeated Sanity'),
(12, 'Armand Hammer'),
(13, 'Arooj Aftab'),
(14, 'John Coltrane'),
(15, 'Autopsy'),
(16, 'Between The Buried And Me'),
(17, 'billy woods'),
(18, 'Blind Guardian'),
(19, 'Blood Incantation'),
(20, 'Boris'),
(21, 'Ceremony'),
(22, 'Charles Mingus'),
(23, 'Chat Pile'),
(24, 'Chelsea Wolfe'),
(25, 'Chris Christodoulou'),
(26, 'Chthe\'ilist'),
(27, 'clipping.'),
(28, 'Clipse'),
(29, 'Clutch'),
(30, 'Cold As Life'),
(31, 'Converge'),
(32, 'Coroner'),
(33, 'Cryptopsy'),
(34, 'Cynic'),
(35, 'Danny Brown'),
(36, 'Dark Angel'),
(37, 'Darren Korb'),
(38, 'Dead And Dripping'),
(39, 'Dead In The Dirt'),
(40, 'Dead Kennedys'),
(41, 'Death Grips'),
(42, 'Deeds of Flesh'),
(43, 'Deep Purple'),
(44, 'Demilich'),
(45, 'Demolition Hammer'),
(46, 'Despised Icon'),
(47, 'Dio'),
(48, 'Disentomb'),
(49, 'Dr. Dre'),
(50, 'Dragged Into Sunlight'),
(51, 'Drain'),
(52, 'Earl Sweatshirt'),
(53, 'Earth Crisis'),
(54, 'Electric Wizard'),
(55, 'El-P'),
(56, 'Eminem'),
(57, 'Encenathrakh'),
(58, 'Equipoise'),
(59, 'Eric Dolphy'),
(60, 'Flying Lotus'),
(61, 'Fossilization'),
(62, 'Ghostface Killah'),
(63, 'Hate Eternal'),
(64, 'Have Heart'),
(65, 'Haywire'),
(66, 'Helmet'),
(67, 'Herbie Hancock'),
(68, 'Howls of Ebb'),
(69, 'Ice Cube'),
(70, 'Iggy And The Stooges'),
(71, 'Igorrr'),
(72, 'Ill Considered'),
(73, 'Immolation'),
(74, 'Imperial Triumphant'),
(75, 'Incantation'),
(76, 'Ingurgitating Oblivion'),
(77, 'J Dilla'),
(78, 'Jay-Z'),
(79, 'JPEGMAFIA'),
(80, 'Judas Priest'),
(81, 'Judge'),
(82, 'Kamasi Washington'),
(83, 'Kendrick Lamar'),
(84, 'Killer Mike'),
(85, 'King Crimson'),
(86, 'King Diamond'),
(87, 'Lauryn Hill'),
(88, 'Led Zeppelin'),
(89, 'Lil Ugly Mane'),
(90, 'Lingua Ignota'),
(91, 'Madvillain'),
(92, 'MF DOOM'),
(93, 'Madlib'),
(94, 'Marty Friedman'),
(95, 'Megadeth'),
(96, 'Metallica'),
(97, 'Slayer'),
(98, 'Mastodon'),
(99, 'Melt-Banana'),
(100, 'Melvins'),
(101, 'Mercyful Fate'),
(102, 'Meshuggah'),
(103, 'Mindforce'),
(104, 'My Bloody Valentine'),
(105, 'Nails'),
(106, 'Nile'),
(107, 'Nirvana'),
(108, 'Nithing'),
(109, 'Organized Konfusion'),
(110, 'Ornette Coleman'),
(111, 'OutKast'),
(112, 'Overkill'),
(113, 'Pearl Jam'),
(114, 'Pharoah Sanders'),
(115, 'Pharoahe Monch'),
(116, 'Public Enemy'),
(117, 'Radiohead'),
(118, 'Raekwon'),
(119, 'Run The Jewels'),
(120, 'Shabaka & The Ancestors'),
(121, 'Shabazz Palaces'),
(122, 'Snoop Dogg'),
(123, 'System of A Down'),
(124, 'Talking Heads'),
(125, 'Terror'),
(126, 'The Beatles'),
(127, 'The Dillinger Escape Plan'),
(128, 'The Notorious B.I.G.'),
(129, 'The Ruins of Beverast'),
(130, 'Trapped Under Ice'),
(131, 'Vermin Womb'),
(132, 'Wu-Tang Clan'),
(133, 'Ashenspire'),
(134, 'Boldy James'),
(135, 'Revocation'),
(136, 'Sanguisugabogg'),
(139, 'Fulci'),
(140, 'Frozen Soul'),
(141, 'Undeath'),
(143, 'GZA'),
(144, 'Tomb Mold'),
(145, 'Necrot'),
(146, 'Combust'),
(147, 'Scarab'),
(148, 'Swans'),
(149, 'Hittman'),
(150, 'Devin The Dude'),
(151, 'Xzibit'),
(152, 'Nate Dogg'),
(153, 'Ms. Roq'),
(154, 'Mary J. Blige'),
(155, 'Kurupt'),
(156, 'Drain'),
(157, 'Sun Ra'),
(158, 'Black Sabbath'),
(159, 'Boldy James & The Alchemist'),
(160, 'Freddie Gibbs & The Alchemist'),
(161, 'Armand Hammer & The Alchemist'),
(169, 'Test Artist');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `Genre_id` int(11) NOT NULL COMMENT 'Auto-generated integer to serve as the primary key for this entity. This was chosen because the same genre name sometimes refers to distinct genres. (Hardcore for instance can refer to a style of punk or a style of electronic music).\n',
  `Genre_name` varchar(50) NOT NULL COMMENT 'Attribute to hold the names of different music genres. 50 was chosen as the length as the longest genre name (including spaces) found on RateYourMusic is 39 characters, and this allows for some extra room for any other long genre names that may develop.\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`Genre_id`, `Genre_name`) VALUES
(1, 'Abstract Hip Hop'),
(2, 'Acid Jazz'),
(3, 'Acid Rock'),
(4, 'Acoustic Rock'),
(5, 'Afrobeat'),
(6, 'Alternative'),
(7, 'Alternative Metal'),
(8, 'Alternative Rock'),
(9, 'Ambient'),
(10, 'Anarcho-Punk'),
(11, 'Art Pop'),
(12, 'Art Punk'),
(13, 'Art Rock'),
(14, 'Atmospheric Black Metal'),
(15, 'Atmospheric Sludge Metal'),
(16, 'Avant-Garde Jazz'),
(17, 'Avant-Garde Metal'),
(18, 'Baroque Pop'),
(19, 'Beatdown Hardcore'),
(20, 'Big Band'),
(21, 'Black Ambient'),
(22, 'Black Metal'),
(23, 'Black Noise'),
(24, 'Blackened Death Metal'),
(25, 'Blackened Grindcore'),
(26, 'Blues Rock'),
(27, 'Boom Bap'),
(28, 'Brazilian Folk Music'),
(29, 'Brazilian Music'),
(30, 'Brutal Death Metal'),
(31, 'Brutal Prog'),
(32, 'Capoeira Music'),
(33, 'Conscious Hip Hop'),
(34, 'Contemporary R&B'),
(35, 'Cool Jazz'),
(36, 'Crossover Thrash'),
(37, 'Crust Punk'),
(38, 'Dark Ambient'),
(39, 'Dark Jazz'),
(40, 'Death Doom Metal'),
(41, 'Death Metal'),
(42, 'Death \'n\' Roll'),
(43, 'Deathcore'),
(44, 'Deathgrind'),
(45, 'Death-Thrash'),
(46, 'Depressive Black Metal'),
(47, 'Dissonant Black Metal'),
(48, 'Dissonant Death Metal'),
(49, 'Djent'),
(50, 'Doom Metal'),
(51, 'Downtempo'),
(52, 'Dream Pop'),
(53, 'Drone'),
(54, 'Drone Metal'),
(55, 'Dub'),
(56, 'Dungeon Synth'),
(57, 'East Coast Hip Hop'),
(58, 'Electro-Industrial'),
(59, 'Electronic'),
(60, 'Emo'),
(61, 'Emoviolence'),
(62, 'Epic Doom Metal'),
(63, 'Experimental'),
(64, 'Experimental Big Band'),
(65, 'Experimental Hip Hop'),
(66, 'Experimental Rock'),
(67, 'Flamenco'),
(68, 'Flamenco Jazz'),
(69, 'Folk Metal'),
(70, 'Folk Rock'),
(71, 'Free Improvisation'),
(72, 'Free Jazz'),
(73, 'Funeral Doom Metal'),
(74, 'Funk'),
(75, 'Funk Metal'),
(76, 'Funk Rock'),
(77, 'Gangsta Rap'),
(78, 'Garage Rock'),
(79, 'G-Funk'),
(80, 'Glam Metal'),
(81, 'Goregrind'),
(82, 'Gothic Metal'),
(83, 'Gothic Rock'),
(84, 'Grindcore'),
(85, 'Groove Metal'),
(86, 'Grunge'),
(87, 'Hard Bop'),
(88, 'Hard Rock'),
(89, 'Hardcore'),
(90, 'Hardcore [Punk]'),
(91, 'Hardcore Hip Hop'),
(92, 'Hardcore Punk'),
(93, 'Heavy Metal'),
(94, 'Heavy Psych'),
(95, 'Hip-Hop'),
(96, 'Horrorcore'),
(97, 'Indie Rock'),
(98, 'Industrial'),
(99, 'Industrial Black Metal'),
(100, 'Industrial Hip Hop'),
(101, 'Industrial Metal'),
(102, 'Industrial Rock'),
(103, 'Instrumental Hip Hop'),
(104, 'Jazz'),
(105, 'Jazz Funk'),
(106, 'Jazz Fusion'),
(107, 'Jazz Rap'),
(108, 'Jazz Rock'),
(109, 'Jazz-Funk'),
(110, 'Klezmer'),
(111, 'Latin Jazz'),
(112, 'Math Rock'),
(113, 'Mathcore'),
(114, 'Melodic Black Metal'),
(115, 'Melodic Death Metal'),
(116, 'Melodic Metalcore'),
(117, 'Metal'),
(118, 'Metalcore'),
(119, 'Midwest Emo'),
(120, 'Modal Jazz'),
(121, 'Neoclassical Darkwave'),
(122, 'Neofolk'),
(123, 'Neo-Psychedelia'),
(124, 'Neo-Soul'),
(125, 'Nerdcore Hip Hop'),
(126, 'New Wave'),
(127, 'New York Hardcore'),
(128, 'No Wave'),
(129, 'Noise'),
(130, 'Noise Pop'),
(131, 'Noise Rock'),
(132, 'Noisecore'),
(133, 'Nordic Folk Music'),
(134, 'Nu Metal'),
(135, 'NWOBHM'),
(136, 'Plunderphonics'),
(137, 'Political Hip Hop'),
(138, 'Pop'),
(139, 'Pop Rap'),
(140, 'Pop Rock'),
(141, 'Post-Bop'),
(142, 'Post-Hardcore'),
(143, 'Post-Industrial'),
(144, 'Post-Metal'),
(145, 'Post-Punk'),
(146, 'Post-Rock'),
(147, 'Power Electronics'),
(148, 'Power Metal'),
(149, 'Powerviolence'),
(150, 'Progressive Death Metal'),
(151, 'Progressive Metal'),
(152, 'Progressive Rock'),
(153, 'Proto-Punk'),
(154, 'Psychedelic'),
(155, 'Psychedelic Pop'),
(156, 'Psychedelic Rock'),
(157, 'Punk Rock'),
(158, 'Rap'),
(159, 'Rap Rock'),
(160, 'Ritual Ambient'),
(161, 'Rock'),
(162, 'Rock & Roll'),
(163, 'Rock Opera'),
(164, 'Saeta'),
(165, 'Screamo'),
(166, 'Shoegaze'),
(167, 'Skate Punk'),
(168, 'Slam Death Metal'),
(169, 'Sludge Metal'),
(170, 'Soul Jazz'),
(171, 'Southern Hip Hop'),
(172, 'Southern Metal'),
(173, 'Space Rock'),
(174, 'Speed Metal'),
(175, 'Spiritual Jazz'),
(176, 'Stoner Metal'),
(177, 'Stoner Rock'),
(178, 'Sunshine Pop'),
(179, 'Surf Punk'),
(180, 'Surf Rock'),
(181, 'Symphonic Black Metal'),
(182, 'Symphonic Death Metal'),
(183, 'Symphonic Metal'),
(184, 'Symphonic Prog'),
(185, 'Symphonic Rock'),
(186, 'Synth Funk'),
(187, 'Technical Death Metal'),
(188, 'Technical Deathcore'),
(189, 'Technical Thrash Metal'),
(190, 'Third Stream'),
(191, 'Thrash Metal'),
(192, 'Traditional Doom Metal'),
(193, 'Trip Hop'),
(194, 'Turntablism'),
(195, 'Underground Hip-Hop'),
(196, 'Viking Metal'),
(197, 'War Metal'),
(198, 'West Coast Hip Hop');

-- --------------------------------------------------------

--
-- Table structure for table `performing_artist`
--

CREATE TABLE `performing_artist` (
  `Song_id` int(11) NOT NULL COMMENT 'The song in question References SONGS.Song_id',
  `Featured_artist` int(11) NOT NULL COMMENT 'The guest/featured artist Refences ARTIST.Artist_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `performing_artist`
--

INSERT INTO `performing_artist` (`Song_id`, `Featured_artist`) VALUES
(105, 134),
(137, 122),
(138, 149),
(142, 149),
(142, 152),
(142, 155),
(143, 56),
(149, 152),
(150, 56);

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `Song_id` int(11) NOT NULL COMMENT 'Auto-generated integer to serve as the primary key for this entity. This method was chosen because it is very common for different artists to have songs using the same name, and not unheard of for a single artist to have multiple songs by the same name.\n',
  `Song_name` varchar(255) NOT NULL COMMENT 'Attribute to hold the song name\n',
  `Album_artist` int(11) DEFAULT NULL COMMENT 'The primary artist for a song or album. References ARTIST.Artist_id',
  `Song_length` time DEFAULT NULL COMMENT 'The length of the song.',
  `Genre` int(11) DEFAULT NULL COMMENT 'The genre of a song. For our design we are keeping things simple by only using the primary genre for a song. If a song crosses genre boundaries additional genres will not be included. This is due to the somewhat subjective nature of genres. References GENRES.Genre_id',
  `Release_year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`Song_id`, `Song_name`, `Album_artist`, `Song_length`, `Genre`, `Release_year`) VALUES
(1, 'Praise And Negation', 1, '00:04:15', 187, 2007),
(2, 'Ad Nauseam', 1, '00:03:40', 187, 2007),
(3, 'The Mask of The Satyr', 1, '00:06:34', 187, 2007),
(4, 'Becoming The Lycanthrope', 1, '00:04:15', 187, 2007),
(5, 'To Fell Goliath', 1, '00:03:48', 187, 2007),
(6, 'Martyr of The Soil', 1, '00:07:34', 187, 2007),
(7, 'Failure', 1, '00:02:54', 187, 2007),
(8, 'The Coming of Genocide', 1, '00:03:39', 187, 2007),
(9, 'Defaeco', 1, '00:08:42', 187, 2007),
(10, 'Drown Within', 1, '00:06:43', 187, 2009),
(11, 'We Are Nil', 1, '00:05:41', 187, 2009),
(12, 'Withered And Obsolete', 1, '00:06:10', 187, 2009),
(13, 'Caecus', 1, '00:06:26', 187, 2009),
(14, 'Tyranny', 1, '00:05:23', 187, 2009),
(15, 'The Earth At Its Knees', 1, '00:05:45', 187, 2009),
(16, 'Soullessness Embraced', 1, '00:06:36', 187, 2009),
(17, 'Everything Is Fire', 1, '00:07:52', 187, 2009),
(18, 'Burning Skies', 1, '00:07:34', 187, 2011),
(19, 'Dead Oceans', 1, '00:07:01', 187, 2011),
(20, 'Cold Becoming', 1, '00:06:16', 187, 2011),
(21, 'Beneath', 1, '00:06:57', 187, 2011),
(22, 'The Hollow Idols', 1, '00:06:07', 187, 2011),
(23, 'Omens', 1, '00:08:26', 187, 2011),
(24, 'The Destroyers of All', 1, '00:10:31', 187, 2011),
(25, 'Odium', 1, '00:02:44', 187, 2013),
(26, 'Vermis', 1, '00:05:58', 187, 2013),
(27, 'Clutching Revulsion', 1, '00:07:04', 187, 2013),
(28, 'Weight of Emptiness', 1, '00:07:42', 187, 2013),
(29, 'Confronting Entropy', 1, '00:06:30', 187, 2013),
(30, 'Fall To Opprobrium', 1, '00:02:23', 187, 2013),
(31, 'The Imperious Weak', 1, '00:07:23', 187, 2013),
(32, 'Cessation', 1, '00:07:01', 187, 2013),
(33, 'Await Rescission', 1, '00:07:31', 187, 2013),
(34, 'Abrogation', 1, '00:05:50', 48, 2016),
(35, 'Yield To Naught', 1, '00:07:44', 48, 2016),
(36, 'There Are No Saviours', 1, '00:08:04', 48, 2016),
(37, 'Shrines of Paralysis', 1, '00:09:25', 48, 2016),
(38, 'Bow To Spite', 1, '00:01:55', 48, 2016),
(39, 'Chasm of Fire', 1, '00:08:07', 48, 2016),
(40, 'Extinguished Light', 1, '00:08:43', 48, 2016),
(41, 'End The Hope', 1, '00:07:52', 48, 2016),
(42, 'The Lifeless Advance', 1, '00:07:02', 48, 2020),
(43, 'Exhale The Ash', 1, '00:06:20', 48, 2020),
(44, 'Stare Into Death And Be Still', 1, '00:08:25', 48, 2020),
(45, 'There Is No Horizon', 1, '00:07:03', 48, 2020),
(46, 'Inversion', 1, '00:07:06', 48, 2020),
(47, 'Visceral Ends', 1, '00:05:41', 48, 2020),
(48, 'Drawn Into The Next Void', 1, '00:08:38', 48, 2020),
(49, 'Dissolved Orders', 1, '00:08:17', 48, 2020),
(50, 'To Flow Through Ashen Hearts', 1, '00:07:07', 48, 2024),
(51, 'The Dawn Is Hollow', 1, '00:07:33', 48, 2024),
(52, 'Further Opening The Wounds', 1, '00:07:57', 48, 2024),
(53, 'Transfiguration In And Out of Worlds', 1, '00:08:33', 48, 2024),
(54, 'To See Death Just Once', 1, '00:08:24', 48, 2024),
(55, 'Undying As An Apparition', 1, '00:09:33', 48, 2024),
(56, 'Cutting The Throat of God', 1, '00:08:42', 48, 2024),
(57, 'Blue Train', 14, '00:10:44', 87, 1958),
(58, 'Moment\'s Notice', 14, '00:09:11', 87, 1958),
(59, 'Locomotion', 14, '00:07:14', 87, 1958),
(60, 'I\'m Old Fashioned', 14, '00:07:58', 87, 1958),
(61, 'Lazy Bird', 14, '00:07:07', 87, 1958),
(62, 'Giant Steps', 14, '00:04:47', 87, 1960),
(63, 'Cousin Mary', 14, '00:05:50', 87, 1960),
(64, 'Countdown', 14, '00:02:26', 87, 1960),
(65, 'Spiral', 14, '00:06:03', 87, 1960),
(66, 'Syeeda\'s Song Flute', 14, '00:07:06', 87, 1960),
(67, 'Naima', 14, '00:04:25', 87, 1960),
(68, 'Mr P.C.', 14, '00:07:03', 87, 1960),
(69, 'My Favorite Things', 14, '00:13:45', 120, 1961),
(70, 'Every Time We Say Goodbye', 14, '00:05:45', 120, 1961),
(71, 'Summertime', 14, '00:11:36', 120, 1961),
(72, 'But Not for Me', 14, '00:09:36', 120, 1961),
(73, 'Africa', 14, '00:16:29', 120, 1961),
(74, 'Greensleeves', 14, '00:09:58', 120, 1961),
(75, 'Blues Minor', 14, '00:07:21', 120, 1961),
(76, 'Ole', 14, '00:18:19', 120, 1961),
(77, 'Dahomey Dance', 14, '00:10:53', 120, 1961),
(78, 'Aisha', 14, '00:07:45', 120, 1961),
(79, 'Crescent', 14, '00:08:44', 141, 1964),
(80, 'Wise One', 14, '00:09:04', 141, 1964),
(81, 'Bessie\'s Blues', 14, '00:03:35', 141, 1964),
(82, 'Lonnie\'s Lament', 14, '00:11:48', 141, 1964),
(83, 'The Drum Thing', 14, '00:07:23', 141, 1964),
(84, 'Part 1: Acknowledgement', 14, '00:07:43', 16, 1965),
(85, 'Part 2: Resolution', 14, '00:07:20', 16, 1965),
(86, 'Part 3: Pursuance', 14, '00:10:43', 16, 1965),
(87, 'Part 4: Psalm', 14, '00:07:03', 16, 1965),
(88, 'Ascension', 14, '00:40:49', 72, 1966),
(89, 'The Father And The Son And The Holy Ghost', 14, '00:12:51', 72, 1966),
(90, 'Compassion', 14, '00:06:50', 72, 1966),
(91, 'Love', 14, '00:08:10', 72, 1966),
(92, 'Consequences', 14, '00:09:13', 72, 1966),
(93, 'Serenity', 14, '00:03:29', 72, 1966),
(94, 'Mars', 14, '00:10:44', 72, 1974),
(95, 'Venus', 14, '00:08:37', 72, 1974),
(96, 'Jupiter', 14, '00:05:26', 72, 1974),
(97, 'Saturn', 14, '00:11:44', 72, 1974),
(98, 'Untitled Original 11383', 14, '00:05:41', 120, 2018),
(99, 'Nature Boy', 14, '00:03:24', 120, 2018),
(100, 'Untitled Original 11386', 14, '00:08:44', 120, 2018),
(101, 'Vilia', 14, '00:05:33', 120, 2018),
(102, 'Impressions', 14, '00:04:36', 120, 2018),
(103, 'Slow Blues', 14, '00:11:29', 120, 2018),
(104, 'One Up, One Down', 14, '00:08:02', 120, 2018),
(105, 'Sauvage', 17, '00:03:07', 1, 2022),
(107, 'Journey in Satchidananda', 7, NULL, NULL, NULL),
(108, 'Shiva-Loka', 7, NULL, NULL, NULL),
(109, 'Stopover Bombay', 7, NULL, NULL, NULL),
(110, 'Something About John Coltrane', 7, NULL, NULL, NULL),
(111, 'Isis And Osiris', 7, NULL, NULL, NULL),
(112, 'Them Bones', 8, NULL, NULL, NULL),
(113, 'Dam That River', 8, NULL, NULL, NULL),
(114, 'Rain When I Die', 8, NULL, NULL, NULL),
(115, 'Down In A Hole', 8, NULL, NULL, NULL),
(116, 'Sickman', 8, NULL, NULL, NULL),
(117, 'Rooster', 8, NULL, NULL, NULL),
(118, 'Junkhead', 8, NULL, NULL, NULL),
(119, 'Dirt', 8, NULL, NULL, 1992),
(120, 'God Smack', 8, NULL, NULL, NULL),
(122, 'Iron Gland', 8, '00:00:46', NULL, 1992),
(123, 'Hate To Feel', 8, NULL, NULL, 1992),
(124, 'Angry Chair', 8, NULL, NULL, 1992),
(125, 'Would?', 8, NULL, NULL, 1992),
(126, 'Rotten Apple', 8, '00:06:58', NULL, 1994),
(127, 'Nutshell', 8, '00:04:19', NULL, 1994),
(128, 'I Stay Away', 8, '00:04:14', NULL, 1994),
(129, 'No Excuses', 8, '00:04:15', 86, 1994),
(131, 'Whale & Wasp', 8, '00:02:37', NULL, NULL),
(132, 'Don\'t Follow', 8, NULL, NULL, NULL),
(134, 'The Watcher', 49, '00:03:27', 77, 1999),
(137, 'Still D.R.E.', 49, '00:04:31', 77, 1999),
(138, 'Big Ego\'s', 49, '00:03:58', 77, 1999),
(139, 'Let Me Ride', 49, NULL, NULL, NULL),
(140, 'High Powered', 49, NULL, NULL, NULL),
(142, 'Xxplosive', 49, '00:03:35', 77, 1991),
(143, 'Forgot About Dre', 49, '00:03:42', 77, 1999),
(144, 'Pleasuredome', 74, '00:05:36', NULL, 2025),
(145, 'Pleasuredome', 74, '00:05:36', NULL, 2025),
(147, 'Stan', 56, '00:06:44', 91, 2000),
(148, 'The Real Slim Shady', 56, '00:04:44', 91, 2000),
(149, '\'Till I Collapse', 56, '00:04:57', 91, 2002),
(150, 'Renagade', 78, '00:05:12', NULL, 2001);

-- --------------------------------------------------------

--
-- Table structure for table `song_albums`
--

CREATE TABLE `song_albums` (
  `Song_id` int(11) NOT NULL COMMENT 'The song in question. Serves as the primary key. Table serves to link songs to the albums they appear on. References SONGS.Song_id',
  `Album_id` int(11) NOT NULL COMMENT 'The album the song appears on. References ALBUMS.Album_id',
  `Track_number` int(11) DEFAULT NULL COMMENT 'Attribute to hold the track number of a song/track on an album'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `song_albums`
--

INSERT INTO `song_albums` (`Song_id`, `Album_id`, `Track_number`) VALUES
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 2, 1),
(11, 2, 2),
(12, 2, 3),
(13, 2, 4),
(14, 2, 5),
(15, 2, 6),
(16, 2, 7),
(17, 2, 8),
(18, 3, 1),
(19, 3, 2),
(20, 3, 3),
(21, 3, 4),
(22, 3, 5),
(23, 3, 6),
(24, 3, 7),
(25, 4, 1),
(26, 4, 2),
(27, 4, 3),
(28, 4, 4),
(29, 4, 5),
(30, 4, 6),
(31, 4, 7),
(32, 4, 8),
(33, 4, 9),
(34, 5, 1),
(35, 5, 2),
(36, 5, 3),
(37, 5, 4),
(38, 5, 5),
(39, 5, 6),
(40, 5, 7),
(41, 5, 8),
(42, 6, 1),
(43, 6, 2),
(44, 6, 3),
(45, 6, 4),
(46, 6, 5),
(47, 6, 6),
(48, 6, 7),
(49, 6, 8),
(50, 7, 1),
(51, 7, 2),
(52, 7, 3),
(53, 7, 4),
(54, 7, 5),
(55, 7, 6),
(56, 7, 7),
(57, 44, 1),
(58, 44, 2),
(59, 44, 3),
(60, 44, 4),
(61, 44, 5),
(62, 45, 1),
(63, 45, 2),
(64, 45, 3),
(65, 45, 4),
(66, 45, 5),
(67, 45, 6),
(68, 45, 7),
(69, 46, 1),
(70, 46, 2),
(71, 46, 3),
(72, 46, 4),
(73, 47, 1),
(74, 47, 2),
(75, 47, 3),
(76, 48, 1),
(77, 48, 2),
(78, 48, 3),
(79, 49, 1),
(80, 49, 2),
(81, 49, 3),
(82, 49, 4),
(83, 49, 5),
(84, 50, 1),
(85, 50, 2),
(86, 50, 3),
(87, 50, 4),
(88, 51, 1),
(89, 52, 1),
(90, 52, 2),
(91, 52, 3),
(92, 52, 4),
(93, 52, 5),
(94, 53, 1),
(95, 53, 2),
(96, 53, 3),
(97, 53, 4),
(98, 54, 1),
(99, 54, 2),
(100, 54, 3),
(101, 54, 4),
(102, 54, 5),
(103, 54, 6),
(104, 54, 7),
(105, 55, 4),
(123, 58, NULL),
(124, 58, NULL),
(125, 58, NULL),
(126, 59, NULL),
(129, 59, NULL),
(134, 61, NULL),
(137, 61, NULL),
(138, 61, NULL),
(139, 63, NULL),
(140, 63, NULL),
(142, 61, NULL),
(143, 61, NULL),
(144, 93, NULL),
(145, 93, NULL),
(147, 95, 3),
(148, 95, 8),
(149, 96, 18),
(150, 94, 12);

-- --------------------------------------------------------

--
-- Table structure for table `years_active`
--

CREATE TABLE `years_active` (
  `Years_active_id` int(11) NOT NULL COMMENT 'Auto-generated integer to serve as the primary key for this entity.\n',
  `Artist_id` int(11) DEFAULT NULL COMMENT 'The artist in question. References ARTISTS.Artist_id',
  `Start_date` varchar(10) DEFAULT NULL COMMENT 'The date or year an artist started to be active. Use a VARCHAR(10) as the most information that may be known for an artist start date is up to 10 characters (YYYY-MM-DD). More often only the year will be listed as this level of precision is often not known. The DATE data type is not used because of this inconsistent precision and a DATE type attribute is not able to accept only the year if the rest of the start date is not known. Inputting "Unknown" is acceptable when the start data is uknown and falls within the character limit.',
  `End_date` varchar(10) DEFAULT NULL COMMENT 'The date or year an artist stopped being active. Use a VARCHAR(10) as the most information that may be known for an artist start date is up to 10 characters (YYYY-MM-DD). More often only the year will be listed as this level of precision is often not known. For artists that are still active the value "present" will be used instead (which is less than 10 characters). Inputting "Unknown" is acceptable when the start data is uknown and falls within the character limit.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `years_active`
--

INSERT INTO `years_active` (`Years_active_id`, `Artist_id`, `Start_date`, `End_date`) VALUES
(1, 139, '2013', 'Present'),
(2, 136, '2019', 'Present'),
(3, 140, '2018', NULL),
(4, 141, NULL, 'Present'),
(5, 144, '2015', 'Present'),
(6, 157, '1934', '1993');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `affiliations`
--
ALTER TABLE `affiliations`
  ADD PRIMARY KEY (`Group_id`,`Artist_id`),
  ADD KEY `Artist_id_idx` (`Artist_id`),
  ADD KEY `Group_id` (`Group_id`);

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`Album_id`),
  ADD KEY `Album_artist_idx` (`Album_artist`);

--
-- Indexes for table `album_genres`
--
ALTER TABLE `album_genres`
  ADD PRIMARY KEY (`Album_id`,`Genre_id`),
  ADD KEY `Genre_id_idx` (`Genre_id`);

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`Artist_id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`Genre_id`);

--
-- Indexes for table `performing_artist`
--
ALTER TABLE `performing_artist`
  ADD PRIMARY KEY (`Song_id`,`Featured_artist`),
  ADD KEY `Song_id_idx` (`Song_id`),
  ADD KEY `Featured_artist_idx` (`Featured_artist`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`Song_id`),
  ADD KEY `Album_artist_idx` (`Album_artist`),
  ADD KEY `Genre_idx` (`Genre`);

--
-- Indexes for table `song_albums`
--
ALTER TABLE `song_albums`
  ADD PRIMARY KEY (`Song_id`,`Album_id`),
  ADD KEY `Album_id_idx` (`Album_id`);

--
-- Indexes for table `years_active`
--
ALTER TABLE `years_active`
  ADD PRIMARY KEY (`Years_active_id`),
  ADD KEY `Artist_id_idx` (`Artist_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `Album_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Auto-generated integer to serve as the primary key for this entity. This method was chosen because it is not uncommon for different artists to have albums using the same name, and even sometimes a single artist will have multiple albums with the same name.\n', AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `Artist_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Auto-generated integer to serve as the primary key for this entity. This method was chosen because there are multiple artists with the same name, as well as to account for artist name changes.\n', AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `Genre_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Auto-generated integer to serve as the primary key for this entity. This was chosen because the same genre name sometimes refers to distinct genres. (Hardcore for instance can refer to a style of punk or a style of electronic music).\n', AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `Song_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Auto-generated integer to serve as the primary key for this entity. This method was chosen because it is very common for different artists to have songs using the same name, and not unheard of for a single artist to have multiple songs by the same name.\n', AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `years_active`
--
ALTER TABLE `years_active`
  MODIFY `Years_active_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Auto-generated integer to serve as the primary key for this entity.\n', AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `affiliations`
--
ALTER TABLE `affiliations`
  ADD CONSTRAINT `Affiliation_Artist_ID` FOREIGN KEY (`Artist_id`) REFERENCES `artists` (`Artist_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Affliation_Group_id_idx` FOREIGN KEY (`Group_id`) REFERENCES `artists` (`Artist_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `Album_artist_idx` FOREIGN KEY (`Album_artist`) REFERENCES `artists` (`Artist_id`),
  ADD CONSTRAINT `Albums_Artist_ID` FOREIGN KEY (`Album_artist`) REFERENCES `artists` (`Artist_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `album_genres`
--
ALTER TABLE `album_genres`
  ADD CONSTRAINT `Album_Genre_Album_ID` FOREIGN KEY (`Album_id`) REFERENCES `albums` (`Album_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Album_Genre_Genre_ID` FOREIGN KEY (`Genre_id`) REFERENCES `genres` (`Genre_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `performing_artist`
--
ALTER TABLE `performing_artist`
  ADD CONSTRAINT `Featured_Artist_Artist_ID` FOREIGN KEY (`Featured_artist`) REFERENCES `artists` (`Artist_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Performing_Artist_Song_ID` FOREIGN KEY (`Song_id`) REFERENCES `songs` (`Song_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `Songs_Artist_ID` FOREIGN KEY (`Album_artist`) REFERENCES `artists` (`Artist_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Songs_Genre_ID` FOREIGN KEY (`Genre`) REFERENCES `genres` (`Genre_id`) ON UPDATE CASCADE;

--
-- Constraints for table `song_albums`
--
ALTER TABLE `song_albums`
  ADD CONSTRAINT `Song_Album_Songs_ID` FOREIGN KEY (`Song_id`) REFERENCES `songs` (`Song_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Song_Albums_Album_ID` FOREIGN KEY (`Album_id`) REFERENCES `albums` (`Album_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `years_active`
--
ALTER TABLE `years_active`
  ADD CONSTRAINT `Years_Active_Artist_ID` FOREIGN KEY (`Artist_id`) REFERENCES `artists` (`Artist_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
