-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Estatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estatus` (
  `idEstatus` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstatus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuarios` (
  `idusuarios` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `edad` INT NOT NULL,
  `codigoPucp` INT NOT NULL,
  `correo` VARCHAR(75) NOT NULL,
  `especialidad` VARCHAR(45) NOT NULL,
  `Estatus_idEstatus` INT NOT NULL,
  PRIMARY KEY (`idusuarios`),
  INDEX `fk_usuarios_Estatus1_idx` (`Estatus_idEstatus` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_Estatus1`
    FOREIGN KEY (`Estatus_idEstatus`)
    REFERENCES `mydb`.`Estatus` (`idEstatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`credenciales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`credenciales` (
  `correo` VARCHAR(45) NOT NULL,
  `pass` VARCHAR(125) NOT NULL,
  `idusuarios` INT NOT NULL,
  PRIMARY KEY (`idusuarios`),
  CONSTRAINT `fk_credenciales_usuarios`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `mydb`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`seguros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`seguros` (
  `idseguros` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idseguros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`viajes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`viajes` (
  `idviaje` INT NOT NULL AUTO_INCREMENT,
  `fechaReserva` DATE NOT NULL,
  `fechaViaje` DATE NOT NULL,
  `ciudadOrigen` VARCHAR(45) NOT NULL,
  `ciudadDestino` VARCHAR(45) NOT NULL,
  `seguros_idseguros` INT NOT NULL,
  `cantidadBoletos` INT NOT NULL,
  `costoTotal` DECIMAL(10,0) NOT NULL,
  `habilitado` TINYINT NOT NULL,
  `idusuarios` INT NOT NULL,
  PRIMARY KEY (`idviaje`),
  INDEX `fk_viajes_seguros1_idx` (`seguros_idseguros` ASC) VISIBLE,
  INDEX `fk_viajes_usuarios1_idx` (`idusuarios` ASC) VISIBLE,
  CONSTRAINT `fk_viajes_seguros1`
    FOREIGN KEY (`seguros_idseguros`)
    REFERENCES `mydb`.`seguros` (`idseguros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_viajes_usuarios1`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `mydb`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
