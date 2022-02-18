CREATE TABLE dealership (
  dealership_name varchar(50),
  city varchar(20),
  workshop varchar(20),
  PRIMARY KEY (dealership_name)
);

CREATE table manager (
  IDcardNr bigint,
  name varchar(20),
  surname varchar(20),
  adress varchar(50),
  gross_annual_salary integer,
  date_of_hiring Date,
  dealership_name varchar(50),
  PRIMARY KEY (IDcardNr),
  FOREIGN KEY (dealership_name) REFERENCES dealership(dealership_name)
  );
  
CREATE table salesperson (
  IDcardNr bigint,
  name varchar(20),
  surname varchar(20),
  adress varchar(50),
  gross_annual_salary integer,
  date_of_hiring Date,
  total_number_of_sales integer,
  dealership_name varchar(50),
  PRIMARY KEY (IDcardNr),
  FOREIGN KEY (dealership_name) REFERENCES dealership(dealership_name)
  );
  
CREATE table mechanic (
  IDcardNr bigint,
  name varchar(20),
  surname varchar(20),
  adress varchar(50),
  gross_annual_salary integer,
  date_of_hiring Date,
  repairs_carried_out integer,
  dealership_name varchar(50),
  PRIMARY KEY (IDcardNr),
  FOREIGN KEY (dealership_name) REFERENCES dealership(dealership_name)
  ); 
  
CREATE table mechanic_phone (
  IDcardNr bigint,
  phone_Nr bigint ,
  PRIMARY key (phone_Nr),
  FOREIGN KEY (IDcardNr) REFERENCES mechanic(IDcardNr)
); 

CREATE table salesperson_phone (
  IDcardNr bigint,
  phone_Nr bigint ,
  PRIMARY key (phone_Nr),
  FOREIGN KEY (IDcardNr) REFERENCES salesperson(IDcardNr)
); 

CREATE table manager_phone (
  IDcardNr bigint,
  phone_Nr bigint ,
  PRIMARY key (phone_Nr),
  FOREIGN KEY (IDcardNr) REFERENCES manager(IDcardNr)
); 
  
CREATE TABLE car (
  VIN BIgint,
  colour varchar(20),
  model_name varchar(20),
  dealership_name varchar(50),
  PRIMARY KEY (VIN),
  FOREIGN KEY (dealership_name) REFERENCES dealership(dealership_name),
  FOREIGN KEY (model_name) REFERENCES model(model_name)
);

CREATE TABLE car_brand (
  model_name varchar(20),
  brand varchar(20),
  PRIMARY KEY (model_name),
  FOREIGN KEY (model_name) REFERENCES car(model_name) 
);

CREATE TABLE model (
  model_name varchar(20),
  engine varchar(20),
  fuel_type varchar(20),
  lane_keeping_assist varchar(20), 
  LED_daytime_running_lights_front_and_rear varchar(20),
  Traffic_sign_recognition varchar(20), 
  Emergency_brake_assist varchar(20),
  PRIMARY KEY (model_name)
); 

CREATE TABLE basic_characteristics (
  model_name varchar(20),
  engine varchar(20),
  fuel_type varchar(20),
  base_price integer,
  PRIMARY KEY (model_name, engine, fuel_type)
);

CREATE TABLE sale (
  customer_ID bigint,
  VIN bigint,
  sales_person_idcardNr bigint,
  extra_price integer,
  date_of_sale date,
  PRIMARY KEY (customer_ID, VIN, sales_person_idcardNr)
);
  
CREATE TABLE car_sold (
  VIN bigint,
  car_plate_number bigint,
  PRIMARY key (VIN),
  FOREIGN KEY (VIN) REFERENCES sale(VIN)
);
  
create TABLE payment (
  customer_ID bigint,
  VIN bigint,
  sales_person_idcardNr bigint,
  PRIMARY KEY (customer_ID, VIN, sales_person_idcardNr)
);
  
CREATE TABLE cash (
  customer_ID bigint,
  VIN bigint,
  sales_person_idcardNr bigint,
  PRIMARY KEY (customer_ID, VIN, sales_person_idcardNr),
  FOREIGN key (customer_ID, VIN, sales_person_idcardNr) REFERENCES payment(customer_ID, VIN, sales_person_idcardNr) 
);

CREATE table installement_financing( 
  customer_ID bigint,
  VIN bigint,
  sales_person_idcardNr bigint,
  financial_institution varchar(50),
  initial_payment integer,
  number_of_months integer,
  PRIMARY KEY (customer_ID, VIN, sales_person_idcardNr)
  FOREIGN key (customer_ID, VIN, sales_person_idcardNr) REFERENCES payment(customer_ID, VIN, sales_person_idcardNr)
); 

CREATE TABLE monthly_payment (
  customer_ID bigint,
  VIN bigint,
  sales_person_idcardNr bigint,
  initial_payment integer,
  number_of_months integer,
  payment_of_each_month integer,
  PRIMARY key (customer_ID, VIN, sales_person_idcardNr,initial_payment, number_of_months)
  FOREIGN KEY (customer_ID, VIN, sales_person_idcardNr,initial_payment, number_of_months) REFERENCES installement_financing(customer_ID, 
                                                                                   VIN, sales_person_idcardNr,initial_payment, number_of_months)
);

create TABLE customer_company (
  commercial_identification_number bigint,
  company_name varchar(50),
  adress varchar(50),
  PRIMARY KEY (commercial_identification_number)
);

CREATE TABLE individual_customer (
  IDcardNr bigint,
  indiv_name varchar(20),
  surname varchar(20),
  email_adress varchar(20),
  adress varchar(50),
  PRIMARY KEY (IDcardNr)
);

CREATE table individual_customer_phone (
  IDcardNr bigint,
  phone_Nr bigint ,
  PRIMARY key (phone_Nr),
  FOREIGN KEY (IDcardNr) REFERENCES individual_customer(IDcardNr)
);

CREATE TABLE maintenance_task (
  VIN varchar(50),
  date_of_entry date,
  time_of_entry time,
  date_of_exit date,
  time_of_exit time,
  type_of_failure varchar(50),
  PRIMARY KEY (VIN, date_of_entry, date_of_exit),
  FOREIGN KEY (VIN) REFERENCES car(VIN)
);

 create Table repair_participation (
  VIN varchar(50),
  date_of_entry date,
  date_of_exit date,
  mechanic_ID_card varchar(50),
  time_spent integer,
  PRIMARY KEY (VIN,date_of_entry,date_of_exit,mechanic_ID_card),
  FOREIGN KEY (VIN,date_of_entry,date_of_exit) REFERENCES maintenance_task(VIN,date_of_entry,date_of_exit),
  FOREIGN KEY (mechanic_ID_card) REFERENCES mechanic(IDcardNr)
);