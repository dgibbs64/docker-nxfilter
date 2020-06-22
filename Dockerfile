FROM ubuntu:20.04

MAINTAINER Daniel Gibbs "me@danielgibbs.co.uk"
LABEL org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.vcs-type="Git" \
      org.label-schema.vcs-url="https://github.com/dgibbs64/docker-nxfilter"

# Download nxfilter
RUN echo "$(curl -s -L http://www.nxfilter.org/|grep Download |grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" |grep download|uniq |xargs -n1 curl -s -L |grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" |grep filter-.*zip|grep -v mediafire)"
RUN curl -s -L http://www.nxfilter.org/|grep Download \
  |grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" \
  |grep download|uniq \
  |xargs -n1 curl -s -L \
  |grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" \
  |grep filter-.*zip|grep -v mediafire \
  |xargs -n1 wget -q && mkdir -p /nxfilter \
  && unzip -o nxfil* -d /nxfilter \
  && cp -R /nxfilter/conf /nxfilter/conf-default \
  && chmod +x /nxfilter/bin/startup.sh \
  && rm -f *.zip

COPY --from=vimagick/sslsplit / /

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/nxfilter/bin/startup.sh"]
