Rails.application.routes.draw do
  post '/csbot' => 'csbot#command_parser'
end
