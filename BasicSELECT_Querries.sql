-- Hacker Rank Basic SELECT Querries in SQL Server

-- Challenge: Query all columns (attributes) for every row in the CITY table.
select * from city;

--Challenge: Query all columns for a city in CITY with the ID 1661.
select * from city where id = 1661;

-- Challenge: Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
SELECT name from city where countrycode='JPN';

--Challenge: Query a list of CITY and STATE from the STATION table
select city, state from station;

-- Challenge: Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
SELECT id,name,countrycode,district,population from city where countrycode='JPN';

-- Challenge: Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
SELECT name from employee order by name asc;

/* Challenge: Write a query that prints a list of employee names (i.e.: the name attribute) for employees
in Employee having a salary greater than  per month who have been employees for less than  months. 
Sort your result by ascending employee_id. */
select name from employee where salary > 2000 and months <10 order by employee_id;

/* Challenge:
Query the NAME field for all American cities in the CITY table with populations larger than 120000. 
The CountryCode for America is USA. */
select name from city where population > 120000 and countrycode='USA';


/* Challenge: Query the Name of any student in STUDENTS who scored higher than  Marks.
Order your output by the last three characters of each name.
If two or more students both have names ending in the same last three characters 
(i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.*/
select name from students where marks >75 order by right(name,3) ASC, id ASC;

/* Challenge: Find the difference between the total number of CITY entries in the table and
the number of distinct CITY entries in the table.*/
select count(*) - count(distinct city) from station;


/* Challenge: Query all columns for all American cities in the CITY table with populations larger than 100000. 
The CountryCode for America is USA. */
SELECT* from city where population > 100000 and countrycode='USA';

/* Challenge: Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. 
Your result cannot contain duplicates. */
select distinct city from station where city like '[aeiou]%';

/* Challenge:Query a list of CITY names from STATION for cities that have an even ID number. 
Print the results in any order, but exclude duplicates from the answer. */
select distinct city from station  where ID % 2  = 0;

/* Challenge: Query the list of CITY names from STATION that do not start with vowels. 
Your result cannot contain duplicates.*/
select distinct city from station where city not like '[aeiou]%' ;

/* Challenge: Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) 
as both their first and last characters. Your result cannot contain duplicates.*/
select distinct city from station where city like '[aeiou]%' and city like '%[aeiou]';

/* Challenge: Query the two cities in STATION with the shortest and longest CITY names, as well as
their respective lengths (i.e.: number of characters in the name). If there is more than one smallest 
or largest city, choose the one that comes first when ordered alphabetically.*/

select top 1 city as cityname, len(city)as citylen from station order by len(city) asc, city asc;

select top 1 city as cityname, len(city) as citylen from station order by len(city) desc, city asc;


/* Challenge: Query the list of CITY names from STATION that either do not start with vowels or 
do not end with vowels. Your result cannot contain duplicates.*/
select distinct city from station where city not like '%[aeiou]' or city not like '[aeiou]%';


/* Challenge: Query the list of CITY names from STATION that do not start with vowels and do not end with vowels.
Your result cannot contain duplicates.*/
select distinct city from station where city not like '[aeiou]%' and city not like '%[aeiou]';