# About

Orchestration to launch aidbox in an environment.

# Usage

## Edit the Configuration

Edit the **.env** file and put your aidbox license values.

If you are in a non-local environment, also take the opportunity to change the password and secret.

## Launch

Run the following to launch aidbox containers in your environment:

```
./launch.sh
```

## Teardown

Run the following to clear aidbox containers in your environment:

```
./teardown
```

Note that if you also want to clear your database data, you'll have to delete the **pgdata** directory.

## Wiping Out Database

To wipe out your database and start fresh, run the **wipe_db.sh** script.

To be used outside of production only.
