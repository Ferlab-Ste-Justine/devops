source config.sh;
#Dump content of Fhir database in ndjson files
(
    cd clin-etl-FHIR;
    ./download.sh;
)

#Upload ndjson files in elasticsearch database
ELASTICSEARCH_SERVICE_ID=$(docker stack services --filter "label=com.docker.stack.image=elasticsearch:6.7.0" -q elasticsearch)
ELASTICSEARCH_CONTAINER_NAME=$(docker service ps --format "{{.Name}}" $ELASTICSEARCH_SERVICE_ID | head -n 1)
ELASTICSEARCH_TASK_ID=$(docker service ps --no-trunc --format "{{.ID}}" $ELASTICSEARCH_SERVICE_ID | head -n 1)
ELASTICSEARCH_ACTUAL_CONTAINER_NAME="$ELASTICSEARCH_CONTAINER_NAME.$ELASTICSEARCH_TASK_ID"
ELASTICSEARCH_CONTAINER_NODE=$(docker service ps --format "{{.Node}}" $ELASTICSEARCH_SERVICE_ID | head -n 1)
(
    cd clin-etl-FHIR;
    docker run -ti --rm -v $(pwd):/app/clin-etl \
    -v ~/.m2:/root/.m2 \
    -v ~/.ivy2:/root/.ivy2 \
    -v ~/.sbt:/root/.sbt \
    -w /app/clin-etl hseeberger/scala-sbt:8u181_2.12.8_1.2.8 \
    sbt clean assembly;
    docker build -t clin-etl-fhir:latest .;
    docker run --rm --network "container:$ELASTICSEARCH_ACTUAL_CONTAINER_NAME" -v "$(pwd)/ndjson:/ndjson" -e "es.nodes=$ELASTICSEARCH_ACTUAL_CONTAINER_NAME" -e "es.port=$ELASTICSEARCH_PORT" clin-etl-fhir:latest;
    docker run --rm -v "$(pwd):/opt" ubuntu:18.04 rm -r /opt/ndjson; 
)