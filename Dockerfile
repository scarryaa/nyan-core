FROM rust:1.67 as builder
WORKDIR /musicnya-desktop/libs/nyan_core
COPY . .
RUN cargo install --path .

FROM debian:bullseye-slim
RUN rm -rf /var/lib/apt/lists/*
COPY --from=builder /musicnya-desktop/libs/nyan_core /usr/local/bin/nyan_core
CMD ["nyan_core"]
