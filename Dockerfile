FROM ubuntu:14.04

RUN apt-get update && \
  apt-get install -y --reinstall build-essential libncurses-dev rsync unzip bc git python wget && \
  git clone git://git.buildroot.net/buildroot /buildroot && \
  cd /buildroot && \
  mkdir -p docker/openvpn/ && \
  wget https://gist.github.com/Croncron85/13146c07be798926694e#file-init-sh -O docker/openvpn/init.sh && \
  wget https://gist.github.com/Croncron85/13146c07be798926694e#file-post-sh -O docker/openvpn/post.sh && \
  chmod +x docker/openvpn/post.sh && \
  wget https://gist.github.com/Croncron85/3e87a87e263fefe28f60 -O .config && \
  make olddefconfig && \
  make clean all && \
  mkdir -p /output/images && \
  mv /buildroot/output/images/rootfs.tar /output/images/rootfs.tar  && \
  apt-get purge --auto-remove build-essential libncurses-dev rsync unzip bc git python wget && \
  cd / && \
  rm -rf /buildroot
