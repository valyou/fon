-- INSERT INTO category VALUES ('ABORIGINAL', 'ABORIGINAL', 'Indigenous connections - people, sites, communities, native title, land usage');
INSERT INTO category VALUES ('ABO_TITLE', 'ABORIGINAL', 'Indigenous Native Title grants');

DELETE FROM category_values WHERE category_code='ABO_TITLE';

-- TODO: would be better to calculate percent of land use, rather than count areas
INSERT INTO category_values (gid,category_code,raw_value,description,value,geom)
-- max(raw_value) = 13
SELECT sa2.gid,'ABO_TITLE',count(*),'Native Title grants: ' || count(*),round(count(*) / 0.13),NULL
FROM raw_abo_title t, sa2_cutdown sa2
WHERE ST_Intersects(t.geom, sa2.geom)
GROUP BY sa2.gid
;

-- pad missing rows
INSERT INTO category_values (gid,category_code,raw_value,description,value,geom)
SELECT gid,'ABO_TITLE',0,'Native Title grants: 0',0,NULL
FROM sa2_cutdown sa2
WHERE gid not in (SELECT gid from category_values WHERE category_code='ABO_TITLE')
;

