FROM alpine:latest as builder
USER root
RUN apk add unzip && \
adduser -D hercules
USER hercules
WORKDIR /home/hercules

ADD --checksum=sha256:ac343358a5ceeb60b4e009892551b0a376706677f82843b853506c00635a533a --chown=hercules:hercules https://www.prince-webdesign.nl/images/downloads/mvs-tk5.zip /home/hercules
#ADD --chown=hercules:hercules mvs-tk5.zip /home/hercules
RUN unzip mvs-tk5.zip -x "mvs-tk5/hercules/*" "mvs-tk5/doc/*" "mvs-tk5/Packages/*" "mvs-tk5/mvs_osx" "*.bat" && \
rm mvs-tk5.zip

FROM hercules:latest
COPY --from=builder --chown=hercules:hercules /home/hercules/mvs-tk5 /home/hercules/mvs-tk5

EXPOSE 3270/tcp
EXPOSE 8038/tcp
WORKDIR /home/hercules/mvs-tk5
CMD tail -n +38 mvs_ipl | /bin/bash
