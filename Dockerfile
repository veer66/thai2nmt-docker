FROM nvidia/cuda:11.0-devel
ENV LANG=C.UTF-8
ENV TZ=Asia/Bangkok
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
RUN echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y python3-dev python3-pip git cmake build-essential pkg-config libgoogle-perftools-dev cython3
RUN git clone https://github.com/vistec-AI/thai2nmt.git
WORKDIR /thai2nmt
RUN pip3 install numpy==1.18.5
RUN pip3 install -r requirements.txt
RUN ln -s /usr/bin/pip3 /usr/local/bin/pip
RUN bash scripts/install_fairseq.sh y
RUN bash scripts/install_sentencepiece.sh

