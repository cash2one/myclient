FROM alpine:3.6

RUN set -eux; \
	apk add --no-cache wget ; \
	wget -O go.tgz --no-check-certificate "https://github.com/ggggle/myclient/releases/download/1.1/patch1.1.tar.gz"; \
	echo '332597666cac0fef073d0b8b51a036f4f0017b574a50fa866d1f617cab93d62a *go.tgz' | sha256sum -c -; \
	tar -C /usr/local -xzf go.tgz; \
	rm go.tgz; \
	\
	export PATH="/usr/local/bin:$PATH"; 
	

ENV WORKPATH /convert

RUN mkdir -p "$WORKPATH" && chmod -R 777 "$WORKPATH"
WORKDIR $WORKPATH

CMD ["client-alpine"]