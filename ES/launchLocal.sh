SWARM=$(docker node ls -q 2>&1 >/dev/null)
if [[ $SWARM = Error* ]]; then
    echo "Docker must be running in swarm mode to execute this script";
    exit 1;
fi

export DATA_DIRECTORY="$(pwd)/esdata";
if [ ! -d "$DATA_DIRECTORY" ]; then
    mkdir -p $DATA_DIRECTORY;
fi

PROXY_NETWORK_EXISTS=$(docker network ls | grep proxy)
if [ -z "$PROXY_NETWORK_EXISTS" ]; then
    docker network create -d overlay --attachable proxy;
fi

docker node update --label-add app_role=elasticsearch $(docker node ls -q);
docker stack deploy -c docker-compose-local.yml elasticsearch;