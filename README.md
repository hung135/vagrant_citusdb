# Vagrant Citus DB demo 
This vagrant script will build a VM with 5 docker instances of postgres 9.6 citusdb.
The master is port forwarded to 5432.
Workers are port fowarded to 5433,5434,5435,5436

You should be able to connect w/ docker/docker as the user/passwd

# How To:
' clone this repo
' cd into the directory made after you have cloned
' execute at shell: vagrant up
' After finish run: vagrant ssh --> to set your password
' It will boot you off the server so: vagrant ssh --> again
' run: docker ps --> You should see all instances of postgres running
