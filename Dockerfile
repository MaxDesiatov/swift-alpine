FROM ghcr.io/maxdesiatov/swift-alpine:builder

RUN ln -s `which python3` /usr/local/bin/python
RUN ./swift/utils/update-checkout --clean && \
  ./swift/utils/build-script --release-debuginfo --test --skip-early-swift-driver
