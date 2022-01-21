FROM ghcr.io/maxdesiatov/swift-alpine:builder

RUN git pull && \
  ./utils/update-checkout --clean --skip-repository swift && \
  ./utils/build-script --release-debuginfo --test --skip-early-swift-driver
