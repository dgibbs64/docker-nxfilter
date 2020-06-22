#!/bin/bash

if [ ! -f "/nxfilter/conf/cfg.default" ]; then
  cp -a /nxfilter/conf-default/. /nxfilter/conf/
fi
systemctl start nxfilter
