DROP TABLE IF EXISTS raw_idg_pop;
CREATE TABLE raw_idg_pop (
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
\COPY raw_idg_pop FROM 'ABS_CENSUS2011_B07_Data_40fa835b-00f3-4993-b534-fdd14abf4ddf.csv' DELIMITERS ',' WITH CSV HEADER
