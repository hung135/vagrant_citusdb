#this will be last and most of the time we won't need and requires 4gb of ram to run
      docker run  --restart=always --name postgres -e POSTGRES_PASSWORD=ubuntu -p 54322:5432 -d postgres:latest   
      # Add Citus repository for package manager
      #https://docs.citusdata.com/en/v6.1/installation/production_deb.html
      curl https://install.citusdata.com/community/deb.sh | sudo bash
      # install the server and initialize db
      sudo apt-get -y install postgresql-9.6-citus-6.1

      # preload citus extension
      sudo pg_conftool 9.6 main set shared_preload_libraries citus

