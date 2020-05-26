# About

This orchestration is to setup an elasticsearch.

# Local Setup

Run the following script just once on your host to adjust the maximum allowed memory maps per process (not the same as maximum memory):

```
sudo ./adjustHost.sh
```

Anytime you want to start elasticsearch, run:

```
./launchLocal.sh
```

Anytime you want to tear it down, run:

```
tearDownLocal.sh
```

If you want to also clear your elasticsearch data, you'll have to do so manually by deleting the **esdata** directory.

# Collab Setup

The infrastructure repo to provision the elasticsearch vms can be found here: https://github.com/cr-ste-justine/collab-infra

To orchestrate the elasticsearch containers, just run:

```
docker stack deploy -c docker-compose.yml elasticsearch
```