# Telogis databases - common installation for both gateway and tuple databases, and then separate configuration
# Tuple database checks consistency with Gateway database for both static and live data - so both usually required

FROM thom/centos

MAINTAINER Tom Young <thomas.young@telogis.com>

RUN yum install -y \
 gcc \
 gcc-c++ \
 flex \
 bison \
 ruby \
 rubygems \
 ruby-devel \
 libgdiplus \
 runit \
 wget \
 tar

RUN rpm -ivh http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-centos93-9.3-1.noarch.rpm

RUN yum install -y \
 postgresql93-server \
 postgresql93-contrib \
 postgresql93-telogis-libs

RUN yum install -y \
 geos.x86_64 \
 proj.x86_64 \
 msgpack.x86_64

RUN yum install -y postgis # More complex than strictly required…but more reliable than building from source or pulling from another system

# PGMP - PostgreSQL Multiple Precision Arithmetic (from https://docs.google.com/a/telogis.com/document/d/1fkpoXnd1wg-fU0cK-CurXST0Ud9LAV5EVh9jZ_RJqPs)
# Create a yum package for this?

RUN yum install -y \
 postgresql93-devel \
 gmp-devel # required for PGMP

RUN wget http://pgfoundry.org/frs/download.php/3073/pgmp-1.0.0.tar.gz
RUN tar xvf pgmp-1.0.0.tar.gz
WORKDIR pgmp-1.0.0
# ENV PATH $PATH:/usr/pgsql-9.3/bin
# RUN make all # fails with error "implicit declaration of function ‘heap_form_tuple’" - access/htup_details.h must be included in src/pmpz_arith.c, src/pmpz_roots.c, and src/pmpz_theor.c
RUN for i in src/pmpz_arith.c src/pmpz_roots.c src/pmpz_theor.c; \
	do \
	  tac $i | sed '/htup.details.h/! s/^#include.*/#include "access\/htup_details.h"\n\0/ ; ta ; b ; :a ; N ; ba'  | tac > $i.new; \
	  cp -f $i.new $i; \
	done

RUN make PG_CONFIG=/usr/pgsql-9.3/bin/pg_config all # pg_config not in path, so reference explicitly
RUN cp pgmp.so /usr/pgsql-9.3/lib/

# COMPLETE UP UNTIL THIS POINT

# scp -r root@chc1-db.a.qual:~/plruby-0.5.4/ ~/plruby-0.5.4/
# cd ~/plruby-0.5.4/
# ruby extconf.rb --with-pg-config=/usr/pgsql-9.3/bin/pg_config
# make clean
# make all
# cd src
# cp plruby.so /usr/pgsql-9.3/lib/

yum install libgdiplus.x86_64
scp root@chc1-db.a.qual:/usr/pgsql-9.3/lib/pg_geobase.so /usr/pgsql-9.3/lib/pg_geobase.so

RUN yum clean all

#ADD XXX /var/lib/pgsql/9.3/data/pg_hba.conf
# Modify for local installation
#ADD XXX /var/lib/pgsql/9.3/data/postgresql.conf

RUN /etc/init.d/postgresql-9.3 initdb

# Install data
# Ruby install scripts are at https://telogis.kilnhg.com/Code/Platform/Database/Devel.git revision: 114677_db_cluster_portability_changes
ENV PGPORT 5432
ENV PGDATA /var/data/pgsql93/app1_data/
ENV PGLOG /var/lib/pgsql/9.3/pgstartup_app1.log

CMD su -l postgres -c "/usr/pgsql-9.3/bin/postmaster -p '5432' -D '/var/lib/pgsql/9.3/data'"

EXPOSE 5432

