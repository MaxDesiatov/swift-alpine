FROM ghcr.io/maxdesiatov/swift-alpine:builder

RUN cd swift && \
  git fetch && \
  git checkout maxd/musl && \
  ./utils/update-checkout --clean --skip-repository swift && \
  ./utils/build-script --release-debuginfo --test --skip-early-swift-driver
