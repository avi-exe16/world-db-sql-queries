-- Q1. Display all countries
SELECT * FROM Country;

-- Q2. Display all cities
SELECT * FROM City;

-- Q3. Display all languages
SELECT * FROM CountryLanguage;

-- Q4. Find the total number of countries
SELECT COUNT(*) AS TotalCountries FROM Country;

-- Q5. Find the total number of cities
SELECT COUNT(*) AS TotalCities FROM City;

-- Q6. Find the total population of the world
SELECT SUM(Population) AS WorldPopulation FROM Country;

-- Q7. Find the average population of countries
SELECT AVG(Population) AS AveragePopulation FROM Country;

-- Q8. Find the maximum and minimum population among countries
SELECT MAX(Population) AS MaxPopulation, MIN(Population) AS MinPopulation FROM Country;

-- Q9. Find the total population of Asia
SELECT SUM(Population) AS AsiaPopulation FROM Country WHERE Continent = 'Asia';

-- Q10. Find the average population of Europe
SELECT AVG(Population) AS EuropeAveragePopulation FROM Country WHERE Continent = 'Europe';

-- Q11. Find countries with population greater than 100 million
SELECT Name, Population FROM Country WHERE Population > 100000000;

-- Q12. Find countries with population less than 1 million
SELECT Name, Population FROM Country WHERE Population < 1000000;

-- Q13. Find countries with life expectancy greater than 75
SELECT Name, LifeExpectancy FROM Country WHERE LifeExpectancy > 75;

-- Q14. Find countries with life expectancy less than 50
SELECT Name, LifeExpectancy FROM Country WHERE LifeExpectancy < 50;

-- Q15. Find countries with GDP greater than 1000
SELECT Name, GNP FROM Country WHERE GNP > 1000;

-- Q16. Total population of countries in each region
SELECT Region, SUM(Population) AS TotalPopulation FROM Country GROUP BY Region;

-- Q17. Average population of countries in each continent
SELECT Continent, AVG(Population) AS AveragePopulation FROM Country GROUP BY Continent;

-- Q18. Continents where total population > 500 million
SELECT Continent, SUM(Population) AS TotalPopulation FROM Country GROUP BY Continent HAVING SUM(Population) > 500000000;

-- Q19. Number of countries in each continent (>10 countries)
SELECT Continent, COUNT(*) AS NumberOfCountries FROM Country GROUP BY Continent HAVING COUNT(*) > 10;

-- Q20. Average life expectancy per continent (>65 years)
SELECT Continent, AVG(LifeExpectancy) AS AvgLifeExpectancy FROM Country GROUP BY Continent HAVING AVG(LifeExpectancy) > 65;

-- Q21. Country name + city names
SELECT c.Name AS Country, ci.Name AS City FROM Country c JOIN City ci ON c.Code = ci.CountryCode ORDER BY c.Name, ci.Name;

-- Q22. Country name, city name, city population
SELECT c.Name AS Country, ci.Name AS City, ci.Population FROM Country c JOIN City ci ON c.Code = ci.CountryCode ORDER BY c.Name, ci.Population DESC;

-- Q23. Most populated city in each country
SELECT c.Name AS Country, ci.Name AS City, ci.Population FROM Country c JOIN City ci ON c.Code = ci.CountryCode WHERE ci.Population = (SELECT MAX(Population) FROM City WHERE CountryCode = c.Code);

-- Q24. Country name + official language
SELECT c.Name AS Country, cl.Language FROM Country c JOIN CountryLanguage cl ON c.Code = cl.CountryCode WHERE cl.IsOfficial = 'T' ORDER BY c.Name;

-- Q25. Countries + languages + percentage
SELECT c.Name AS Country, cl.Language, cl.Percentage FROM Country c JOIN CountryLanguage cl ON c.Code = cl.CountryCode ORDER BY c.Name, cl.Percentage DESC;

-- Q26. Cities in Asian countries
SELECT ci.Name AS City, c.Name AS Country FROM City ci JOIN Country c ON ci.CountryCode = c.Code WHERE c.Continent = 'Asia' ORDER BY c.Name, ci.Name;

-- Q27. Country name, capital city, population
SELECT c.Name AS Country, ci.Name AS Capital, c.Population FROM Country c JOIN City ci ON c.Capital = ci.ID ORDER BY c.Name;

-- Q28. Total city population vs country population
SELECT c.Name AS Country, SUM(ci.Population) AS TotalCityPopulation, c.Population AS CountryPopulation FROM Country c JOIN City ci ON c.Code = ci.CountryCode GROUP BY c.Name, c.Population ORDER BY c.Name;

