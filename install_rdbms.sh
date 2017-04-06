#this will be last and most of the time we won't need and requires 4gb of ram to run
docker build -t postgrescitus .
      #docker run  --restart=always --name postgres -e POSTGRES_PASSWORD=ubuntu -p 54322:5432 -d postgres:latest   
      # Add Citus repository for package manager
      #https://docs.citusdata.com/en/v6.1/installation/production_deb.html
      curl https://install.citusdata.com/community/deb.sh | sudo bash
      # install locally sowe can have client tools 
      sudo apt-get -y install postgresql-9.6-citus-6.1

      # preload citus extension
      #sudo pg_conftool 9.6 main set shared_preload_libraries citus
      docker run -d -p 5432:5432 --name master postgrescitus
      docker run -d -p 5433:5432 postgrescitus
      docker run -d -p 5434:5432 postgrescitus
      docker run -d -p 5435:5432 postgrescitus
      docker run -d -p 5436:5432 postgrescitus
      # because Master is port forward to localhost 5432 from above
     psql -h localhost -U postgres -c "SELECT * from master_add_node('localhost', 5433);"
     psql -h localhost -U postgres -c "SELECT * from master_add_node('localhost', 5434);"
     psql -h localhost -U postgres -c "SELECT * from master_add_node('localhost', 5435);"
     psql -h localhost -U postgres -c "SELECT * from master_add_node('localhost', 5436);"

