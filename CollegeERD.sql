-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CollegeERD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CollegeERD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CollegeERD` DEFAULT CHARACTER SET utf8 ;
USE `CollegeERD` ;

-- -----------------------------------------------------
-- Table `CollegeERD`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CollegeERD`.`Student` (
  `stdNo` CHAR(8) NOT NULL,
  `stdName` VARCHAR(20) NOT NULL,
  `stdHp` CHAR(13) NOT NULL,
  `stdYear` TINYINT NOT NULL,
  `stdAddress` VARCHAR(100) NULL DEFAULT 'null',
  PRIMARY KEY (`stdNo`),
  UNIQUE INDEX `stdHp_UNIQUE` (`stdHp` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CollegeERD`.`Lecture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CollegeERD`.`Lecture` (
  `lecNo` INT NOT NULL,
  `lecName` VARCHAR(20) NOT NULL,
  `lecCredit` TINYINT NOT NULL,
  `lecTime` TINYINT NOT NULL,
  `lecClass` VARCHAR(10) NULL DEFAULT 'null',
  PRIMARY KEY (`lecNo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CollegeERD`.`Register`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CollegeERD`.`Register` (
  `regStdNo` CHAR(8) NOT NULL,
  `reglecNo` INT NOT NULL,
  `regMidScore` INT NULL DEFAULT NULL,
  `regFinalScore` INT NULL DEFAULT NULL,
  `regTotalScore` INT NULL DEFAULT NULL,
  `regGrade` CHAR(1) NULL DEFAULT 'null',
  INDEX `fk_Register_Student_idx` (`regStdNo` ASC) VISIBLE,
  INDEX `fk_Register_Lecture1_idx` (`reglecNo` ASC) VISIBLE,
  CONSTRAINT `fk_Register_Student`
    FOREIGN KEY (`regStdNo`)
    REFERENCES `CollegeERD`.`Student` (`stdNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Register_Lecture1`
    FOREIGN KEY (`reglecNo`)
    REFERENCES `CollegeERD`.`Lecture` (`lecNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
