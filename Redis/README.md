### Redis docker-compose

#### Installation
on a swarm cluster or on a local environment
Create a network instance with 

```docker network create -d overlay --attachable proxy```
Then Run 

```docker-compose up```

To access the Redis instance
on another console

Run:
```
docker exec -ti redis_redis_1 /bin/sh
redis-cli
> ping
the redis should answer PONG
```

to check for an alias and get ensembl id for that gene:
```
smembers gene:HYST2477
```
To get data for 1 ensembl id
``` 
smembers id:ENSG00000121410
```
