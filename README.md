# FactoryScrap

[![Build Status](https://travis-ci.org/masa-iwasaki/factory_scrap.svg?branch=master)](https://travis-ci.org/masa-iwasaki/factory_scrap)
[![codecov](https://codecov.io/gh/masa-iwasaki/factory_scrap/branch/master/graph/badge.svg)](https://codecov.io/gh/masa-iwasaki/factory_scrap)

FactoryScrap is a tool to convert factory definitions of FactoryBot to Rails fixtures partially.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'factory_scrap', group: :test
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install factory_scrap

## Usage

You can convert all factory definitions to fixtures and export them under a directory by calling `FactoryScrap.dump_fixtures` method.

```console
$ RAILS_ENV=test rails c 
> FactoryScrap.dump_fixtures "./tmp"
```

## Warnings

All associations & callbackes defined inside factories will are ignored.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/masa-iwasaki/factory_scrap.
