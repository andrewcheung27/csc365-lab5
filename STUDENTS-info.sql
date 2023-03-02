-- Lab 5 - STUDENTS
-- name: Andrew Cheung
-- email: acheun29@calpoly.edu


USE `STUDENTS`;
-- Q1
SELECT s1.FirstName, s1.LastName, s1.grade,
    s2.FirstName, s2.LastName, s2.grade
FROM list AS s1, list AS s2
WHERE s1.FirstName = s2.FirstName
    AND s1.LastName < s2.LastName;


USE `STUDENTS`;
-- Q2
SELECT s.FirstName, s.LastName
FROM list AS s, teachers AS t
WHERE s.classroom = t.classroom
    AND s.grade = 4
    AND t.First != 'GORDON' AND t.Last != 'KAWA'
ORDER BY s.LastName;


USE `STUDENTS`;
-- Q3
SELECT COUNT(*)
FROM list
WHERE grade = 1 OR grade = 2;


USE `STUDENTS`;
-- Q4
SELECT COUNT(s.FirstName) AS Classmates
FROM list AS elton, list AS s
WHERE elton.FirstName = 'ELTON' AND elton.LastName = 'FULVIO'
    AND s.classroom = elton.classroom
    AND NOT (s.FirstName = 'ELTON' AND s.LastName = 'FULVIO');
