FROM ubuntu:20.04

MAINTAINER Daniel Gibbs "me@danielgibbs.co.uk"
LABEL org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.vcs-type="Git" \
      org.label-schema.vcs-url="https://github.com/dgibbs64/docker-nxfilter"

CMD ["/nxfilter-install.sh"]

COPY --from=vimagick/sslsplit / /

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/nxfilter/bin/startup.sh"]
