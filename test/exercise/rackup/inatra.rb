module Inatra
  class << self
    @@handlers = {}
    def routes(&block)
    instance_eval(&block)
    puts "******routes/// \n block #{block} \n"
    end


    def call(env)
      puts "!!!env #{env} "
      request_method = env['REQUEST_METHOD'].to_sym.downcase
      path = env['PATH_INFO']
      puts "****method call \n  request #{request_method} path #{path}" 
      puts "!!!!hand  #{@@handlers[request_method][path]}\n rm #{request_method} p #{path} \n  h met #{@@handlers[request_method]} \n #{@@handlers} "
      return [404, {}, ['Not Found']] unless @@handlers[request_method][path]
      @@handlers[request_method][path].call
    end

    def method_missing (method_name,*args,&block)
      puts "met miss met_name #{method_name} args #{args}  block #{block} "
      @@handlers[method_name] ||=  {} 
      @@handlers[method_name][args[0]] = block
      puts "handlers #{@@handlers}"
    end

  end
end
