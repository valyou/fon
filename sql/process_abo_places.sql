-- INSERT INTO category VALUES ('ABORIGINAL', 'ABORIGINAL', 'Indigenous connections - people, sites, communities, native title, land usage');
-- INSERT INTO category VALUES ('ABO_PLACES', 'ABORIGINAL', 'Indigenous heritage sites');

DELETE FROM category_values WHERE category_code='ABO_PLACES';

INSERT INTO category_values (gid,category_code,raw_value,description,value,geom)
WITH weights AS (
  SELECT gid, 0.2 AS weight FROM raw_abo_places WHERE status='Stored Data / Not a Site'
  UNION ALL
  SELECT gid, 0.5 AS weight FROM raw_abo_places WHERE status='Lodged'
  UNION ALL
  SELECT gid, 1.0 AS weight FROM raw_abo_places WHERE status='Registered Site'
)
-- max(sum) = 4136.7
SELECT sa2.gid,'ABO_PLACES',sum(weights.weight),
       'Indigenous Heritage Sites: ' || count(*) || ', weighted by status (Stored, Lodged, Registered). ',
       round(sum(weights.weight) / 41.367),NULL
FROM raw_abo_places p, weights, sa2_cutdown sa2
WHERE p.gid=weights.gid AND ST_Intersects(p.geom, sa2.geom)
GROUP BY sa2.gid
;

INSERT INTO category_values (gid,category_code,raw_value,description,value,geom)
SELECT gid,'ABO_PLACES',0,'Indigenous Heritage Sites: 0',0,NULL
FROM sa2_cutdown sa2
WHERE gid not in (SELECT gid from category_values WHERE category_code='ABO_PLACES')
;

