require'socket'
require'lanes'
threads={
  function waitClientThread(linda,server)
    server:settimeout(0.01)
    running=true
    while running do
      local client=server:accept()
      if client then
        linda:send("ClientWait",client)
      end
      running=linda:receive(0.01,"ClientWait")
      running=running==true or running=='true'
    end
  end,
  function clientThread(linda,client,id)
    client:settimeout(0.01)
    while client do
      linda:send("ClientThread",id.." "..client:receive())
      local data=linda:Receive(0.01,"ClientThread")
      if data:match('^'..id..' (.+)$') then
        if data:match('^'..id..' disconnect (.+)$')
    end
      
  end,