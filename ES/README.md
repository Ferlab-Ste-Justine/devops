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

# Reminder For Collab Setup

```
on each docker box
sudo sysctl -w vm.max_map_count=262144
and
sudo nano /etc/sysctl.conf <<
#Added by FL to be able to run elasticsearch in docker container
vm.max_map_count=262144

mkdir /usr/share/elasticsearch/data
chmod 0577 /usr/share/elasticsearch/data

docker swarm init...
docker swarm join ...
./nodeUpdate.sh
docker stack deploy -c docker-compose.yml clin

```