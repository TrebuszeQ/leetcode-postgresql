--https://leetcode.com/problems/game-play-analysis-iv/
    

SELECT ROUND(
    (
        (
            SELECT COUNT(DISTINCT a.player_id)
            FROM Activity a
            JOIN Activity b
                ON a.player_id = b.player_id
            WHERE a.event_date = b.event_date + 1
        )::numeric /
        (
            SELECT COUNT(DISTINCT player_id) 
            FROM Activity
        )::numeric
    ),
    2
) AS "fraction";
