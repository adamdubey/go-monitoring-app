# go-monitoring-app

## quick start

```sh
# start docker container services
docker-compose up -d

# execute database migration
soda migrate

# start ipe service
cd ipe && ./ipe

# start client app
./run.sh
# in browser, visit localhost:4000
```