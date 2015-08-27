# rubbopot

Visto che la voglia di scrivere in inglese è poca, beccatevi la spiegazione in italiano prima.

## Perché?

Perché posso. Visto che è pieno di gentaglia la fuori, tanto vale vedere cosa gira, no?

## Ma c'è l'honeypot "X"

Fottesega, è una sfida personale.

## È scritta col culoh!!!

Lo so, mica lavoro come programmatore.

# Start facile (per chi ga pressa)

gem install eventmachine
ruby honeypot_server.rb

# Partiamo con la robba seria

Il file principale da lanciare è ruby_honeypot.rb, questo carica i vari moduli presenti in _modules/_ e gestisce le connessioni via EventMachine
* cli.rb: questa è la riga di comando, ma è in TODO l'espansione modulare (quando, non lo so)
* colors.rb: per i colori, eyecandy che al momento non funziona, ci penserò più avanti
* config.rb: file di configurazione, magari sposterò tutto in qualcosa di più intelligente come YAML o JSON
* log.rb: questo logga, è abbastanza completo credo, qualcosa mi inventerò al limite

# TODO

* sistema di login fuffo
* migliorare il wget (exception time!!)
* riscrivere il readme in inglese?
* aggiungere più comandi
* fare un finto filesystem (questo me lo devo inventare un attimo, tanto per girare tra le cartelle, vabbè che ormai vanno a bot, si vedrà)
