Go to a manager node 
```
docker stack deploy -c docker-compose.yml qa
```
Open a socket secure tunnel
```
ssh -L 5000:localhost:5000 ubuntu@...
```

Build, tag and push to remote registry (QA)
i.e. (for Proxy-api)
```
docker-compose 
docker build . --tag=chusj/clin-proxy-api-{endpoint}-service
docker images [TAKE THE LATEST ID)
docker tag [LATEST ID] chusj/clin-proxy-api-{endpoint}-service:latest
docker push
```