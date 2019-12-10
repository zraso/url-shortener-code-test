require "spec_helper"

describe UrlShortener do
  include Rack::Test::Methods

  let (:app) { UrlShortener.new }
    context "GET /" do
      it "responds status 200 OK" do
        get "/"
        expect(last_response.status).to eq 200
      end
  end
end