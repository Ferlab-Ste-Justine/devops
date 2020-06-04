export VERSION=1.1.0
export IMAGE=chusj/ansible-playbooks:$VERSION

docker build -t $IMAGE .;
docker push $IMAGE;