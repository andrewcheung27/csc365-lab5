-- Lab 5- KATZENJAMMER
-- name: Andrew Cheung
-- email: acheun29@calpoly.edu


USE `KATZENJAMMER`;
-- TODO: Q1
 SELECT b.Firstname, ??????
SELECT *
FROM Instruments AS i, Band AS b
WHERE i.Bandmate = b.Id
    AND i.Instrument = 'bass balalaika';


USE `KATZENJAMMER`;
-- Q2
SELECT COUNT(DISTINCT p.Song)
FROM Performance AS p, Vocals AS v,
    Band AS solveig, Band AS turid
WHERE solveig.Firstname = 'Solveig' AND turid.Firstname = 'Turid'
    AND solveig.Id = p.Bandmate
    AND turid.Id = v.Bandmate
    AND p.Song = v.Song
    AND p.StagePosition = 'center'
    AND v.VocalType = 'lead';


USE `KATZENJAMMER`;
-- Q3
SElECT COUNT(*)
FROM Instruments AS i, Vocals AS v, Performance AS p, Band AS b
WHERE i.Bandmate = b.Id AND v.Bandmate = b.Id AND p.Bandmate = b.Id
    AND i.Song = v.Song AND i.Song = p.Song AND v.Song = p.Song
    AND b.Firstname = 'Anne-Marit'
    AND i.Instrument = 'banjo'
    AND v.VocalType = 'lead'
    AND p.StagePosition = 'center';


USE `KATZENJAMMER`;
-- Q4
SELECT COUNT(DISTINCT i.Instrument)
FROM Instruments AS i, Band AS b
WHERE i.Bandmate = b.Id
    AND b.Firstname = 'Turid';


USE `KATZENJAMMER`;
-- Q5
SELECT DISTINCT sol_i.Instrument
FROM Instruments AS sol_i, Band AS sol_b,
    Instruments AS tur_i, Band AS tur_b
WHERE sol_i.Bandmate = sol_b.Id AND tur_i.Bandmate = tur_b.Id
    AND sol_b.Firstname = 'Solveig'
    AND tur_b.Firstname = 'Turid'
    AND sol_i.Instrument = tur_i.Instrument
ORDER BY sol_i.Instrument;


USE `KATZENJAMMER`;
-- Q6
SELECT COUNT(DISTINCT i.Song) - COUNT(DISTINCT guitar.Song) AS WithoutGuitar
FROM Instruments AS i, Instruments AS guitar
WHERE guitar.Instrument = 'guitar';


USE `KATZENJAMMER`;
-- Q7
SELECT COUNT(DISTINCT i1.Song)
FROM Instruments AS i1, Instruments AS i2,
    Songs AS s
WHERE i1.Song = s.SongId AND i2.Song = s.SongId
    AND i1.Instrument = i2.Instrument
    AND i1.Bandmate != i2.Bandmate;
