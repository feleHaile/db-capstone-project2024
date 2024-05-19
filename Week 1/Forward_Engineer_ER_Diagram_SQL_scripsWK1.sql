-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemondb` DEFAULT CHARACTER SET latin1 ;
USE `littlelemondb` ;

-- -----------------------------------------------------
-- Table `littlelemondb`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`bookings` (
  `bookingID` INT(11) NOT NULL,
  `bookingDate` DATE NOT NULL,
  `tableNumber` INT(11) NOT NULL,
  PRIMARY KEY (`bookingID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `littlelemondb`.`customerdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`customerdetails` (
  `customerID` INT(11) NOT NULL,
  `firstName` VARCHAR(255) NOT NULL,
  `lastName` VARCHAR(255) NOT NULL,
  `contactNumber` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`customerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `littlelemondb`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`menu` (
  `menuItemID` INT(11) NOT NULL,
  `category` VARCHAR(200) NOT NULL,
  `itemName` VARCHAR(200) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`menuItemID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `littlelemondb`.`menu_has_orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`menu_has_orders` (
  `menu_menuItemID` INT(11) NOT NULL,
  `orders_orderID` INT(11) NOT NULL,
  `orders_bookings_bookingID` INT(11) NOT NULL,
  `orders_orderdeliverystatus_orderID` INT(11) NOT NULL,
  PRIMARY KEY (`menu_menuItemID`, `orders_orderID`, `orders_bookings_bookingID`, `orders_orderdeliverystatus_orderID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `littlelemondb`.`orderdeliverystatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`orderdeliverystatus` (
  `orderID` INT(11) NOT NULL,
  `deliveryDate` DATE NOT NULL,
  `status` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`orderID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `littlelemondb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`orders` (
  `orderID` INT(11) NOT NULL,
  `orderDate` DATE NOT NULL,
  `quantity` INT(11) NOT NULL,
  `totalCost` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`orderID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `littlelemondb`.`staffinformation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`staffinformation` (
  `staffID` INT(11) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `salary` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`staffID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
