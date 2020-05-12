FROM alpine:3.11.3

RUN apk add \
  bash \
  build-base \
  clang \
  clang-dev \
  g++ \
  git \
  linux-headers \
  llvm \
  ninja \
  python \
  py-pip \
  screen \
  htop
RUN pip install six

RUN mkdir -p /root/source

WORKDIR /root/source

RUN git clone https://github.com/apple/swift.git
RUN ./swift/utils/update-checkout --clone
