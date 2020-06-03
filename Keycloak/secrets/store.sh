SECRETS=( "keycloak_db_user" "keycloak_db_password" "keycloak_admin_user" "keycloak_admin_password" "keycloak_clin_client_secret" )

for SECRET in "${SECRETS[@]}"
do
    docker secret create $SECRET $SECRET;
done