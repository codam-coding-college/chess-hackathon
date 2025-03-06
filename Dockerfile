FROM rust:slim-bullseye AS rust
RUN set -ex && rustup install nightly

FROM ubuntu:25.04

COPY --from=rust /usr/local/cargo /usr/local/cargo
COPY --from=rust /usr/local/rustup /usr/local/rustup

RUN set -ex && \
	apt update -y && apt upgrade -y && \
	apt install -y gcc clang python-is-python3 g++ make cmake \
	llvm-bolt

ENV PATH="$PATH:/usr/local/rustup/bin:/usr/local/cargo/bin"

ENV RUSTUP_HOME=/usr/local/rustup
ENV CARGO_HOME=/usr/local/cargo

COPY tools/ /tools
