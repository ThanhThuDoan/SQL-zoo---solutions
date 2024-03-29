--------------------------SELECT NAMES----------------------------
/*Find the country that start with Y*/
SELECT name FROM world
  WHERE name LIKE 'Y%'
/*Find the countries that end with y*/
SELECT name FROM world
  WHERE name LIKE '%Y'
/*Luxembourg has an x - so does one other country. List them both.
Find the countries that contain the letter x*/
SELECT name FROM world
  WHERE name LIKE '%X%'

/*Iceland, Switzerland end with land - but are there others?
Find the countries that end with land*/
SELECT name FROM world
  WHERE name LIKE '%land'
/*Columbia starts with a C and ends with ia - there are two more like this.
Find the countries that start with C and end with ia*/
SELECT name FROM world
  WHERE name LIKE 'C%' and 
 name LIKE '%ia'
/*Find the country that has oo in the name*/
SELECT name FROM world
  WHERE name LIKE '%oo%'
/*Bahamas has three a - who else? Find the countries that have three or more a in the name*/
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'
/*Find the countries that have "t" as the second character.*/
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name
/*Find the countries that have two "o" characters separated by two others*/
SELECT name FROM world
 WHERE name LIKE '%o__o%'
/*Find the countries that have exactly four characters.*/
SELECT name FROM world
 WHERE len(name) = 4
/*Find the country where the name is the capital city.*/
SELECT name
  FROM world
 WHERE name = capital
/*Find the country where the capital is the country plus "City".*/
SELECT name
  FROM world
 WHERE capital = concat(name, ' City')
/*Find the capital and the name where the capital includes the name of the country.*/
SELECT capital,name 
FROM world 
WHERE capital LIKE concat('%', name, '%');
/*Find the capital and the name where the capital is an extension of name of the country.*/
SELECT capital,name 
FROM world 
WHERE capital LIKE concat('%', name, '%') AND capital > name;
/*Show the name and the extension where the capital is an extension of name of the country.*/
SELECT name, REPLACE(capital, name, '') AS ext
FROM world
WHERE capital LIKE CONCAT('%', name, '%')
AND LEN(capital) > LEN(name)
