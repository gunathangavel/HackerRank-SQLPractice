-- Aggregation Querries
--Query a count of the number of cities in CITY having a Population larger than .
select count(*) from city where population >100000;

--Query the average population of all cities in CITY where District is California.
select avg(population) from city where district ='California';

-- Query the difference between the maximum and minimum populations in CITY.
select max(population) - min(population) from city;

--Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
select sum(population) from city where countrycode='JPN';

-- Query the total population of all cities in CITY where District is California.
select sum(population) from city where district='California' group by district;

/* Write a query to find the maximum total earnings for all employees as well as the total number of employees
who have maximum total earnings. Then print these values as  space-separated integers*/

select  max(months* salary) ,count(*) from employee 
where (months* salary) = (select max(months* salary) from employee);

/*Query the following two values from the STATION table:
The sum of all values in LAT_N rounded to a scale of  decimal places.
The sum of all values in LONG_W rounded to a scale of  decimal places.*/
select cast(sum(lat_n) as decimal(7,2)) as lat,
 cast(sum(long_w) as decimal(7,2)) as lon from station ;

/*Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than .
Truncate your answer to  decimal places*/
select  cast(max(lat_n)as decimal (10,4)) 
from station where lat_n < 137.2345;

/* Query the sum of Northern Latitudes (LAT_N) from 
STATION having values greater than  and less than . Truncate your answer to  decimal places.*/
select  cast(sum(lat_n)as decimal (10,4)) 
from station where lat_n > 38.7880 and lat_n < 137.2345;

/* Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N)
in STATION that is less than . Round your answer to  decimal places. */
select  cast(long_w as decimal (10,4)) 
from station where lat_n  = 
( select max(lat_n) from station where lat_n < 137.2345);

/* Query the smallest Northern Latitude (LAT_N) 
from STATION that is greater than . Round your answer to  decimal places. */
select cast(min(lat_n) as decimal(10,4)) from station where lat_n > 38.7780;

/* Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) 
in STATION is greater than . Round your answer to  decimal places. */

select cast(long_w as decimal(10,4)) from station
where lat_n = (select min(lat_n) from station where lat_n > 38.7780);

