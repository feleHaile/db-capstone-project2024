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
-- Table `littlelemondb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`customers` (
  `CustomerID` INT(11) NOT NULL,
  `FullName` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `littlelemondb`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`bookings` (
  `BookingID` INT(11) NOT NULL,
  `BookingDate` DATE NULL DEFAULT NULL,
  `CustomerID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `CustomerID` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `bookings_ibfk_1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `littlelemondb`.`customers` (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `littlelemondb`.`menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`menus` (
  `MenuID` INT(11) NOT NULL,
  `MenuName` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `littlelemondb`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`staff` (
  `StaffID` INT(11) NOT NULL,
  `Name` VARCHAR(255) NULL DEFAULT NULL,
  `Role` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `littlelemondb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`orders` (
  `OrderID` INT(11) NOT NULL,
  `TotalCost` DECIMAL(10,2) NULL DEFAULT NULL,
  `CustomerID` INT(11) NULL DEFAULT NULL,
  `staff_StaffID` INT(11) NOT NULL,
  PRIMARY KEY (`OrderID`, `staff_StaffID`),
  INDEX `CustomerID` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_orders_staff1_idx` (`staff_StaffID` ASC) VISIBLE,
  CONSTRAINT `orders_ibfk_1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `littlelemondb`.`customers` (`CustomerID`),
  CONSTRAINT `fk_orders_staff1`
    FOREIGN KEY (`staff_StaffID`)
    REFERENCES `littlelemondb`.`staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `littlelemondb`.`menu_has_orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`menu_has_orders` (
  `MenuID` INT(11) NULL DEFAULT NULL,
  `OrderID` INT(11) NULL DEFAULT NULL,
  INDEX `MenuID` (`MenuID` ASC) VISIBLE,
  INDEX `OrderID` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `menu_has_orders_ibfk_1`
    FOREIGN KEY (`MenuID`)
    REFERENCES `littlelemondb`.`menus` (`MenuID`),
  CONSTRAINT `menu_has_orders_ibfk_2`
    FOREIGN KEY (`OrderID`)
    REFERENCES `littlelemondb`.`orders` (`OrderID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `littlelemondb`.`menuitems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`menuitems` (
  `MenuItemID` INT(11) NOT NULL,
  `CourseName` VARCHAR(255) NULL DEFAULT NULL,
  `StarterName` VARCHAR(255) NULL DEFAULT NULL,
  `menus_MenuID` INT(11) NOT NULL,
  PRIMARY KEY (`MenuItemID`, `menus_MenuID`),
  INDEX `fk_menuitems_menus1_idx` (`menus_MenuID` ASC) VISIBLE,
  CONSTRAINT `fk_menuitems_menus1`
    FOREIGN KEY (`menus_MenuID`)
    REFERENCES `littlelemondb`.`menus` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `littlelemondb`.`orderdeliverystatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`orderdeliverystatus` (
  `OrderID` INT(11) NOT NULL,
  `Status` VARCHAR(100) NULL DEFAULT NULL,
  `DeliveryDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  CONSTRAINT `orderdeliverystatus_ibfk_1`
    FOREIGN KEY (`OrderID`)
    REFERENCES `littlelemondb`.`orders` (`OrderID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

USE `littlelemondb` ;

-- -----------------------------------------------------
-- Placeholder table for view `littlelemondb`.`ordersview`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`ordersview` (`OrderID` INT, `TotalCost` INT, `CustomerName` INT, `MenuName` INT, `CourseName` INT, `StarterName` INT, `BookingDate` INT, `Status` INT, `DeliveryDate` INT, `StaffName` INT, `Role` INT);

-- -----------------------------------------------------
-- View `littlelemondb`.`ordersview`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`ordersview`;
USE `littlelemondb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `littlelemondb`.`ordersview` AS select `o`.`OrderID` AS `OrderID`,`o`.`TotalCost` AS `TotalCost`,`c`.`FullName` AS `CustomerName`,`m`.`MenuName` AS `MenuName`,`mi`.`CourseName` AS `CourseName`,`mi`.`StarterName` AS `StarterName`,`b`.`BookingDate` AS `BookingDate`,`ods`.`Status` AS `Status`,`ods`.`DeliveryDate` AS `DeliveryDate`,`s`.`Name` AS `StaffName`,`s`.`Role` AS `Role` from (((((((`littlelemondb`.`orders` `o` join `littlelemondb`.`customers` `c` on(`o`.`CustomerID` = `c`.`CustomerID`)) join `littlelemondb`.`bookings` `b` on(`o`.`CustomerID` = `b`.`CustomerID`)) join `littlelemondb`.`menu_has_orders` `mho` on(`o`.`OrderID` = `mho`.`OrderID`)) join `littlelemondb`.`menus` `m` on(`mho`.`MenuID` = `m`.`MenuID`)) join `littlelemondb`.`menuitems` `mi` on(`mho`.`MenuID` = `mi`.`MenuItemID`)) join `littlelemondb`.`orderdeliverystatus` `ods` on(`o`.`OrderID` = `ods`.`OrderID`)) join `littlelemondb`.`staff` `s` on(`ods`.`OrderID` = `s`.`StaffID`));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
