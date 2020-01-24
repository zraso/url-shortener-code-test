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
      data = { 'url': 'http://www.farmdrop.com' }
      post '/', data.to_json, "CONTENT_TYPE" => "application/json"
      expect(last_response.status).to eq 200
      response = JSON.parse(last_response.body)
      expect(response['url']).to eq 'http://www.farmdrop.com'
      # post '/', params: { url: 'hello' }
      # expect(last_response.body).to include 'hello'
    end

    it 'returns status 400 if no url is passed' do
      data = { 'blah': 'blahblah' }
      post '/', data.to_json, "CONTENT_TYPE" => "application/json"
      expect(last_response.status).to eq 400
    end

    it 'returns status 400 if string is passed instead of json' do
      data = 'a string'
      post '/', data, "CONTENT_TYPE" => "application/json"
      expect(last_response.status).to eq 400
    end
  end

  context 'GET /:url' do
    it 'returns status 301' do
      get '/12abc'
      expect(last_response.status).to eq 301
    end
  end
end
