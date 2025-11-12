---https://leetcode.com/problems/game-play-analysis-i/description/
SELECT player_id, 
    MIN(EVENT_DATE) AS "first_login"
FROM Activity
GROUP BY player_id;