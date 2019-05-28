```
docker service create   --name=viz   --publish=18080:8080/tcp   --constraint=node.role==manager   --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock   dockersamples/visualizer
```