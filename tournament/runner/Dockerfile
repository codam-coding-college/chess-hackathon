FROM ubuntu:25.04 AS cutechess

RUN set -ex \
	&& apt update -y && apt upgrade -y \
	&& apt install -y g++ cmake make qtbase5-dev libqt5svg5-dev git

RUN set -ex \
	&& git clone --depth 1 https://github.com/cutechess/cutechess.git \
	&& mkdir /cutechess/build

WORKDIR /cutechess/build
RUN set -ex \
	&& cmake .. -DCMAKE_BUILD_TYPE=Release \
	&& cmake --build . -j8 \
	&& cp cutechess-cli /usr/local/bin

FROM rust:slim-bullseye AS rust

RUN set -ex && rustup install nightly

FROM ubuntu:25.04

RUN set -ex && \
	apt update -y && apt upgrade -y && \
	apt install -y gcc clang python-is-python3 g++ make cmake \
	llvm-bolt parallel lftp

RUN set -ex \
	&& apt update -y && apt upgrade -y \
	&& apt install -y --no-install-recommends qtbase5-dev sudo git

COPY --from=rust /usr/local/cargo /usr/local/cargo
COPY --from=rust /usr/local/rustup /usr/local/rustup
COPY --from=cutechess /usr/local/bin/cutechess-cli /usr/local/bin

ENV PATH="$PATH:/usr/local/rustup/bin:/usr/local/cargo/bin"

ENV RUSTUP_HOME=/usr/local/rustup
ENV CARGO_HOME=/usr/local/cargo

RUN useradd --no-create-home -s /sbin/nologin --user-group bot \
	&& useradd --no-create-home -s /bin/bash --user-group white \
	&& useradd --no-create-home -s /bin/bash --user-group black

RUN git clone --depth=2 https://github.com/codam-coding-college/chess-hackathon.git /root/chess-hackathon

RUN make -C /root/chess-hackathon/example

COPY . /root
COPY tools/ /tools

#ENTRYPOINT [ "/root/start.sh" ]
