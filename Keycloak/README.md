Default Keycloak user is `admin` and it's password is `KEYCLOAK_PASSWORD`.

```
on local machine with docker-compose...
POSTGRESQL_PASSWORD=1q2w3e4r KEYCLOAK_PASSWORD=1q2w3e4r docker-compose up
```
For swar docker cluster 
You can limit the set of nodes where a task can be scheduled by defining constraint expressions. Multiple constraints find nodes that satisfy every expression (AND match). Constraints can match node or Docker Engine labels

```nodeUpdate.sh``` will create a label that will be used by docker stack deploy (next).
Since postgresql service will used a volume, we need to make sure the same node always start psotgres to keep the keycloack configuration from reboot.

```
on a swarm cluster
./nodeUpdate.sh
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
