# Vagrant Citus DB demo 
- This vagrant script will build a VM with 5 docker instances of postgres 9.6 citusdb.
- The master is port forwarded to 5432. IP: 192.168.33.11
- Workers are port fowarded to 5433,5434,5435,5436

- You should be able to connect w/ docker/docker as the user/passwd

# How To:
- clone this repo
- cd into the directory made after you have cloned
- execute at shell: vagrant ujjjjp
- After finish run: vagrant ssh --> to set your password
- It will boot you off the server so: vagrant ssh --> again
- run: docker ps --> You should see all instances of postgres running
- run: psql -h localhost -U postgres -c "SELECT * FROM master_get_active_worker_nodes();"
- node_name | node_port 
- -----------+-----------
-  localhost |      5434
-  localhost |      5436
-  localhost |      5433
-  localhost |      5435
- (4 rows)
