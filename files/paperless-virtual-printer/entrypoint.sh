#!/bin/bash
set -e

declare -r usermap_original_uid=$(id -u print)
declare -r usermap_original_gid=$(id -g print)
declare -r usermap_new_uid=${USERMAP_UID:-$usermap_original_uid}
declare -r usermap_new_gid=${USERMAP_GID:-${usermap_original_gid:-$usermap_new_uid}}

if [[ ${usermap_new_uid} != "${usermap_original_uid}" ]]; then
	echo "${log_prefix} Mapping UID to $usermap_new_uid"
	usermod --non-unique --uid "${usermap_new_uid}" print
else
	echo "${log_prefix} No UID changes"
fi

if [[ ${usermap_new_gid} != "${usermap_original_gid}" ]]; then
	echo "${log_prefix} Mapping GID to $usermap_new_gid"
	groupmod --non-unique --gid "${usermap_new_gid}" print
else
	echo "${log_prefix} No GID changes"
fi

cat cups-pdf.conf | envsubst > /etc/cups/cups-pdf.conf
cat cupsd.conf | envsubst > /etc/cups/cupsd.conf
cat printers.conf | envsubst > /etc/cups/printers.conf
cat vprint.service | envsubst > /etc/avahi/services/vprint.service
cp /usr/share/ppd/cups-pdf/CUPS-PDF_noopt.ppd /etc/cups/ppd/${PRINTER_ID}.ppd

/usr/sbin/avahi-daemon --daemonize
exec /usr/sbin/cupsd -f
