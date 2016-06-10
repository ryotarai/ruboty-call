module Ruboty
  module Handlers
    class Call < Base
      env :TWILIO_ACCOUNT_SID, 'twilio account sid'
      env :TWILIO_AUTH_TOKEN, 'twilio auth token'
      env :RUBOTY_PHONE_NUMBER, 'twilio phone number'
      env :RUBOTY_LANG, 'which language ruboty speaks. details: https://jp.twilio.com/docs/api/twiml/say#attributes-language', optional: true

      on /call \+(?<to>\d+) (?<text>.*)/, name: 'phone_call_with_message', description: "make a call with specific message"
      on /call \+(?<to>\d+)$/, name: 'phone_call', description: "make a call"

      # call is already used in ruboty
      def phone_call(message)
        Ruboty::Call::Actions::Call.new(message).call
      end

      # call is already used in ruboty
      def phone_call_with_message(message)
        Ruboty::Call::Actions::Call.new(message).call_with_message
      end
    end
  end
end
