-- INSERT INTO category VALUES ('ABORIGINAL', 'ABORIGINAL', 'Indigenous connections - people, sites, communities, native title, land usage');
-- INSERT INTO category VALUES ('IDG_COMMS', 'ABORIGINAL', 'Indigenous towns and communities');

DELETE FROM category_values WHERE category_code='IDG_COMMS';

INSERT INTO category_values (gid,category_code,raw_value,description,value,geom)
-- max(raw_value) = 85
SELECT sa2.gid,'IDG_COMMS',count(*),'Indigenous Communities: ' || count(*),round(count(*) / 0.85),NULL
FROM raw_idg_comms c, sa2_cutdown sa2
WHERE ST_Intersects(c.geom, sa2.geom)
GROUP BY sa2.gid
;

INSERT INTO category_values (gid,category_code,raw_value,description,value,geom)
SELECT gid,'IDG_COMMS',0,'Indigenous towns and communities: 0',0,NULL
FROM sa2_cutdown sa2
WHERE gid not in (SELECT gid from category_values WHERE category_code='IDG_COMMS')
;

