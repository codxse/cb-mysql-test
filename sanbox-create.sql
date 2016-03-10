CREATE TABLE Pengarang(
	`id_pengarang` INT(20) NOT NULL AUTO_INCREMENT,
	`nomor_pengarang` VARCHAR(20) NOT NULL,
	`jenis_kelamin` enum('L','P') NOT NULL,
	PRIMARY KEY(`id_pengarang`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE Buku(
	`id_buku` INT(20) NOT NULL AUTO_INCREMENT,
	`judul_buku` VARCHAR(50) NOT NULL,
	`id_pengarang` INT(20) NOT NULL,
	PRIMARY KEY(`id_buku`),
	FOREIGN KEY(`id_pengarang`)
		REFERENCES Pengarang(`id_pengarang`)
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;