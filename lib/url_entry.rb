class URLEntry

  attr_reader :url

  def initialize(url)
    @url = url
    @short_url = ''
  end

  def json_response
    { :short_url => short_url, :url => url }.to_json
  end

  def short_url
    charset = Array('a'..'z') + Array(1..9)
    @short_url = Array.new(5) { charset.sample }.join
  end

end