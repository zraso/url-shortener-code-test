class URLEntry

  def short_url
    charset = Array('a'..'z') + Array(1..9)
    @short_url = Array.new(5) { charset.sample }.join
  end

end