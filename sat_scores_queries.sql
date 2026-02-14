create database sat_stuff_db;
use sat_stuff_db;

select * from sat_results;


-- I don't like these column names. Let's just change th ename. 

create table st_re_used
as select * from sat_results;


select * from st_re_used;

ALTER TABLE st_re_used 
CHANGE `SAT Critical Reading Avg. Score` `Average Critical_Reading_Score` int;

ALTER TABLE st_re_used 
CHANGE `SAT Math Avg. Score` `Average Math SAT Score` int;

ALTER TABLE st_re_used 
CHANGE `SAT Writing Avg. Score` `Average Writing SAT Score` int;


-- SBQ -- 1 
select * from sat_results;


select avg(`SAT Critical Reading Avg. Score`) from sat_results;
-- The average SAT Reading score is 400.

select avg(`SAT Writing Avg. Score`) from sat_results;
-- The average SAT Reading score is 393.

select avg(`SAT Math Avg. Score`) from sat_results;
-- The average SAT Reading score is 413.

-- So comparing the results. The most highest average score was on the Math exams.



-- SBQ 2: 


-- Which of the top 5 schools have the highest averages on all subjects?
select * from st_re_used;

select max(`Average Critical_Reading_Score`) as max_reading_score,
max(`Average Writing SAT Score`) as max_wriing_score,
max(`Average Math SAT Score`) as max_math_score from st_re_used;
-- find the max value of each subject. 

-- The highest reading score was 679. 
-- The highest writing score was 682
-- The highest math sore was 735


select *  from st_re_used
where `Average Critical_Reading_Score` = 679;
-- STUYVESANT HIGH SCHOOL has the highest average reading SAT scores.

select *  from st_re_used
where `Average Writing SAT Score` = 682;
-- STUYVESANT HIGH SCHOOL has the highest average reading AND writing SAT scores.

select *  from st_re_used
where `Average Math SAT Score` = 735;
-- STUYVESANT HIGH SCHOOL has the highest average reading, writing AND math SAT scores.


-- Let's find the top 5 schools.

select max(`Average Critical_Reading_Score`) as max_reading_score,
max(`Average Writing SAT Score`) as max_wriing_score,
max(`Average Math SAT Score`) as max_math_score from st_re_used;


-- The highest reading score was 679. 
-- The highest writing score was 682
-- The highest math sore was 735

select * from st_re_used
where `Average Critical_Reading_Score` > 620
and `Average Writing SAT Score` > 630
and `Average Math SAT Score` > 680
order by `Average Critical_Reading_Score`, `Average Writing SAT Score`, `Average Math SAT Score` desc;

-- I decided to filter out which schools had close to the highest scores of all subjects. And I got Bronx High School of Science, and Staten Island technical High School.
-- So for now, we will just do the top 3 schools. 



-- Let's find out which schools have the LOWEST averages.

select min(`Average Critical_Reading_Score`) as min_reading_score,
min(`Average Writing SAT Score`) as min_wriing_score,
min(`Average Math SAT Score`) as min_math_score from st_re_used;

-- The lowest reading score was 279.
-- The lowest writing score was 286
-- The lowest math score was 312. 

-- Even here still, math averages were much higher.

select *  from st_re_used
where `Average Critical_Reading_Score` = 279;
-- MULTICULTURAL HIGH SCHOOL has the lowest average reading and writing score. 

select * from st_re_used
where `Average Writing SAT Score` = 286;

select * from st_re_used
where `Average Math SAT Score` = 312;
-- BRONX INTERNATIONAL HIGH SCHOOL has the lowest math score.alter

-- So MULTICULTURAL HIGH SCHOOL has the lowest average reading and writing score. And BRONX INTERNATIONAL HIGH SCHOOL has the lowest math score.alter




-- For the top 3 schools, does the amount of test takers have an impact on their scores for all subjects?
select * from st_re_used
where `Average Critical_Reading_Score` > 620
and `Average Writing SAT Score` > 630
and `Average Math SAT Score` > 680;

-- Yes. The more test takers, the higher the average. Because it adds to the overall average. 
-- STUYVESANT HIGH SCHOOL had the most test takers, which resulted in the highest averages of scores for reading, writing, and math.


-- Now for the bottom 3 schools with the lowest average:

select *  from st_re_used
where `Average Critical_Reading_Score` < 300;

select * from st_re_used
where `Num of SAT Test Takers` < 30;
-- MULTICULTURAL HIGH SCHOOL had 29 test takers. But it wasn't the school with the least amount of test takers. 
-- For there have been schools with less test takers, but still a higher average in one of these subjects than this school. 
-- So for this school, the amount of people taking the test does not affect the reading scores.


select * from st_re_used
where `Average Writing SAT Score` < 300;

-- Multicultural high school does have the lowest writing score as well. And according to THIS data, they have the lowest score and lowest amount of test takers. 
-- Which means that the amount of test takers does impact the writing score.


select * from st_re_used
where`Average Math SAT Score` < 315;
-- There is only one entry here, so there is not a lot of information to get out of this query.



-- SBQ - 3: Going Deep into The Highest Averages

-- Of these 3 of the highest schools, which one had the highest math scores? 
-- And which one had the lowest?

select * from st_re_used
where `Average Critical_Reading_Score` > 620
and `Average Writing SAT Score` > 630
and `Average Math SAT Score` > 680

-- STUYVESANT HIGH SCHOOL had the highest math sat score, and STATEN ISLAND TECHNICAL HIGH SCHOOL had the lowest math score out of the three.and

-- Of these 5 schools, which one had the highest reading scores? And which one had the lowest?

-- STUYVESANT HIGH SCHOOL had the highest reading sat score, and STATEN ISLAND TECHNICAL HIGH SCHOOL had the lowest reading score out of the three.


-- Of these 5 schools, which one had the highest writing scores? And which one had the lowest?

-- STUYVESANT HIGH SCHOOL had the highest writing sat score, and STATEN ISLAND TECHNICAL HIGH SCHOOL had the lowest writing score out of the three.

-- So out of the three top schools, STUYVESANT HIGH SCHOOL had the highest math, reading, and writing SAT scores.
-- While STATEN ISLAND TECHNICAL HIGH SCHOOL had the lowest math, reading and writing scores. and Bronx High School Of Science was in the middle.