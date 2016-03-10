CREATE TABLE `Buku` (
  `id_buku` int(11) NOT NULL,
  `judul_buku` varchar(50) NOT NULL,
  `id_pengarang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `Buku` (`id_buku`, `judul_buku`, `id_pengarang`) VALUES
(1, 'Me Before You', 1011123),
(2, 'The 8-Week Blood Sugar Diet', 1011123),
(3, 'I Quit Sugar', 1011121),
(4, 'The Book Thief', 1011122),
(5, 'The Dressmaker', 1011122),
(6, 'Against All Grain', 1011121),
(7, 'The Elegance of the Hedgehog', 1011122);

CREATE TABLE `Pengarang` (
  `id_pengarang` int(11) NOT NULL,
  `nama_pengarang` varchar(50) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `Pengarang` (`id_pengarang`, `nama_pengarang`, `jenis_kelamin`) VALUES
(1011121, 'Joe Wick', 'L'),
(1011122, 'Michael Mosley', 'L'),
(1011123, 'Bell Hooks', 'L');

ALTER TABLE `Buku`
  ADD PRIMARY KEY (`id_buku`);

ALTER TABLE `Pengarang`
  ADD PRIMARY KEY (`id_pengarang`);

ALTER TABLE `Buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `Pengarang`
  MODIFY `id_pengarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1011124;

SELECT Buku.judul_buku
FROM Buku
JOIN Pengarang ON Buku.id_pengarang = Pengarang.id_pengarang
WHERE Pengarang.nama_pengarang = 'Joe Wick';

SELECT Buku.judul_buku
FROM Buku
JOIN Pengarang On Buku.id_pengarang = Pengarang.id_pengarang
WHERE Pengarang.nama_pengarang = 'Chairil Anwar';