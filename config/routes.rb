require 'rack/websocket'

class SocketApp < Rack::WebSocket::Application
  def on_open(env)
    puts 'Client connected'
  end
  def on_close(env)
    puts 'Client disconnected'
  end
  def on_message(env, message)
    puts "Got message: #{message}"
    send_data 'Here is your reply'
  end
end

Railsocks::Application.routes.draw do
  match '/demo' => 'Demo#index'

  mount SocketApp.new => "/socket"
end
