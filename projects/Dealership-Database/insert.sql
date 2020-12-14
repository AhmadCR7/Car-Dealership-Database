-- Script name: inserts.sql
   -- Author:      Ahmad Afghan
   -- Purpose:     insert sample data to test the integrity of this database system



 USE `my_dealership_database`;
 
 
 INSERT INTO `CustomerAddress` (address_id, number, street, city, state, zip, country)
 VALUE (1, 2629, 'Alderwood Dr', 'San Jose', 'CA', 95132, 'United States'),
       (2, 4054, 'Shona court', 'San Jose', 'CA', 95124, 'United States'),
       (3, 4601, 'Darcel Court', 'Union City', 'CA', 94587, 'Canada'),
       (4, 434, 'Shona drive', 'Fremont', 'CA', 95124, 'United States');

 INSERT INTO Account (account_id, username, password, account_type)
 VALUE (1, 'Ahmad.Afghan', 'coolguy', 'Customer'),
	   (2, 'Yama24', 'nice23', 'Customer'),
       (3, 'MassoudRahimi', 'wow', 'Customer'),
       (4, 'Yee','nice', 'Employee');


INSERT INTO `CreditCardType`(cc_type_id, billing_address, billing_city,billing_state,
billing_country, billing_zip)
VALUE (1, '2629 Alderwood Dr', 'San Jose', 'CA', 'USA', 95132),
	  (2, 'Shona court', 'San Jose', 'CA', 'USA', 95124),
      (3, '2525 Alderwood Dr', 'San Jose', 'Canada', 'USA', 95132),
      (4, '33 Tasman Dr', 'Fremmont', 'CA', 'USA', 98423);

INSERT INTO `CreditCard` (cc_it, cc_number, expiration_date, CCV, cc_type_id)
VALUE (1, 4563872462491353, '10/24', 434, 3),
	  (2, 4759204591402517, '2/30', 321, 2),
      (3, 6483291739201610, '3/18', 675, 1);

INSERT INTO Customer (customer_id, full_name, DOB, email, phone, gender, customer_address, account_id, cc_id)
VALUE (1, 'Ahmad Afghan', '10-25-1993', 'aafghan@mail.sfsu.edu', '(469)321-0894', 'Male', 1, 1, 1),
      (2, 'Marcel Waziri', '02-16-1998', 'mwaziri@mail.sfsu.edu', '(510)739-9744', 'Fmale', 2, 3, 2),
      (3, 'Carlos Cazares', '12-23-1994', 'ccazaresn@mail.sfsu.edu', '(510)432-9843', 'Male', 3, 2, 3);

-- -----------------------------------------------------
-- Table `Employee`
-- -----------------------------------------------------
INSERT INTO `Employee` (employee_id, full_name, phone_number, email, starting_date, DOB)
VALUE (1, 'Mohamad Akbar', '(510)432-4532', 'MAkbar@honda.com', '12/2/2018', '10-29-1993'),
      (2, 'Carlos Ortiz', '(510)432-232', 'COrtiz34@honda.com', '1/2/2019', '10-29-1994'),
      (3, 'Jasica Moran', '(310)432-4532', 'Jmoran33@honda.com', '12/3/2018', '10-29-2000');
-- -----------------------------------------------------
-- Table `Service Shop`
-- -----------------------------------------------------
INSERT INTO `ServiceShop` (service_shop_id, email, phone)
VALUE (111, 'serviceshop@yahoo.com', '510-654-5423');

-- -----------------------------------------------------
-- Table `Dealership Address`
-- -----------------------------------------------------
INSERT INTO `DealershipAddress` (Address_id, street, city, state)
VALUE (22, '4599 Stevens Creek Blvd', 'San Jose', 'CA');

-- -----------------------------------------------------
-- Table `Finance Plan`
-- -----------------------------------------------------
INSERT INTO `FinancePlan`(Plan_id, effective_date, term, amount)
VALUE(1, '10-20-2020', 7, '$20000'),
	  (2, '10-20-2019', 3, '$15000'),
	 (3, '3-4-2015', 2, '$10000');
-- -----------------------------------------------------
-- Table `Dealership`
-- -----------------------------------------------------
INSERT INTO `Dealership` (dealership_id, name, email, phone, Service_shop_Fk, DealershipAdd_Fk, Finance_plan_id)
VALUE (11, 'Milpitas Honda', 'milpitashonda@gmail.com', '510-432-8765', 111, 22, 1);

