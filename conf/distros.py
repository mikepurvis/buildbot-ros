# This file contains the configuration for Buildbot-ROS's apt repos.
# If deploying directly from the public container, use the volume
# function to replace this file with your own configuration, or just
# add an env var to override the repo name.

import os

dists=["precise", "trusty"]
name=os.getenv("REPO_NAME")
arches=["i386", "amd64"]
key=os.getenv("SIGNING_KEY_ID")
