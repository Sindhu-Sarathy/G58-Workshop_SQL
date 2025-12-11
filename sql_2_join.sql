# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
#
SELECT * FROM city WHERE Name LIKE 'ping%' ORDER BY  Population ASC;
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
#
SELECT * FROM city WHERE Name LIKE 'ran%' ORDER BY  Population DESC;
#
# 3: Count all cities
#
SELECT COUNT(*) FROM city;
#
# 4: Get the average population of all cities
#
SELECT AVG(Population) as Population FROM city;
#
# 5: Get the biggest population found in any of the cities
#
SELECT MAX(Population) as Population FROM city;
#
# 6: Get the smallest population found in any of the cities
#
SELECT MIN(Population) as Population FROM city;
#
# 7: Sum the population of all cities with a population below 10000
#
SELECT SUM(Population) FROM city WHERE Population < 10000;
#
# 8: Count the cities with the countrycodes MOZ and VNM
#
SELECT COUNT(*) FROM city WHERE CountryCode IN ('MOZ' , 'VNM');
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
#
SELECT COUNT(*) FROM city WHERE CountryCode IN ('MOZ' , 'VNM') GROUP BY CountryCode;
#
# 10: Get average population of cities in MOZ and VNM
#
SELECT AVG(Population) as Population FROM city WHERE CountryCode IN ('MOZ' , 'VNM');
#
# 11: Get the countrycodes with more than 200 cities
#
SELECT CountryCode FROM city GROUP BY CountryCode HAVING COUNT(*) > 200;
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
#
SELECT CountryCode, COUNT(*) FROM city GROUP BY CountryCode HAVING COUNT(*) > 200  ORDER BY COUNT(*) ASC;
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
#
SELECT Language FROM city JOIN countrylanguage ON city.CountryCode=countrylanguage.CountryCode WHERE city.Population BETWEEN 400 AND 500;
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
#
SELECT Name, Language FROM city NATURAL JOIN countrylanguage WHERE Population BETWEEN 500 AND 600;
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
#
SELECT DISTINCT city.Name FROM city INNER JOIN country ON city.countryCode = (SELECT countryCode FROM city WHERE Population = 122199);
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
#
SELECT c2.Name AS Name FROM city c1 JOIN city c2 ON c1.CountryCode = c2.CountryCode WHERE c1.Population = 122199  AND c2.Population <> 122199;
#
# 17: What are the city names in the country where Luanda is capital?
#
SELECT City.Name FROM City INNER JOIN Country ON City.CountryCode = Country.Code WHERE Capital = (SELECT Id FROM City WHERE Name = 'Luanda');
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
#
SELECT c1.Name AS Name FROM country co JOIN city c1 ON co.Capital = c1.ID WHERE co.Region = (SELECT co2.Region FROM city c
   INNER JOIN country co2 ON c.CountryCode = co2.Code
    WHERE c.Name = 'Yaren'
);
#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
#
SELECT Language AS Languages FROM countrylanguage lang JOIN city c1 ON lang.CountryCode = c1.CountryCode WHERE c1.Name = 'Riga';
#
# 20: Get the name of the most populous city
#
SELECT Name FROM city where Population=(SELECT MAX(Population) FROM city);