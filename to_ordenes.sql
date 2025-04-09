CREATE TABLE `ordenes` (
    `ID` INTEGER NOT NULL,
    `_id` VARBINARY(12),
    `usuario_id` VARBINARY(12),
    `total` DOUBLE,
    `estado` LONGTEXT,
    `fecha` DATETIME,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;


CREATE TABLE `ordenes_juegos` (
    `ID` INTEGER NOT NULL,
    `parent_fk` INTEGER,
    `INDEX` INTEGER,
    `Object_fk` INTEGER,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;


CREATE TABLE `ordenes_juegos_Object` (
    `ID` INTEGER NOT NULL,
    `juego_id` VARBINARY(12),
    `cantidad` INTEGER,
    `precio` DOUBLE,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;


ALTER TABLE `ordenes_juegos`
ADD CONSTRAINT `s3t_ordenes_juegos_ordenes_0` FOREIGN KEY (`parent_fk`) REFERENCES `ordenes`(`ID`),
ADD CONSTRAINT `s3t_ordenes_juegos_ordenes_juegos_Object_0` FOREIGN KEY (`Object_fk`) REFERENCES `ordenes_juegos_Object`(`ID`);



-- { _id: 67d1f0602fbe37213f3d4448 }
INSERT INTO `ordenes` (`ID`, `_id`, `usuario_id`, `total`, `estado`, `fecha`)
    VALUES
        (0, x'67D1F0602FBE37213F3D4448', x'67D1F0602FBE37213F3D4446', 29.99, 'pendiente', '2025-03-12 12:00:00.000000');

INSERT INTO `ordenes_juegos_Object` (`ID`, `juego_id`, `cantidad`, `precio`)
    VALUES
        (0, x'67D1F0602FBE37213F3D4447', 1, 29.99);

INSERT INTO `ordenes_juegos` (`ID`, `parent_fk`, `INDEX`, `Object_fk`)
    VALUES
        (0, 0, 0, 0);

