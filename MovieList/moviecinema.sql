-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Nov 2020 pada 12.06
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moviecinema`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `comment_movie`
--

CREATE TABLE `comment_movie` (
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `comment_movie`
--

INSERT INTO `comment_movie` (`user_id`, `movie_id`, `user_name`, `comment`) VALUES
(6, 13, 'test3', 'Ini film bagus banget!'),
(6, 13, 'test3', 'ini film recommended'),
(6, 13, 'test3', 'pokoknya keren deh'),
(6, 13, 'test3', NULL),
(6, 13, 'test3', NULL),
(6, 13, 'test3', 'test'),
(6, 13, 'test3', 'test2'),
(6, 13, 'test3', 'test3'),
(6, 13, 'test3', 'test5'),
(6, 13, 'test3', 'test4'),
(1, 13, 'abc', 'waw'),
(1, 4, 'Dimas', 'Film animasi yang bagus walaupun telah dibuat 19 tahun yang lalu'),
(1, 4, 'Dimas', 'Film animasi yang bagus walaupun telah dibuat 19 tahun yang lalu'),
(1, 13, 'Dimas', ''),
(1, 13, 'Dimas', 'test5'),
(1, 13, 'Dimas', 'test5'),
(1, 13, 'Dimas', 'test6'),
(2, 4, 'Nova', 'Anime favorite saya!'),
(3, 4, 'Kyle', 'Film ini membawa kita ke dalam dunia fantasi lain dengan sangat baik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `movie`
--

CREATE TABLE `movie` (
  `movie_id` int(3) NOT NULL,
  `movie_name` varchar(20) DEFAULT NULL,
  `director` varchar(20) DEFAULT NULL,
  `year` varchar(20) DEFAULT NULL,
  `movie_img_url` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `movie`
--

INSERT INTO `movie` (`movie_id`, `movie_name`, `director`, `year`, `movie_img_url`) VALUES
(4, 'Spirited Away', 'Hayao Miyazaki', '2001', 'https://markb4.files.wordpress.com/2014/02/spirited-away.jpg'),
(5, 'BirdBox', ' Susanne Bier.', '2018', 'https://th.bing.com/th/id/OIP.u2vEcmwWluUVoXkMscYAWAHaHa?pid=Api&rs=1'),
(8, 'Parasite', 'Bong Joon Ho', '2019', 'https://th.bing.com/th/id/OIP.CUVKYytYBi6YRdHqwolMKAHaLH?pid=Api&rs=1'),
(12, 'Aquaman', 'James Wan', '2018', 'https://kpreviews.files.wordpress.com/2017/12/aquaman__2018____poster_by_saydesigns-dbjw7ce.jpg?w=760'),
(13, 'The Conjuring', 'James Wan', '2013', 'http://pgsramblings.files.wordpress.com/2014/06/the-conjuring.jpg?w=800'),
(14, 'Kimi no nawa', 'Makoto Shinkai', '2016', 'https://vignette.wikia.nocookie.net/kiminonawa/images/6/62/Kimi-no-Na-wa.-Visual.jpg/revision/latest?cb=20160927170951');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `email`, `username`, `password`) VALUES
(1, 'test1@gmail.com', 'Dimas', '123456'),
(2, 'test2@gmail.com', 'Nova', '123456'),
(3, 'test3@gmail.com', 'Kyle', '123456');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movie_id`),
  ADD UNIQUE KEY `movie_name` (`movie_name`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `movie`
--
ALTER TABLE `movie`
  MODIFY `movie_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
