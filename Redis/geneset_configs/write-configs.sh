export CONFIG_VERSION=1
export CONFIG_NAME=geneset-redis-v${CONFIG_VERSION}
if [ "$1" = "dev" ]; then
    CONFIG_EXISTS=$(docker config ls | grep $CONFIG_NAME)
    #In dev, we overwrite config as a convenience. In production, revision numbers should be incremented
    if [ ! -z "$CONFIG_EXISTS" ]; then
        docker config rm $CONFIG_NAME;
    fi
    cat redis.conf | docker config create $CONFIG_NAME -;
else
    cat redis.conf | docker config create $CONFIG_NAME -;
fi