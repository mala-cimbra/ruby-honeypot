#!/usr/bin/env ruby

# file di configurazione
# sposterei tutto in un file YAML o JSON
# per semplicità, ma al momento è così e probabilmente ci resterà

# qui ci sono le impostazioni base
# ascolto, porta, hostname
$listen = '0.0.0.0'
$port = 2000
$hostname = "devserver"

# simulazione della shell
# qui ce ne sono di già pronte
sh = "# "
bash = "#{$user}@#{$hostname}:~# "
busybox = "/ # "

# scelta della shell, gestirsi
# da quelle pronte sopra oppure 
# scrivenere la stringa che la contiene
$shellprompt = sh


# simulazione del login
# TODO: da implementare se mai lo farò
$user = "root"
$passwords = ["root", "admin", "12345"]
