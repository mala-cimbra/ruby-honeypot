#!/usr/bin/env ruby
  require 'eventmachine'
  require 'pp'
  
require './modules/cli.rb'
require './modules/log.rb'
require './modules/config.rb'
require './modules/colors.rb'

module HoneyServer
  
  def post_init
    @remotehost = Socket.unpack_sockaddr_in(get_peername).reverse
    puts "Client connected! - #{@remotehost[0]} - #{Time.now}"
    @logging = LoggingX::Log.new(@remotehost)
    send_prompt
  end
  
  def receive_data(data)
    @logging.write(data)
    send_data(bash(data.chomp!))
    send_prompt
  end
  
  def unbind
    puts "Client disconnected: #{@remotehost[0]} - #{Time.now}"
    @logging.close
  end
  
  def send_prompt
    send_data($shellprompt)
  end
end


begin		# Error handling
EventMachine::run do
  
  EventMachine::start_server $listen, $port, HoneyServer
  puts "Started HoneyServer on #{$listen}:#{$port}..."

end
rescue Interrupt
  puts "\nCTRL+C Detected! Closing now!"
end