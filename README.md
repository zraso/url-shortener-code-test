# Url Shortener Code Test

This app is a URL shortening service which accepts a post request with the URL you would like to shorten, and responds with a randomly generated short URL as well as your original URL. When you visit the short URL, the app redirects you to your original URL.

## How to install and run
1. Clone this repository
2. In your command line
* Run `bundle install` to install dependencies
* Run `rackup -p 4000` to start up the server

## Using the app
1. Request a shortened URL (with or without including 'http' protocol)

```
curl localhost:4000 -XPOST -d '{ "url": "www.farmdrop.com" }'
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

## Run tests
1. Run `rspec` from command line to check tests. This app has over 97% coverage.
2. Run `rubocop` from command line to check linter.

## Development

### Key decisions and challenges
* I decided to use Sinatra rather than Rails to develop this program due to its scope and size, and that it would not be using any databases. My key challenge developing this program was that I did not have experience testing json requests/responses in a Sinatra framework, and have only [previously done this in Rails](https://github.com/nateg101/acebook-by-WinkyFace/blob/master/spec/controllers/api/v1/posts_controller_spec.rb). With more time, I would have liked to improve the test coverage of my Sinatra app file.
* After spending some time exploring different ways to store the temporary url data, including sessions, .json files, .yaml files, I ended up using a class variable as I was having issues adding and retrieving data to/from a file. This was not ideal, and again with more time I would have liked to find a better solution for this - ideally using a temporary .json file.

### Testing
* To test the controller, I used manual tests via curl, postman and the browser
* I used TDD and unit testing to test the model
