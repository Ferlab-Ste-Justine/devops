SWARM=$(docker node ls -q 2>&1 >/dev/null)
if [[ $SWARM = Error* ]]; then
    echo "Docker must be running in swarm mode to execute this script";
    exit 1;
fi

PROXY_NETWORK_EXISTS=$(docker network ls | grep proxy)
if [ -z "$PROXY_NETWORK_EXISTS" ]; then
    docker network create -d overlay --attachable proxy;
fi

ES7_NETWORK_EXISTS=$(docker network ls | grep elasticsearch7-internal)
if [ -z "$ES7_NETWORK_EXISTS" ]; then
    docker network create -d overlay --attachable elasticsearch7-internal;
fi


export DATA_DIRECTORY="/home/ubuntu/es7data";
if [ ! -d "$DATA_DIRECTORY" ]; then
    mkdir -p $DATA_DIRECTORY;
fi

docker stack deploy -c docker-compose.yml elasticsearch7;