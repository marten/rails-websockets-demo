One of my co-workers asked how to serve websockets from the same server as a normal Rails
application. This is a demo that shows how to do that.

There's only one controller `DemoController` that serves in index page at `/demo`. That page
renders some HTML and JavaScript that tries to connect to a websocket server at `/socket`.

This `/socket` comes from a Rack application that I've defined straight in `config/routes.rb`.
Obviously, in a Real Application you would do that some place else ;)

Anyway, it's simply a mounted engine, and you have to make sure to start it with Thin, otherwise
it doesn't work.

## Trying it out

    bundle install
    bundle exec rails server thin

And then visit http://localhost:3000/demo
