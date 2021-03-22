       -- Script name: tests.sql
       -- Author:     Ahmad Afghan
       -- Purpose:     test the integrity of this database system
       
       
-- database to test data into

  USE `my_dealership_database`;
  SET SQL_SAFE_UPDATES=0;
   select * from `Salesperson`; 
  
-- 1. testing table Customer Addrress
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  
-- To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

#DELETE FROM `Customer Address` WHERE country = 'Canada';

UPDATE `Customer Address` SET number = 2525 WHERE street = 'Alderwood Dr';

-- 2. testing table Account
DELETE FROM `Account` WHERE password = 'nice';

UPDATE `Account` SET password = 'nice3333' WHERE password = 'nice23';


-- 3. testing Credit Card table 
-- Error Code: 1054. Unknown column 'country' in 'where clause'
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`my_dealership_database`.`credit card`, CONSTRAINT `CC_type_FK` FOREIGN KEY (`cc_type_id`) REFERENCES `credit card type` (`cc_type_id`))


DELETE FROM `Credit Card Type` WHERE billing_city = 'Fremont';
#DELETE FROM `Credit Card Type` WHERE billing_address = '2629 Alderwood Dr';
UPDATE `Credit Card Type` SET billing_zip = '95132' WHERE billing_country ='USA';

-- 4. testing Credit Card tbale
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`my_dealership_database`.`credit card`, CONSTRAINT `CC_type_FK` FOREIGN KEY (`cc_type_id`) REFERENCES `credit card type` (`cc_type_id`))

#DELETE FROM `Credit Card` WHERE cc_number = 4563872462491353;

UPDATE `Credit Card` SET CCV = 999 WHERE  cc_number = 4759204591402517;

-- 5. testing Customer table 
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`my_dealership_database`.`customer_car`, CONSTRAINT `Customer_id_FK` FOREIGN KEY (`customer_id_Fk`) REFERENCES `customer` (`customer_id`))

#DELETE FROM `Customer` WHERE full_name = 'Ahmad Afghan'; 

UPDATE  `Customer` SET gender = 'Fmale' WHERE email='aafghan@mail.sfsu.edu';

-- 6. testing Employee table 
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`my_dealership_database`.`employees`, CONSTRAINT `Employee_Employee_FK` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`))

#DELETE FROM `Employee` WHERE full_name = 'Mohamad Akbar';

UPDATE `Employee` SET DOB = '10-25-1993' WHERE full_name = 'Carlos Ortiz';

-- 7. testing Sercice Shop
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`my_dealership_database`.`dealership`, CONSTRAINT `service_shop_FK` FOREIGN KEY (`Service_shop_Fk`) REFERENCES `service shop` (`service_shop_id`))

#DELETE FROM `Service Shop` WHERE phone = '510-654-5423';

UPDATE `Service Shop` SET service_shop_id = 22 WHERE email = 'serviceshop@yahoo.com';


-- 8. testing Dealership Address
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`my_dealership_database`.`dealership`, CONSTRAINT `dearship address_FK` FOREIGN KEY (`DealershipAdd_Fk`) REFERENCES `dealership address` (`Address_id`))

#DELETE FROM `Dealership Address` WHERE city = 'San Jose';

UPDATE `Dealership Address` SET State = 'VA' WHERE street = '4599 Stevens Creek Blvd';

-- 9 testing Finance Plan
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`my_dealership_database`.`dealership`, CONSTRAINT `finance_plan_Fk` FOREIGN KEY (`Finance_plan_id`) REFERENCES `finance plan` (`Plan_id`))

#DELETE FROM `Finance Plan` WHERE term = '7';

UPDATE `Finance Plan` SET amount= '400' WHERE plan_id = '1';


-- 10 testing Car table 
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`my_dealership_database`.`car_warranty`, CONSTRAINT `Car_VIN` FOREIGN KEY (`VIN`) REFERENCES `car` (`VIN`))

#DELETE FROM `Car` WHERE car_model = 'Honda Accord';
 UPDATE `Car` SET car_year= '2021' WHERE car_model = 'Honda Civic';
 
 -- 11 testing Warranty 
 -- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`my_dealership_database`.`car_warranty`, CONSTRAINT `Warranty` FOREIGN KEY (`warranty_id`) REFERENCES `warranty` (`warranty_id`))

 #DELETE FROM `Warranty` WHERE warranty_id = 1;
  
  UPDATE `Warranty` SET effective_date = '10-31-1992' WHERE warranty_id = 2;
  
  -- testing SalesPerson
  
  DELETE FROM `Salesperson` WHERE salary = '$20';
  
  UPDATE `Salesperson` SET salary = '$18' WHERE salesperson_id = 2;
  
  
-- testing Mechanic table 
  
  DELETE FROM `Mechanic` WHERE salary = '$45';
  
  UPDATE `Mechanic` SET salary = '$39' WHERE mechanic_id = 2;
 

-- testing Manger table 
  
  DELETE FROM `Manger` WHERE salary = '$100';
  
  UPDATE `Manger` SET salary = '$50' WHERE manger_id = 3;
  
  
  -- testing Car Part table 
 -- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`my_dealership_database`.`car_part_table`, CONSTRAINT `part_id_FK` FOREIGN KEY (`part_id_Fk`) REFERENCES `car part` (`part_id`))

  #DELETE From `Car Part` WHERE part_id = 1; 
  
  UPDATE `Car Part` SET Price = 30 WHERE part_id = 3;

-- testing Discount table 
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`my_dealership_database`.`customer_discount`, CONSTRAINT `discount_id` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`Discount_id`))

#DELETE From `Discount` WHERE discount_id = 1; 

UPDATE `Discount` SET discount_type = '40% discount'  WHERE discount_id =1;

