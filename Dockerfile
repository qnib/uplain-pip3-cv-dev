ARG DOCKER_REGISTRY=docker.io
ARG FROM_IMG_REPO=qnib
ARG FROM_IMG_NAME=uplain-pip3
ARG FROM_IMG_TAG=latest
ARG FROM_IMG_HASH=""

FROM ${DOCKER_REGISTRY}/${FROM_IMG_REPO}/${FROM_IMG_NAME}:${FROM_IMG_TAG}${DOCKER_IMG_HASH}

RUN pip3 install opencv-contrib-python-headless tqdm mxnet gluoncv
RUN pip3 install --upgrade numpy
## Since gluoncv wants to access the home directory
RUN groupadd -g 2000 devA
RUN groupadd -g 3000 devB
RUN useradd --home-dir /home/aliceA -u 2001 --no-create-home -g 2000 aliceA
RUN useradd --home-dir /home/aliceB -u 3001 --no-create-home -g 3000 aliceB
RUN useradd --home-dir /home/bobA -u 2002 --no-create-home -g 2000 bobA
RUN useradd --home-dir /home/bobB -u 3002 --no-create-home -g 3000 bobB
RUN useradd --home-dir /home/charlieA -u 2003 --no-create-home -g 2000 charlieA
RUN useradd --home-dir /home/charlieB -u 3003 --no-create-home -g 3000 charlieB
