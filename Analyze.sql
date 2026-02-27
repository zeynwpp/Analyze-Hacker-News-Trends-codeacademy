--Understanding the dataset
SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;

--Hacker News Moderating
select sum(score)
from hacker_news;

select user, sum(score)
from hacker_news
group by user
having sum(score)>200
order by 2 desc;

SELECT (517 + 309 + 304 + 282) / 6366.0;

SELECT user,
   COUNT(*)
FROM hacker_news
WHERE url LIKE '%watch?v=dQw4w9WgXcQ%'
GROUP BY 1
ORDER BY 2 DESC;

-- Which sites feed Hacker News?

SELECT CASE
   WHEN url LIKE '%github.com%' THEN 'GitHub'
   WHEN url LIKE '%medium.com%' THEN 'Medium'
   WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
   ELSE 'Other'
  END AS 'Source',
  COUNT(*) as Count
FROM hacker_news
GROUP BY 1;

SELECT timestamp
FROM hacker_news
LIMIT 10;

SELECT timestamp,
   strftime('%H', timestamp) as Time
FROM hacker_news
GROUP BY 1
LIMIT 20;

-- What's the best time to post a story?

SELECT strftime('%H', timestamp) AS 'Hour', 
   ROUND(AVG(score), 1) AS 'Average Score', 
   COUNT(*) AS 'Number of Stories'
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;


