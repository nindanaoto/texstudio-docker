# texstudio-docker
This project contain Dockerfile for texstudio-docker.

Usage

docker run -it --rm -v $PWD:/home/developer/workspace -v ~/.config/texstudio:/home/developer/.config/texstudio -v /tmp/.X11-unix/:/tmp/.X11-unix -e DISPLAY=$DISPLAY texstudio
