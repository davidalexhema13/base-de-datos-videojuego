CREATE TABLE `usuarios` (
    `ID` INTEGER NOT NULL,
    `_id` VARBINARY(12),
    `nombre` LONGTEXT,
    `correo` LONGTEXT,
    `contraseña` LONGTEXT,
    `direccion` LONGTEXT,
    `telefono` LONGTEXT,
    `rol` LONGTEXT,
    `fecha_registro` DATETIME,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;



-- { _id: 67d1efb02fbe37213f3d4443 }
INSERT INTO `usuarios` (`ID`, `_id`, `nombre`, `correo`, `contraseña`, `direccion`, `telefono`, `rol`, `fecha_registro`)
    VALUES
        (0, x'67D1EFB02FBE37213F3D4443', 'David Hernández', 'david@example.com', 'hash_password', 'Calle 123, Medellín, Colombia', '+57 3001234567', 'cliente', '2025-03-12 12:00:00.000000');


-- { _id: 67d1f0602fbe37213f3d4446 }
INSERT INTO `usuarios` (`ID`, `_id`, `nombre`, `correo`, `contraseña`, `direccion`, `telefono`, `rol`, `fecha_registro`)
    VALUES
        (1, x'67D1F0602FBE37213F3D4446', 'David Hernández', 'david@example.com', 'hash_password', 'Calle 123, Medellín, Colombia', '+57 3001234567', 'cliente', '2025-03-12 12:00:00.000000');

