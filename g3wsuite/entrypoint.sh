#!/bin/bash
set -e

SETUP_LOCKFILE="/usr/src/g3w-suite/.entrypoint.conf.lock"
if [ ! -f "${SETUP_LOCKFILE}" ]; then
	/usr/local/bin/invoke waitfordbs >> /usr/src/g3w-suite/invoke.log
  echo "waitfordbs task done"

  echo "running migrations"
  /usr/local/bin/invoke migrations >> /usr/src/g3w-suite/invoke.log

  echo "running fixtures"
  /usr/local/bin/invoke fixtures >> /usr/src/g3w-suite/invoke.log

  echo "running collectstatic"
  /usr/local/bin/invoke collectstatic >> /usr/src/g3w-suite/invoke.log

  echo "running movegeodata"
  /usr/local/bin/invoke movegeodata >> /usr/src/g3w-suite/invoke.log

  #echo "running restoredump"
  /usr/local/bin/invoke restoredump
  #>> /usr/src/g3w-suite/invoke.log
  touch ${SETUP_LOCKFILE}
fi



exec $CMD