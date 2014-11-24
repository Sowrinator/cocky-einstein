#!/bin/sh

gosu postgres postgres --single <<- EOSQL
   CREATE DATABASE docker;
   ALTER USER postgres WITH PASSWORD 'postgres';
   CREATE USER docker;
   ALTER USER docker WITH PASSWORD 'docker';
   GRANT ALL PRIVILEGES ON DATABASE docker to docker;
EOSQL