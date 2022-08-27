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

Select POS, playerid
CASE WHEN POS = 'OF' THEN 'Outfield'
WHEN POS = 'SS' THEN 'Infield'
WHEN POS = '1B' THEN 'Infield'
WHEN POS = '2B' THEN 'Infield'
WHEN POS = '3B' THEN 'Infield'
WHEN POS = 'P' THEN 'Battery'
WHEN POS = 'C' THEN 'Battery'
ELSE END AS 'Other'
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