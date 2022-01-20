FROM alpine:3.13

RUN apk add \
  bash \
  build-base \
  git \
  cmake \
  curl \
  gcc \
  gcompat \
  g++ \
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
