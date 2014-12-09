FROM ubuntu:trusty
MAINTAINER Mike Purvis

ENV DEBIAN_FRONTEND noninteractive
ENV BUILDBOT_CREATED dec_3_2014

# Install build, webserver, apt management stuff.
RUN apt-get update
RUN apt-get install -q -y --no-install-recommends \
  python-pip python-dev python-empy build-essential git ssh \
  reprepro cowbuilder debootstrap devscripts git-buildpackage \
  fakeroot debhelper debmirror nginx openssl

# Install buildbot itself.
RUN pip install rosdistro buildbot buildbot-slave

# Insert buildbot master configuration from this repo, and set up the PATH.
ADD . /buildbot-ros
ADD ./conf/pbuilderrc /root/.pbuilderrc
ENV PATH /buildbot-ros/scripts:$PATH

# Nginx is the package server and a reverse-proxy to Buildbot web UI.
EXPOSE 80

# Some miscellaneous configuration; things you might want to override.
ENV REPO_DIR /building
ENV REPO_NAME ExampleCo
ENV NUM_BUILDSLAVES 2

# You probably want to connect this externally to persist the built packages.
VOLUME /building

CMD run_container
