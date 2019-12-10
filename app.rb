# frozen_string_literal: true

require 'sinatra/base'
require 'json'
require './lib/url_entry'

class UrlShortener < Sinatra::Base
  get '/' do
    'Send a post request to shorten your URL'
  end

  post '/' do
    req = JSON.parse(request.body.read)
    @entry = URLEntry.new(req['url'])
    @entry.json_response
  end

  run! if app_file == $PROGRAM_NAME
end