-- -----------------------------------------------------
-- Table `Employees`
-- -----------------------------------------------------
INSERT INTO `Employees` (dearship_id, employee_id)
VALUE(11, 3),(11,2),(11,1);

-- -----------------------------------------------------
-- Table `Supplier`
-- -----------------------------------------------------

INSERT INTO `Supplier` (supplier_id, supplier_name, supplier_number, supplier_email)
VALUE (32, 'HONDA', '543-453-3345', 'honda@gmail.com'),
	  (33, 'TOYOTA', '523-453-2345', 'toyota@gmail.com'),
      (34, 'MAZDA', '133-234-2345', 'mazda@gmail.com');

-- -----------------------------------------------------
-- Table `Dearlership_Supplier`
-- -----------------------------------------------------

INSERT INTO `Dearlership_Supplier` (dearlership_id, supplier_id)
VALUE (11, 32),(11,34),(11,33);

-- -----------------------------------------------------
-- Table `Car Engine`
-- -----------------------------------------------------
INSERT INTO `CarEngine`(engine_id, price)
VALUE (77, '$3000'), (23, '$3423'), (99, '$2342');



-- -----------------------------------------------------
-- Table `Car Type`
-- -----------------------------------------------------
INSERT INTO `CarType` (type_id, car_type)
VALUE(01, 'sedan'), ('02', 'Truck-V8'), (03, 'SUV');


-- -----------------------------------------------------
-- Table `Car`
-- -----------------------------------------------------

INSERT INTO CAR (VIN, car_model, car_year, car_color, car_engine_Fk, car_type_Fk)
VALUE (22, 'Honda Accord', '2017', 'White', 77, 03),
      (33, 'Honda Civic', '2018', 'Black', 23, 03),
      (44, 'TOYOTA TACOMA', '2018', 'Black', 99, 01);

-- -----------------------------------------------------
-- Table `Warranty`
-- -----------------------------------------------------

INSERT INTO `Warranty` (warranty_id, effective_date)
VALUE (1, '10-22-2020'),
	  (2, '12-05-2019'),
      (3, '12-09-2015');

-- -----------------------------------------------------
-- Table `Car_Warranty`
-- -----------------------------------------------------

INSERT INTO `Car_Warranty` (VIN, warranty_id) VALUE (22, 1), (44,3), (33, 2);

-- -----------------------------------------------------
-- Table `Customer_Car`
-- -----------------------------------------------------

INSERT INTO `Customer_Car` (customer_id_Fk, VIN_id_Fk)
VALUE (1, 22), (2, 33), (3,44);

-- -----------------------------------------------------
-- Table `Discount`
-- -----------------------------------------------------
INSERT INTO `Discount` (Discount_id, discount_type)
VALUE (01, '20% discount'), (02, '30% discount'), (03, '40% discount');

-- -----------------------------------------------------
-- Table `Customer_Discount`
-- -----------------------------------------------------
INSERT INTO `Customer_Discount` (customer_id, discount_id)
VALUE (1, 02), (2, 03), (3, 01);

-- -----------------------------------------------------
-- Table `Salesperson`
-- -----------------------------------------------------
INSERT INTO `Salesperson` (salesperson_id, employeeid_Fk, starting_date, salary)
VALUE (1, 1, '12/2/2018', '$20'),
(2, 3, '12/31/2019', '$15');




-- -----------------------------------------------------
-- Table `Mechanic`
-- -----------------------------------------------------
INSERT INTO `Mechanic`(mechanic_id, salary, employeeid_Fk)
VALUE (1, '$45 per hour', 2),
(2, '$30 per hour', 3),
(3, '$30 per hour', 1);

-- -----------------------------------------------------
-- Table `Manaer`
-- -----------------------------------------------------
INSERT INTO `Manger`(manger_id, salary, employeeid_Fk)
VALUE (1, '$100 per hour', 1),
(2, '$80 per hour', 2),
(3, '$90 per hour', 3);
-- -----------------------------------------------------
-- Table `Car Part`
-- -----------------------------------------------------
INSERT INTO `CarPart`(part_id, car_type, Price)
VALUE(1, 'water pump', 100),(2, 'tire', 200), (3, 'breaks', 240);

-- -----------------------------------------------------
-- Table `Car_Part_Table`
-- -----------------------------------------------------

INSERT INTO `Car_Part_Table`(VIN_Fk, part_id_Fk)
VALUE (33, 1), (22, 3), (22, 3);
