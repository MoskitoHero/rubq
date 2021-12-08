# Rubq
Rubq allows access to Google Bigquery the rails way. It uses the `Google::Cloud::Bigquery` gem behind the scenes and allows for migrations and basic administration.

## Usage
Here be dragons! This is a proof-of-concept project I am currently toying around with.

This is still very much of a work in progress. **Unusable for now. You have been warned.**

### What works
* Creating a model migration and its corresponding table in BigQuery
* Inserting a row in a managed table

### What does not work
* Everything else

### Roadmap to the first usable version
* Write a `rubq:migrate` task
* Set up schema validation
* Set up a test suite
* Migrations:
  * Streamline usage
  * Implement `self.down`
  * Create / Delete tables
* Model:
  * `#new`
  * `#delete`
  * `#update`
  * Querying:
    * `#all`
    * `#find`
    * `#find_by`

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
  config.dataset  =  'mybigquerydataset'
end
```

## Documentation
[Read the docs](https://rubydoc.info/github/MoskitoHero/rubq/main)

## FAQ
**Why not an ActiveRecord adapter?**

Because Bigquery is by no means a mere SQL database. This gem is just a wrapper around the `Google::Cloud::Bigquery` gem that provides convenience methods in an ActiveRecord-like fashion.

## Contributing
I will add contribution guidelines as soon as this is ready to use.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
