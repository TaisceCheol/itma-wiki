# Irish Traditional Music Archive

## HOW-TO: Deploy Confluence to Digital Ocean via docker-machine

1: Create droplet: `docker-machine create --driver digitalocean \
			--digitalocean-access-token=$DIGITAL_OCEAN_ACCESS_TOKEN \
			--digitalocean-size 2gb \
			--digitalocean-region lon1  \
			itma-wiki`

2: Switch to droplet machine: `eval $(docker-machine env itma-wiki)`

3: Launch: `docker-compose up -d`

4: Create postgres tables: 
```bash
$ docker-machine ssh itma-wiki
$ docker ps [dockerconfluence_postgres_1]
$ docker exec -it dockerconfluence_postgres_1 bash
$ gosu postgres psql
$ CREATE USER confluence;
$ CREATE DATABASE confluence;
$ GRANT ALL PRIVILEGES ON DATABASE confluence TO confluence;
$ \l
$ \q
$ exit
$ exit	
```
====

To tear down: `docker-compose down && docker-machine stop itma-wiki && docker-machine rm itma-wiki`
