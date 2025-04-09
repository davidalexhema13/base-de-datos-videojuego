CREATE TABLE `games` (
    `ID` INTEGER NOT NULL,
    `_id` VARBINARY(12),
    `titulo` LONGTEXT,
    `descripcion` LONGTEXT,
    `precio` DOUBLE,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;



-- { _id: 67db1801e337a720aa1291c3 }
INSERT INTO `games` (`ID`, `_id`, `titulo`, `descripcion`, `precio`)
    VALUES
        (0, x'67DB1801E337A720AA1291C3', 'The Witcher 3: Wild Hunt', 'The Witcher 3: Wild Hunt es un juego de rol de mundo abierto desarrollado por CD Projekt Red.', 120.0);

