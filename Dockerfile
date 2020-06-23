FROM ubuntu:20.04

MAINTAINER Daniel Gibbs "me@danielgibbs.co.uk"
LABEL org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.vcs-type="Git" \
      org.label-schema.vcs-url="https://github.com/dgibbs64/docker-nxfilter"
RUN apt-get update && \
apt-get upgrade && \
apt-get install -y wget curl default-jre

RUN nxfilterurl=$(curl -s -L https://nxfilter.org/p3/download | grep ".deb" | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | grep "filter-.*deb" | grep -v "mediafire") && \
nxfilterdeb=$(echo ${nxfilterurl} | cut -d'/' -f4-) && \
wget "${nxfilterurl}" && \
apt-get -y install ./"${nxfilterdeb}"

COPY --from=vimagick/sslsplit / /

COPY entrypoint.sh /entrypoint.sh
<<<<<<< HEAD
ENTRYPOINT ["/entrypoint.sh" ]
=======
ENTRYPOINT ["bash","/entrypoint.sh" ]
>>>>>>> 6c9c2d1ba395e6c7263786a746f516e4dc5e26d7

CMD ["/nxfilter/bin/startup.sh"]
