# frozen_string_literal: true

class URLEntry
  @@data = {}

  def self.data
    @@data
  end

  def self.retrieve(url_params)
    @@data[url_params]
  end

  attr_reader :url

  def initialize(url)
    @url = check_protocol(url)
    @short_url = ''
  end

  def json_response
    save
    { short_url: @short_url, url: @url }.to_json
  end

  def save
    @@data[short_url] = @url
  end

  def short_url
    charset = Array('a'..'z') + Array(1..9)
    @short_url = Array.new(5) { charset.sample }.join
  end

  def check_protocol(url)
    protocol = url.split('www')[0]
    protocol.empty? ? "http://#{url}" : url
  end
end
