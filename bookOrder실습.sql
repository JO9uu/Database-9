-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bookOrder2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bookOrder2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bookOrder2` DEFAULT CHARACTER SET utf8 ;
USE `bookOrder2` ;

-- -----------------------------------------------------
-- Table `bookOrder2`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookOrder2`.`User` (
  `userId` VARCHAR(10) NOT NULL,
  `userName` VARCHAR(10) NULL,
  `userAddr` VARCHAR(50) NULL,
  PRIMARY KEY (`userId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookOrder2`.`UserOrder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookOrder2`.`UserOrder` (
  `orderNo` INT NOT NULL,
  `orderDate` DATE NULL,
  `userId` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`orderNo`),
  INDEX `fk_UserOrder_User1_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_UserOrder_User1`
    FOREIGN KEY (`userId`)
    REFERENCES `bookOrder2`.`User` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookOrder2`.`Book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookOrder2`.`Book` (
  `bookNo` INT NOT NULL,
  `bookName` VARCHAR(20) NULL,
  PRIMARY KEY (`bookNo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookOrder2`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookOrder2`.`Order` (
  `orderNo` INT NOT NULL,
  `bookNo` INT NOT NULL,
  `count` INT NULL,
  `price` INT NULL,
  PRIMARY KEY (`orderNo`, `bookNo`),
  INDEX `fk_Order_UserOrder_idx` (`orderNo` ASC) VISIBLE,
  INDEX `fk_Order_Book1_idx` (`bookNo` ASC) VISIBLE,
  CONSTRAINT `fk_Order_UserOrder`
    FOREIGN KEY (`orderNo`)
    REFERENCES `bookOrder2`.`UserOrder` (`orderNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Book1`
    FOREIGN KEY (`bookNo`)
    REFERENCES `bookOrder2`.`Book` (`bookNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
