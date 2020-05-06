SWARM=$(docker node ls -q 2>&1 >/dev/null)
if [[ $SWARM = Error* ]]; then
    echo "Docker must be running in swarm mode to execute this script";
    exit 1;
fi

PROXY_NETWORK_EXISTS=$(docker network ls | grep proxy)
if [ -z "$PROXY_NETWORK_EXISTS" ]; then
    docker network create -d overlay --attachable proxy;
fi

POSTGRES_DIRECTORY="$(pwd)/postgres";

if [ ! -d "$POSTGRES_DIRECTORY" ]; then
    mkdir -p $POSTGRES_DIRECTORY;
fi

if [ ! -f fullchain.pem ]; then
    (cd ../certificates/self-signed-certificate; ./generate_self_signed.sh);
    cp ../certificates/fullchain.pem .;
    cp ../certificates/privkey.pem .;
fi

./nodeUpdate.sh;
POSTGRESQL_PASSWORD=1q2w3e4r KEYCLOAK_PASSWORD=1q2w3e4r docker stack deploy -c docker-compose.yml keycloak