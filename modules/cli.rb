#!/usr/bin/env ruby
#encoding: utf-8
# module cli
  

def bash(ciemmeddi)
  cmd = ciemmeddi.split[0]
  output = case cmd
    when "" then ""
    when "whoami" then "#{$user}\r\n"
    when "hostname" then "#{$hostname}\r\n"

    ## necessita di funzione
    when "id" then checkId($user)

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

def ls(arg)
  
  #case
  
end

def pwd
  
end