# frozen_string_literal: true

require 'sinatra/base'
require 'json'
require './lib/url_entry'

class UrlShortener < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do

    req = check_json(request.body.read)

    # return status 400 if req.is_a? Integer

    if req.key?('url')
      @entry = URLEntry.new(req['url'])
      @entry.json_response
    else
      return status 400
    end


  end

  get '/:url' do
    url = URLEntry.retrieve(params[:url])
    redirect url, 301
  end

  def check_json(request)
    begin
      JSON.parse(request)
    rescue JSON::ParserError
      { }
    end
  end

  run! if app_file == $PROGRAM_NAME
end