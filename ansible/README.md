# About

Dockerfile to build an ansible image and use it to run playbooks on remote hosts

# Playbooks

- /opt/playbooks/docker.yml: Playbook that installs docker and docker-compose on all hosts

# Usage Example


From the directory of this image:

```
docker build -t chu-ansible .
```

From your hosts file directory:

```
docker run -v $(pwd)/hosts:/opt/hosts \
           -v ~/.ssh:/.ssh chu-ansible \
           -i /opt/hosts \
           -u ubuntu \
           --private-key=/.ssh/id_rsa \
           --become \
           /opt/playbooks/docker.yml
```