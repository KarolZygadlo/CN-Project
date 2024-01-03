-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Lis 27, 2023 at 09:05 AM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ksiegarnia`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klient`
--

CREATE TABLE `klient` (
  `idklient` int(11) NOT NULL,
  `imie` varchar(45) DEFAULT NULL,
  `nazwisko` varchar(45) DEFAULT NULL,
  `adres` varchar(45) DEFAULT NULL,
  `telefon` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klient`
--

INSERT INTO `klient` (`idklient`, `imie`, `nazwisko`, `adres`, `telefon`) VALUES
(1, 'Jan ', 'Kowalski', 'Legnica ul.Hutników 2', '508508510'),
(2, 'Anna', 'Nowak', 'Lubin ul.Legnicla 12', '502503504'),
(3, 'Tomasz', 'Nowak', 'Lubin ul.Legnicla 12', '502508509');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkt`
--

CREATE TABLE `produkt` (
  `idprodukt` int(11) NOT NULL,
  `nazwa_produktu` varchar(45) DEFAULT NULL,
  `cena` float DEFAULT NULL,
  `kod_produktu` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produkt`
--

INSERT INTO `produkt` (`idprodukt`, `nazwa_produktu`, `cena`, `kod_produktu`) VALUES
(1, 'Kurs C++', 99, '10520'),
(2, 'Sieci komputerowe', 59, '10444');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zakupy`
--

CREATE TABLE `zakupy` (
  `idzakupy` int(11) NOT NULL,
  `id_klienta` int(11) DEFAULT NULL,
  `id_produktu` int(11) DEFAULT NULL,
  `data_zakupu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zakupy`
--

INSERT INTO `zakupy` (`idzakupy`, `id_klienta`, `id_produktu`, `data_zakupu`) VALUES
(1, 1, 1, '2023-11-21');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`idklient`);

--
-- Indeksy dla tabeli `produkt`
--
ALTER TABLE `produkt`
  ADD PRIMARY KEY (`idprodukt`);

--
-- Indeksy dla tabeli `zakupy`
--
ALTER TABLE `zakupy`
  ADD PRIMARY KEY (`idzakupy`),
  ADD KEY `fk_idproduktu` (`id_produktu`),
  ADD KEY `fk_idklienta` (`id_klienta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `klient`
--
ALTER TABLE `klient`
  MODIFY `idklient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `produkt`
--
ALTER TABLE `produkt`
  MODIFY `idprodukt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `zakupy`
--
ALTER TABLE `zakupy`
  MODIFY `idzakupy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `zakupy`
--
ALTER TABLE `zakupy`
  ADD CONSTRAINT `fk_idklienta` FOREIGN KEY (`id_klienta`) REFERENCES `klient` (`idklient`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idproduktu` FOREIGN KEY (`id_produktu`) REFERENCES `produkt` (`idprodukt`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
