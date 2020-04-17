POSTGRES_DIRECTORY="$(pwd)/pgdata";
if [ -d "$POSTGRES_DIRECTORY" ]; then
    ./teardown.sh;
    sudo rm -r pgdata;
    mkdir pgdata;
    export $(cat .env | xargs);
    docker stack deploy -c docker-compose.yml aidbox;
    sleep 60; #Aidbox takes a while to boot, a pool on the service to see if it is up may be a worthwhile refactor
fi

