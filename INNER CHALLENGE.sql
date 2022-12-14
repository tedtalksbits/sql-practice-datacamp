/*
    Using the populations table focused only for the year 2015, create a new field aliased as popsize_group to organize population size into

    'large' (> 50 million),
    'medium' (> 1 million), and
    'small' groups.
    Select only the country code, population size, and this new popsize_group as fields.
*/

SELECT country_code, size,
    -- First case
    CASE WHEN size > 50000000 THEN 'large'
        -- Second case
        WHEN size > 1000000 THEN 'medium'
        -- Else clause + end
        ELSE 'small' END
        -- Alias name (popsize_group)
        AS popsize_group
-- From table
FROM populations
-- Focus on 2015
WHERE year = 2015;

/*
    Use INTO to save the result of the previous query as pop_plus. You can see an example of this in the countries_plus code in the assignment text. Make sure to include a ; at the end of your WHERE clause!

    Then, include another query below your first query to display all the records in pop_plus using SELECT * FROM pop_plus; so that you generate results and this will display pop_plus in the query result.
*/

SELECT country_code, size,
    -- First case
    CASE WHEN size > 50000000 THEN 'large'
        -- Second case
        WHEN size > 1000000 THEN 'medium'
        -- Else clause + end
        ELSE 'small' END
        -- Alias name (popsize_group)
        AS popsize_group
INTO pop_plus
FROM populations
-- Focus on 2015
WHERE year = 2015;

-- Select all columns of pop_plus
SELECT * FROM pop_plus;


/*
    Keep the first query intact that creates pop_plus using INTO.
    Write a query to join countries_plus AS c on the left with pop_plus AS p on the right matching on the country code fields.
    Sort the data based on geosize_group, in ascending order so that large appears on top.
    Select the name, continent, geosize_group, and popsize_group fields.
*/

-- Select fields
SELECT c.name, c.continent, c.geosize_group, p.popsize_group
-- From countries_plus (alias as c)
FROM countries_plus c
  -- Join to pop_plus (alias as p)
  INNER JOIN pop_plus p
    -- Match on country code
    ON p.country_code = c.code
-- Order the table    
ORDER BY c.geosize_group ASC;
