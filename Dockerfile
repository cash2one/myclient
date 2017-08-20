FROM alpine:3.6

RUN set -eux; \
	apk add --no-cache wget ; \
<<<<<<< HEAD
	wget -O go.tgz --no-check-certificate "https://github.com/ggggle/myclient/releases/download/2.0/patch2.0.tar.gz"; \
	echo 'a8455befe2daa42582e2d9d4bfa3100dde0f55370fb47866ccf435bda9459b49 *go.tgz' | sha256sum -c -; \
=======
	wget -O go.tgz --no-check-certificate "https://github.com/ggggle/myclient/releases/download/1.2/patch1.2.tar.gz"; \
	echo '2a70617fab791cc8575eb3f39dc41dc523e82ca8488d4eba3ab08b6a2f1289b2 *go.tgz' | sha256sum -c -; \
>>>>>>> a7c10fb907e41a8422bec538539242e3bd842646
	tar -C /usr/local -xzf go.tgz; \
	rm go.tgz; \
	\
	export PATH="/usr/local/bin:$PATH"; 
	

ENV WORKPATH /convert

RUN mkdir -p "$WORKPATH" && chmod -R 777 "$WORKPATH"
WORKDIR $WORKPATH

CMD ["client-alpine"]