# About

This script is used to create secrets belonging to aidbox.

# Future Improvements

This script is currently executed manually.  In the future, it should be automatically integrated with the creation of new environments.

Also, this script is currently only used to generate the initial secrets. Once we have identified all the dependent services, we'll adjust the script to also support secret rotation.

# Usage

- Create the following files containing the corresponding secrets:
   **aidbox_root_user**, **aidbox_root_password**,
   **aidbox_admin_user**, **aidbox_admin_password**,
   **aidbox_db_user**, **aidbox_db_password**,
   **aidbox_license_id**, **aidbox_license_key**

- Run:

```
./store.sh
```

- Delete all the files you created. Do not leave them laying around on the server