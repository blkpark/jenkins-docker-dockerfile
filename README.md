# jenkins-docker

```
docker run -v /vol/jenkins:/var/jenkins_home -v /usr/bin/docker:/usr/bin/docker -v /var/run/docker.sock:/var/run/docker.sock -v /usr/lib/libdevmapper.so.1.02:/usr/lib/libdevmapper.so.1.02 --rm --name jenkins cosmosio/jenkins-docker
```