#!/usr/bin/env ruby
$listen = '0.0.0.0'
$port = 2000
$hostname = "devserver"

## choose your shell
sh = "# "
bash = "#{$user}@#{$hostname}:~# "
busybox = "/ # "
#-----------------
$shellprompt = sh

## login credentials
$user = "root"
$passwords = ["root", "admin", "12345"]