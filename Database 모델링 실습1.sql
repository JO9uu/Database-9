-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema University
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema University
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `University` DEFAULT CHARACTER SET utf8 ;
USE `University` ;

-- -----------------------------------------------------
-- Table `University`.`Departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University`.`Departments` (
  `depNo` INT NOT NULL,
  `depName` VARCHAR(20) NOT NULL,
  `depTel` CHAR(14) NOT NULL,
  PRIMARY KEY (`depNo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`Professors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University`.`Professors` (
  `proNo` CHAR(6) not NULL,
  `proName` VARCHAR(20) NOT NULL,
  `proJumin` CHAR(14) NOT NULL,
  `proEmail` VARCHAR(45) NOT NULL,
  `proHp` CHAR(13) NULL,
  `proAddr` VARCHAR(100) NOT NULL,
  `depNo` INT NOT NULL,
  PRIMARY KEY (`proNo`),
  UNIQUE INDEX `proJumin_UNIQUE` (`proJumin` ASC) VISIBLE,
  UNIQUE INDEX `proHp_UNIQUE` (`proHp` ASC) VISIBLE,
  INDEX `fk_Professors_Departments1_idx` (`depNo` ASC) VISIBLE,
  CONSTRAINT `fk_Professors_Departments1`
    FOREIGN KEY (`depNo`)
    REFERENCES `University`.`Departments` (`depNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University`.`Students` (
  `stdNO` CHAR(8) NOT NULL,
  `stdName` VARCHAR(20) NOT NULL,
  `stdJumin` CHAR(14) NOT NULL,
  `stdHp` CHAR(13) NOT NULL,
  `stdEmail` VARCHAR(45) NULL,
  `stdAddr` VARCHAR(100) NOT NULL,
  `proNo` CHAR(6) NOT NULL,
  `depNo` INT NOT NULL,
  PRIMARY KEY (`stdNO`),
  UNIQUE INDEX `stdJumin_UNIQUE` (`stdJumin` ASC) VISIBLE,
  UNIQUE INDEX `stdEmail_UNIQUE` (`stdEmail` ASC) VISIBLE,
  UNIQUE INDEX `stdHp_UNIQUE` (`stdHp` ASC) VISIBLE,
  INDEX `fk_Students_Professors_idx` (`proNo` ASC) VISIBLE,
  INDEX `fk_Students_Departments1_idx` (`depNo` ASC) VISIBLE,
  CONSTRAINT `fk_Students_Professors`
    FOREIGN KEY (`proNo`)
    REFERENCES `University`.`Professors` (`proNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Students_Departments1`
    FOREIGN KEY (`depNo`)
    REFERENCES `University`.`Departments` (`depNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`LecTures`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University`.`LecTures` (
  `lecNo` CHAR(6) NOT NULL,
  `proNo` CHAR(6) NOT NULL,
  `lecName` VARCHAR(45) NOT NULL,
  `lecCredit` TINYINT NOT NULL,
  `lecTime` TINYINT NOT NULL,
  `lecClass` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`lecNo`, `proNo`),
  INDEX `fk_LecTures_Professors1_idx` (`proNo` ASC) VISIBLE,
  CONSTRAINT `fk_LecTures_Professors1`
    FOREIGN KEY (`proNo`)
    REFERENCES `University`.`Professors` (`proNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`Register`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University`.`Register` (
  `stdNO` CHAR(8) NOT NULL,
  `lecNo` CHAR(6) NOT NULL,
  `proNo` CHAR(6) NOT NULL,
  `regAttenScore` TINYINT NULL,
  `regMidScore` TINYINT NULL,
  `regFinalScore` TINYINT NULL,
  `regEtcScore` TINYINT NULL,
  `regTotal` TINYINT NULL,
  `regGrade` CHAR(1) NULL,
  PRIMARY KEY (`stdNO`, `lecNo`, `proNo`),
  INDEX `fk_Register_Students1_idx` (`stdNO` ASC) VISIBLE,
  INDEX `fk_Register_LecTures1_idx` (`lecNo` ASC, `proNo` ASC) VISIBLE,
  CONSTRAINT `fk_Register_Students1`
    FOREIGN KEY (`stdNO`)
    REFERENCES `University`.`Students` (`stdNO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Register_LecTures1`
    FOREIGN KEY (`lecNo`)
    REFERENCES `University`.`LecTures` (`lecNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

