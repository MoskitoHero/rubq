# Rubq
Rubq allows access to Google Bigquery the rails way.

## Usage
Here be dragons!

This is still very much of a work in progress. Unusable for now.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'rubq'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install rubq
```

Initialize the library:

``` ruby
# app/config/initializers/rubq.rb
Rubq.configure do |config|
  config.project  =  'my-google-project'
  config.region   =  'eu'
  config.dataset  =  'my-bigquery-dataset'
end
```

## Documentation
Available soon online. All code is fully yard-documented for now.

## Contributing
I will add contribution guidelines as soon as this is ready to use.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
