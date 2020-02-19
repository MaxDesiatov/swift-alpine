FROM alpine:3.11.3

RUN apk add git cmake llvm clang clang-dev python py-pip ninja bash gcc g++
RUN pip install six

RUN mkdir -p /root/source

WORKDIR /root/source

RUN git clone https://github.com/apple/swift.git
RUN ./swift/utils/update-checkout --clone
