#!/bin/sh
CAMD_ID=7387
CAMD_NAME="wicardd"
CAMD_BIN=wicardd
INFOFILE_A=ecm0.info
INFOFILE_B=ecm1.info
INFOFILE_C=ecm2.info
INFOFILE_D=ecm3.info
INFOFILE_E=ecm4.info
INFOFILE_F=ecm5.info
INFOFILE_LINES=1111111111000000
REZAPP=0
logger $0 $1
echo $0 $1
remove_tmp () {
rm -rf /tmp/*.info* /tmp/*.tmp*
}

case "$1" in
  start)
  remove_tmp
  /usr/bin/$CAMD_BIN -d -c /etc/wicardd.conf
  ;;
  stop)
  killall -9 $CAMD_BIN 2>/dev/null
  sleep 2
  remove_tmp
  ;;
  *)
  $0 stop
  exit 0
  ;;
esac

exit 0
