select DISTINCT year
from homegames
ORDER BY year DESC;

select namefirst, namelast, height
from people
WHERE height = (SELECT MIN(height) from people);

select a.g_all, a.teamID, p.namefirst, p.namelast
from appearances AS a
INNER JOIN people AS p
ON a.playerid = p.playerid
WHERE p.namefirst = 'Eddie' AND p.namelast = 'Gaedel';

Select s.schoolname, c.playerid, p.namefirst, p.namelast, SUM(m.salary)
from schools AS s
FULL JOIN collegeplaying AS c
ON s.schoolid = c.schoolid
FULL JOIN people AS p
ON c.playerid = p.playerid
FULL JOIN salaries AS m
ON p.playerid = m.playerid
WHERE schoolname = 'Vanderbilt University'
GROUP BY s.schoolname, c.playerid, p.namefirst, p.namelast
ORDER BY SUM(m.salary) DESC;

Select POS, playerid,
CASE WHEN POS = 'OF' THEN 'Outfield'
WHEN POS = 'SS' THEN 'Infield'
WHEN POS = '1B' THEN 'Infield'
WHEN POS = '2B' THEN 'Infield'
WHEN POS = '3B' THEN 'Infield'
WHEN POS = 'P' THEN 'Battery'
WHEN POS = 'C' THEN 'Battery'
ELSE 'Other' END AS position
FROM fielding;

SELECT SUM(po) AS pos_putouts, 
CASE WHEN pos = 'OF' THEN 'Outfield'
WHEN pos IN ('SS', '1B', '2B', '3B') THEN 'Infield'
WHEN pos IN ('P', 'C') THEN 'Battery'
ELSE 'Other'
END AS position
FROM fielding
WHERE yearid = '2016'
GROUP BY position;


SELECT ROUND(CAST(SUM(so) AS NUMERIC)/SUM(g/2),2) AS avg_strikeouts,
CASE WHEN yearid BETWEEN '1920' and '1929' THEN '1920s'
    WHEN yearid BETWEEN '1930' and '1939' THEN '1930s'
    WHEN yearid BETWEEN '1940' and '1949' THEN '1940s'
    WHEN yearid BETWEEN '1950' and '1959' THEN '1950s'
    WHEN yearid BETWEEN '1960' and '1969' THEN '1960s'
    WHEN yearid BETWEEN '1970' and '1979' THEN '1970s'
    WHEN yearid BETWEEN '1980' and '1989' THEN '1980s'
    WHEN yearid BETWEEN '1990' and '1999' THEN '1990s'
    WHEN yearid BETWEEN '2000' and '2009' THEN '2000s'
    WHEN yearid BETWEEN '2010' and '2019' THEN '2010s'
    ELSE 'outside scope' END AS Decades
FROM teams
GROUP BY Decades
ORDER BY Decades DESC;