# RubyPins

RubyPins! The simple way to control your Raspberry Pi's GPIO pins, with Ruby!

Tested operating systems: Raspian

To install, from a terminal, run:

```bash
gem install ruby_pins
```

If you are using a Gemfile, such as with a Ruby on Rails application add:

```ruby
gem 'ruby_pins'
```

to your Gemfile, and run

```bash
bundle
```

## Usage

Create a new pin:

```ruby
# All arguments are optional, including the pin number!
# Not much can be done without a pin number though!
pin = RubyPins::Pin.new pin: 17, name: 'My Cool Pin!', state: :off
```

Turn the pin on:

```ruby
pin.on
```

Turn the pin off:

```ruby
pin.off
```

Now rewire your whole house to be interfaced from your Ruby app!

## Installing Ruby (and Rails)

This is the guide I use to install Ruby and Ruby on Rails on my Pis:

http://elinux.org/RPi_Ruby_on_Rails


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ruby_pins. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

