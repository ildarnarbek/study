Inatra.routes do
  get '/hello' do
    puts "******get hello"
    [200, {}, ['Hello World']]
  end

  get '/ping' do
    puts "******get ping"
    [200, {}, ['PONG']]
  end

  post '/bye' do
    puts "******post bye"
    [200, {}, ['Bye Bye']]
  end
end
