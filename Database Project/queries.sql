--Question 1
select dealership_name , count(*) as total_amount_of_cars
from car 
GROUP by dealership_name ;

--Question 2:
select VIN , dealership_name ,date_of_sale
from car
JOIN model
USING (model_name)

JOIN basic_characteristics
USING (model_name,engine,fuel_type)

join sale
USING (VIN)

where base_price < 100
AND date_of_sale > '2021-03-21';

--Question 3:
with number_of_sales_of_model(model_name , number_of_sales, fuel_type) as 
( select model_name , count(*) as number_of_sales,fuel_type
from car
 join model
 USING (model_name)
  
 join sale
 USING (VIN)
 group by model_name)
select brand
 from car_brand
 join number_of_sales_of_model
 using (model_name)
 
 where fuel_type='electric' or fuel_type='hybrid'
 and number_of_sales = (select max(number_of_sales) from number_of_sales_of_model);
 
--Question 4:
with number_of_repairs_of_model(model_name , number_of_repairs) as 
( select model_name , count(*) as number_of_repairs
from car
 join maintenance_task
 USING (vin)
 GROUP BY model_name )
select model_name,brand,number_of_repairs
 from number_of_repairs_of_model
 JOIN car_brand 
 USING (model_name)
 ORDER by number_of_repairs DESC
 limit 10 ;
 
 --Question 5:
select sum(extra_price) as money_earned_by_company_in_2020
from sale 
where date_of_sale BETWEEN '2020-01-01' AND '2020-12-31' ;

--Question 6:
with money_of_cars_sold(sales_person_idcardnr , price_of_all_cars) as 
( select sales_person_idcardnr, sum(base_price + extra_price) as price_of_all_cars 
from sale
 join car
 USING (vin)
 
 join basic_characteristics
 USING (model_name)
where date_of_sale BETWEEN '2020-01-01' AND '2020-12-31'       
GROUP by sales_person_idcardnr )
select name, sales_person_idcardnr , gross_annual_salary + 0.05*price_of_all_cars as money_made_by_saleperson 
from money_of_cars_sold, salesperson
WHERE money_of_cars_sold.sales_person_idcardnr = salesperson.IDcardNr ; 

--Question 7:
select name, surname
from salesperson , installement_financing
where salesperson.idcardnr = installement_financing.sales_person_idcardnr

EXCEPT

select name , surname
from salesperson , cash
where salesperson.idcardnr = cash.sales_person_idcardnr;


--Question 8:
with cars_purchased_by_companies(vin) as (
select vin
from sale, customer_company
where sale.customer_id = customer_company.commercial_identification_number)
SELECT name, surname,time_spent
from mechanic, repair_participation, cars_purchased_by_companies
where mechanic.idcardnr = repair_participation.mechanic_id_card
and cars_purchased_by_companies.vin = repair_participation.vin 
ORDER BY time_spent ; 

--Question 9:
SELECT dealership_name, type_of_failure, count(*) as number_of_vehicles
from car
JOIN maintenance_task
USING (VIN)
where type_of_failure = 'Alternator'
group by (dealership_name)
ORDER by number_of_vehicles DESC
limit 1;


--Question 10;
with money_earned_by_each_saleperson(sales_person_idcardnr,dealership_name,money_earned_by_saleperson) as
(select sales_person_idcardnr,salesperson.dealership_name, sum(base_price + extra_price) as money_earned_by_saleperson 
from sale ,salesperson

 join car
 USING (vin)
 
 join basic_characteristics
 USING (model_name)
where sale.sales_person_idcardnr = salesperson.idcardnr
GROUP by sales_person_idcardnr )
select name , surname,s.money_earned_by_saleperson,adress,salesperson.dealership_name
from salesperson, money_earned_by_each_saleperson s
where s.sales_person_idcardnr = salesperson.idcardnr
and money_earned_by_saleperson > 

(SELECT avg(money_earned_by_saleperson) 
from money_earned_by_each_saleperson f
WHERE f.dealership_name = s.dealership_name);