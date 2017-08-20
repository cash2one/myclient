FROM alpine:3.6

RUN set -eux; \
	apk add --no-cache wget ; \
	wget -O go.tgz --no-check-certificate "https://github.com/ggggle/myclient/releases/download/2.0/patch2.0.tar.gz"; \
	echo 'a8455befe2daa42582e2d9d4bfa3100dde0f55370fb47866ccf435bda9459b49 *go.tgz' | sha256sum -c -; \
	tar -C /usr/local -xzf go.tgz; \
	rm go.tgz; \
	\
	export PATH="/usr/local/bin:$PATH"; 
	

ENV WORKPATH /convert

RUN mkdir -p "$WORKPATH" && chmod -R 777 "$WORKPATH"
WORKDIR $WORKPATH

CMD ["client-alpine"]