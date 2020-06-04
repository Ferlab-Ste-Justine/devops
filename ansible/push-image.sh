export VERSION=1.0.0
export IMAGE=chusj/ansible-playbooks:$VERSION

docker build -t $IMAGE .;
docker push $IMAGE;