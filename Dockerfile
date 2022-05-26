FROM ubuntu:20.04

WORKDIR /home/qiskit/

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y python3-pandas \
                        python3-jupyter \
                        python3-notebook \
                        python3-h5py \
                        python3.8-venv \
                        cmake \
                        ninja-build \
                        python3-scipy \
                        python-numpy \
                        python3.8-dev \
                        lapack \
                        libblas \
                        liblas \
                        liblapack \
                        libblas64-dev \
                        libblas-dev \
                        libopenblas \
                        libopenblas-dev \
                        gfortran \
                        cython3 \
                        python3-sklearn \
                        libxml2  \
                        libxslt1-dev

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN python3 -m venv qrel_venv --system-site-packages && \
    . qrel_venv/bin/activate