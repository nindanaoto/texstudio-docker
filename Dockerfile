    FROM ubuntu:17.10
     
    RUN apt-get update && apt-get -y upgrade && apt-get install -y apt-utils&& apt-get clean && apt-get install -y texlive-lang-japanese && apt-get clean && apt-get -y install texstudio sudo libgnomeui-0 libcanberra-gtk0 && apt-get clean
     
    # Replace 1000 with your user / group id
    RUN export uid=1000 gid=1000 && \
        mkdir -p /home/developer && \
        echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
        echo "developer:x:${uid}:" >> /etc/group && \
        echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
        chmod 0440 /etc/sudoers.d/developer && \
        chown ${uid}:${gid} -R /home/developer && mkdir -p /home/developer/workspace
     
    USER developer
    ENV HOME /home/developer

    WORKDIR /home/developer/workspace
    CMD /bin/bash -c "texstudio *.tex"
