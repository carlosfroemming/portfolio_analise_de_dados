-- Este código foi gerado a partir da configuração do Diagrama Entidade Relacionamento realizado no MySQL Workbench, 
-- com algumas pequenas alterações e com as importações dos arquivos CSV da fonte de dados, os quais foram baixados do site do
-- Ministério do Desenvolvimento, Indústria, Comércio e Serviços, na parte de Estatísticas de Comércio Exterior em Dados Abertos.

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Schema exportacoes_brasil_2022
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exportacoes_brasil_2022` DEFAULT CHARACTER SET utf8 ;
USE `exportacoes_brasil_2022` ;

-- -----------------------------------------------------
-- Table `exportacoes_brasil_2022`.`NCM_SH`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exportacoes_brasil_2022`.`NCM_SH` (
  `CO_SH4` INT NOT NULL AUTO_INCREMENT,
  `NO_SH4_POR` VARCHAR(300) NOT NULL,
  `CO_SH2` INT NOT NULL,
  `NO_SH2_POR` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`CO_SH4`))
ENGINE = InnoDB;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/NCM_SH.csv"
INTO TABLE NCM_SH
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- -----------------------------------------------------
-- Table `exportacoes_brasil_2022`.`PAIS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exportacoes_brasil_2022`.`PAIS` (
  `CO_PAIS` INT NOT NULL AUTO_INCREMENT,
  `CO_PAIS_ISOA3` VARCHAR(3) NOT NULL,
  `NO_PAIS` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`CO_PAIS`))
ENGINE = InnoDB;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/PAIS.csv"
INTO TABLE PAIS
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- -----------------------------------------------------
-- Table `exportacoes_brasil_2022`.`UF`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exportacoes_brasil_2022`.`UF` (
  `CO_UF` INT NOT NULL AUTO_INCREMENT,
  `SG_UF` CHAR(2) NOT NULL,
  `NO_UF` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`CO_UF`))
ENGINE = InnoDB;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/UF.csv"
INTO TABLE UF
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- -----------------------------------------------------
-- Table `exportacoes_brasil_2022`.`UF_MUN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exportacoes_brasil_2022`.`UF_MUN` (
  `CO_MUN_GEO` INT NOT NULL AUTO_INCREMENT,
  `NO_MUN` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`CO_MUN_GEO`))
ENGINE = InnoDB;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/UF_MUN.csv"
INTO TABLE UF_MUN
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- -----------------------------------------------------
-- Table `exportacoes_brasil_2022`.`EXP_2022_MUN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exportacoes_brasil_2022`.`EXP_2022_MUN` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `CO_ANO` YEAR NOT NULL,
  `CO_MES` DECIMAL(2) NOT NULL,
  `SH4` INT NOT NULL,
  `CO_PAIS` INT NOT NULL,
  `CO_MUN` INT NOT NULL,
  `KG_LIQUIDO` DECIMAL(20) NOT NULL,
  `VL_FOB` DECIMAL(20) NOT NULL,
  `CO_UF` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_exp_2022_mun_1_idx` (`SH4` ASC) VISIBLE,
  INDEX `fk_exp_2022_mun_2_idx` (`CO_PAIS` ASC) VISIBLE,
  INDEX `fk_exp_2022_mun_3_idx` (`CO_UF` ASC) VISIBLE,
  INDEX `fk_exp_2022_mun_4_idx` (`CO_MUN` ASC) VISIBLE,
  CONSTRAINT `fk_exp_2022_mun_1`
    FOREIGN KEY (`SH4`)
    REFERENCES `exportacoes_brasil_2022`.`NCM_SH` (`CO_SH4`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exp_2022_mun_2`
    FOREIGN KEY (`CO_PAIS`)
    REFERENCES `exportacoes_brasil_2022`.`PAIS` (`CO_PAIS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exp_2022_mun_3`
    FOREIGN KEY (`CO_UF`)
    REFERENCES `exportacoes_brasil_2022`.`UF` (`CO_UF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exp_2022_mun_4`
    FOREIGN KEY (`CO_MUN`)
    REFERENCES `exportacoes_brasil_2022`.`UF_MUN` (`CO_MUN_GEO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/EXP_2022_MUN.csv"
INTO TABLE EXP_2022_MUN
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

------------------------------------------------------------------

SELECT * FROM EXP_2022_MUN;

SELECT * FROM NCM_SH;

SELECT * FROM PAIS;

SELECT * FROM UF;

SELECT * FROM UF_MUN;

SHOW VARIABLES LIKE "secure_file_priv";



