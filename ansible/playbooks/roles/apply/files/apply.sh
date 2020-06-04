if [ -f "vars.sh" ]; then
    source vars.sh;
fi

docker stack deploy --prune -c docker-compose.yml $DEPLOYMENT_STACK;