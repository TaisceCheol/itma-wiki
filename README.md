# Irish Traditional Music Archive

## HOW-TO: Deploy Confluence to Digital Ocean via docker-machine

1: Create droplet: `docker-machine create --driver digitalocean --digitalcean-access-token=$DIGITAL_OCEAN_ACCESS_TOKEN --digitalocean-size 1gb --digitalocean-region lon1  itma-wiki`

2: Switch to droplet machine: `eval $(docker-machine env itma-wiki`

3: Launch: `docker-compose up -d`

====

To tear down: `docker-compose down && docker-machine stop itma-wiki && docker-machine rm itma-wiki`
