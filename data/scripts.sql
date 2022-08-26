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
