FROM rust:1.79.0-slim-bullseye AS builder
RUN apt update -y && \
    apt install --yes --no-install-recommends \
        libssl-dev \
        pkg-config \
        g++ \
        gcc \
        git \
        curl \
        make \
        cmake \
        ca-certificates

WORKDIR /app

COPY Cargo.toml Cargo.lock ./

COPY . .

ENV RUSTFLAGS="--cfg tokio_unstable"

RUN cargo build --release

FROM debian:bullseye-slim
RUN apt update -y && \
    apt install --yes --no-install-recommends \
        libssl-dev \
        ca-certificates

COPY --from=builder /app/target/release/{app} /usr/local/bin/app

ENV RPC_SERVER_PORT=9988

EXPOSE 9988

ENTRYPOINT ["app"]