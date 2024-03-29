FROM alpine:edge

RUN apk add \
  bash \
  build-base \
  git \
  cmake \
  curl \
  gcc \
  g++ \
  libatomic \
  libgcc \
  linux-headers \
  musl-dev \
  ninja \
  build-base \
  python3 \
  screen \
  htop

RUN ln -s `which python3` /usr/local/bin/python
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
  python get-pip.py
RUN pip install six

RUN mkdir -p /root/source

WORKDIR /root/source

RUN git clone https://github.com/apple/swift.git
RUN ./swift/utils/update-checkout --clone
RUN cd swift && \
  git fetch && \
  git checkout maxd/musl
  