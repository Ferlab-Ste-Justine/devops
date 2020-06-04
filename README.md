![](https://github.com/cr-ste-justine/devops/workflows/Build%20Ansible%20Playbooks%20Image/badge.svg)
![](https://github.com/cr-ste-justine/devops/workflows/Publish%20Ansible%20Playbooks%20Image/badge.svg)

# Devops
Deployments repo - Docker and scripts

## Instructions For Collab

update label of all manager node
```
docker node update --label-add node_role=generic workflow
docker node update --label-add state_anchor=true workflow
docker node update --label-add node_role=generic emma
docker node update --label-add node_role=generic dev-server-1
docker node update --label-add node_role=generic dev-server-3
```

Clone repo to all manager role
into src/
git clone https://github.com/cr-ste-justine/devops.git

## Instructions For Dockerized Local Environment

1. Create a single node docker swarm cluster (if you got a single networking interface, **docker swarm init** should work without having to pass extra arguments)

2. Type the following:

```
docker node update --label-add app_role=generic $(docker node ls -q)
docker node update --label-add state_anchor=true $(docker node ls -q)
```