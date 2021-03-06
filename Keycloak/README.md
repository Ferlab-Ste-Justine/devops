# Defaults

The default Keycloak user is `admin` and it's password is `KEYCLOAK_PASSWORD`.

The default clin-proxi-api secret is '01b99f28-1331-4fec-903b-c2e8043cec77'

Keycloak will have a Clin Realm pre-configured with clin-proxi-api client ID  (see the **realm-export.json** file)

# Postgres Volume Note

The postgres container will be launched with its database directory mapped to the ```./postgres``` directory on the host.

This allows the database data to be preserved in the event that the postgres container is destroyed.

# Local docker-compose Setup

Type: 

```
docker network create -d overlay --attachable proxy
POSTGRESQL_PASSWORD=1q2w3e4r KEYCLOAK_PASSWORD=1q2w3e4r docker-compose up -d
```

# Local Swarm Docker Cluster Setup

## Deployment Selectors Note

The postgres database will only be deployed on a node that have a **db_role** label with a value of **postgresql**

The keycloak service will only be deployed on a node that have a **node_role** label with a value of **devops**

The ```nodeUpdate.sh``` will assign both labels to the local node so that both services will be deployable on it using Docker Swarm.

## Setup With Scripts

To launch, run:

```
./LauchLocal.sh
```

To tear it down, run:

```
./tearDownLocal.sh
```

## Setup Manually

Type :

```
./nodeUpdate.sh
mkdir postgres
docker network create -d overlay --attachable proxy
POSTGRESQL_PASSWORD=1q2w3e4r KEYCLOAK_PASSWORD=1q2w3e4r docker stack deploy -c docker-compose.yml test
```

## How To Access It

From your host, you can access the keycloak endpoints at (you'll need to accept that the certificate is not valid):

```
https://localhost:8443/auth
```

Assuming you followed the directions for a self-signed certificate in the **certificates** directory, you can also access it in your browser without security warnings at:

```
https://dev.chusj-clin-dev.org:8443/auth/
```

When inside one of the containers, you can access the keycloak endpoints at:

```
https://keycloak:8443/auth
http://keycloak:8080/auth
```

Additionally, you'll need to create some users and change the default secrets.