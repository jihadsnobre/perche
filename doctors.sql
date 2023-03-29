-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema doctors
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema doctors
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `doctors` ;
USE `doctors` ;

-- -----------------------------------------------------
-- Table `doctors`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `doctors`.`Doctor` (
  `Name` INT NOT NULL,
  `Date_of_birth` DATE NULL,
  `Address` VARCHAR(45) NULL,
  `Phone` INT NULL,
  `Salary` VARCHAR(45) NULL,
  PRIMARY KEY (`Name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `doctors`.`Medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `doctors`.`Medical` (
  `Overtime_rate` INT NOT NULL,
  `Doctor_Name` INT NOT NULL,
  PRIMARY KEY (`Doctor_Name`),
  CONSTRAINT `fk_Medical_Doctor1`
    FOREIGN KEY (`Doctor_Name`)
    REFERENCES `doctors`.`Doctor` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `doctors`.`Specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `doctors`.`Specialist` (
  `field` INT NOT NULL,
  PRIMARY KEY (`field`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `doctors`.`Specialist_has_Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `doctors`.`Specialist_has_Doctor` (
  `Specialist_field` INT NOT NULL,
  `Doctor_Name` INT NOT NULL,
  PRIMARY KEY (`Specialist_field`, `Doctor_Name`),
  INDEX `fk_Specialist_has_Doctor_Doctor1_idx` (`Doctor_Name` ASC) VISIBLE,
  INDEX `fk_Specialist_has_Doctor_Specialist_idx` (`Specialist_field` ASC) VISIBLE,
  CONSTRAINT `fk_Specialist_has_Doctor_Specialist`
    FOREIGN KEY (`Specialist_field`)
    REFERENCES `doctors`.`Specialist` (`field`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Specialist_has_Doctor_Doctor1`
    FOREIGN KEY (`Doctor_Name`)
    REFERENCES `doctors`.`Doctor` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
