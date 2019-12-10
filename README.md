# Url Shortener Code Test

This app is a URL shortening service which accepts a post request with the URL you would like to shorten, and responds with a randomly generated short URL as well as your original URL. When you visit the short URL, the app redirects you to your original URL.

## How to install and run
1. Clone this repository
2. In your command line
* Run `bundle install`
* Run `rackup -p 4000`

## Using the app
1. Request a shortened URL

```
curl localhost:4000 -XPOST -d '{ "url": "http://www.farmdrop.com" }'
{ "short_url": "/4niy2", "url": "http://www.farmdrop.com" }
```

2. Use your shortened URL

```
curl -v localhost:4000/4niy2
...
< HTTP/1.1 301 Moved Permanently
...
< Location: http://www.farmdrop.com
```