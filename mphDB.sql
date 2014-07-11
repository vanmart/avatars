SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `pets_history` ;
CREATE SCHEMA IF NOT EXISTS `pets_history` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `pets_history` ;

-- -----------------------------------------------------
-- Table `pets_history`.`entidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pets_history`.`entidad` ;

CREATE  TABLE IF NOT EXISTS `pets_history`.`entidad` (
  `id_entidad` INT NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  `direccion` VARCHAR(45) NULL ,
  `telefono` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_entidad`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pets_history`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pets_history`.`cliente` ;

CREATE  TABLE IF NOT EXISTS `pets_history`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT ,
  `especialidad` VARCHAR(90) NULL ,
  `entidad_id_entidad` INT NOT NULL ,
  PRIMARY KEY (`id_cliente`) ,
  INDEX `fk_Cliente_entidad1_idx` (`entidad_id_entidad` ASC) ,
  CONSTRAINT `fk_Cliente_entidad1`
    FOREIGN KEY (`entidad_id_entidad` )
    REFERENCES `pets_history`.`entidad` (`id_entidad` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pets_history`.`veterinario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pets_history`.`veterinario` ;

CREATE  TABLE IF NOT EXISTS `pets_history`.`veterinario` (
  `id_veterinario` INT NOT NULL ,
  `especialidad` VARCHAR(45) NULL ,
  `entidad_id_entidad` INT NOT NULL ,
  PRIMARY KEY (`id_veterinario`) ,
  INDEX `fk_veterinario_entidad1_idx` (`entidad_id_entidad` ASC) ,
  CONSTRAINT `fk_veterinario_entidad1`
    FOREIGN KEY (`entidad_id_entidad` )
    REFERENCES `pets_history`.`entidad` (`id_entidad` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pets_history`.`propietario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pets_history`.`propietario` ;

CREATE  TABLE IF NOT EXISTS `pets_history`.`propietario` (
  `id_propietario` INT NOT NULL ,
  `entidad_id_entidad` INT NOT NULL ,
  PRIMARY KEY (`id_propietario`) ,
  INDEX `fk_propietario_entidad1_idx` (`entidad_id_entidad` ASC) ,
  CONSTRAINT `fk_propietario_entidad1`
    FOREIGN KEY (`entidad_id_entidad` )
    REFERENCES `pets_history`.`entidad` (`id_entidad` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pets_history`.`anotacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pets_history`.`anotacion` ;

CREATE  TABLE IF NOT EXISTS `pets_history`.`anotacion` (
  `id_anotacion` INT NOT NULL ,
  `mensaje` MEDIUMTEXT NULL ,
  PRIMARY KEY (`id_anotacion`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pets_history`.`estado_medico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pets_history`.`estado_medico` ;

CREATE  TABLE IF NOT EXISTS `pets_history`.`estado_medico` (
  `idestado_medico` INT NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idestado_medico`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pets_history`.`mascota`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pets_history`.`mascota` ;

CREATE  TABLE IF NOT EXISTS `pets_history`.`mascota` (
  `id_mascota` INT NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  `estado_medico_idestado_medico` INT NOT NULL ,
  `propietario_id_propietario` INT NOT NULL ,
  PRIMARY KEY (`id_mascota`) ,
  INDEX `fk_mascota_estado_medico1_idx` (`estado_medico_idestado_medico` ASC) ,
  INDEX `fk_mascota_propietario1_idx` (`propietario_id_propietario` ASC) ,
  CONSTRAINT `fk_mascota_estado_medico1`
    FOREIGN KEY (`estado_medico_idestado_medico` )
    REFERENCES `pets_history`.`estado_medico` (`idestado_medico` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mascota_propietario1`
    FOREIGN KEY (`propietario_id_propietario` )
    REFERENCES `pets_history`.`propietario` (`id_propietario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pets_history`.`historial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pets_history`.`historial` ;

CREATE  TABLE IF NOT EXISTS `pets_history`.`historial` (
  `id_historial` INT NOT NULL ,
  PRIMARY KEY (`id_historial`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pets_history`.`foto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pets_history`.`foto` ;

CREATE  TABLE IF NOT EXISTS `pets_history`.`foto` (
  `idfoto` INT NOT NULL ,
  `uri` VARCHAR(45) NULL ,
  PRIMARY KEY (`idfoto`) )
ENGINE = InnoDB;

USE `pets_history` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
