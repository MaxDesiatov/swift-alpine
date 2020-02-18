FROM alpine:3.11.3

RUN apk add git cmake llvm clang python py-pip ninja bash gcc g++
RUN pip install six

RUN mkdir -p /root/source

WORKDIR /root/source

RUN pwd && ls
RUN git clone https://github.com/swift/swift.git
RUN ./swift/utils/update-checkout --clone
RUN ./swift/utils/build-script --release-debuginfo
