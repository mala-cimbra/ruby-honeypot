#!/usr/bin/env ruby 

# MODULO DI LOG
# questo è il modulo che logga cosa fanno i bot/stronzi
# che tentano di fotterti il server
# lo reputo abbastanza completo,  c'è sempre da migliorare

module LoggingX
    # classe Log
    # avrei potuto fare una classe log direttamente
    # ma in versione modulo è già più espandibile
    # oggettivamente modulare!
    class Log
        # inizializza le variabili per la classe
        # basta l'host remoto
        # poi il resto se lo tira su da solo
        # l'unica cosa che sarebbe bella da aggiungere è un sistema di whois così
        # so da dove arriva lo stronzo
        def initialize(remotehost)
            t = Time.now
            remote_ip = remotehost[0].to_s

            date = t.year.to_s + "-" + t.month.to_s + "-" + t.day.to_s
            hour = t.hour.to_s + ":" + t.min.to_s + ":" + t.sec.to_s

            filename = remote_ip + "---" + date + ".txt"

            @log = File.new("./logs/#{filename}", "a")
            @log.write("#################\n")
            @log.write("## Log started on #{date} at #{hour}\n")
            @log.write("## IP: #{remote_ip}\n")
            @log.write("###### Command List:\n")
            @log.flush
        end
        
        # scrive nel log
        # flusha ogni volta il file per non avere problemi
        # di scrittura in attesa
        def write(data) # write file
            @log.write("# " + Time.now.to_s + " -> " + data)
            @log.flush
        end

        # chiusura del file e quindi della connessione
        def close # close file
            @log.write("## Closing connection at " + Time.now.to_s + "\n\n")
            @log.flush
            @log.close
        end

    end

end
