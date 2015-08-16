# module log 

module LoggingX

class Log
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
  
  def write(data) # write file
    @log.write("# " + Time.now.to_s + " -> " + data)
    @log.flush
  end
  
  def close # close file
    @log.write("## Closing connection at " + Time.now.to_s + "\n\n")
    @log.flush
    @log.close
  end
  
end

end