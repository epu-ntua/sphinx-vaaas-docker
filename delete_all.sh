docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi -f $(docker images -q)
docker volume rm -f $(docker volume ls -f "dangling=true")