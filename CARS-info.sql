-- Lab5 - CARS
-- name: Andrew Cheung
-- email: acheun29@calpoly.edu


USE `CARS`;
-- Q1
SELECT makes.Make, cardata.Year, carmakers.Maker
FROM makes, cardata, models, carmakers, makes AS honda, cardata AS hondata
WHERE honda.Id = hondata.Id
    AND honda.Make = 'honda civic' AND hondata.Year = 1982
    AND makes.Id = cardata.Id
    AND makes.Model = models.Model
    AND models.Maker = carmakers.Id
    AND cardata.Year > '1980'
    AND cardata.MPG > hondata.MPG
ORDER BY cardata.MPG DESC;


USE `CARS`;
-- Q2
SELECT AVG(cardata.Horsepower) AS AVG,
    MAX(cardata.Horsepower) AS MAX,
    MIN(cardata.Horsepower) AS MIN
FROM cardata, makes, models, carmakers, countries
WHERE cardata.Id = makes.Id
    AND makes.Model = models.Model
    AND models.Maker = carmakers.Id
    AND carmakers.Country = countries.Id
    AND countries.Name = 'france'
    AND cardata.Cylinders = 4
    AND cardata.Year >= 1971 AND cardata.Year <= 1976;


USE `CARS`;
-- Q3
SELECT COUNT(*)
FROM makes AS volvo_make, cardata AS volvo_data, makes, cardata
WHERE volvo_make.Id = volvo_data.Id
    AND volvo_make.Make = 'volvo 145e (sw)'
    AND volvo_data.Year = 1972
    AND makes.Id = cardata.Id AND makes.Id != volvo_make.Id
    AND cardata.Year = 1971
    AND cardata.Accelerate < volvo_data.Accelerate;


USE `CARS`;
-- Q4
SELECT COUNT(DISTINCT carmakers.Id)
FROM cardata, makes, models, carmakers
WHERE cardata.Id = makes.Id
    AND makes.Model = models.Model
    AND models.Maker = carmakers.Id
    AND cardata.Weight > 5000;
