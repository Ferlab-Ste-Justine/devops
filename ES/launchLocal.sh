export DATA_DIRECTORY="$(pwd)/esdata";
if [ ! -d "$DATA_DIRECTORY" ]; then
    mkdir -p $DATA_DIRECTORY;
fi

docker-compose -f docker-compose-local.yml up -d;
