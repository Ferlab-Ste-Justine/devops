SWARM=$(docker node ls -q 2>&1 >/dev/null)
if [[ $SWARM = Error* ]]; then
    echo "Docker must be running in swarm mode to execute this script";
    exit 1;
fi

LICENSE_NOT_SET=$(cat .env | grep SET_YOUR_LICENSE)
if [ ! -z "$LICENSE_NOT_SET" ]; then
    echo "You have to edit the .env file with your license values. If you are in a shared environment, also take the opportunity to change the password and secret.";
    exit 1;
fi

AIDBOX_NETWORK_EXISTS=$(docker network ls | grep aidbox)
if [ -z "$AIDBOX_NETWORK_EXISTS" ]; then
    docker network create -d overlay --attachable aidbox;
    docker network create -d overlay --attachable aidbox-db;
fi

POSTGRES_DIRECTORY="$(pwd)/pgdata";
if [ ! -d "$POSTGRES_DIRECTORY" ]; then
    mkdir -p $POSTGRES_DIRECTORY;
fi

./nodeUpdate.sh;
(
    export $(cat .env | xargs);
    docker stack deploy -c docker-compose.yml aidbox;
)
