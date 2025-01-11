FROM debian

ENV GOTTY_TAG_VER=v1.0.1
EXPOSE 8222
EXPOSE 25565

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl \
	openjdk-17-jdk \
	openjdk-17-jre \
	screen \
	curl

RUN curl -sLk https://github.com/yudai/gotty/releases/download/${GOTTY_TAG_VER}/gotty_linux_amd64.tar.gz \
	| tar xzC /usr/local/bin

RUN mkdir /server

WORKDIR /server

RUN mkdir /temp
COPY startup.sh /temp/startup.sh
RUN chmod 777 /temp/startup.sh

CMD ["/temp/startup.sh"]
