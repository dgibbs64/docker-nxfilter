
#!/bin/bash
apt-get update
apt-get upgrade
apt-get install -y wget curl default-jre
nxfilterurl=$(curl -s -L https://nxfilter.org/p3/download | grep ".deb" | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | grep filter-.*deb | grep -v mediafire)
nxfilterdeb=$(echo ${nxfilterurl} | cut -d'/' -f4-)
wget "${nxfilterurl}"
dpkg -i "${nxfilterdeb}"
