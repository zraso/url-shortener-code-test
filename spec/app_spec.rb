# frozen_string_literal: true

require 'spec_helper'

describe UrlShortener do
  include Rack::Test::Methods

  let (:app) { UrlShortener.new }

  context 'GET /' do
    it 'responds status 200 OK' do
      get '/'
      expect(last_response.status).to eq 200
    end
  end

  context 'POST /' do
    it 'returns ok' do
      post '/', params: { url: 'hello' }
      expect(last_response.body).to include 'hello'
    end
  end

  context 'GET /:url' do
    it 'returns status 200' do
      get '/12abc'
      expect(last_response.status).to eq 301
    end
  end
end
