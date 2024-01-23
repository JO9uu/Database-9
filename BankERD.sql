-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bankERD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bankERD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bankERD` DEFAULT CHARACTER SET utf8 ;
USE `bankERD` ;

-- -----------------------------------------------------
-- Table `bankERD`.`bank_customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankERD`.`bank_customer` (
  `c_no` VARCHAR(14) NOT NULL,
  `c_name` VARCHAR(20) NOT NULL,
  `c_dist` TINYINT NOT NULL DEFAULT 0,
  `c_phone` CHAR(13) NOT NULL,
  `c_addr` VARCHAR(50) NULL DEFAULT 'null',
  PRIMARY KEY (`c_no`),
  UNIQUE INDEX `c_phone_UNIQUE` (`c_phone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bankERD`.`bank_account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankERD`.`bank_account` (
  `a_no` CHAR(11) NOT NULL,
  `a_item_dist` CHAR(2) NOT NULL,
  `a_item_name` VARCHAR(20) NOT NULL,
  `a_c_no` VARCHAR(14) NOT NULL,
  `a_balance` INT NOT NULL DEFAULT 0,
  `a_open_date` DATE NOT NULL,
  PRIMARY KEY (`a_no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bankERD`.`bank_transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankERD`.`bank_transaction` (
  `t_no` INT NOT NULL AUTO_INCREMENT,
  `t_a_no` CHAR(11) NOT NULL,
  `t_dist` TINYINT NOT NULL,
  `t_amount` INT NOT NULL DEFAULT 0,
  `t_datetime` DATETIME NOT NULL,
  PRIMARY KEY (`t_no`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

create database bankERD;