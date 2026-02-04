-- Advanced Select Querries
/* 
1. Generate the following two result sets:

	1. Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by 
	the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). 
	For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
	
	2. Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order,
	and output them in the following format:
*/

select output_str from 
	(
		select (name + '(' + left(occupation,1) + ')') as output_str ,
			1 as sort_group,
			name as sort_col1,
			null as sort_col2
		from occupations -- order by output_str asc

	UNION ALL

		select 'There are a total of ' + convert(varchar, count(*)) + ' ' + lower(occupation) +'s.' as output_str,
			2 as sort_group,
			convert(varchar, count(*)) as sort_col1 ,
			occupation as sort_col2
		from occupations group by occupation
	) res
	order by sort_group,sort_col1,sort_col2;

/*
2. Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically
and displayed underneath its corresponding Occupation. The output should consist of
four columns (Doctor, Professor, Singer, and Actor) in that specific order, with their respective names 
listed alphabetically under each column.

Note: Print NULL when there are no more names corresponding to an occupation.
*/

with cte as (
    select name,occupation,
    row_number() over (partition by occupation order by name) as rn
    from occupations 
)
select [Doctor],  [Professor],[Singer],[Actor] from cte
pivot
(
    max(name)
    for occupation in ([Doctor],  [Professor],[Singer],[Actor])
) AS p;

/*
3. Given the table schemas below, write a query to print the company_code, founder name, 
total number of lead managers, total number of senior managers, total number of managers, 
and total number of employees. Order your output by ascending company_code.
Note: The tables may contain duplicate records.
*/

select c.company_code, founder, 
	 count(distinct lm.lead_manager_code) as lead_count ,
	 count(distinct sm.senior_manager_code)as sr_count,
	 count(distinct m.manager_code) as mng_count, 
	 count(distinct e.employee_code) as emp_count 
 from company c 
	left join lead_manager lm on c.company_code = lm.company_code
	left join senior_manager sm on c.company_code = sm.company_code
	left join manager m on c.company_code = m.company_code
	left join employee e on c.company_code = e.company_code
group by c.company_code , founder
order by c.company_code;
