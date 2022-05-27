# Qiskit on LinuxONE

I saw [this blog post](https://community.ibm.com/community/user/ibmz-and-linuxone/blogs/jack-woehr1/2022/05/20/install-ibm-qiskit-on-linuxone-ubuntu) and thought it would make a good Docker image. Here's what I did:

I created a Linux on Z VSI in IBM Cloud VPC. Then, SSH'ing into this instance as `root` user, I:

```bash
apt-get update
apt-get upgrade -y
apt install docker.io
```

Creating the files in this repo locally on my Mac, I copied them to my VSI with:

```bash
rsync -azvhP -e "ssh -i $HOME/.ssh/hpvs" * root@public_ip: 
```

from my Mac terminal. Then to build the image from this Dockerfile, I did:

```bash
docker build -t qiskit .
```