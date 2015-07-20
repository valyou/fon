-- INSERT INTO category VALUES ('ABORIGINAL', 'ABORIGINAL', 'Indigenous connections - people, sites, communities, native title, land usage');
-- INSERT INTO category VALUES ('IDG_USAGE', 'ABORIGINAL', 'Indigenous towns and communities');
INSERT INTO category VALUES ('IDG_USAGE', 'ABORIGINAL', 'Land assigned to Indigenous use');

DELETE FROM category_values WHERE category_code='IDG_USAGE';

-- TODO: would be better to calculate percent of land use, rather than count areas
INSERT INTO category_values (gid,category_code,raw_value,description,value,geom)
-- gid,category_code,raw_value,description,value,geom.  max(raw_value) = 414
SELECT sa2.gid,'IDG_USAGE',count(*),'Land areas assigned to Indigenous use: ' || count(*),round(count(*) / 4.14),NULL
FROM raw_idg_usage u, sa2_cutdown sa2
WHERE ST_Intersects(u.geom, sa2.geom)
GROUP BY sa2.gid
;

-- pad missing rows
INSERT INTO category_values (gid,category_code,raw_value,description,value,geom)
SELECT gid,'IDG_USAGE',0,'Land areas assigned to Indigenous use: 0',0,NULL
FROM sa2_cutdown sa2
WHERE gid not in (SELECT gid from category_values WHERE category_code='IDG_USAGE')
;

