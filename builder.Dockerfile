FROM alpine:edge

RUN apk add \
  bash \
  build-base \
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

COPY clang-test.c .
RUN clang clang-test.c --target=x86_64-unknown-linux-gnu -Wno-unknown-warning-option -Werror=unguarded-availability-new -fno-stack-protector -rdynamic -o test && ./test && rm test clang-test.c

# RUN git clone https://github.com/apple/swift.git
# RUN ./swift/utils/update-checkout --clone
