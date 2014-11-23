This Repo contains some scripts for monitoring an icecast server in zabbix.

This Repo has been downloaded from https://github.com/hairmare/zabbix-icecast

## Dependencies

You will need to satisfy the following deps on the monitored System:

- xsltproc from libxslt
- wget

For Ubuntu do the following:

``sudo apt-get install xsltproc wget``

## Installation

- Copy the scripts dir to ``/usr/local/scripts/zabbix`` and give executions right on ``icestats.sh`` to zabbix user 
Example: ``chown zabbix:zabbix icestats.sh; chmod u+x icestats.sh``

- Change configuration in ``icestats.conf.example`` to suit your needs and rename the file to ``icestats.conf``

- Add UserParameters from ``userparameters.txt`` to your ``zabbix_agentd.conf``

- Restart zabbix agent

## Configuration

You may import ``Template_App_Icecast.xml`` as a starting point. The Template contains monitoring for the streams this was written for.

You can use the following keys for monitoring.

* ``icecast.global.clients``
* ``icecast.global.client_connections``
* ``icecast.global.sources``
* ``icecast.source.listeners[*]``
* ``icecast.source.slow_listeners[*]``

In the ``icecast.source.*`` items the first parameter ($1) is the name of an icecast mountpoint

## Contributors

* [https://github.com/hairmare Lucas Bickel]
* [https://github.com/hecko Marcel Hecko]
* [https://github.com/zetneteork Lukáš Vikto]
