FROM ubuntu:14.04

RUN apt-get update && \
  apt-get install -y --reinstall build-essential libncurses-dev rsync unzip bc git python wget && \
  git clone git://git.buildroot.net/buildroot /buildroot && \
  mkdir -p /buildroot/docker/openvpn && \
  wget https://gist.github.com/Croncron85/13146c07be798926694e/raw/c15552b0d8c87a87418f62c35ff50116b20c9538/init.sh -O /buildroot/docker/openvpn/init.sh && \
  wget https://gist.github.com/Croncron85/13146c07be798926694e/raw/c15552b0d8c87a87418f62c35ff50116b20c9538/post.sh -O /buildroot/docker/openvpn/post.sh && \
  chmod +x /buildroot/docker/openvpn/post.sh && \
  wget https://gist.github.com/Croncron85/3e87a87e263fefe28f60/raw/b8a93dd5cf776c6d1ff7e516f3057318eea845fd/.config -O /buildroot/.config && \
  cd /buildroot && \
  make olddefconfig && \
  make clean all && \
  mkdir -p /output/images && \
  mv /buildroot/output/images/rootfs.tar /output/images/rootfs.tar  && \
  apt-get purge -y --auto-remove build-essential libncurses-dev rsync unzip bc git python wget && \
  cd / && \
  rm -rf /buildroot
