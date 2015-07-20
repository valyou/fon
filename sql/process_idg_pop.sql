-- INSERT INTO category VALUES ('ECONOMY', 'ECONOMY', 'Aboriginal');
-- INSERT INTO category VALUES ('ABORIGINAL', 'ABORIGINAL', 'Aboriginal');
-- INSERT INTO category VALUES ('POPULATION', 'ECONOMY', 'Population');
-- INSERT INTO category VALUES ('IDG_POP', 'ABORIGINAL', 'Aboriginal Population');

-- select max(value) from raw_idg_pop where "INGP" = 'TOT'; -- 25504
-- select max(value) from raw_idg_pop where "INGP" = '4'; -- 4044

DELETE FROM category_values WHERE category_code='POPULATION';
INSERT INTO category_values (gid,category_code,raw_value,description,value,geom)
SELECT sa2.gid, 'POPULATION', pop.value, 
       'Total population = ' || pop.value, 
       round(pop.value / 255.04), sa2.geom
FROM raw_idg_pop pop, sa2_cutdown sa2 
WHERE pop."REGION" = sa2.sa2_main11 AND pop."INGP" = 'TOT';

-- pad null rows
INSERT INTO category_values (gid,category_code,raw_value,description,value,geom)
SELECT gid,'POPULATION',0,'Total population: 0',0,NULL
FROM sa2_cutdown sa2
WHERE gid not in (SELECT gid from category_values WHERE category_code='POPULATION')
;


DELETE FROM category_values WHERE category_code='IDG_POP';
INSERT INTO category_values (gid,category_code,raw_value,description,value,geom)
SELECT sa2.gid, 'IDG_POP', pop.value, 
       'Aboriginal population = ' || pop.value, 
       round(pop.value / 40.44), sa2.geom
FROM raw_idg_pop pop, sa2_cutdown sa2 
WHERE pop."REGION" = sa2.sa2_main11 AND pop."INGP" = '4';

-- pad null rows
INSERT INTO category_values (gid,category_code,raw_value,description,value,geom)
SELECT gid,'IDG_POP',0,'Aboriginal population: 0',0,NULL
FROM sa2_cutdown sa2
WHERE gid not in (SELECT gid from category_values WHERE category_code='IDG_POP')
;


