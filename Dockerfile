FROM ghcr.io/maxdesiatov/swift-alpine:builder

RUN ./swift/utils/update-checkout --clean && \
  ./swift/utils/build-script --release-debuginfo --test --skip-early-swift-driver
