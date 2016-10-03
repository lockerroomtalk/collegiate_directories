# CollegiateDirectories

Interact with the https://www.collegiatedirectories.com API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'collegiate_directories'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install collegiate_directories

## Usage

```ruby
require "collegiate_directories"

directory = CollegiateDirectories.new("my-api-token")
directory.sports
#=> {"Sports"=>[{"Name"=>"Archery", "IsTraditional"=>false, "Id"=>1}, ... }
directory.coaches_for(:archery)
#=> {"Coaches"=>[{"School"=>{"Name"=>"Univ. of the Cumberlands", "AlphaName"=>"CUMBERLANDS, UNIVERSITY OF THE", ... }
directory.coaches_for(:rollerball)
#=> CollegiateDirectories::SportNotFound: rollerball is an invalid sport
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lockerroomtalk/collegiate_directories.
