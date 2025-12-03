-- https://leetcode.com/problems/game-play-analysis-iv/
WITH CTE AS (
    SELECT player_id,
        event_date
    FROM (
        SELECT *,
            ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date ASC, player_id ASC) AS row_number
        FROM Activity
    ) AS ranked_entries
    WHERE row_number = 1
        OR row_number = 2
)

SELECT ROUND(
    (
        (
            SELECT COUNT(DISTINCT a.player_id)
            FROM CTE a
            JOIN CTE b
                ON a.player_id = b.player_id
            WHERE b.event_date = a.event_date + 1
        )::numeric /
        (
            SELECT COUNT(DISTINCT player_id)
            FROM CTE
        )::numeric
    ),
    2
) AS "fraction";