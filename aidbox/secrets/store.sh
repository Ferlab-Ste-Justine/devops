SECRETS=( "aidbox_root_user" "aidbox_root_password" "aidbox_admin_user" "aidbox_admin_password" "aidbox_db_user" "aidbox_db_password" "aidbox_license_id" "aidbox_license_key" )

for SECRET in "${SECRETS[@]}"
do
    docker secret create $SECRET $SECRET;
done