require 'pry'
require 'sinatra'
require 'json'
require './compile_color'

get '/ping' do
  'pong'
end

post '/color_info', provides: :json do
  body = request.body.read

  if body.empty?
    status 400
  else
    params = JSON.parse(body)
    image = params['image']

    obj_main = RmagickCompileColor.new(image)
    obj_main.compile
    obj_main.display
  end
end
