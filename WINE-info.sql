-- Lab 5 - WINE
-- name: Andrew Cheung
-- email: acheun29@calpoly.edu


USE `WINE`;
-- Q1
SELECT w.Grape, w.Winery, w.Name, w.Score, 12 * w.Price * w.Cases AS Revenue
FROM wine AS w, wine AS series, appellations AS a
WHERE series.Name = 'Appelation Series' AND series.Vintage = 2006
    AND w.Appellation = a.Appellation
    AND a.County = 'Napa'
    AND w.Vintage = 2006
    AND 12 * w.Price * w.Cases > 12 * series.Price * series.Cases
ORDER BY 12 * w.Price * w.Cases DESC;


USE `WINE`;
-- Q2
SELECT AVG(Score) AS AvgScore
FROM wine
WHERE Appellation = 'Sonoma Valley'
    AND Grape = 'Zinfandel';


USE `WINE`;
-- Q3
SELECT SUM(12 * Price * Cases)
FROM wine
WHERE Vintage = 2009
    AND Grape = 'Sauvignon Blanc'
    AND Score >= 89;


USE `WINE`;
-- Q4
SELECT AVG(Cases) AS AvgCases
FROM wine AS w, appellations AS a
WHERE w.Appellation = a.Appellation
    AND w.Grape = 'Zinfandel'
    AND a.Area = 'Central Coast';


USE `WINE`;
-- Q5
SELECT COUNT(w.WineId) AS Wines
FROM wine AS w, wine AS rrv, appellations AS a_rrv, grapes AS g
WHERE rrv.Appellation = a_rrv.Appellation
    AND a_rrv.Appellation = 'Russian River Valley'
    AND rrv.Score = 98
    AND w.Grape = g.Grape
    AND w.Appellation = a_rrv.Appellation
    AND g.Color = 'Red'
    AND w.Vintage = rrv.Vintage;
