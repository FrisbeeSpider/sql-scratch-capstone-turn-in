 SELECT DISTINCT q.user_id, h.user_id IS NOT NULL AS 'is_home_try_on',
 		h.number_of_pairs, p.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz q 
 LEFT JOIN home_try_on h
 		ON q.user_id = h.user_id
 LEFT JOIN purchase p
 		ON p.user_id = q.user_id
 LIMIT 10;
 
 SELECT *
FROM quiz
LIMIT 5;

SELECT *
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;
 
 SELECT question,
COUNT(DISTINCT user_id)
FROM survey
GROUP BY 1;
 
WITH funnels AS (SELECT DISTINCT q.user_id, h.user_id IS NOT NULL AS 'is_home_try_on',
 	h.number_of_pairs, p.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz q 
 LEFT JOIN home_try_on h
 	ON q.user_id = h.user_id
 LEFT JOIN purchase p
 	ON p.user_id = q.user_id)
SELECT  number_of_pairs, 
 SUM(is_home_try_on) AS 'num_home_try',
 SUM(is_purchase) AS 'num_purchase', 
 ROUND(100.0 * SUM(is_purchase) / SUM(is_home_try_on), 2) AS '% Purchase'
FROM funnels
GROUP BY number_of_pairs
Order BY number_of_pairs;

SELECT style, COUNT(*) AS 'num_each_style'
FROM purchase
GROUP BY style;

SELECT style, product_id, COUNT(*) AS 'num_each_product', model_name, color, price
FROM purchase
GROUP BY product_id
ORDER BY num_each_product;