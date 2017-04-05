#this will be last and most of the time we won't need and requires 4gb of ram to run
      docker run  --restart=always --name postgres -e POSTGRES_PASSWORD=ubuntu -p 54322:5432 -d postgres:latest   
      #docker pull microsoft/mssql-server-linu
