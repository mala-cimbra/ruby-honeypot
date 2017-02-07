#!/usr/bin/
#env ruby
# encoding: utf-8
# module cli
require 'open-uri'

# gestione della riga di comando
# prende la riga che spara il bot/coglionazzio
# la pulisce da eventuali spazi
# prende il primo indice [0]
# e la processa
#
# in divisione ci sono i comandi un po'
# più elaborati che necessitano di una funzione
# apposta

def commandLine(ciemmeddi)
    dirtyCommand = ciemmeddi.split
    cmd = dirtyCommand[0]
    case cmd
    when "" then ""
    when nil then ""
    when "whoami" then "#{$user}\r\n"
    when "hostname" then "#{$hostname}\r\n"

        ## necessita di funzione
    when "id" then checkId($user)
    when "wget" then wget(dirtyCommand[1])

        #------------------------
    when "exit" then close_connection_after_writing
    else commandNotFound($shellprompt, cmd)
    end
end

# comando checkId
# ---------------
# (che poi si prende la configurazione da config.rb

def checkId(user)
    id = Random.rand(1002...1030)
    if user == "root"
        "uid=0(root) gid=0(root) groups=0(root)\r\n"
    else
        "uid=#{id}(#{user}) gid=#{id}(#{user}) groups=#{id}(#{user})\r\n"
    end
end

# comando errato
# --------------
# fa un controllo della configurazione
# e agisce di conseguenza

def commandNotFound(shellprompt, cmd)
    case shellprompt
    when "sh" then "sh: #{cmd}: not found\r\n"
    when "bash" then "-bash: #{cmd}: command not found\r\n"
    when "busybox" then "sh: #{cmd}: not found\r\n"
    else "command not found\r\n"
    end
end

# comando wget
# ------------
# simula wget, per cose semplici funziona, ma se ci sono degli argomenti
# bisogna macchinarci, i bot e la gente è stronza.
# TODO: da lavorarci se mai lo farò

def wget(url)
    if (url != nil)
        safeUrl = URI.parse(url)

        "--#{Time.now}-- #{url}"
        File.open(File.join(Dir.pwd, "wget-dl", safeUrl.request_uri.split("/").last), "w+") do |saved_file|
            # the following "open" is provided by open-uri
            open(url, "r") do |read_file|
                saved_file.write(read_file.read)
            end
        end
        """Connecting to #{url} (#{safeUrl.hostname})|#{}|:#{safeUrl.port}... connected.
HTTP request send... 200 OK
Saving in: #{safeUrl.request_uri.split("/").last}
[ <#{"=" * Random.rand(1...40)}>   ] #{Random.rand(10002...50000)}      --.-K/s   in #{Random.rand(0.1...9.8).round(2)}s
#{Time.now} (#{Random.rand(95...653)} KB/s) - \"#{safeUrl.request_uri.split("/").last}\" saved\r\n"""
    else
        """wget: missing URL
Usage: wget [URL]...\r\n"""
    end

end

# comando ls
# ----------
# TODO: simulare un filesystem

def ls(arg)
end

# comando pwd
# -----------
# da simulare in concomitanza di ls

def pwd 
end
