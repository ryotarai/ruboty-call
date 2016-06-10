# Ruboty::Callng

ruboty plugin for make a call to you. This plugin is fork of [ruboty-call](https://github.com/blockgiven/ruboty-call)

## Requirements

- ruboty-slack\_rtm

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-callng'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruboty-callng

## Usage

You need to get [Twilio](https://jp.twilio.com/) account and set these environment variables

| env                 | description         |
| ------------------- | ------------------- |
| TWILIO_ACCOUNT_SID  | twilio account sid  |
| TWILIO_AUTH_TOKEN   | twilio auth token   |
| RUBOTY_PHONE_NUMBER | twilio phone number |

```
#general> ruboty call +81xxxxxxxxx
#general< Calling
```

Ruboty will call the number and say like "YOURNAME calls you at general channel at Slack. Please open Slack"

### Arbitrary message

```
> ruboty call +81xxxxxxxxxx Good morning
< Calling
```

Ruboty accepts English and Japanese message.

## Contributing

1. Fork it ( https://github.com/ryotarai/ruboty-callng/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
