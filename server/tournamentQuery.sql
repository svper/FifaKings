SELECT
  u.* , Sum(P) AS P,Sum(W) AS W,Sum(D) AS D,Sum(L) AS L,
  SUM(F) as F,SUM(A) AS A,SUM(GD) AS GD,SUM(Pts) AS Pts
FROM(
  SELECT
    home_id User,
    1 P,
    IF(home_score > away_score,1,0) W,
    IF(home_score = away_score,1,0) D,
    IF(home_score < away_score,1,0) L,
    home_score F,
    away_score A,
    home_score-away_score GD,
    CASE WHEN home_score > away_score THEN 3 WHEN home_score = away_score THEN 1 ELSE 0 END PTS
  FROM `match`
  UNION ALL
  SELECT
    away_id,
    1,
    IF(home_score < away_score,1,0),
    IF(home_score = away_score,1,0),
    IF(home_score > away_score,1,0),
    away_score,
    home_score,
    away_score-home_score GD,
    CASE WHEN home_score < away_score THEN 3 WHEN home_score = away_score THEN 1 ELSE 0 END
  FROM `match`
) as tot
JOIN `user` u ON tot.User=u.id
GROUP BY User
ORDER BY SUM(Pts) DESC ;


//With tournamentSpec

SELECT
  u.* , Sum(P) AS P,Sum(W) AS W,Sum(D) AS D,Sum(L) AS L,
  SUM(F) as F,SUM(A) AS A,SUM(GD) AS GD,SUM(Pts) AS Pts
FROM(
  SELECT
    home_id User,
    1 P,
    IF(home_score > away_score,1,0) W,
    IF(home_score = away_score,1,0) D,
    IF(home_score < away_score,1,0) L,
    home_score F,
    away_score A,
    home_score-away_score GD,
    CASE WHEN home_score > away_score THEN 3 WHEN home_score = away_score THEN 1 ELSE 0 END PTS
  FROM `match`
    WHERE tournament_id = 1
  UNION ALL
  SELECT
    away_id,
    1,
    IF(home_score < away_score,1,0),
    IF(home_score = away_score,1,0),
    IF(home_score > away_score,1,0),
    away_score,
    home_score,
    away_score-home_score GD,
    CASE WHEN home_score < away_score THEN 3 WHEN home_score = away_score THEN 1 ELSE 0 END
  FROM `match`
    WHERE tournament_id = 1
) as tot
JOIN `user` u ON tot.User=u.id
GROUP BY User
ORDER BY SUM(Pts) DESC ;