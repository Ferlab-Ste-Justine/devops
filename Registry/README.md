Go to a manager node 
```
docker stack deploy -c docker-compose.yml qaReg
```
To test

```
docker pull alpine
docker tag alpine localhost:5000/alpine
docker push localhost:5000/alpine

```


Build, tag and push to registry

```
copy docker.env .env
nano .env
docker-compose build 
docker tag localhost:5000/clin-proxy-api-auth-service:latest localhost:5000/clin-proxy-api-auth-service:1.1
docker push localhost:5000/clin-proxy-api-auth-service:latest
docker push localhost:5000/clin-proxy-api-auth-service:1.1

...
docker stack deploy -c docker-compose.yml qa-proxy-api
docker service update qa-proxi-api_auth --image localhost:5000/clin-proxy-api-auth-service:1.1
```

To scale the service up or down...
```
docker service scale qa-proxi-api_auth=3
```