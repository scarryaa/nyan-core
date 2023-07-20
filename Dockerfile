FROM rust:1.67 as builder
WORKDIR /
COPY . .
RUN cargo install --path .

FROM debian:bullseye-slim
RUN rm -rf /var/lib/apt/lists/*
COPY --from=builder / /
CMD ["nyan_core"]
