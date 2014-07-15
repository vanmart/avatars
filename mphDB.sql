SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `pets_history` ;
CREATE SCHEMA IF NOT EXISTS `pets_history` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `pets_history` ;

-- -----------------------------------------------------
-- Table `pets_history`.`datos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pets_history`.`datos` ;

CREATE  TABLE IF NOT EXISTS `pets_history`.`datos` (
  `id_datos` INT NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  `direccion` VARCHAR(45) NULL ,
  `telefono` INT NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `cuidad` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_datos`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pets_history`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pets_history`.`cliente` ;

CREATE  TABLE IF NOT EXISTS `pets_history`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT ,
  `especialidad` VARCHAR(90) NULL ,
  `datos_id_datos` INT NOT NULL ,
  PRIMARY KEY (`id_cliente`) ,
  INDEX `fk_Cliente_entidad1_idx` (`datos_id_datos` ASC) ,
  CONSTRAINT `fk_Cliente_entidad1`
    FOREIGN KEY (`datos_id_datos` )
    REFERENCES `pets_history`.`datos` (`id_datos` )
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
  `datos_id_datos` INT NOT NULL ,
  `cliente_id_cliente` INT NOT NULL ,
  PRIMARY KEY (`id_veterinario`) ,
  INDEX `fk_veterinario_entidad1_idx` (`datos_id_datos` ASC) ,
  INDEX `fk_veterinario_cliente1_idx` (`cliente_id_cliente` ASC) ,
  CONSTRAINT `fk_veterinario_entidad1`
    FOREIGN KEY (`datos_id_datos` )
    REFERENCES `pets_history`.`datos` (`id_datos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_veterinario_cliente1`
    FOREIGN KEY (`cliente_id_cliente` )
    REFERENCES `pets_history`.`cliente` (`id_cliente` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pets_history`.`propietario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pets_history`.`propietario` ;

CREATE  TABLE IF NOT EXISTS `pets_history`.`propietario` (
  `id_propietario` INT NOT NULL ,
  `datos_id_datos` INT NOT NULL ,
  PRIMARY KEY (`id_propietario`) ,
  INDEX `fk_propietario_entidad1_idx` (`datos_id_datos` ASC) ,
  CONSTRAINT `fk_propietario_entidad1`
    FOREIGN KEY (`datos_id_datos` )
    REFERENCES `pets_history`.`datos` (`id_datos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pets_history`.`historial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pets_history`.`historial` ;

CREATE  TABLE IF NOT EXISTS `pets_history`.`historial` (
  `id_historial` INT NOT NULL ,
  `fecha_creacion` DATE NOT NULL ,
  `cliente_id_cliente` INT NOT NULL ,
  PRIMARY KEY (`id_historial`) ,
  INDEX `fk_historial_cliente1_idx` (`cliente_id_cliente` ASC) ,
  CONSTRAINT `fk_historial_cliente1`
    FOREIGN KEY (`cliente_id_cliente` )
    REFERENCES `pets_history`.`cliente` (`id_cliente` )
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
  `fecha` DATE NULL ,
  `historial_id_historial` INT NOT NULL ,
  `veterinario_id_veterinario` INT NOT NULL ,
  PRIMARY KEY (`id_anotacion`) ,
  INDEX `fk_anotacion_historial1_idx` (`historial_id_historial` ASC) ,
  INDEX `fk_anotacion_veterinario1_idx` (`veterinario_id_veterinario` ASC) ,
  CONSTRAINT `fk_anotacion_historial1`
    FOREIGN KEY (`historial_id_historial` )
    REFERENCES `pets_history`.`historial` (`id_historial` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_anotacion_veterinario1`
    FOREIGN KEY (`veterinario_id_veterinario` )
    REFERENCES `pets_history`.`veterinario` (`id_veterinario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `tipo_animal` VARCHAR(45) NULL ,
  `estado_medico_idestado_medico` INT NOT NULL ,
  `propietario_id_propietario` INT NOT NULL ,
  `historial_id_historial` INT NOT NULL ,
  PRIMARY KEY (`id_mascota`) ,
  INDEX `fk_mascota_estado_medico1_idx` (`estado_medico_idestado_medico` ASC) ,
  INDEX `fk_mascota_propietario1_idx` (`propietario_id_propietario` ASC) ,
  INDEX `fk_mascota_historial1_idx` (`historial_id_historial` ASC) ,
  CONSTRAINT `fk_mascota_estado_medico1`
    FOREIGN KEY (`estado_medico_idestado_medico` )
    REFERENCES `pets_history`.`estado_medico` (`idestado_medico` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mascota_propietario1`
    FOREIGN KEY (`propietario_id_propietario` )
    REFERENCES `pets_history`.`propietario` (`id_propietario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mascota_historial1`
    FOREIGN KEY (`historial_id_historial` )
    REFERENCES `pets_history`.`historial` (`id_historial` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pets_history`.`imagen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pets_history`.`imagen` ;

CREATE  TABLE IF NOT EXISTS `pets_history`.`imagen` (
  `idfoto` INT NOT NULL ,
  `nombre` VARCHAR(45) NULL ,
  `imagen` LONGBLOB NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `anotacion_id_anotacion` INT NOT NULL ,
  PRIMARY KEY (`idfoto`) ,
  INDEX `fk_foto_anotacion1_idx` (`anotacion_id_anotacion` ASC) ,
  CONSTRAINT `fk_foto_anotacion1`
    FOREIGN KEY (`anotacion_id_anotacion` )
    REFERENCES `pets_history`.`anotacion` (`id_anotacion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `pets_history` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
