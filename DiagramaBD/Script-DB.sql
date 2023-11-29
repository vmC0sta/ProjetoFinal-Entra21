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
-- Table `mydb`.`PAIS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PAIS` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `DESCRICAO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `DESCRICAO_UNIQUE` (`DESCRICAO` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ESTADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ESTADO` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `DESCRICAO` VARCHAR(45) NOT NULL,
  `PAIS_id` INT NOT NULL,
  PRIMARY KEY (`id`, `PAIS_id`),
  UNIQUE INDEX `DESCRICAO_UNIQUE` (`DESCRICAO` ASC) VISIBLE,
  INDEX `fk_ESTADO_PAIS1_idx` (`PAIS_id` ASC) VISIBLE,
  CONSTRAINT `fk_ESTADO_PAIS1`
    FOREIGN KEY (`PAIS_id`)
    REFERENCES `mydb`.`PAIS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MUNICIPIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MUNICIPIO` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `DESCRICAO` VARCHAR(45) NOT NULL,
  `ESTADO_PAIS_id` INT NOT NULL,
  PRIMARY KEY (`id`, `ESTADO_PAIS_id`),
  UNIQUE INDEX `DESCRICAO_UNIQUE` (`DESCRICAO` ASC) VISIBLE,
  INDEX `fk_MUNICIPIO_ESTADO1_idx` (`ESTADO_PAIS_id` ASC) VISIBLE,
  CONSTRAINT `fk_MUNICIPIO_ESTADO1`
    FOREIGN KEY (`ESTADO_PAIS_id`)
    REFERENCES `mydb`.`ESTADO` (`PAIS_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CEP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CEP` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `DESCRICAO` VARCHAR(45) NOT NULL,
  `MUNICIPIO_ESTADO_PAIS_id` INT NOT NULL,
  PRIMARY KEY (`id`, `MUNICIPIO_ESTADO_PAIS_id`),
  UNIQUE INDEX `DESCRICAO_UNIQUE` (`DESCRICAO` ASC) VISIBLE,
  INDEX `fk_CEP_MUNICIPIO1_idx` (`MUNICIPIO_ESTADO_PAIS_id` ASC) VISIBLE,
  CONSTRAINT `fk_CEP_MUNICIPIO1`
    FOREIGN KEY (`MUNICIPIO_ESTADO_PAIS_id`)
    REFERENCES `mydb`.`MUNICIPIO` (`ESTADO_PAIS_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ENDERECO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ENDERECO` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `MUNICIPIO_id` INT NOT NULL,
  `ESTADO_id` INT NOT NULL,
  `PAIS_id` INT NOT NULL,
  `CEP_id` INT NOT NULL,
  `numero` VARCHAR(255) NOT NULL,
  `complemento` VARCHAR(45) NULL,
  `logradouro` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ENDERECO_MUNICIPIO_idx` (`MUNICIPIO_id` ASC) VISIBLE,
  INDEX `fk_ENDERECO_ESTADO1_idx` (`ESTADO_id` ASC) VISIBLE,
  INDEX `fk_ENDERECO_PAIS1_idx` (`PAIS_id` ASC) VISIBLE,
  INDEX `fk_ENDERECO_CEP1_idx` (`CEP_id` ASC) VISIBLE,
  CONSTRAINT `fk_ENDERECO_MUNICIPIO`
    FOREIGN KEY (`MUNICIPIO_id`)
    REFERENCES `mydb`.`MUNICIPIO` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ENDERECO_ESTADO1`
    FOREIGN KEY (`ESTADO_id`)
    REFERENCES `mydb`.`ESTADO` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ENDERECO_PAIS1`
    FOREIGN KEY (`PAIS_id`)
    REFERENCES `mydb`.`PAIS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ENDERECO_CEP1`
    FOREIGN KEY (`CEP_id`)
    REFERENCES `mydb`.`CEP` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CARGO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CARGO` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PESSOA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PESSOA` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(255) NOT NULL,
  `CNPJCPF` TINYINT NOT NULL,
  `TELEFONE` VARCHAR(45) NULL,
  `CELULAR` VARCHAR(45) NOT NULL,
  `INFOCOMPLEMENTAR` VARCHAR(255) NULL,
  `EHFUNCIONARIO` VARCHAR(45) NULL,
  `EHCLIENTE` VARCHAR(45) NULL,
  `ENDERECO_id` INT NOT NULL,
  `CARGO_id` INT NOT NULL,
  `EMAIL` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `NOME_UNIQUE` (`NOME` ASC) VISIBLE,
  INDEX `fk_PESSOA_ENDERECO1_idx` (`ENDERECO_id` ASC) VISIBLE,
  INDEX `fk_PESSOA_CARGO1_idx` (`CARGO_id` ASC) VISIBLE,
  UNIQUE INDEX `EMAIL_UNIQUE` (`EMAIL` ASC) VISIBLE,
  CONSTRAINT `fk_PESSOA_ENDERECO1`
    FOREIGN KEY (`ENDERECO_id`)
    REFERENCES `mydb`.`ENDERECO` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PESSOA_CARGO1`
    FOREIGN KEY (`CARGO_id`)
    REFERENCES `mydb`.`CARGO` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`USUARIO` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(45) NOT NULL,
  `SENHA` VARCHAR(45) NOT NULL,
  `PESSOA_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `NOME_UNIQUE` (`NOME` ASC) VISIBLE,
  INDEX `fk_USUARIO_PESSOA1_idx` (`PESSOA_id` ASC) VISIBLE,
  CONSTRAINT `fk_USUARIO_PESSOA1`
    FOREIGN KEY (`PESSOA_id`)
    REFERENCES `mydb`.`PESSOA` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`STATUSVENDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`STATUSVENDA` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `descricao_UNIQUE` (`descricao` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MODALIDADETRANSPORTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MODALIDADETRANSPORTE` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VENDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VENDA` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `PESSOA_id` INT NOT NULL,
  `DATA` DATE NOT NULL,
  `STATUS_id` INT NOT NULL,
  `VALORTOTAL` DOUBLE NOT NULL,
  `MODALIDADETRANSPORTE_id` INT NOT NULL,
  PRIMARY KEY (`id`, `STATUS_id`),
  INDEX `fk_PEDIDO_PESSOA1_idx` (`PESSOA_id` ASC) VISIBLE,
  INDEX `fk_PEDIDO_STATUS1_idx` (`STATUS_id` ASC) VISIBLE,
  INDEX `fk_VENDA_MODALIDADETRANSPORTE1_idx` (`MODALIDADETRANSPORTE_id` ASC) VISIBLE,
  CONSTRAINT `fk_PEDIDO_PESSOA1`
    FOREIGN KEY (`PESSOA_id`)
    REFERENCES `mydb`.`PESSOA` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PEDIDO_STATUS1`
    FOREIGN KEY (`STATUS_id`)
    REFERENCES `mydb`.`STATUSVENDA` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENDA_MODALIDADETRANSPORTE1`
    FOREIGN KEY (`MODALIDADETRANSPORTE_id`)
    REFERENCES `mydb`.`MODALIDADETRANSPORTE` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CATEGORIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CATEGORIA` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `descricao_UNIQUE` (`descricao` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`UNIDADEMEDIDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`UNIDADEMEDIDA` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `sigla` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PRODUTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PRODUTO` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `CODIGOREFERENCIA` VARCHAR(45) NOT NULL,
  `DESCRICAO` VARCHAR(45) NOT NULL,
  `CATEGORIA_id` INT NOT NULL,
  `UNIDADEMEDIDA_id` INT NOT NULL,
  PRIMARY KEY (`id`, `UNIDADEMEDIDA_id`),
  UNIQUE INDEX `CODIGOREFERENCIA_UNIQUE` (`CODIGOREFERENCIA` ASC) VISIBLE,
  INDEX `fk_PRODUTO_CATEGORIA1_idx` (`CATEGORIA_id` ASC) VISIBLE,
  INDEX `fk_PRODUTO_UNIDADEMEDIDA1_idx` (`UNIDADEMEDIDA_id` ASC) VISIBLE,
  CONSTRAINT `fk_PRODUTO_CATEGORIA1`
    FOREIGN KEY (`CATEGORIA_id`)
    REFERENCES `mydb`.`CATEGORIA` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUTO_UNIDADEMEDIDA1`
    FOREIGN KEY (`UNIDADEMEDIDA_id`)
    REFERENCES `mydb`.`UNIDADEMEDIDA` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ESTOQUE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ESTOQUE` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `QUANTIDADE` VARCHAR(45) NOT NULL,
  `PRODUTO_id` INT NOT NULL,
  `VALOR` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ESTOQUE_PRODUTO1_idx` (`PRODUTO_id` ASC) VISIBLE,
  CONSTRAINT `fk_ESTOQUE_PRODUTO1`
    FOREIGN KEY (`PRODUTO_id`)
    REFERENCES `mydb`.`PRODUTO` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VENDA_has_PRODUTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VENDA_has_PRODUTO` (
  `PEDIDO_id` INT NOT NULL,
  `PRODUTO_id` INT NOT NULL,
  `QUANTIDADE` DOUBLE NOT NULL,
  `VALOR` DOUBLE NOT NULL,
  PRIMARY KEY (`PEDIDO_id`, `PRODUTO_id`),
  INDEX `fk_PEDIDO_has_PRODUTO_PRODUTO1_idx` (`PRODUTO_id` ASC) VISIBLE,
  INDEX `fk_PEDIDO_has_PRODUTO_PEDIDO1_idx` (`PEDIDO_id` ASC) VISIBLE,
  CONSTRAINT `fk_PEDIDO_has_PRODUTO_PEDIDO1`
    FOREIGN KEY (`PEDIDO_id`)
    REFERENCES `mydb`.`VENDA` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PEDIDO_has_PRODUTO_PRODUTO1`
    FOREIGN KEY (`PRODUTO_id`)
    REFERENCES `mydb`.`PRODUTO` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`STATUSCOMPRA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`STATUSCOMPRA` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `descricao_UNIQUE` (`descricao` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`COMPRA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`COMPRA` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `PESSOA_id` INT NOT NULL,
  `DATA` DATE NOT NULL,
  `VALORTOTAL` DOUBLE NOT NULL,
  `MODALIDADETRANSPORTE_id` INT NOT NULL,
  `STATUSCOMPRA_id` INT NOT NULL,
  PRIMARY KEY (`id`, `STATUSCOMPRA_id`),
  INDEX `fk_PEDIDO_PESSOA1_idx` (`PESSOA_id` ASC) VISIBLE,
  INDEX `fk_COMPRA_MODALIDADETRANSPORTE1_idx` (`MODALIDADETRANSPORTE_id` ASC) VISIBLE,
  INDEX `fk_COMPRA_STATUSCOMPRA1_idx` (`STATUSCOMPRA_id` ASC) VISIBLE,
  CONSTRAINT `fk_PEDIDO_PESSOA10`
    FOREIGN KEY (`PESSOA_id`)
    REFERENCES `mydb`.`PESSOA` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMPRA_MODALIDADETRANSPORTE1`
    FOREIGN KEY (`MODALIDADETRANSPORTE_id`)
    REFERENCES `mydb`.`MODALIDADETRANSPORTE` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMPRA_STATUSCOMPRA1`
    FOREIGN KEY (`STATUSCOMPRA_id`)
    REFERENCES `mydb`.`STATUSCOMPRA` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`COMPRA_has_PRODUTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`COMPRA_has_PRODUTO` (
  `COMPRA_id` INT NOT NULL,
  `PRODUTO_id` INT NOT NULL,
  `QUANTIDADE` DOUBLE NOT NULL,
  `VALOR` DOUBLE NOT NULL,
  PRIMARY KEY (`COMPRA_id`, `PRODUTO_id`),
  INDEX `fk_COMPRA_has_PRODUTO_PRODUTO1_idx` (`PRODUTO_id` ASC) VISIBLE,
  INDEX `fk_COMPRA_has_PRODUTO_COMPRA1_idx` (`COMPRA_id` ASC) VISIBLE,
  CONSTRAINT `fk_COMPRA_has_PRODUTO_COMPRA1`
    FOREIGN KEY (`COMPRA_id`)
    REFERENCES `mydb`.`COMPRA` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMPRA_has_PRODUTO_PRODUTO1`
    FOREIGN KEY (`PRODUTO_id`)
    REFERENCES `mydb`.`PRODUTO` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
