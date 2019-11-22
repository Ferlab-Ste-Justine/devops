# About

Dockerfile to build an ansible image and use it locally to run ansible playbooks on remote hosts

# Playbooks

- /opt/playbooks/docker.yml: Playbook that installs docker and docker-compose on all remote hosts
- /opt/playbooks/letsencrypt.yml: Generate a letsencrypt certificate on a remote host
- /opt/playbooks/haproxy.yml: Setting a dockerized reverse-proxy making use of letsencrypt certificates
# Usage Example

Follow the following steps from your local:

- Create an hosts file for the remote hosts you want to install docker and docker-compose on

- Make sure you have an ssh key allowing you to login remotely on all remote hosts with a user that can run commands as root

- Build the image by running the following from the directory of this README file:

```
docker build -t chu-ansible .
```

To install **docker** and **docker-compose** on the remote hosts:

- From the directory of your **hosts** file, run:

```
docker run -v $(pwd)/hosts:/opt/hosts \
           -v ~/.ssh:/.ssh \
           chu-ansible \
           -i /opt/hosts \
           -u ubuntu \
           --private-key=/.ssh/id_rsa \
           --become \
           /opt/playbooks/docker.yml
```

To setup a certificate on the remote hosts (if a certificate is present at the **letsencrypt** directory, it will be uploaded remotely, else a new certificate will be created remotely and downloaded):

```
docker run -v $(pwd)/hosts:/opt/hosts \
           -v ~/.ssh:/.ssh \
           -v $(pwd):/opt/letsencrypt \
           chu-ansible \
           -i /opt/hosts \
           -u ubuntu \
           --private-key=/.ssh/id_rsa \
           --become \
           /opt/playbooks/letsencrypt.yml \
           --extra-vars "letsencrypt_email=some@email.com letsencrypt_domain=some.domain.com"
```

To run an haproxy container instance with the certificates you just generated running on host network:

```
docker run -v $(pwd)/hosts:/opt/hosts \
           -v ~/.ssh:/.ssh \
           -v $(pwd)/haproxy.cfg:/opt/haproxy/haproxy.cfg \
           chu-ansible \
           -i /opt/hosts \
           -u ubuntu \
           --private-key=/.ssh/id_rsa \
           --become \
           /opt/playbooks/haproxy.yml \
           --extra-vars "haproxy_network_mode=host haproxy_networks=[] haproxy_exposed_ports=[] letsencrypt_domain=some.domain.com"
```