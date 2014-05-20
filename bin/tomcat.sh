#!/bin/bash
# #################################################
# description: Apache Tomcat start/stop/restart service
# processname: tomcat
# chkconfig: 234 20 80
#
# LOG:
# yyyy/mm/dd [login] [notes]
# 2014/04/23 cgwong v1.0.0 Initial creation from original.
# #################################################

# TC_USER is the default user of tomcat
TC_USER=web ; export TC_USER

# TC wrapper Script path and name
TC_SCRIPT=/www/tomcat/scripts/all_tomcats.sh ; export TC_SCRIPT

if [ ! -f ${TC_SCRIPT} ]; then
  echo "Tomcat script missing: ${TC_SCRIPT}"
  exit 1
fi

status()
{
  /bin/su - ${TC_USER} -c "${TC_SCRIPT} status"
}
 
start()
{
  if [ id ]
  /bin/su - ${TC_USER} -c "${TC_SCRIPT} start" &
}

stop()
{
  /bin/su - ${TC_USER} -c "${TC_SCRIPT} stop"
}

case $1 in
start)
  start ;;
stop)
  stop ;;
#status)
#  status ;;
restart|reload|clean)
  echo "Restarting Tomcat..."
  stop
  start
  ;;
*)
  echo "Usage: $0 {start|stop|restart|reload|clean}"
  exit 1
  ;;
esac

exit $?

# End