#!/bin/bash
psql valyou <<EOF
DROP TABLE IF EXISTS raw_abo_pop;
CREATE TABLE raw_abo_pop (
"STATE" integer,
"State" text,
"REGIONTYPE" text,
"Region Type" text,
"FREQUENCY" text,
"Frequency" text,
"MEASURE" integer,
"Sex" text,
"AGE" text,
"Age" text,
"TIME" integer,
"Time" integer,
"REGION" varchar(9),
"Region" text,
"INGP" varchar(3),
"Indigenous Status" text,
Value integer,
Flags text
);
\COPY raw_abo_pop FROM 'ABS_CENSUS2011_B07_Data_40fa835b-00f3-4993-b534-fdd14abf4ddf.csv' DELIMITERS ',' WITH CSV HEADER
\q
EOF

exit

"STATE","State","REGIONTYPE","Region Type","FREQUENCY","Frequency","MEASURE","Sex","AGE","Age","TIME","Time","REGION","Region","INGP","Indigenous Status",Value,Flags
"5","Western Australia","SA2","Statistical Area Level 2","A","Annual","3","Persons","TT","Total all ages","2011","2011","501011001","Augusta","4","Indigenous(a)",40,
"5","Western Australia","SA2","Statistical Area Level 2","A","Annual","3","Persons","TT","Total all ages","2011","2011","501011002","Busselton","4","Indigenous(a)",423,
"5","Western Australia","SA2","Statistical Area Level 2","A","Annual","3","Persons","TT","Total all ages","2011","2011","501011003","Busselton Region","4","Indigenous(a)",69,
"5","Western Australia","SA2","Statistical Area Level 2","A","Annual","3","Persons","TT","Total all ages","2011","2011","501011004","Margaret River","4","Indigenous(a)",75,
"5","Western Australia","SA2","Statistical Area Level 2","A","Annual","3","Persons","TT","Total all ages","2011","2011","501021005","Australind - Leschenault","4","Indigenous(a)",261,
"5","Western Australia","SA2","Statistical Area Level 2","A","Annual","3","Persons","TT","Total all ages","2011","2011","501021006","Bunbury","4","Indigenous(a)",428,
"5","Western Australia","SA2","Statistical Area Level 2","A","Annual","3","Persons","TT","Total all ages","2011","2011","501021007","Capel","4","Indigenous(a)",92,
"5","Western Australia","SA2","Statistical Area Level 2","A","Annual","3","Persons","TT","Total all ages","2011","2011","501021008","College Grove - Carey Park","4","Indigenous(a)",344,
"5","Western Australia","SA2","Statistical Area Level 2","A","Annual","3","Persons","TT","Total all ages","2011","2011","501021009","Collie","4","Indigenous(a)",285,
