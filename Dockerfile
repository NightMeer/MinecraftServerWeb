FROM debian:latest

ARG SOFTWARENAME_VER="1.0.0"
ENV GOTTY_TAG_VER=v1.0.1

LABEL base.image="debian:latest"
LABEL dockerfile.version="1"
LABEL software="SoftwareName"
LABEL software.version="${SOFTWARENAME_VER}"
LABEL description="Start Minecraft Server with Web Console"
LABEL website="https://github.com/NightMeer/MinecraftServerWeb"
LABEL license=""
LABEL maintainer="NightMeer"
LABEL maintainer.email="git@nightmeer.de"
#Github Related
LABEL org.opencontainers.image.source="https://github.com/NightMeer/MinecraftServerWeb" 

VOLUME ["/server"]

EXPOSE 8222
EXPOSE 25565

WORKDIR /server

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl \
	openjdk-17-jdk \
	openjdk-17-jre \
	screen \
	curl

RUN curl -sLk https://github.com/yudai/gotty/releases/download/${GOTTY_TAG_VER}/gotty_linux_amd64.tar.gz \
	| tar xzC /usr/local/bin

RUN mkdir /temp
COPY startup.sh /temp/startup.sh
RUN chmod 777 /temp/startup.sh

ENTRYPOINT ["/bin/sh"]
CMD ["-c","/temp/startup.sh"]
