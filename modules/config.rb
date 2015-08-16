#!/usr/bin/env ruby
$listen = '0.0.0.0'
$port = 2000
$user = "root"
$hostname = "devserver"

## choose your shell
sh = "# "
bash = "#{$user}@#{$hostname}:~# "
busybox = "/ # "
#-----------------
$shellprompt = sh