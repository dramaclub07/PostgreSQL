-- Problem Statement 1: Set up the cognitive_data table with 8 columns and import a subset of
-- the human_cognitive_performance.csv dataset to initialize the table.

CREATE TABLE
 user_id | age | gender | sleep_dur | stress_lev | diet_type | daily_scre_exercise | f_caffeine | i_reaction | memory | i_cognitive | ai_predicted_score 
---------+-----+--------+-----------+------------+-----------+---------------------+------------+------------+--------+-------------+--------------------
(0 rows)

DROP TABLE
CREATE TABLE
COPY 80000
 user_id | age | gender | sleep_dur | stress_lev |   diet_type    | daily_scre_exercise | exercise_category | f_caffeine | i_reaction | memory | i_cognitive | ai_predicted_score 
---------+-----+--------+-----------+------------+----------------+---------------------+-------------------+------------+------------+--------+-------------+--------------------
 U1      |  57 | Female |       6.5 |          3 | Non-Vegetarian |                 6.5 | Medium            |         41 |     583.33 |     65 |       36.71 |              39.77
 U2      |  39 | Female |       7.6 |          9 | Non-Vegetarian |                10.8 | High              |        214 |     368.24 |     58 |       54.35 |              57.68
 U3      |  26 | Male   |       8.2 |          6 | Vegetarian     |                 5.7 | Low               |        429 |     445.21 |     49 |       32.57 |              29.54
 U4      |  32 | Male   |       7.8 |          9 | Vegetarian     |                 8.3 | Low               |        464 |     286.33 |     94 |       70.15 |              74.59
 U5      |  50 | Male   |       9.7 |          2 | Non-Vegetarian |                11.3 | Medium            |        365 |     237.65 |     62 |       87.54 |              91.78
(5 rows)

--Problem Statement 2: Using a transaction, calculate the average I_Cognitive score for each
-- diet_type and exercise_category combination, and display the results.(limit 1)

COPY 80000
   diet_type    | exercise_category | avg_cognitive_score 
----------------+-------------------+---------------------
 Non-Vegetarian | High              |   65.87654368328346
(1 row)


--(limit 10)
   diet_type    | exercise_category | avg_cognitive_score 
----------------+-------------------+---------------------
 Non-Vegetarian | High              |   65.87654368328346
 Vegan          | High              |   65.83137399876769
 Vegetarian     | High              |   65.29252994630319
 Vegetarian     | Medium            |   61.10665885230857
 Non-Vegetarian | Medium            |   61.09538812067891
 Vegan          | Medium            |   60.55572724327789
 Non-Vegetarian | Low               |  51.625878409976536
 Vegan          | Low               |   51.29712121212124
 Vegetarian     | Low               |  51.273083412422444
(9 rows)

BEGIN
ROLLBACK
DROP TABLE
CREATE TABLE
COPY 80000
BEGIN
ROLLBACK

-- Problem Statement 3: Using a transaction, update the AI_Predicted_Score for users with 
--sleep_dur less than 7.0 by adding 5 points.
BEGIN
UPDATE 39231
 user_id | sleep_dur | ai_predicted_score 
---------+-----------+--------------------
 U572    |       4.4 |                  5
 U1954   |         5 |              58.31
 U2034   |       4.4 |  66.03999999999999
 U2136   |         4 |              45.76
 U2624   |       6.3 |              63.22
(5 rows)

COMMIT

-- Problem Statement 4: Using a transaction, delete records from the cognitive_data 
--table where stress_lev is greater than 8.
BEGIN
DELETE 15769
 user_id | stress_lev 
---------+------------
(0 rows)

COMMIT

-- Problem Statement 5: Using a transaction, update the f_caffeine for users with 
--diet_type = 'Vegan' by increasing it by 100.
BEGIN
BEGIN
UPDATE 6345
 user_id | diet_type | f_caffeine 
---------+-----------+------------
 U12     | Vegan     |        102
 U57     | Vegan     |        272
 U13905  | Vegan     |        568
 U15785  | Vegan     |        256
 U13909  | Vegan     |        253
(5 rows)

COMMIT

-- Problem Statement 6: Using a transaction, update the i_cognitive score for users
-- with memory above 70 by adding 2 points.

BEGIN
UPDATE 31114
 user_id | memory | i_cognitive 
---------+--------+-------------
 U12     |     84 |         102
 U57     |     81 |         102
 U15785  |     74 |       78.09
 U13909  |     79 |       56.57
 U13     |     72 |       69.11
(5 rows)

COMMIT

--Problem Statement 7: Using a transaction, delete records where age is less than 25
-- and ai_predicted_score is below 30.

BEGIN
DELETE 903
BEGIN
DELETE 903
 user_id | age | ai_predicted_score 
---------+-----+--------------------
(0 rows)

COMMIT
