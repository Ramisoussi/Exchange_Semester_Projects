insert into dealership
VALUES ('dealership 1', 'Brussels' , 'workshop 1'),
       ('dealership 2', 'Anderlecht' , 'workshop 2'),
       ('dealership 3', 'Genk' , 'workshop 3'),
       ('dealership 4', 'Liége' , 'workshop 4');
       
       
insert into car
VALUES (2568871256784,'red','clio','dealership 1'),
       (5968411266587,'white','c4','dealership 1'),
       (3687452632569,'red','kia rio','dealership 2'),
       (3236985698412,'black','megane','dealership 3'),
       (2568876580235,'blue','peugeot 206','dealership 3'),
       (6352558569840,'white','seat ibiza','dealership 4');
       
insert into model
VALUES ('clio','V Engine','diesel','A','B','C','D'),
       ('c4','Twin Cylinders','gasoline','A','B','C','D'),
       ('kia rio','Twin Cylinders','electric','A','B','C','D'),
       ('megane','Four Cylinders','hybrid','A','B','C','D'),
       ('peugeot 206','V Engine','hybrid','A','B','C','D'),
       ('seat ibiza','Four Cylinders','electric','A','B','C','D');   
       
insert into basic_characteristics
VALUES ('clio','V Engine','diesel',40),
       ('c4','Twin Cylinders','gasoline',74),
       ('kia rio','Twin Cylinders','electric',55),
       ('megane','Four Cylinders','hybrid',39),
       ('peugeot 206','V Engine','hybrid',26),
       ('seat ibiza','Four Cylinders','electric',68);      
       
insert into car_brand
VALUES ('clio','renault'),
       ('c4','citroen'),
       ('kia rio','kia'),
       ('megane','renault'),
       ('peugeot 206','peugeot'),
       ('seat ibiza','seat'); 
       
insert into sale
VALUES (5669655412236,2568871256784,896554474223,42,'2020-04-23'),
       (5695332158412,5968411266587,558744566320,89,'2021-03-22'),
       (5963287412562,3687452632569,786210236021,40,'2020-02-21'),
       (1256984223665,3236985698412,896523654122,56,'2021-01-25'),
       (1256987126325,2568876580235,589365423658,67,'2020-03-28'),
       (1569874236587,6352558569840,236589745213,57,'2021-02-19'); 
       
insert into maintenance_task
VALUES (2568871256784,'2021-03-28','09:30:00','2021-04-15','11:30:00','Brakes'),
       (2568871256784,'2021-04-28','09:30:00','2021-05-16','11:30:00','Alternator'),
       (5968411266587,'2021-04-22','09:10:00','2021-05-02','09:00:00','Alternator'),
       (3687452632569,'2021-01-22','10:30:00','2021-03-27','08:20:00','Clutch'),
       (3687452632569,'2021-04-23','10:30:00','2021-05-02','08:20:00','Alternator');
       
       
insert into salesperson
VALUES (896554474223,'reda','saloui','Paris',420,'2010-04-23',20,'dealership 1'),
       (558744566320,'tylor','vardey','New york',700,'2009-03-22',22,'dealership 1'),
       (786210236021,'sami','chalbi','Marseille',300,'2005-02-21',30,'dealership 1'),
       (896523654122,'alex','durand','Milano',560,'2011-01-25',18,'dealership 3'),
       (589365423658,'mario','gilardini','Liege',640,'2012-03-28',18,'dealership 3'),
       (236589745213,'augustine','fresnel','Bruxelles',560,'2013-02-19',16,'dealership 3');  
       
insert into installement_financing
VALUES (5669655412236,2568871256784,896554474223,'BNP Paribas',5,10),
       (5963287412562,3687452632569,786210236021,'ING',10,15),
       (1256987126325,2568876580235,589365423658,'Societé générale',11,16),
       (1569874236587,6352558569840,236589745213,'BNP Paribas',8,12);  
       
insert into mechanic
VALUES (8965544742255,'rami','sodi','Paris',420,'2010-04-23',35,'dealership 1'),
       (5587445663458,'hichem','vardey','New york',700,'2009-03-22',30,'dealership 1'),
       (4586210236021,'alexandre','parout','Marseille',300,'2005-02-21',50,'dealership 2'),
       (5698523654122,'alex','durand','Milano',560,'2011-01-25',45,'dealership 2'),
       (8963265423658,'mario','gustavo','Liege',640,'2012-03-28',25,'dealership 2'),
       (2365699745213,'augustin','frame','Bruxelles',560,'2013-02-19',21,'dealership 4');
       
insert into repair_participation
VALUES (2568871256784,'2021-03-28','2021-04-15',8965544742255,120),
       (3687452632569,'2021-04-28','2021-05-16',5587445663458,160),
       (5968411266587,'2021-04-22','2021-05-02',4586210236021,200),
       (3236985698412,'2021-01-22','2021-03-27',5698523654122,320),
       (6352558569840,'2021-04-23','2021-05-02',2365699745213,230);       

insert into customer_company
VALUES (5669655412236,'Pfizer','Brussels'),
       (5963287412562,'Adidas','Paris'),
       (1256987126325,'Carrefour','Liége');