# frozen_string_literal: true

require 'sinatra/base'
require 'json'
require './lib/url_entry'

class UrlShortener < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    req = JSON.parse(request.body.read)
    @entry = URLEntry.new(req['url'])
    @entry.json_response
  end

  get '/:url' do
    url = URLEntry.retrieve(params[:url])
    redirect url, 301
  end

  run! if app_file == $PROGRAM_NAME
end
