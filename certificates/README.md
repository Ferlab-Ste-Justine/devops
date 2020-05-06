# About 

Scripts to manage certificates are located here.

# Storing Certificates in Secrets

The **store.sh** script will store your certificates in docker secrets.

It can be composed with the folling environment variables:

CERTIFICATE_DIRECTORY: Directory where certificate files are located. Defaults to the current directory.
PRIVATE_KEY: Name of the private key file. Defaults to privkey.pem.
CERTIFICATE: Name of the certificate file. Defaults to fullchain.pem.
CERTIFICATE_SECRET_PREFIX: Prefix to put before the secret name. No need to put an underscore, it is already added.

The script is idempotent, but not safe, it will overwrite pre-existing secrets with the same name (usually, this is what you want during certificate rotation)

# Generating Self-Signed Certificates

In the local, you can create a mock QA authority and sign a certificate with it.

Run the following:

```
cd self-signed-certificate;
./generate_self_signed.sh;
```

You have two additional manual steps to perform if you wish to use https in your browser without a warning:

- Add the following in your /etc/hosts file:

```
127.0.1.1       dev.chusj-clin-dev.org
```

- Add the CA authority in your browsers. 

For Chrome, go to:

```
Settings > Privacy and Security > Manage Certificates > Authority > Import 
```

And add **self-signed-certificate/ca.pem** to the list.

For Firefox, go to:

```
Preferences > Privacy & Security > View Certificates > Authorities > Import
```

And add **self-signed-certificate/ca.pem** to the list.