-- Lab 5 - INN
-- name: Andrew Cheung
-- email: acheun29@calpoly.edu


USE `INN`;
-- Q1
SELECT DISTINCT rooms.RoomCode, rooms.RoomName
FROM reservations AS r1, reservations AS r2, reservations AS r3, rooms
WHERE r1.Room = rooms.RoomCode
    AND r2.Room = rooms.RoomCode
    AND r3.Room = rooms.RoomCode
    AND r1.CheckIn <= '2010-02-16' AND r1.CheckOut >= '2010-02-16'
    AND r2.CheckIn <= '2010-07-12' AND r2.CheckOut >= '2010-07-12'
    AND r3.CheckIn <= '2010-10-20' AND r3.CheckOut >= '2010-10-20'
ORDER BY rooms.RoomName;


USE `INN`;
-- Q2
SELECT COUNT(*)
FROM reservations, rooms
WHERE reservations.Room = rooms.RoomCode
    AND rooms.decor = 'modern'
    AND DATEDIFF(CheckOut, CheckIn) = 7;


USE `INN`;
-- Q3
SELECT COUNT(*)
FROM reservations, rooms
WHERE reservations.Room = rooms.RoomCode
    AND MONTH(CheckIn) = 8
    AND MONTH(CheckOut) = 8
    AND Adults = 2
    AND Kids = 2;


USE `INN`;
-- Q4
SELECT AVG(DATEDIFF(CheckOut, CheckIn))
FROM rooms, reservations
WHERE reservations.Room = rooms.RoomCode
    AND rooms.RoomName = 'Interim but salutary'
    AND CheckIn >= '2010-05-01'
    AND CheckOut < '2010-08-31';


USE `INN`;
-- Q5
SELECT COUNT(DISTINCT DATEDIFF(CheckOut, CheckIn)) AS NumDurations
FROM reservations, rooms
WHERE reservations.Room = rooms.RoomCode
    AND MONTH(CheckIn) = 7 AND YEAR(CheckIn) = 2010
    AND MONTH(CheckOut) = 7 AND YEAR(CheckOut) = 2010
    AND rooms.RoomName = 'Interim but salutary';
