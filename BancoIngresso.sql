
-- -----------------------------------------------------
-- Schema gerenciador_Ingressos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gerenciador_Ingressos` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci ;
USE `gerenciador_Ingressos` ;

-- -----------------------------------------------------
-- Table `gerenciador_Ingressos`.`Evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gerenciador_Ingressos`.`Evento` (
  `nome` VARCHAR(40) NOT NULL,
  `data` DATE NULL,
  `local` VARCHAR(45) NULL,
  `valorBase` FLOAT NULL,
  PRIMARY KEY (`nome`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `gerenciador_Ingressos`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gerenciador_Ingressos`.`Cliente` (
  `CPF` VARCHAR(25) NOT NULL,
  `nome` VARCHAR(45) NULL,
  `dtNascimento` DATE NULL,
  `endereco` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `gerenciador_Ingressos`.`Ingresso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gerenciador_Ingressos`.`Ingresso` (
  `cdIdentificacao` FLOAT NOT NULL,
  `quantidadeDisponivel` DECIMAL NULL,
  `registroCompra` VARCHAR(60) NULL,
  `valorPago` DOUBLE NULL,
  `Evento_nome` VARCHAR(40) NOT NULL,
  `Cliente_CPF` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`cdIdentificacao`, `Evento_nome`, `Cliente_CPF`),
  INDEX `fk_Ingresso_Evento1_idx` (`Evento_nome` ASC),
  INDEX `fk_Ingresso_Cliente1_idx` (`Cliente_CPF` ASC),
  CONSTRAINT `fk_Ingresso_Evento1`
    FOREIGN KEY (`Evento_nome`)
    REFERENCES `gerenciador_Ingressos`.`Evento` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ingresso_Cliente1`
    FOREIGN KEY (`Cliente_CPF`)
    REFERENCES `gerenciador_Ingressos`.`Cliente` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `gerenciador_Ingressos`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gerenciador_Ingressos`.`Empresa` (
  `cnpj` VARCHAR(25) NOT NULL,
  `endereco` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`cnpj`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `gerenciador_Ingressos`.`Conexao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gerenciador_Ingressos`.`Conexao` (
  `Evento_nome` VARCHAR(40) NOT NULL,
  `Empresa_cnpj` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`Evento_nome`, `Empresa_cnpj`),
  INDEX `fk_Evento_has_Empresa_Empresa1_idx` (`Empresa_cnpj` ASC) ,
  INDEX `fk_Evento_has_Empresa_Evento_idx` (`Evento_nome` ASC),
  CONSTRAINT `fk_Evento_has_Empresa_Evento`
    FOREIGN KEY (`Evento_nome`)
    REFERENCES `gerenciador_Ingressos`.`Evento` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evento_has_Empresa_Empresa1`
    FOREIGN KEY (`Empresa_cnpj`)
    REFERENCES `gerenciador_Ingressos`.`Empresa` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
