# Puppet-profiler

Find out what's making your Puppet runs so bloody slow!

## Installation

    gem install puppet-profiler

## Generating a report

Just run the puppet-profiler command and wait

    puppet-profiler

It'll eventually return a report of the slowest resources in your manifest for
this host.  This gives you a good idea of where to start optimising.

    Top 5 Puppet resources by runtime
    =================================
    
     0.78s - Edit_grub_for_serial[serialconsole]
     0.55s - File[/usr/share/logstash/outputs]
     0.35s - File[/etc/nginx/common]
     0.35s - Service[haproxy]
     0.34s - Exec[accept_sun_dlj]
