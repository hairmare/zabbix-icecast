#!/bin/sh

# grab data from zabbix stats url
#
# this also takes care of only requesting the file when needed. h
# eavy lifting is done by some xslt sheets contained in the xslt
# subdir. 
#
# Copyright - 2010 - Lucas Bickel for Radio RaBe
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# CONFIG
STATS_URL=http://stream-01.hq.rabe.ch:8000/admin/stats.xml
STATS_TMP='/tmp/zabbix-icecast-stats.xml'

# load a stats dump from icecast
function load_stats {

	# file is fetched every 30 secs
	max_age=$((`date +%s` - 30))
	
	if [[ `stat -c %Y $STATS_TMP` -lt $max_age ]]; then
		wget -q $STATS_URL -O $STATS_TMP
	fi
}

# main action
load_stats
xsltproc --stringparam mount "$2" "`dirname $0`/xslt/$1.xsl" $STATS_TMP
