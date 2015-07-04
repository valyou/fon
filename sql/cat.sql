-- select max(value) from raw_abo_pop where "INGP" = 'TOT'; -- 25504
-- select max(value) from raw_abo_pop where "INGP" = '4'; -- 4044
INSERT INTO category VALUES ('POPULATION', 'Population');
INSERT INTO category VALUES ('ABO_POP', 'Aboriginal Population');

INSERT INTO category_values
SELECT sa2.gid, 'POPULATION', pop.value, 
       'Total population = ' || pop.value, 
       round(pop.value / 255.04), sa2.geom
FROM raw_abo_pop pop, sa2_cutdown sa2 
WHERE pop."REGION" = sa2.sa2_main11 AND pop."INGP" = 'TOT'

INSERT INTO category_values
SELECT sa2.gid, 'ABO_POP', pop.value, 
       'Total population = ' || pop.value, 
       round(pop.value / 404.4), sa2.geom
FROM raw_abo_pop pop, sa2_cutdown sa2 
WHERE pop."REGION" = sa2.sa2_main11 AND pop."INGP" = '4'


