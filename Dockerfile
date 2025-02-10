FROM ubuntu:25.04

RUN set -ex && \
	apt update -y && apt upgrade -y && \
	apt install -y gcc clang python-is-python3 g++ make cmake \
	llvm-bolt

RUN set -ex && \
	apt update -y && apt upgrade -y && \
	apt install -y rustup && \
	rustup default stable && \
	rustup install nightly
