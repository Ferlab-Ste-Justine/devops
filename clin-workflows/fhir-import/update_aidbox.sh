source config.sh;
export AIDBOX_AUTH_TOKEN=$(printf $FHIR_CREDENTIAL | base64 -w 0)
(
    cd fhir-import;
    docker build -t fhir-import:latest .;
    docker run --rm --network aidbox -e "AIDBOX_URL=$AIDBOX_URL" -e "AIDBOX_AUTH_TOKEN=$AIDBOX_AUTH_TOKEN" fhir-import:latest /bin/bash -c "/opt/upsert.sh";
)