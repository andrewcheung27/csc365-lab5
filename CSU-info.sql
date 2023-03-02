-- Lab 5 - CSU
-- name: Andrew Cheung
-- email: acheun29@calpoly.edu

USE `CSU`;
-- Q1
SELECT AVG(degrees.degrees)
FROM campuses, degrees
WHERE degrees.CampusId = campuses.Id
    AND Campus = 'California Polytechnic State University-San Luis Obispo'
    AND degrees.Year >= 1995 AND degrees.Year <= 2000;


USE `CSU`;
-- Q2
SELECT MIN(fee) AS Min, AVG(fee) AS Avg, MAX(fee) AS Max
FROM fees
WHERE Year = 2002;


USE `CSU`;
-- Q3
SELECT AVG(s.FTE / f.FTE)
FROM enrollments AS s, faculty AS f
WHERE s.CampusId = f.CampusId
    AND s.Year = 2004 AND f.Year = 2004
    AND s.FTE > 15000;


USE `CSU`;
-- Q4
(SELECT e.Year AS Year
FROM enrollments AS e, campuses AS c
WHERE e.CampusId = c.Id
    AND c.Campus = 'California Polytechnic State University-San Luis Obispo'
    AND e.Enrolled > 17000)
UNION
(SELECT d.year AS Year
FROM degrees AS d, campuses AS c
WHERE d.CampusId = c.Id
    AND c.Campus = 'California Polytechnic State University-San Luis Obispo'
    AND d.degrees > 3500)
ORDER BY Year;
