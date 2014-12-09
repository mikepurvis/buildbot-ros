SSH Key
=======

If you'd like your buildbot to be able to access private repositories or
a private rosdistro, create `id_rsa` and `id_rsa.pub` in this folder, and
add the public key to your Github or Bitbucket account.

You can add these files by forking the repo and adding them to the fork,
or you can just volume-in the keys path using Docker.

