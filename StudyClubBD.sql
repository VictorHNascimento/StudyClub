-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 22-Nov-2021 às 23:58
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studyclub`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `rotInsTarefa` (IN `idUser` INT(11), IN `nome` VARCHAR(60), IN `materia` VARCHAR(60), IN `progresso` INT(11), IN `statusTarefa` VARCHAR(15), IN `dataIni` DATE, IN `prazo` DATE, IN `descri` VARCHAR(240))  BEGIN
INSERT INTO cadtarefa(cadtarefa.idUser, cadtarefa.nomeTarefa, cadtarefa.mateTarefa, cadtarefa.progTarefa, cadtarefa.statusTarefa, cadtarefa.dataTarefa, cadtarefa.prazoTarefa, cadtarefa.descTarefa) 
VALUES (idUser, nome, materia, progresso,statusTarefa,dataIni, prazo, descri);
                       END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `rotInsUser` (IN `nome` VARCHAR(120), IN `data` DATE, IN `sexo` VARCHAR(120), IN `estado` VARCHAR(120), IN `cidade` VARCHAR(120), IN `escola` VARCHAR(120), IN `email` VARCHAR(120), IN `senha` VARCHAR(120), IN `nick` VARCHAR(120))  BEGIN
INSERT INTO cadUser (caduser.idUser, cadUser.nomeUser, cadUser.nickUser, cadUser.anivUser,cadUser.genUser,cadUser.estadoUser, cadUser.cidadeUser, cadUser.escolaUser, cadUser.emailUser, cadUser.senhaUser) 
VALUES (
    '', nome, nick, data, sexo, estado, cidade, escola, email, md5(senha)
    );
 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadtarefa`
--

