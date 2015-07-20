#!/bin/bash
# Import Aboriginal data
#   idg_comms  (Communities & Townships)
#   idg_usage  (ALT_Estate assigned to Aboriginal use)
#   idg_places (Heritage sites)
#   idg_pop    (Population)
#   idg_title  (Native Title grants)
#   idg_apps   (Native Title applications .. not used since too broad)

# Run from data directory, expects subdirs 'shp' and 'sql'

shp2pgsql -s 4326 -d shp/idg_usage/ALT_Estate_20150703_GovHack_NonexclusiveAgreement.shp raw_idg_usage > sql/raw_idg_usage.sql

shp2pgsql -s 4326 -d shp/idg_comms/Remote_Aboriginal_Comms_and_Town_Based_Reserves_GovHack_NonexclusiveAgreement.shp raw_idg_comms > sql/raw_idg_comms.sql

shp2pgsql -s 4326 -d shp/idg_places/place.shp raw_idg_places > sql/raw_idg_places.sql

shp2pgsql -s 4326 -d -W LATIN1 shp/idg_title/NTD_Register_Nat.shp raw_idg_title > sql/raw_idg_title.sql
