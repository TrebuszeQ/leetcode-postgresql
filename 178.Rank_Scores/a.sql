--- https://leetcode.com/problems/rank-scores/description/
SELECT score,
    (dense_ran() OVER
    ORDER BY score DESC) AS rank
FROM Scores
ORDER BY score DESC