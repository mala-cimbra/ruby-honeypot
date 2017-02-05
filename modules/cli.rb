#!/usr/bin/env ruby
#encoding: utf-8
# module cli
require 'open-uri'

def commandLine(ciemmeddi)
  dirtyCommand = ciemmeddi.split
  cmd = dirtyCommand[0]
  output = case cmd
    when "" then ""
    when "whoami" then "#{$user}\r\n"
    when "hostname" then "#{$hostname}\r\n"

    ## necessita di funzione
    when "id" then checkId($user)
    when "wget" then wget(dirtyCommand[1])

#------------------------
    when "exit" then close_connection_after_writing
    else commandNotFound($shellprompt, cmd)
  end

  output
end

def checkId(user)
  id = Random.rand(1002...1030)
  if user == "root"
    "uid=0(root) gid=0(root) groups=0(root)\r\n"
  else
    "uid=#{id}(#{user}) gid=#{id}(#{user}) groups=#{id}(#{user})\r\n"
  end
end

def commandNotFound(shellprompt, cmd)
  exitString = case shellprompt
    when "sh" then "sh: #{cmd}: not found\r\n"
    when "bash" then "-bash: #{cmd}: command not found\r\n"
    when "busybox" then "sh: #{cmd}: not found\r\n"
    else "command not found\r\n"
  end
end

def wget(url)

  if (url != nil || url != "")
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

def ls(arg)
end

def pwd 
end