module NaiveCampingRoutes
  
  extend self
  
  def R(url)
    route_lookup = routes
    
    klass = Class.new
    meta  = class << klass; self; end
    meta.send(:define_method, :inherited) do |base|
      raise "Already defined" if route_lookup[url]
      route_lookup[url] = base
    end
    klass
  end
  
  def routes
    @routes ||= {}
  end
  
  def process(url, params={})
    routes[url].new.get(params)
  end
end

module NaiveCampingRoutes
  class Hello < R '/hello'
    def get(params)
      puts "hello #{params[:name]}"
    end
  end
  
  class Goodbye < R '/goodbye'
    def get(params)
      puts "goodbye #{params[:name]}"
    end
  end
end

NaiveCampingRoutes.process('/hello', :name => "greg")
NaiveCampingRoutes.process('/goodbye', :name => "joe")
    
  