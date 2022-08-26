select DISTINCT year
from homegames
ORDER BY year DESC;

select namefirst, namelast, height
from people
WHERE height = (SELECT MIN(height) from people);
