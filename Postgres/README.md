```
mkdir postgres
echo '1q2w3e4r' > POSTGRES_PASSWORD.txt
docker-compose up
or
docker stack deploy -c docker-compose.yml clinbd
```