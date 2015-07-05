-- INSERT INTO category VALUES ('ABORIGINAL', 'ABORIGINAL', 'Indigenous connections - people, sites, communities, native title, land usage');
-- INSERT INTO category VALUES ('ABO_COMMS', 'ABORIGINAL', 'Indigenous towns and communities');

DELETE FROM category_values WHERE category_code='ABO_COMMS';

INSERT INTO category_values (gid,category_code,raw_value,description,value,geom)
-- max(raw_value) = 85
SELECT sa2.gid,'ABO_COMMS',count(*),'Indigenous Communities: ' || count(*),round(count(*) / 0.85),NULL
FROM raw_abo_comms c, sa2_cutdown sa2
WHERE ST_Intersects(c.geom, sa2.geom)
GROUP BY sa2.gid
;

INSERT INTO category_values
SELECT gid,'ABO_COMMS',0,'Indigenous towns and communities: 0',0,NULL
FROM sa2_cutdown sa2
WHERE gid not in (SELECT gid from category_values WHERE category_code='ABO_COMMS')
;

