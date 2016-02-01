FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y --reinstall build-essential libncurses-dev rsync unzip bc git python wget

RUN git clone git://git.buildroot.net/buildroot /buildroot
WORKDIR /buildroot

RUN make clean all 2>&1

RUN mkdir -p docker/openvpn/
RUN wget https://gist.github.com/Croncron85/13146c07be798926694e#file-init-sh -O docker/openvpn/init.sh
RUN wget https://gist.github.com/Croncron85/13146c07be798926694e#file-post-sh -O docker/openvpn/post.sh
RUN chmod +x docker/openvpn/post.sh

RUN wget https://gist.github.com/Croncron85/3e87a87e263fefe28f60 -O .config
RUN make olddefconfig
RUN make

RUN ln -s /buildroot/output/images/rootfs.tar /rootfs.tar
