#!/usr/bin/env ruby
# require delle gemme di base
require 'eventmachine'
require 'pp' # questo è per debug

# moduli presenti nella cartella modules
# ho anche fatto la funzione per il caricamento dinamico
# magari l'aggiornerò
require './modules/cli.rb'
require './modules/log.rb'
require './modules/config.rb'
require './modules/colors.rb'

# modulo honeypot
# qui comincia
module HoneyServer

    # magia di eventmachine
    def post_init

        # qua becca l'host remoto che tenta di inculare il server
        @remotehost = Socket.unpack_sockaddr_in(get_peername).reverse
        puts "Client connected! - #{@remotehost[0]} - #{Time.now}"

        # e si fa partire il sistema di log
        @logging = LoggingX::Log.new(@remotehost)
        send_prompt
    end

    # magia di eventmachine di quando riceve dati
    def receive_data(data)

        # scrive nel file di log
        @logging.write(data)

        # e risponde al comando inviato ricevuto
        send_data(commandLine(data.chomp!))

        # manda il prompt
        send_prompt
    end

    # magia di eventmachine alla disconnessione
    def unbind
        puts "Client disconnected: #{@remotehost[0]} - #{Time.now}"

        # chiude il file di log
        @logging.close
    end

    # manda il prompt
    def send_prompt
        send_data($shellprompt)
    end
end


begin		# L'unico errore che mai becca è l'interruzione con CTRL + C
    EventMachine::run do

        # magia di eventmachine fa partire il server
        EventMachine::start_server $listen, $port, HoneyServer
        puts "Started HoneyServer on #{$listen}:#{$port}..."

    end
rescue Interrupt #cath dell'interrupt e chiude senza gli errori
    puts "\nCTRL+C Detected! Closing now!"
end
