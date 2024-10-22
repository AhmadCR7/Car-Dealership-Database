-- MySQL Script generated by MySQL Workbench
-- Sun Dec  6 12:27:27 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering




DROP TABLE IF EXISTS `CustomerAddress` ;

CREATE TABLE IF NOT EXISTS `CustomerAddress` (
  `address_id` TINYINT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(100) NOT NULL,
  `number` INT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` CHAR(2) NOT NULL,
  `zip` INT NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Account` ;

CREATE TABLE IF NOT EXISTS `Account` (
  `account_id` TINYINT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `account_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`account_id`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `CreditCardType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CreditCardType` ;

CREATE TABLE IF NOT EXISTS `CreditCardType` (
  `cc_type_id` TINYINT NOT NULL AUTO_INCREMENT,
  `billing_address` VARCHAR(45) NOT NULL,
  `billing_city` CHAR(30) NOT NULL,
  `billing_state` VARCHAR(30) NOT NULL,
  `billing_country` VARCHAR(45) NOT NULL,
  `billing_zip` INT NOT NULL,
  PRIMARY KEY (`cc_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CreditCard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CreditCard` ;

CREATE TABLE IF NOT EXISTS `CreditCard` (
  `cc_it` TINYINT NOT NULL AUTO_INCREMENT,
  `cc_number` CHAR(16) NOT NULL,
  `expiration_date` VARCHAR(20) NOT NULL,
  `CCV` CHAR(3) NOT NULL,
  `cc_type_id` TINYINT NULL,
  PRIMARY KEY (`cc_it`),
  INDEX `CC_type_FK_idx` (`cc_type_id` ASC) VISIBLE,
  CONSTRAINT `CC_type_FK`
    FOREIGN KEY (`cc_type_id`)
    REFERENCES `CreditCardType` (`cc_type_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Customer` ;

CREATE TABLE IF NOT EXISTS `Customer` (
  `customer_id` TINYINT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(45) NOT NULL,
  `DOB` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `customer_address` TINYINT NULL,
  `account_id` TINYINT NULL,
  `cc_id` TINYINT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `account_id_FK_idx` (`account_id` ASC) VISIBLE,
  INDEX `cc_id_FK_idx` (`cc_id` ASC) VISIBLE,
  INDEX `customer_address_FK_idx` (`customer_address` ASC) VISIBLE,
  CONSTRAINT `customer_address_FK`
    FOREIGN KEY (`customer_address`)
    REFERENCES `CustomerAddress` (`address_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `account_id_FK`
    FOREIGN KEY (`account_id`)
    REFERENCES `Account` (`account_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `cc_id_FK`
    FOREIGN KEY (`cc_id`)
    REFERENCES `CreditCard` (`cc_it`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Employee` ;

CREATE TABLE IF NOT EXISTS `Employee` (
  `employee_id` TINYINT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(45) NOT NULL,
  `phone_number` CHAR(20) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `gender` ENUM('m', 'f') NOT NULL,
  `starting_date` VARCHAR(45) NOT NULL,
  `DOB` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`employee_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ServiceShop`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ServiceShop` ;

CREATE TABLE IF NOT EXISTS `ServiceShop` (
  `service_shop_id` TINYINT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(30) NOT NULL,
  `phone` CHAR(20) NOT NULL,
  PRIMARY KEY (`service_shop_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DealershipAddress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DealershipAddress` ;

CREATE TABLE IF NOT EXISTS `DealershipAddress` (
  `Address_id` TINYINT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NOT NULL,
  `city` VARCHAR(10) NOT NULL,
  `state` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Address_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FinancePlan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FinancePlan` ;

CREATE TABLE IF NOT EXISTS `FinancePlan` (
  `Plan_id` TINYINT NOT NULL AUTO_INCREMENT,
  `effective_date` VARCHAR(45) NOT NULL,
  `term` INT NOT NULL,
  `amount` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Plan_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dealership`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Dealership` ;

CREATE TABLE IF NOT EXISTS `Dealership` (
  `dealership_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `phone` CHAR(20) NOT NULL,
  `Service_shop_Fk` TINYINT NOT NULL,
  `DealershipAdd_Fk` TINYINT NOT NULL,
  `Finance_plan_id` TINYINT NOT NULL,
  PRIMARY KEY (`dealership_id`),
  INDEX `finance plan_idx` (`Finance_plan_id` ASC) VISIBLE,
  INDEX `dearship address_FK_idx` (`DealershipAdd_Fk` ASC) VISIBLE,
  INDEX `service_shop_FK_idx` (`Service_shop_Fk` ASC) VISIBLE,
  CONSTRAINT `service_shop_FK`
    FOREIGN KEY (`Service_shop_Fk`)
    REFERENCES `ServiceShop` (`service_shop_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `dearship address_FK`
    FOREIGN KEY (`DealershipAdd_Fk`)
    REFERENCES `DealershipAddress` (`Address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `finance_plan_Fk`
    FOREIGN KEY (`Finance_plan_id`)
    REFERENCES `FinancePlan` (`Plan_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Employees` ;

CREATE TABLE IF NOT EXISTS `Employees` (
  `dearship_id` TINYINT NOT NULL,
  `employee_id` TINYINT NOT NULL,
  INDEX `Employee_Dealership_FK_idx` (`dearship_id` ASC) VISIBLE,
  CONSTRAINT `Employee_Dealership_FK`
    FOREIGN KEY (`dearship_id`)
    REFERENCES `Dealership` (`dealership_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Employee_Employee_FK`
    FOREIGN KEY (`employee_id`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Supplier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Supplier` ;

CREATE TABLE IF NOT EXISTS `Supplier` (
  `supplier_id` TINYINT NOT NULL AUTO_INCREMENT,
  `supplier_name` VARCHAR(45) NOT NULL,
  `supplier_number` CHAR(20) NOT NULL,
  `supplier_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`supplier_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dearlership_Supplier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Dearlership_Supplier` ;

CREATE TABLE IF NOT EXISTS `Dearlership_Supplier` (
  `dearlership_id` TINYINT NOT NULL,
  `supplier_id` TINYINT NOT NULL,
  INDEX `dealership_id_idx` (`dearlership_id` ASC) VISIBLE,
  INDEX `supplier_id_idx` (`supplier_id` ASC) VISIBLE,
  CONSTRAINT `dealership_id`
    FOREIGN KEY (`dearlership_id`)
    REFERENCES `Dealership` (`dealership_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `supplier_id`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `Supplier` (`supplier_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CarEngine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CarEngine` ;

CREATE TABLE IF NOT EXISTS `CarEngine` (
  `engine_id` TINYINT NOT NULL,
  `price` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`engine_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CarType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CarType` ;

CREATE TABLE IF NOT EXISTS `CarType` (
  `type_id` TINYINT NOT NULL AUTO_INCREMENT,
  `Car_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Car`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Car` ;

CREATE TABLE IF NOT EXISTS `Car` (
  `VIN` TINYINT NOT NULL,
  `car_model` VARCHAR(45) NOT NULL,
  `car_year` CHAR(20) NOT NULL,
  `car_color` VARCHAR(45) NOT NULL,
  `car_engine_Fk` TINYINT NOT NULL,
  `car_type_Fk` TINYINT NULL,
  PRIMARY KEY (`VIN`),
  INDEX `car_engine_FK_idx` (`car_engine_Fk` ASC) VISIBLE,
  INDEX `car_type_id_FK_idx` (`car_type_Fk` ASC) VISIBLE,
  CONSTRAINT `car_engine_FK`
    FOREIGN KEY (`car_engine_Fk`)
    REFERENCES `CarEngine` (`engine_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `car_type_id_FK`
    FOREIGN KEY (`car_type_Fk`)
    REFERENCES `CarType` (`type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Warranty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Warranty` ;

CREATE TABLE IF NOT EXISTS `Warranty` (
  `warranty_id` TINYINT NOT NULL AUTO_INCREMENT,
  `effective_date` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`warranty_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Car_Warranty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Car_Warranty` ;

CREATE TABLE IF NOT EXISTS `Car_Warranty` (
  `VIN` TINYINT NOT NULL,
  `warranty_id` TINYINT NOT NULL,
  INDEX `Car_VIN_idx` (`VIN` ASC) VISIBLE,
  INDEX `Warranty_idx` (`warranty_id` ASC) VISIBLE,
  CONSTRAINT `Car_VIN`
    FOREIGN KEY (`VIN`)
    REFERENCES `Car` (`VIN`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Warranty`
    FOREIGN KEY (`warranty_id`)
    REFERENCES `Warranty` (`warranty_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Customer_Car`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Customer_Car` ;

CREATE TABLE IF NOT EXISTS `Customer_Car` (
  `customer_id_Fk` TINYINT NOT NULL,
  `VIN_id_Fk` TINYINT NOT NULL,
  INDEX `Customer_id_idx` (`customer_id_Fk` ASC) VISIBLE,
  INDEX `Car_VIN_idx` (`VIN_id_Fk` ASC) VISIBLE,
  CONSTRAINT `Customer_id_FK`
    FOREIGN KEY (`customer_id_Fk`)
    REFERENCES `Customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Car_VIN_FK`
    FOREIGN KEY (`VIN_id_Fk`)
    REFERENCES `Car` (`VIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Discount`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Discount` ;

CREATE TABLE IF NOT EXISTS `Discount` (
  `Discount_id` TINYINT NOT NULL AUTO_INCREMENT,
  `discount_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Discount_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Customer_Discount`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Customer_Discount` ;

CREATE TABLE IF NOT EXISTS `Customer_Discount` (
  `customer_id` TINYINT NOT NULL,
  `discount_id` TINYINT NULL,
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE,
  INDEX `discount_id_idx` (`discount_id` ASC) VISIBLE,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `discount_id`
    FOREIGN KEY (`discount_id`)
    REFERENCES `Discount` (`Discount_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Salesperson`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Salesperson` ;

CREATE TABLE IF NOT EXISTS `Salesperson` (
  `salesperson_id` TINYINT NOT NULL AUTO_INCREMENT,
  `employeeid_Fk` TINYINT NOT NULL,
  `starting_date` VARCHAR(30) NOT NULL,
  `salary` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`salesperson_id`, `employeeid_Fk`),
  INDEX `employee_id_FK_idx` (`employeeid_Fk` ASC) VISIBLE,
  CONSTRAINT `salesperson_employee_id_FK`
    FOREIGN KEY (`employeeid_Fk`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mechanic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mechanic` ;

CREATE TABLE IF NOT EXISTS `Mechanic` (
  `mechanic_id` TINYINT NOT NULL AUTO_INCREMENT,
  `salary` VARCHAR(20) NOT NULL,
  `employeeid_Fk` TINYINT NOT NULL,
  PRIMARY KEY (`mechanic_id`, `employeeid_Fk`),
  INDEX `employee_id_FK_idx` (`employeeid_Fk` ASC) VISIBLE,
  CONSTRAINT `mechanic_employee_id_FK`
    FOREIGN KEY (`employeeid_Fk`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Manger`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Manger` ;

CREATE TABLE IF NOT EXISTS `Manger` (
  `manger_id` TINYINT NOT NULL AUTO_INCREMENT,
  `salary` VARCHAR(45) NOT NULL,
  `employeeid_Fk` TINYINT NOT NULL,
  PRIMARY KEY (`manger_id`, `employeeid_Fk`),
  INDEX `employee_id_FK_idx` (`employeeid_Fk` ASC) VISIBLE,
  CONSTRAINT `manger_employee_id_FK`
    FOREIGN KEY (`employeeid_Fk`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CarPart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CarPart` ;

CREATE TABLE IF NOT EXISTS `CarPart` (
  `part_id` TINYINT NOT NULL,
  `car_type` VARCHAR(45) NOT NULL,
  `Price` INT NOT NULL,
  PRIMARY KEY (`part_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Car_Part_Table`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Car_Part_Table` ;

CREATE TABLE IF NOT EXISTS `Car_Part_Table` (
  `VIN_Fk` TINYINT NULL,
  `part_id_Fk` TINYINT NULL,
  INDEX `VIN_FK_idx` (`VIN_Fk` ASC) VISIBLE,
  INDEX `part_id_FK_idx` (`part_id_Fk` ASC) VISIBLE,
  CONSTRAINT `VIN_FK`
    FOREIGN KEY (`VIN_Fk`)
    REFERENCES `Car` (`VIN`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `part_id_FK`
    FOREIGN KEY (`part_id_Fk`)
    REFERENCES `CarPart` (`part_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
