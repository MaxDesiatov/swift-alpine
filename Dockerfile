FROM ghcr.io/maxdesiatov/swift-alpine:builder

RUN cd swift && \
  git pull && \
  ./utils/update-checkout --clean --skip-repository swift && \
  ./utils/build-script --release --test --skip-early-swift-driver
