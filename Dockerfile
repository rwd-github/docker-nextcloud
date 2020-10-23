FROM alpine:latest
ARG VCS_REF
ARG BUILD_DATE
ARG buildno
ARG USER=ncsync
ARG USER_UID=1000
ARG USER_GID=1000

ENV USER=$USER \
    USER_UID=$USER_UID \
    USER_GID=$USER_GID


# create group and user
RUN addgroup -g $USER_GID $USER && adduser -G $USER -D -u $USER_UID $USER

# update repositories and install nextcloud-client
RUN apk update && apk add --no-cache \
        nextcloud-client \
        ttf-dejavu \
        xdg-utils firefox \
    && rm -rf /etc/apk/cache

USER $USER
RUN gio mime x-scheme-handler/https org.mozilla.firefox.desktop
RUN gio mime x-scheme-handler/http org.mozilla.firefox.desktop

## add run script
#ADD run.sh /usr/bin/run.sh

#CMD /usr/bin/run.sh

ENTRYPOINT nextcloud
