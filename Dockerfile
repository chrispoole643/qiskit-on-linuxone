FROM ubuntu

WORKDIR /home/qiskit/

ENV TZ="America/Toronto"    

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/America/Toronto /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get install -y python3-pandas \
                       python3-jupyter-core \
                       python3-notebook \
                       python3-h5py \
                       python3-venv \
                       python3-pip \
                       cmake \
                       ninja-build \
                       python3-scipy \
                       python3-numpy \
                       python3-dev \
                       liblapack-dev \
                       libblas-dev \
                       libblas3 \
                       libopenblas-dev \
                       libopenblas-base \
                       gfortran \
                       cython3 \
                       python3-sklearn \
                       libxml2  \
                       libxslt1-dev

COPY requirements.txt ./
RUN pip3 install --upgrade pip && \
#RUN pip3 install --no-cache-dir -r requirements.txt
#RUN python3 -m venv qrel_venv --system-site-packages && \
#    . qrel_venv/bin/activate