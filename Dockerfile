FROM ubuntu:20.04

MAINTAINER Daniel Gibbs "cgunzelman@gmail.com"
LABEL org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.vcs-type="Git" \
      org.label-schema.vcs-url="https://github.com/dgibbs64/docker-nxfilter"
      
RUN apt-get update && \
    apt-get upgrade && \
    apt-get install -y default-jre

RUN dpkg -i http://pub.nxfilter.org/nxfilter-4.3.7.3.deb

COPY --from=vimagick/sslsplit / /

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/nxfilter/bin/startup.sh"]
