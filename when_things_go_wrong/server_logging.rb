require "socket"
require "logger"

class StandardError
  def report
    "#{self.class}: #{message}\n#{backtrace.join($/)}"
  end
end

class Server     

  def initialize(logger)
    @logger   = logger
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
    if ["*", "/"].include?(action)
      @logger.info "executing: '#{action}' with #{args.inspect}"
      session.puts(send(action, *args))
    else
      session.puts("Invalid command")
    end
  rescue StandardError => e
    @logger.error(e.report)
    session.puts "Sorry, something went wrong."
  end

  def run 
    while session = @server.accept 
      handle_request(session)
    end
  end 
end

begin 
  logger = Logger.new("development.log")
  host   = Server.new(logger)
  
  host.run
rescue StandardError => e
  logger.fatal(e.report)
  puts "Something seriously bad just happened, exiting"
end
