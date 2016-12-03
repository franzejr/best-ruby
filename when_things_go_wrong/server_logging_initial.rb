require "socket"


class Server     

  def initialize
    @server   = TCPServer.new('localhost',port=3333)   
  end

  def *(x, y)
    "#{Float(x) * Float(y)}"
  end

  def /(x, y)
    "#{Float(x) / Float(y)}"
  end

  def handle_request(session)
    action, *args = session.gets.split(/\s/)
    session.puts(send(action, *args))
  end

  def run 
    while session = @server.accept 
      handle_request(session)
    end
  end 

end

Server.new.run
