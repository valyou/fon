#!/bin/bash
# Import Aboriginal data
#   abo_comms  (Communities & Townships)
#   abo_usage  (ALT_Estate assigned to Aboriginal use)
#   abo_places (Heritage sites)
#   abo_pop    (Population)
#   abo_title  (Native Title grants)
#   abo_apps   (Native Title applications .. not used since too broad)

# Run from data directory, expects subdirs 'shp' and 'sql'

shp2pgsql -s 4326 -d shp/abo_usage/ALT_Estate_20150703_GovHack_NonexclusiveAgreement.shp raw_abo_usage > sql/raw_abo_usage.sql
psql valyou < sql/raw_abo_usage.sql

shp2pgsql -s 4326 -d shp/abo_comms/Remote_Aboriginal_Comms_and_Town_Based_Reserves_GovHack_NonexclusiveAgreement.shp raw_abo_comms > sql/raw_abo_comms.sql
psql valyou < sql/raw_abo_comms.sql

shp2pgsql -s 4326 -d shp/abo_places/place.shp raw_abo_places > sql/raw_abo_places.sql
psql valyou < sql/raw_abo_usage.sql

shp2pgsql -s 4326 -d -W LATIN1 shp/abo_title/NTD_Register_Nat.shp raw_abo_title > sql/raw_abo_title.sql
psql valyou < sql/raw_abo_title.sql
