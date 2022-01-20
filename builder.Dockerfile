FROM alpine:edge

RUN apk add \
  bash \
  git \
  clang \
  clang-dev \
  cmake \
  curl \
  gcc \
  g++ \
  musl-dev \
  ninja \
  build-base \
  python3 \
  screen \
  htop

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
  python3 get-pip.py
RUN pip install six

RUN mkdir -p /root/source

WORKDIR /root/source

RUN git clone https://github.com/apple/swift.git
RUN ./swift/utils/update-checkout --clone
