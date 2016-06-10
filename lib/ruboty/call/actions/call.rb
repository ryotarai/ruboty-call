require 'twilio-ruby'
require 'uri'

module Ruboty
  module Call
    module Actions
      class Call < Ruboty::Actions::Base
        def call
          phone_call
        end

        private

        def from
          ENV['RUBOTY_PHONE_NUMBER']
        end

        def language
          ENV['RUBOTY_LANG'] || 'ja-JP'
        end

        def phone_call
          twilio_client.account.calls.create({
            :to => to,
            :from => from,
            :url => twiml_url,
            :method => 'GET',
            :fallback_method => 'GET',
            :status_callback_method => 'GET',
          })
        rescue
          message.reply("なにかに失敗したよ.")
        end

        def text
          message[:text]
        end

        def to
          message[:to]
        end

        def twilio_client
          # put your own credentials here
          account_sid = ENV['TWILIO_ACCOUNT_SID']
          auth_token = ENV['TWILIO_AUTH_TOKEN']

          Twilio::REST::Client.new account_sid, auth_token
        end

        def twiml
          <<TWIML
<?xml version="1.0" encoding="UTF-8"?>
<Response>
    <Say voice="alice" language="#{language}">#{text}</Say>
</Response>
TWIML
        end

        def twiml_url
          "http://twimlets.com/echo?Twiml=#{URI.escape(twiml)}"
        end
      end
    end
  end
end
