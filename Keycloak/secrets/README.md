# About

This script is used to create secrets belonging to Keycloak.

# Future Improvements

This script is currently executed manually.  In the future, it should be automatically integrated with the creation of new environments.

Also, this script is currently only used to generate the initial secrets. Once we have identified all the dependent services, we'll adjust the script to also support secret rotation.

# Usage

- Create the following files containing the corresponding secrets:,
   **keycloak_db_user**, **keycloak_db_password**,
   **keycloak_admin_user**, **keycloak_admin_password**,
   **keycloak_clin_client_secret**

- Run:

```
./store.sh
```

- Delete all the files you created. Do not leave them laying around on the server