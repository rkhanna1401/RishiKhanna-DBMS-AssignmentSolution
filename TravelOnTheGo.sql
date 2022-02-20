use TravelOnTheGo;

CREATE TABLE PASSENGER (
Passenger_name varchar(20),
Category varchar(10),
Gender varchar(8),
Boarding_City varchar(15),
Destination_City varchar(15),
Distance int,
Bus_Type varchar(10));

CREATE TABLE PRICE (
Bus_Type varchar(10),
Distance int,
Price int );

INSERT INTO PASSENGER values ('Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper'),
('Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting'),
('Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper'),
('Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper'),
('Udit','Non-AC','M','Trivandrum','Panaji',1000,'Sleeper'),
('Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting'),
('Hemant','Non-AC','M','Panaji','Mumbai',700,'Sleeper'),
('Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting'),
('Piyush','AC','M','Pune','Nagpur',700,'Sitting');

select * from PASSENGER;

INSERT INTO PRICE values ('Sleeper',350,770),
('Sleeper',350,770),
('Sleeper',500,1100),
('Sleeper',600,1320),
('Sleeper',700,1540),
('Sleeper',1000,2200),
('Sleeper',1200,2640),
('Sleeper',1500,2700),
('Sitting',500,620),
('Sitting',600,744),
('Sitting',700,868),
('Sitting',1000,1240),
('Sitting',1200,1488),
('Sitting',1500,1860);

select * from PRICE;

/* 3- How many females and how many male passengers travelled for a minimum distance of 600 KM s?  */
Select count(Gender), Gender from PASSENGER where Distance > 600 GROUP BY Gender;

/* 4 - Find the minimum ticket price for Sleeper Bus.*/
Select min(Price) from PRICE where Bus_Type = 'Sleeper';

/* 5- Select passenger names whose names start with character 'S' */
Select Passenger_name from PASSENGER where Passenger_name like 'S%';

/* 6 - Calculate price charged for each passenger displaying Passenger name, Boarding City,
Destination City, Bus_Type, Price in the output*/
Select Passenger_name,Boarding_City,Destination_City,Bus_Type, P2.Price from PASSENGER as P1
INNER JOIN PRICE as P2 On P1.Bus_Type = P2.Bus_Type;

/* 7 - What are the passenger name/s and his/her ticket price who travelled in the Sitting bus
for a distance of 1000 KM s*/
Select DISTINCT(Passenger_name) ,P2.Bus_Type from PASSENGER as P1
INNER JOIN PRICE as P2  On P1.Bus_Type = P2.Bus_Type where P2.Bus_Type='Sitting' and P2.Distance >1000;

/* 8 - What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to
Panaji? */
Select Price,Distance,Bus_Type from PRICE where distance = 
 (Select Distance from PASSENGER where Passenger_name='Pallavi');

/*9 - List the distances from the "Passenger" table which are unique (non-repeated
distances) in descending order. */
Select DISTINCT(Distance) from PASSENGER Order By Distance DESC;

/* 10 - Display the passenger name and percentage of distance travelled by that passenger
from the total distance travelled by all passengers without using user variables*/
select Distance,
       count(*) * 100.0/ sum(count(*)) over () as Distance_Percent
from PASSENGER
group by Distance;