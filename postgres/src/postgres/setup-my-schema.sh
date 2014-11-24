#!/bin/sh

gosu postgres postgres --single <<- EOSQL
   CREATE DATABASE docker;
   CREATE USER docker;
   GRANT ALL PRIVILEGES ON DATABASE docker to docker;
EOSQL