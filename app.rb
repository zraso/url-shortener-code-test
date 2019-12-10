require 'sinatra/base'
require 'json'

class UrlShortener < Sinatra::Base 

  get '/' do
    "Send a post request to shorten your URL"
  end

  post '/' do
    req = JSON.parse(request.body.read)
    { :short_url => 'short_url', :url => req["url"] }.to_json
  end

  run! if app_file == $0
end