#!/bin/sh

gosu postgres postgres --single <<- EOSQL
   CREATE DATABASE docker;
EOSQL
gosu postgres postgres --single docker <<- EOSQL
   CREATE TABLE einstein ( col1 varchar(255) );
   INSERT INTO einstein VALUES ( 'Hi, Its Postgres' );
   ALTER USER postgres WITH PASSWORD 'postgres';
   CREATE USER docker WITH PASSWORD 'docker';
   ALTER ROLE docker SUPERUSER;
EOSQL