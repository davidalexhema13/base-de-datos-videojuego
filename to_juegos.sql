CREATE TABLE `juegos` (
    `ID` INTEGER NOT NULL,
    `_id` VARBINARY(12),
    `titulo` LONGTEXT,
    `descripcion` LONGTEXT,
    `precio` DOUBLE,
    `stock` INTEGER,
    `publicador` LONGTEXT,
    `fecha_lanzamiento` DATETIME,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;


CREATE TABLE `juegos_plataformas` (
    `ID` INTEGER NOT NULL,
    `parent_fk` INTEGER,
    `INDEX` INTEGER,
    `String` LONGTEXT,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;


CREATE TABLE `juegos_generos` (
    `ID` INTEGER NOT NULL,
    `parent_fk` INTEGER,
    `INDEX` INTEGER,
    `String` LONGTEXT,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;


CREATE TABLE `juegos_imagenes` (
    `ID` INTEGER NOT NULL,
    `parent_fk` INTEGER,
    `INDEX` INTEGER,
    `String` LONGTEXT,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;


ALTER TABLE `juegos_plataformas`
ADD CONSTRAINT `s3t_juegos_plataformas_juegos_0` FOREIGN KEY (`parent_fk`) REFERENCES `juegos`(`ID`);


ALTER TABLE `juegos_generos`
ADD CONSTRAINT `s3t_juegos_generos_juegos_0` FOREIGN KEY (`parent_fk`) REFERENCES `juegos`(`ID`);


ALTER TABLE `juegos_imagenes`
ADD CONSTRAINT `s3t_juegos_imagenes_juegos_0` FOREIGN KEY (`parent_fk`) REFERENCES `juegos`(`ID`);



-- { _id: 67d1efb12fbe37213f3d4444 }
INSERT INTO `juegos` (`ID`, `_id`, `titulo`, `descripcion`, `precio`, `stock`, `publicador`, `fecha_lanzamiento`)
    VALUES
        (0, x'67D1EFB12FBE37213F3D4444', 'GTA V', 'Juego de mundo abierto con muchas misiones.', 29.99, 50, 'Rockstar Games', '2013-09-17 00:00:00.000000');

INSERT INTO `juegos_plataformas` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (0, 0, 0, 'PC');

INSERT INTO `juegos_plataformas` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (1, 0, 1, 'PS5');

INSERT INTO `juegos_plataformas` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (2, 0, 2, 'Xbox');

INSERT INTO `juegos_generos` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (0, 0, 0, 'Acción');

INSERT INTO `juegos_generos` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (1, 0, 1, 'Aventura');

INSERT INTO `juegos_imagenes` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (0, 0, 0, 'gta5.jpg');


-- { _id: 67d1f0602fbe37213f3d4447 }
INSERT INTO `juegos` (`ID`, `_id`, `titulo`, `descripcion`, `precio`, `stock`, `publicador`, `fecha_lanzamiento`)
    VALUES
        (1, x'67D1F0602FBE37213F3D4447', 'GTA V', 'Juego de mundo abierto con muchas misiones.', 29.99, 50, 'Rockstar Games', '2013-09-17 00:00:00.000000');

INSERT INTO `juegos_plataformas` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (3, 1, 0, 'PC');

INSERT INTO `juegos_plataformas` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (4, 1, 1, 'PS5');

INSERT INTO `juegos_plataformas` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (5, 1, 2, 'Xbox');

INSERT INTO `juegos_generos` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (2, 1, 0, 'Acción');

INSERT INTO `juegos_generos` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (3, 1, 1, 'Aventura');

INSERT INTO `juegos_imagenes` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (1, 1, 0, 'gta5.jpg');

