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