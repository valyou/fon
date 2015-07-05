WITH weights AS (
  SELECT gid, 0.2 AS weight FROM raw_abo_places WHERE status='Stored Data / Not a Site'
  UNION ALL
  SELECT gid, 0.5 AS weight FROM raw_abo_places WHERE status='Lodged'
  UNION ALL
  SELECT gid, 1.0 AS weight FROM raw_abo_places WHERE status='Registered Site'
)
INSERT INTO category_values
-- gid,category_code,raw_value,description,value,geom
SELECT sa2.gid,'INDIGENOUS_PLACES',sum(weights.weight),'Indigenous Heritage Sites: ' || count(*) || ', weighted by status (Stored, Lodged, Registered). ',sum(weights.weight),NULL
FROM raw_abo_places p, weights, sa2_cutdown sa2
WHERE p.gid=weights.gid AND ST_Intersects(p.geom, sa2.geom)
GROUP BY sa2.gid
;
