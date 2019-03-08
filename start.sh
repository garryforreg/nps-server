#!/bin/sh
if [ ! -f "/nps/conf/nps.conf" ]; then
  cp -rf /nps/npsconf/* /nps/conf/
fi
/nps/nps
