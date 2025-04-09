CREATE TABLE `user` (
    `ID` INTEGER NOT NULL,
    `_id` VARBINARY(12),
    `name` LONGTEXT,
    `age` INTEGER,
    `status` LONGTEXT,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;



-- { _id: 67b772db198f06b8f042839b }
INSERT INTO `user` (`ID`, `_id`, `name`, `age`, `status`)
    VALUES
        (0, x'67B772DB198F06B8F042839B', 'sue', 26, 'pending');

