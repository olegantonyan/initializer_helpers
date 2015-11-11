# InitializerHelpers

Source code worth 1000 words
```ruby
module InitializerHelpers
  module_function

  def skip_console_rake_generators &block
    skip(console? || generators? || rake?, &block)
  end

  def skip_rake_generators &block
    skip(generators? || rake?, &block)
  end

  def skip_generators &block
    skip(generators?, &block)
  end

  def skip_console &block
    skip(console?, &block)
  end

  def rake?
    File.basename($0) == 'rake'
  end

  def console?
    defined? Rails::Console
  end

  def generators?
    defined? Rails::Generators
  end

  private
  module_function

  def skip(condition, &block)
    raise ArgumentError, 'no block given' if block.blank?
    yield unless condition
  end
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'initializer_helpers', github: 'olegantonyan/initializer_helpers'
```

And then execute:

    $ bundle

## Usage

```ruby
InitializerHelpers.skip_console_rake_generators do
  # execute this block only when we are not in console, rake or rails generators
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/olegantonyan/initializer_helpers. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
