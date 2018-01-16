#!/usr/bin/expect
set password xxxxxxxx
spawn ssh ddns@your.host.net -C -N -g -R localhost:14100:192.168.0.41:80 -o ExitOnForwardFailure=yes -o ServerAliveInterval=60
expect "yes/no"     { send "yes\r"; exp_continue }
expect "password"   { send "$password\r" }
interact
