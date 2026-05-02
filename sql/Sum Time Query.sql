SELECT namelink, emp_id,  sum (totaltime), sum(massagehrs) FROM public."time" where time_date > '2026-04-15'
Group By(namelink, emp_id)
ORDER BY namelink asc LIMIT 100
