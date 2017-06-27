FROM alpine:3.6

RUN set -eux; \
	apk add --no-cache wget ; \
	wget -O go.tgz --no-check-certificate "https://github.com/ggggle/myclient/releases/download/1.2/patch1.2.tar.gz"; \
	echo '2a70617fab791cc8575eb3f39dc41dc523e82ca8488d4eba3ab08b6a2f1289b2 *go.tgz' | sha256sum -c -; \
	tar -C /usr/local -xzf go.tgz; \
	rm go.tgz; \
	\
	export PATH="/usr/local/bin:$PATH"; 
	

ENV WORKPATH /convert

RUN mkdir -p "$WORKPATH" && chmod -R 777 "$WORKPATH"
WORKDIR $WORKPATH

CMD ["client-alpine"]