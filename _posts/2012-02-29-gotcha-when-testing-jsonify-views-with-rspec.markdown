---
layout: post
title: "Gotcha When Testing Jsonify Views with RSpec"
date: 2012-02-29 20:11
comments: true
categories:
- Unit Testing
- Ruby on Rails
---

I'm kicking myself because it took me a long time to figure out something so obvious.  However, this snuck up on me because I refactored a controller to use the [Jsonify gem](https://github.com/bsiggelkow/jsonify) instead of `render json: {object}`.

When you are testing the response body in RSpec controller specs, it will work with `render json` no matter what.  So, as an example, `render json: {hello:"world"}` returns `'{"hello":"world"}'` inside `response.body`.  But after you switch it to a view with Jsonify like this: `json.hello "world"`, you get `'{}'`.  What gives?

Well the answer is right in the readme for [rspec-rails-2](https://github.com/rspec/rspec-rails):

>RSpec's preferred approach to spec'ing controller behaviour is to isolate the controller from its collaborators. By default, therefore, controller example groups do not render the views in your app. Due to the way Rails searches for view templates, the template still needs to exist, but it won't actually be loaded.

Therefore, if you want to render your views you must include the `render_views` directive in your `describe` block:

``` ruby
describe WidgetsController do
  render_views
```

That probably would have jumped out at me a lot sooner if I was trying to test a standard .erb view, but of course it applies to any templating solution, and it's best not to forget it!