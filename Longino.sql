#sdiaz 04-06-2022 00:00
# tablas para informacion de clientes

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema longino
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema longino
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `longino` DEFAULT CHARACTER SET utf8 ;
USE `longino` ;

-- -----------------------------------------------------
-- Table `longino`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `longino`.`clientes` (
  `Codcliente` INT NOT NULL AUTO_INCREMENT,
  `DPI` INT NULL,
  `Nit` VARCHAR(15) NULL,
  `Nombres` VARCHAR(100) NULL,
  `Apellidos` VARCHAR(100) NULL,
  `FecNacimiento` DATE NULL,
  `Genero` VARCHAR(10) NULL,
  `EstadoCivil` VARCHAR(15) NULL,
  `Email` VARCHAR(65) NULL,
  `TipoVivienda` INT NULL,
  `ProveEnergia` INT NULL,
  `CorrelativoEnergia` INT NULL,
  PRIMARY KEY (`Codcliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `longino`.`Direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `longino`.`Direccion` (
  `IdDireccion` INT NOT NULL,
  `Calle` VARCHAR(45) NULL,
  `Numerocasa` VARCHAR(45) NULL,
  `Colonia_Aldea` VARCHAR(105) NULL,
  `Apartamento` VARCHAR(45) NULL,
  `Nivel` VARCHAR(45) NULL,
  `Zona` INT NULL,
  `Municipio` INT NULL,
  `Departamento` INT NULL,
  `TipoDirec` INT NULL,
  `Codcliente` INT NOT NULL,
  PRIMARY KEY (`IdDireccion`),
  INDEX `fk_Direccion_clientes_idx` (`Codcliente` ASC) VISIBLE,
  CONSTRAINT `fk_Direccion_clientes`
    FOREIGN KEY (`Codcliente`)
    REFERENCES `longino`.`clientes` (`Codcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `longino`.`TipoDireccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `longino`.`TipoDireccion` (
  `IdTipoDireccion` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(100) NULL,
  `Estado` INT NULL,
  PRIMARY KEY (`IdTipoDireccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `longino`.`Catalogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `longino`.`Catalogo` (
  `idCatalogo` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idCatalogo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `longino`.`InfLaboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `longino`.`InfLaboral` (
  `idInfLaboral` INT NOT NULL AUTO_INCREMENT,
  `RelacionLaboral` VARCHAR(145) NULL,
  `Nombre` VARCHAR(65) NULL,
  `TipoEmpresa` INT NULL,
  `FechaContratacion` DATE NULL,
  `AreaLaboral` VARCHAR(45) NULL,
  `Sueldo` VARCHAR(45) NULL,
  `PeriodoPagos` INT NULL,
  `IdDireccion` INT NULL,
  `IdContactos` INT NULL,
  `FechaUltimoPago` DATE NOT NULL,
  `InfLaboralcol` VARCHAR(45) NULL,
  `CodCliente` INT NULL,
  `Codcliente` INT NOT NULL,
  PRIMARY KEY (`idInfLaboral`, `Codcliente`),
  INDEX `fk_InfLaboral_clientes1_idx` (`Codcliente` ASC) VISIBLE,
  CONSTRAINT `fk_InfLaboral_clientes1`
    FOREIGN KEY (`Codcliente`)
    REFERENCES `longino`.`clientes` (`Codcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `longino`.`Contactos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `longino`.`Contactos` (
  `idContactos` INT NOT NULL AUTO_INCREMENT,
  `CodCliente` INT NOT NULL,
  `NumeroTelefono` VARCHAR(45) NULL,
  `Tipo` INT NOT NULL,
  `Nombres` VARCHAR(45) NULL,
  `Parentesco` INT NULL,
  `Codcliente` INT NOT NULL,
  PRIMARY KEY (`idContactos`),
  INDEX `fk_Contactos_clientes1_idx` (`Codcliente` ASC) VISIBLE,
  CONSTRAINT `fk_Contactos_clientes1`
    FOREIGN KEY (`Codcliente`)
    REFERENCES `longino`.`clientes` (`Codcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `longino`.`TiposEmpresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `longino`.`TiposEmpresa` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `longino`.`Credito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `longino`.`Credito` (
  `idCredito` INT NOT NULL AUTO_INCREMENT,
  `IdCliente` INT NOT NULL,
  `TipoCredito` INT NULL,
  `DescriGasto` INT NULL,
  `Vigente` TINYINT NULL,
  `SumaInicial` DECIMAL(4,2) NULL,
  `SumaMaximo` DECIMAL(4,2) NULL,
  `Idpagos` INT NULL,
  PRIMARY KEY (`idCredito`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `longino`.`Banco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `longino`.`Banco` (
  `idBanco` INT NOT NULL AUTO_INCREMENT,
  `CodCliente` INT NULL,
  `NombreBanco` VARCHAR(45) NULL,
  `NumeroCuenta` VARCHAR(45) NULL,
  `TipoCuenta` VARCHAR(45) NULL,
  `Estado` TINYINT NULL,
  `Bancocol` VARCHAR(45) NULL,
  PRIMARY KEY (`idBanco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `longino`.`DetalleCredito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `longino`.`DetalleCredito` (
  `idDetalleCredito` INT NOT NULL AUTO_INCREMENT,
  `idCredito` INT NOT NULL,
  `FechaUltimaPago` DATE NULL,
  `FechaPago` DATE NULL,
  PRIMARY KEY (`idDetalleCredito`))
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
