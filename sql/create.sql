CREATE USER fon WITH ENCRYPTED PASSWORD 'vicious' CREATEDB;
CREATE DATABASE valyou WITH ENCODING 'UTF-8' OWNER "fon";
GRANT ALL PRIVILEGES ON DATABASE valyou TO fon;
CONNECT valyou;
CREATE EXTENSION postgis;
