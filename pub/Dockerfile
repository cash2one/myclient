FROM alpine:3.7

RUN set -eux; \
	apk add --no-cache wget ; \
	wget -O go.tgz --no-check-certificate "https://github.com/ggggle/myclient/releases/download/pub1.0/patchPub1.0.tgz"; \
	tar -C /usr/local -xzf go.tgz; \
	rm go.tgz; \
	\
	export PATH="/usr/local/bin:$PATH"; 
	

ENV WORKPATH /convert

RUN mkdir -p "$WORKPATH" && chmod -R 777 "$WORKPATH"
WORKDIR $WORKPATH

CMD ["client-alpine"]