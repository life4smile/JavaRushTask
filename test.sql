CREATE SCHEMA `test` DEFAULT CHARACTER SET utf8;

CREATE TABLE `test`.`user` (
`ID` INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
`NAME` VARCHAR(25) NOT NULL,
`AGE` INT(11) NOT NULL,
`IS_ADMIN` BIT(1) NOT NULL DEFAULT false,
`CREATED_DATE` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Ivanov', '20');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Petrov', '21');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Smirnov', '22');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Kuznecov', '23');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Popov', '35');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Sokolov', '53');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Novikov', '35');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Egorov', '2');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Orlov', '86');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Makarov', '12');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Romanov', '56');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Sergeev', '53');
