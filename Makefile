NAME := jenkins
REPO := blkpark
TARGET := ${REPO}/${NAME}
DOCKER := ${TARGET}:latest
MNT_POINT := /mnt/jenkins
DOCKER_BIN := /usr/bin/docker

default: build

build:
	docker build -t ${DOCKER} .

run:
	docker run -d --restart=always -p  8081:8080 -p 50000:50000 \
    -u 0 \
    -v ${MNT_POINT}:/var/jenkins_home \
    -v ${MNT_POINT}/tmp:/tmp \
    -v ${DOCKER_BIN}:/usr/bin/docker \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /usr/lib/libdevmapper.so.1.02:/usr/lib/libdevmapper.so.1.02 \
    --name  ${NAME} ${DOCKER}


release:
	docker push ${DOCKER}
