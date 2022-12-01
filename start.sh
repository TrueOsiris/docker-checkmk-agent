#!/bin/bash
echo "Executing start.sh ..."
echo "Stopping xinetd ..."
service xinetd stop 2>&1


x=/etc/xinetd.d/checkmk-agent
ap=$AGENTPACKAGE
i=$INSTALLED
if [ -z $x ]; then
	echo "xinetd.d file for checkmk does not exist. creating $x."
	echo "service check_mk" > $x
	echo "{" >> $x
	echo "	type           = UNLISTED" >> $x
	echo "	port           = 6556" >> $x
	echo "	socket_type    = stream" >> $x
	echo "	protocol       = tcp" >> $x
	echo "	wait           = no" >> $x
	echo "	user           = root" >> $x
	echo "	server         = /usr/bin/check_mk_agent" >> $x
	echo "	#only_from      = 10.10.12.2" >> $x
	echo "	disable        = no" >> $x
	echo "}" >> $x
fi
echo "agentpackage source = $ap"
if [ ! -e "/install_packages/agentpackage.deb" ]; then
	curl -v "$ap" -o "/install_packages/agentpackage.deb"
fi
echo "installed = $i"
if [ $i == "FALSE" ]; then
	dpkg -i /install_packages/agentpackage.deb
fi
service xinetd start 2>&1
#/usr/sbin/xinetd -filelog /var/log/xinetd2.log -stayalive
