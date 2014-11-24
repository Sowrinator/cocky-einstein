FROM postgres:9.3
ADD database-init.sh /docker-entrypoint-initdb.d/
ADD fix-acl.sh /docker-entrypoint-initdb.d/