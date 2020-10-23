#!/bin/bash

image=rwd1/nextcloud

docker build --cache-from ${image} --tag ${image} .

export myUID=$(id -u)
export myGID=$(id -g)
#xhost +local:docker
docker run -it						\
	--user $myUID:$myGID									\
	--env="DISPLAY=unix$DISPLAY"							\
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"     	\
    --volume="/home/$USER/alternativHome/nextcloud:/home/" \
    --volume="/home/$USER/Nextcloud:/home/ncsync/Nextcloud" \
	--entrypoint sh \
	${image}

exit 0
	--entrypoint sh \
	--entrypoint bash \

