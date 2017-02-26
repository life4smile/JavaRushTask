CREATE SCHEMA `test` DEFAULT CHARACTER SET utf8;

CREATE TABLE `test`.`user` (
`ID` INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
`NAME` VARCHAR(25) NOT NULL,
`AGE` INT(11) NOT NULL,
`IS_ADMIN` BIT(1) NOT NULL DEFAULT false,
`CREATED_DATE` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

INSERT INTO `test`.`user` (`NAME`, `AGE`, `IS_ADMIN`) VALUES ('Ivanov', '20', '1');
INSERT INTO `test`.`user` (`NAME`, `AGE`, `IS_ADMIN`) VALUES ('Petrov', '21', '0');
INSERT INTO `test`.`user` (`NAME`, `AGE`, `IS_ADMIN`) VALUES ('Smirnov', '22', '0');
INSERT INTO `test`.`user` (`NAME`, `AGE`, `IS_ADMIN`) VALUES ('Kuznecov', '23', '0');
INSERT INTO `test`.`user` (`NAME`, `AGE`, `IS_ADMIN`) VALUES ('Popov', '35', '1');
INSERT INTO `test`.`user` (`NAME`, `AGE`, `IS_ADMIN`) VALUES ('Sokolov', '53', '0');
INSERT INTO `test`.`user` (`NAME`, `AGE`, `IS_ADMIN`) VALUES ('Novikov', '35', '0');
INSERT INTO `test`.`user` (`NAME`, `AGE`, `IS_ADMIN`) VALUES ('Egorov', '2', '0');
INSERT INTO `test`.`user` (`NAME`, `AGE`, `IS_ADMIN`) VALUES ('Orlov', '86', '0');
INSERT INTO `test`.`user` (`NAME`, `AGE`, `IS_ADMIN`) VALUES ('Makarov', '12', '0');
INSERT INTO `test`.`user` (`NAME`, `AGE`, `IS_ADMIN`) VALUES ('Romanov', '56', '1');
INSERT INTO `test`.`user` (`NAME`, `AGE`, `IS_ADMIN`) VALUES ('Sergeev', '53', '0');
