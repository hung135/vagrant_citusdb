FROM ubuntu
RUN apt-get update && apt-get install -y curl
RUN curl https://install.citusdata.com/community/deb.sh | bash
# install the server and initialize db
RUN apt-get -y install postgresql-9.6-citus-6.1

# preload citus extension
RUN pg_conftool 9.6 main set shared_preload_libraries citus
RUN pg_conftool 9.6 main set listen_addresses '*'
#RUN vi /etc/postgresql/9.6/main/pg_hba.conf
#jjRUN sudo service postgresql restart
# and make it start automatically when computer does
#RUN sudo update-rc.d postgresql enable
# add the citus extension
USER postgres

# Create a PostgreSQL role named ``docker`` with ``docker`` as the password and
# then create a database `docker` owned by the ``docker`` role.
# Note: here we use ``&&\`` to run commands one after the other - the ``\``
#       allows the RUN command to span multiple lines.
RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    createdb -O docker docker



RUN service postgresql restart
#RUN psql -c "CREATE EXTENSION citus;"
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.6/main/pg_hba.conf
EXPOSE 5432
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]
# Set the default command to run when starting the container
CMD ["/usr/lib/postgresql/9.6/bin/postgres", "-D", "/var/lib/postgresql/9.6/main", "-c", "config_file=/etc/postgresql/9.6/main/postgresql.conf"]

