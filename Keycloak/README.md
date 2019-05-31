Default Keycloak user is `admin` and it's password is `KEYCLOAK_PASSWORD`.

```
on local machine with docker-compose...
POSTGRESQL_PASSWORD=1q2w3e4r KEYCLOAK_PASSWORD=1q2w3e4r docker-compose up

on a swarm cluster
./nodeUpdate
mkdir postgres
POSTGRESQL_PASSWORD=1q2w3e4r KEYCLOAK_PASSWORD=1q2w3e4r docker stack deploy -c docker-compose.yml test
```

Then go to 
```
https://localhost:8443/auth
http://localhost:8080/auth
```
internal service is
```
https://keycloak:8443/auth
http://keycloak:8080/auth
```
