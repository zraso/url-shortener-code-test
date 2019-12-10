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

    it 'gets a message' do
      get '/'
      expect(last_response.body).to eq 'Send a post request to shorten your URL'
    end
  end

  context 'POST /' do
    # it "includes the original url" do
    #   # data = '{"short_url":"short_url","url":"http://www.farmdrop.com"}'
    #   post "/"
    #   expect(last_response.body).to eq 'hello'
    # end
  end
end
