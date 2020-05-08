module Inatra
  class << self
    @@handlers = {}
    def routes(&block)
      instance_eval(&block)
    end

    def call(env)
      request_method = env['REQUEST_METHOD'].to_sym.downcase
      path = env['PATH_INFO']
      return [404, {}, ['Not Found']] unless @@handlers[request_method][path]

      @@handlers[request_method][path].call
    end

    def method_missing(method_name, *args, &block)
      @@handlers[method_name] ||= {}
      @@handlers[method_name][args[0]] = block
    end
  end
end
