FROM alpine:edge

RUN apk add \
  git \
  cmake \
  curl \
  python2 \
  python3 \
  ninja \
  bash \
  build-base \
  g++ \
  screen \
  htop

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
  python get-pip.py
RUN pip install six

RUN mkdir -p /root/source

WORKDIR /root/source

RUN git clone https://github.com/apple/swift.git
RUN ./swift/utils/update-checkout --clone
