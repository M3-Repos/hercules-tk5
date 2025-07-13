FROM alpine:3.22 AS builder
LABEL org.opencontainers.image.source="https://github.com/M3-Repos/hercules-tk5"
RUN apk add --no-cache unzip

WORKDIR /tmp
ADD --checksum=sha256:ac343358a5ceeb60b4e009892551b0a376706677f82843b853506c00635a533a https://www.prince-webdesign.nl/images/downloads/mvs-tk5.zip /tmp
RUN <<EOF
unzip mvs-tk5.zip -x "mvs-tk5/hercules/*" "mvs-tk5/doc/*" "mvs-tk5/Packages/*" "mvs-tk5/mvs_osx" "*.bat"
unzip mvs-tk5.zip "mvs-tk5/hercules/httproot/*"
rm mvs-tk5.zip
EOF

FROM ghcr.io/m3-repos/hercules:latest
COPY --from=builder --chown=hercules:hercules /tmp/mvs-tk5 /home/hercules/mvs-tk5
WORKDIR /home/hercules/mvs-tk5
USER hercules

ENV HERCULES_RC="scripts/ipl.rc" HERCULES_CNF="conf/tk5.cnf"
EXPOSE 3270/tcp 8038/tcp

CMD ["hercules"]