-- Q29. Countries with population > average
SELECT Name, Population FROM Country WHERE Population > (SELECT AVG(Population) FROM Country);

-- Q30. Country with highest population
SELECT Name, Population FROM Country ORDER BY Population DESC LIMIT 1;

-- Q31. Country with highest life expectancy
SELECT Name, LifeExpectancy FROM Country ORDER BY LifeExpectancy DESC LIMIT 1;

-- Q32. Cities with population > average city population
SELECT Name, Population FROM City WHERE Population > (SELECT AVG(Population) FROM City);

-- Q33. Countries with population > India
SELECT Name, Population FROM Country WHERE Population > (SELECT Population FROM Country WHERE Name = 'India');

-- Q34. Countries with max population in their continent
SELECT Name, Continent, Population FROM Country c WHERE Population = (SELECT MAX(Population) FROM Country WHERE Continent = c.Continent);

-- Q35. Top 5 most populated cities
SELECT Name, Population FROM City ORDER BY Population DESC LIMIT 5;

-- Q36. Top 3 most populated countries in each continent
SELECT Continent, Name, Population FROM (SELECT Continent, Name, Population, RANK() OVER (PARTITION BY Continent ORDER BY Population DESC) AS rnk FROM Country) ranked WHERE rnk <= 3;

-- Q37. Country with highest number of cities
SELECT c.Name AS Country, COUNT(ci.ID) AS NumberOfCities FROM Country c JOIN City ci ON c.Code = ci.CountryCode GROUP BY c.Name ORDER BY NumberOfCities DESC LIMIT 1;

-- Q38. Continent with highest total population
SELECT Continent, SUM(Population) AS TotalPopulation FROM Country GROUP BY Continent ORDER BY TotalPopulation DESC LIMIT 1;

-- Q39. Countries where capital city population > 1 million
SELECT c.Name AS Country, ci.Name AS Capital, ci.Population FROM Country c JOIN City ci ON c.Capital = ci.ID WHERE ci.Population > 1000000;

-- Q40. Most commonly spoken language
SELECT Language, SUM(Percentage) AS TotalPercentage FROM CountryLanguage GROUP BY Language ORDER BY TotalPercentage DESC LIMIT 1;

-- Q41. Countries with >10 languages
SELECT c.Name AS Country, COUNT(cl.Language) AS NumLanguages FROM Country c JOIN CountryLanguage cl ON c.Code = cl.CountryCode GROUP BY c.Name HAVING COUNT(cl.Language) > 10;

-- Q42. Top 5 countries with highest life expectancy
SELECT Name, LifeExpectancy FROM Country ORDER BY LifeExpectancy DESC LIMIT 5;

-- Q43. Top 10 cities with highest population + country + continent
SELECT ci.Name AS City, ci.Population, c.Name AS Country, c.Continent FROM City ci JOIN Country c ON ci.CountryCode = c.Code ORDER BY ci.Population DESC LIMIT 10;

-- Q44. Countries with population > average of their continent
SELECT Name, Continent, Population FROM Country c WHERE Population > (SELECT AVG(Population) FROM Country WHERE Continent = c.Continent);

-- Q45. Continent-wise country with highest population
SELECT Continent, Name, Population FROM Country c WHERE Population = (SELECT MAX(Population) FROM Country WHERE Continent = c.Continent);

-- Q46. Second-most populated country
SELECT Name, Population FROM Country ORDER BY Population DESC LIMIT 1 OFFSET 1;

-- Q47. Third-highest populated city
SELECT Name, Population FROM City ORDER BY Population DESC LIMIT 1 OFFSET 2;

-- Q48. Country with maximum number of cities
SELECT c.Name AS Country, COUNT(ci.ID) AS NumberOfCities FROM Country c JOIN City ci ON c.Code = ci.CountryCode GROUP BY c.Name ORDER BY NumberOfCities DESC LIMIT 1;

-- Q49. Language spoken in largest number of countries
SELECT Language, COUNT(DISTINCT CountryCode) AS NumCountries FROM CountryLanguage GROUP BY Language ORDER BY NumCountries DESC LIMIT 1;

-- Q50. Continent with highest average country population
SELECT Continent, AVG(Population) AS AvgPopulation, COUNT(*) AS NumCountries FROM Country GROUP BY Continent ORDER BY AvgPopulation DESC LIMIT 1;
