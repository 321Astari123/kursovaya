-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema viki
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema viki
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `viki` DEFAULT CHARACTER SET utf8 ;
USE `viki` ;

-- -----------------------------------------------------
-- Table `viki`.`Region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viki`.`Region` (
  `idRegion` INT NOT NULL AUTO_INCREMENT,
  `RegionName` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idRegion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `viki`.`Rarity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viki`.`Rarity` (
  `idRarity` INT NOT NULL AUTO_INCREMENT,
  `RarityStar` INT NOT NULL,
  PRIMARY KEY (`idRarity`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `viki`.`Character`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viki`.`Character` (
  `idNameC` INT NOT NULL AUTO_INCREMENT,
  `CharName` VARCHAR(255) NOT NULL,
  `CharSize` VARCHAR(255) NOT NULL,
  `UseWeapon` VARCHAR(255) NOT NULL,
  `Elemental` VARCHAR(255) NOT NULL,
  `Region_idRegion` INT NOT NULL,
  `Rarity_idRarity` INT NOT NULL,
  PRIMARY KEY (`idNameC`),
  INDEX `fk_CharacterName_Region1_idx` (`Region_idRegion` ASC) VISIBLE,
  INDEX `fk_CharacterName_Rarity1_idx` (`Rarity_idRarity` ASC) VISIBLE,
  CONSTRAINT `fk_CharacterName_Region1`
    FOREIGN KEY (`Region_idRegion`)
    REFERENCES `viki`.`Region` (`idRegion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CharacterName_Rarity1`
    FOREIGN KEY (`Rarity_idRarity`)
    REFERENCES `viki`.`Rarity` (`idRarity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `viki`.`Weapon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viki`.`Weapon` (
  `idWeapon` INT NOT NULL AUTO_INCREMENT,
  `WeapName` VARCHAR(255) NOT NULL,
  `WeapType` VARCHAR(255) NOT NULL,
  `Rarity_idRarity` INT NOT NULL,
  `CharacterName_idNameC` INT NOT NULL,
  PRIMARY KEY (`idWeapon`),
  INDEX `fk_Weapon_Rarity1_idx` (`Rarity_idRarity` ASC) VISIBLE,
  INDEX `fk_Weapon_CharacterName1_idx` (`CharacterName_idNameC` ASC) VISIBLE,
  CONSTRAINT `fk_Weapon_Rarity1`
    FOREIGN KEY (`Rarity_idRarity`)
    REFERENCES `viki`.`Rarity` (`idRarity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Weapon_CharacterName1`
    FOREIGN KEY (`CharacterName_idNameC`)
    REFERENCES `viki`.`Character` (`idNameC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `viki`.`WorldBosses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viki`.`WorldBosses` (
  `idWorldBosses` INT NOT NULL AUTO_INCREMENT,
  `WBName` VARCHAR(255) NOT NULL,
  `WbType` VARCHAR(255) NOT NULL,
  `Region_idRegion` INT NOT NULL,
  PRIMARY KEY (`idWorldBosses`),
  INDEX `fk_WorldBosses_Region1_idx` (`Region_idRegion` ASC) VISIBLE,
  CONSTRAINT `fk_WorldBosses_Region1`
    FOREIGN KEY (`Region_idRegion`)
    REFERENCES `viki`.`Region` (`idRegion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `viki`.`Foods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viki`.`Foods` (
  `idFoods` INT NOT NULL AUTO_INCREMENT,
  `FoodName` VARCHAR(255) NOT NULL,
  `FoodType` VARCHAR(255) NOT NULL,
  `Rarity_idRarity` INT NOT NULL,
  `Region_idRegion` INT NOT NULL,
  PRIMARY KEY (`idFoods`),
  INDEX `fk_Foods_Rarity1_idx` (`Rarity_idRarity` ASC) VISIBLE,
  INDEX `fk_Foods_Region1_idx` (`Region_idRegion` ASC) VISIBLE,
  CONSTRAINT `fk_Foods_Rarity1`
    FOREIGN KEY (`Rarity_idRarity`)
    REFERENCES `viki`.`Rarity` (`idRarity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Foods_Region1`
    FOREIGN KEY (`Region_idRegion`)
    REFERENCES `viki`.`Region` (`idRegion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
