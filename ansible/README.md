# About

Dockerfile to build an ansible image and use it locally to run ansible playbooks on remote hosts

# Playbooks

- /opt/playbooks/docker.yml: Playbook that installs docker and docker-compose on all remote hosts

# Usage Example

Follow the following steps from your local:

- Create an hosts file for the remote hosts you want to install docker and docker-compose on

- Make sure you have an ssh key allowing you to login remotely on all remote hosts with a user that can run commands as root

- Build the image by running the following from the directory of this README file:

```
docker build -t chu-ansible .
```

- From the directory of your **hosts** file, run:

```
docker run -v $(pwd)/hosts:/opt/hosts \
           -v ~/.ssh:/.ssh chu-ansible \
           -i /opt/hosts \
           -u ubuntu \
           --private-key=/.ssh/id_rsa \
           --become \
           /opt/playbooks/docker.yml
```