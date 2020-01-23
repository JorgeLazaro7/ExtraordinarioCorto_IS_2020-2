-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BDIS
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `BDIS` ;

-- -----------------------------------------------------
-- Schema BDIS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BDIS` ;
USE `BDIS` ;

-- -----------------------------------------------------
-- Table `BDIS`.`Administrador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDIS`.`Administrador` ;

CREATE TABLE IF NOT EXISTS `BDIS`.`Administrador` (
  `idAdministrador` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `nombreUsuario` VARCHAR(45) NOT NULL,
  `contrasenia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAdministrador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDIS`.`Producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDIS`.`Producto` ;

CREATE TABLE IF NOT EXISTS `BDIS`.`Producto` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(256) NULL,
  `foto` VARCHAR(90) NULL,
  `precio` DECIMAL(15) NOT NULL,
  PRIMARY KEY (`idProducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDIS`.`Recibo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDIS`.`Recibo` ;

CREATE TABLE IF NOT EXISTS `BDIS`.`Recibo` (
  `idRecibo` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `nombreCliente` VARCHAR(45) NOT NULL,
  `lugarEnvio` VARCHAR(45) NOT NULL,
  `total` DECIMAL(15) NOT NULL,
  PRIMARY KEY (`idRecibo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDIS`.`Recibo_has_Producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDIS`.`Recibo_has_Producto` ;

CREATE TABLE IF NOT EXISTS `BDIS`.`Recibo_has_Producto` (
  `Recibo_idRecibo` INT NOT NULL,
  `Producto_idProducto` INT NOT NULL,
  PRIMARY KEY (`Recibo_idRecibo`, `Producto_idProducto`),
  INDEX `fk_Recibo_has_Producto_Producto1_idx` (`Producto_idProducto` ASC),
  INDEX `fk_Recibo_has_Producto_Recibo_idx` (`Recibo_idRecibo` ASC),
  CONSTRAINT `fk_Recibo_has_Producto_Recibo`
    FOREIGN KEY (`Recibo_idRecibo`)
    REFERENCES `BDIS`.`Recibo` (`idRecibo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Recibo_has_Producto_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `BDIS`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
