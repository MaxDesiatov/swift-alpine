FROM ghcr.io/maxdesiatov/swift-alpine:builder

RUN ./swift/utils/build-script --release-debuginfo --test --skip-early-swift-driver
