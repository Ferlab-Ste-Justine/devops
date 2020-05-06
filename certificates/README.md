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