CREATE TABLE `cadtarefa` (
  `idTarefa` int(20) NOT NULL,
  `idUser` int(11) NOT NULL,
  `nomeTarefa` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  `mateTarefa` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  `progTarefa` int(11) NOT NULL,
  `statusTarefa` varchar(15) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'A Realizar',
  `dataTarefa` date NOT NULL,
  `prazoTarefa` date NOT NULL,
  `descTarefa` varchar(240) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `caduser`
--

CREATE TABLE `caduser` (
  `idUser` int(11) NOT NULL,
  `nomeUser` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickUser` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `anivUser` date NOT NULL,
  `genUser` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estadoUser` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidadeUser` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `escolaUser` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailUser` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senhaUser` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `loguser`
-- (See below for the actual view)
--
CREATE TABLE `loguser` (
`idUser` int(11)
,`nickUser` varchar(120)
,`emailUser` varchar(120)
,`senhaUser` varchar(120)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tarefaandamento`
-- (See below for the actual view)
--
CREATE TABLE `tarefaandamento` (
`idTarefa` int(20)
,`idUser` int(11)
,`nomeTarefa` varchar(60)
,`mateTarefa` varchar(60)
,`progTarefa` int(11)
,`statusTarefa` varchar(15)
,`dataTarefa` date
,`prazoTarefa` date
,`descTarefa` varchar(240)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tarefaconcluida`
-- (See below for the actual view)
--
CREATE TABLE `tarefaconcluida` (
`idTarefa` int(20)
,`idUser` int(11)
,`nomeTarefa` varchar(60)
,`mateTarefa` varchar(60)
,`progTarefa` int(11)
,`statusTarefa` varchar(15)
,`dataTarefa` date
,`prazoTarefa` date
,`descTarefa` varchar(240)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tarefarealizar`
-- (See below for the actual view)
--
CREATE TABLE `tarefarealizar` (
`idTarefa` int(20)
,`idUser` int(11)
,`nomeTarefa` varchar(60)
,`mateTarefa` varchar(60)
,`progTarefa` int(11)
,`statusTarefa` varchar(15)
,`dataTarefa` date
,`prazoTarefa` date
,`descTarefa` varchar(240)
);

-- --------------------------------------------------------

--
-- Structure for view `loguser`
--
DROP TABLE IF EXISTS `loguser`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `loguser`  AS  select `caduser`.`idUser` AS `idUser`,`caduser`.`nickUser` AS `nickUser`,`caduser`.`emailUser` AS `emailUser`,`caduser`.`senhaUser` AS `senhaUser` from `caduser` where ((`caduser`.`idUser` = `caduser`.`idUser`) and (`caduser`.`senhaUser` = `caduser`.`senhaUser`)) ;

-- --------------------------------------------------------

--
-- Structure for view `tarefaandamento`
--
DROP TABLE IF EXISTS `tarefaandamento`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tarefaandamento`  AS  select `cadtarefa`.`idTarefa` AS `idTarefa`,`cadtarefa`.`idUser` AS `idUser`,`cadtarefa`.`nomeTarefa` AS `nomeTarefa`,`cadtarefa`.`mateTarefa` AS `mateTarefa`,`cadtarefa`.`progTarefa` AS `progTarefa`,`cadtarefa`.`statusTarefa` AS `statusTarefa`,`cadtarefa`.`dataTarefa` AS `dataTarefa`,`cadtarefa`.`prazoTarefa` AS `prazoTarefa`,`cadtarefa`.`descTarefa` AS `descTarefa` from `cadtarefa` where ((`cadtarefa`.`progTarefa` <> 0) and (`cadtarefa`.`progTarefa` <> 100) and (`cadtarefa`.`statusTarefa` = 'Em Andamento')) ;

-- --------------------------------------------------------

--
-- Structure for view `tarefaconcluida`
--
DROP TABLE IF EXISTS `tarefaconcluida`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tarefaconcluida`  AS  select `cadtarefa`.`idTarefa` AS `idTarefa`,`cadtarefa`.`idUser` AS `idUser`,`cadtarefa`.`nomeTarefa` AS `nomeTarefa`,`cadtarefa`.`mateTarefa` AS `mateTarefa`,`cadtarefa`.`progTarefa` AS `progTarefa`,`cadtarefa`.`statusTarefa` AS `statusTarefa`,`cadtarefa`.`dataTarefa` AS `dataTarefa`,`cadtarefa`.`prazoTarefa` AS `prazoTarefa`,`cadtarefa`.`descTarefa` AS `descTarefa` from `cadtarefa` where ((`cadtarefa`.`progTarefa` = 100) and (`cadtarefa`.`statusTarefa` = 'Concluida')) ;

-- --------------------------------------------------------

--
-- Structure for view `tarefarealizar`
--
DROP TABLE IF EXISTS `tarefarealizar`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tarefarealizar`  AS  select `cadtarefa`.`idTarefa` AS `idTarefa`,`cadtarefa`.`idUser` AS `idUser`,`cadtarefa`.`nomeTarefa` AS `nomeTarefa`,`cadtarefa`.`mateTarefa` AS `mateTarefa`,`cadtarefa`.`progTarefa` AS `progTarefa`,`cadtarefa`.`statusTarefa` AS `statusTarefa`,`cadtarefa`.`dataTarefa` AS `dataTarefa`,`cadtarefa`.`prazoTarefa` AS `prazoTarefa`,`cadtarefa`.`descTarefa` AS `descTarefa` from `cadtarefa` where ((`cadtarefa`.`progTarefa` = 0) and (`cadtarefa`.`statusTarefa` = 'A Realizar')) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cadtarefa`
--
ALTER TABLE `cadtarefa`
  ADD PRIMARY KEY (`idTarefa`),
  ADD KEY `idUser` (`idUser`);

--
-- Indexes for table `caduser`
--
ALTER TABLE `caduser`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `emailUser` (`emailUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cadtarefa`
--
ALTER TABLE `cadtarefa`
  MODIFY `idTarefa` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `caduser`
--
ALTER TABLE `caduser`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
