Qiang Blog
==========

Qiang's blog. Awesome articles:-)

# Information

- Hosted on [Heroku](http://qiang-blog.herokuapp.com)
- Powered by [Ruby on Rails](http://rubyonrails.org)

# Installation

```ruby
$ heroku run rake db:migrate
$ heroku run rails console
Admin.create!({ :email => '...', :password => '...', :password_confirmation => '...' })

$ heroku config:set AUTHOR=[YOUR NAME]
$ heroku config:set TWITTER=[YOUR ACCOUNT]
$ heroku config:set FACEBOOK=[YOUR ACCOUNT]
$ heroku config:set ABOUT_ME=[YOUR ACCOUNT]
$ heroku config:set ADDTHIS=[YOUR ACCOUNT]
$ heroku config:set DISQUS=[YOUR ACCOUNT]
```

# License

[MIT](http://opensource.org/licenses/MIT)
