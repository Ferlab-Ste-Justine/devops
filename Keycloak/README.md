```
POSTGRESQL_PASSWORD=1q2w3e4r KEYCLOAK_PASSWORD=1q2w3e4r docker-compose up
or
mkdir postgres
POSTGRESQL_PASSWORD=1q2w3e4r KEYCLOAK_PASSWORD=1q2w3e4r docker stack deploy -c docker-compose.yml test
```

Then go to 
```
https://localhost:8443/auth
```
internal service is
```
https://keycloak:8443/auth
```