--SQL zoo- solutions/ select basics
/*1.The example uses a WHERE clause to show the population of 'France'. Note that strings (pieces of text that are data) should be in 'single quotes'; 
Show the population in Germany*/
SELECT poplation
FROM world 
WHERE name = 'Germany'
/*Checking a list The word IN allows us to check if an item is in a list. The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.
Show the name and the population for 'Sweden', 'Norway' and 'Denmark'*/
SELECT name, population 
FROM world
WHERE name IN ('Sweden', 'Norway' ,'Denmark');
/*Which countries are not too small and not too big? Modify it to show the country and the area for countries with an area between 200,000 and 250,000.*/
SELECT name, area 
FROM world
WHERE area BETWEEN 200000 AND 250000
