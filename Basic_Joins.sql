-- Basic Joins
--Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
select c.name from city c inner join country cc 
on c.countrycode= cc.code where continent='Africa';

/* Given the CITY and COUNTRY tables, query the names of all the continents
(COUNTRY.Continent) and their respective average city populations (CITY.Population) 
rounded down to the nearest integer.*/
select cc.continent, avg(c.population) from 
city c inner join country cc on c.countrycode = cc.code
group by cc.continent;

/* Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.*/
select  sum(c.population) from city c inner join country cc 
on c.countrycode= cc.code where cc.continent='Asia';

-- medium level joins
/* Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name,
and the total number of challenges created by each student. Sort your results by the total number of challenges 
in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id.
If more than one student created the same number of challenges and the count is less than the maximum number
of challenges created, then exclude those students from the result. */

select h.hacker_id, h.name, count(challenge_id) as total_challenges from 
hackers h inner join challenges c
on h.hacker_id = c.hacker_id
group by h.hacker_id, h.name
having count(challenge_id) = (select max(cnt) from (
    select count(challenge_id) as cnt from challenges group by hacker_id) sub
)
OR
count(challenge_id) in(
    select cnt from (select count(challenge_id) as cnt from challenges
    group by hacker_id ) sub 
    group by cnt having count(cnt) =1)
    order by total_challenges desc , h.hacker_id ASC;

 /* Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! 
 Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one 
 challenge. Order your output in descending order by the total number of challenges in which the hacker earned
 a full score. If more than one hacker received full scores in same number of challenges, 
 then sort them by ascending hacker_id. */

select h.hacker_id, h.name
 from hackers h inner join submissions s 
on h.hacker_id = s.hacker_id
join challenges c on s.challenge_id = c.challenge_id
join difficulty d on d.difficulty_level = c.difficulty_level
where s.score = d.score
group by h.hacker_id, h.name
having count(distinct s.challenge_id) > 1
order by count(distinct s.challenge_id) desc,h.hacker_id asc;

/* The total score of a hacker is the sum of their maximum scores for all of the challenges. 
Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score.
If more than one hacker achieved the same total score, then sort the result by ascending hacker_id.
Exclude all hackers with a total score of  from your result. */

select h.hacker_id,h.name , sum(t.max_score) as total_score
from hackers h join (
    select hacker_id , challenge_id, max(score) as max_score
    from submissions group by hacker_id, challenge_id)t 
    on h.hacker_id = t.hacker_id
    group by h.hacker_id ,h.name
    having sum(t.max_score) > 0
    order by total_score desc, h.hacker_id asc;

