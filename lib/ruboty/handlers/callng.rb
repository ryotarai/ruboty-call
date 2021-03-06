module Ruboty
  module Handlers
    class Callng < Base
      class Error < StandardError; end

      env :TWILIO_ACCOUNT_SID, 'twilio account sid'
      env :TWILIO_AUTH_TOKEN, 'twilio auth token'
      env :RUBOTY_PHONE_NUMBER, 'twilio phone number'

      on /call \+(?<to>\d+) (?<text>.*)/, name: 'phone_call_with_message', description: "make a call with specific message"
      on /call \+(?<to>\d+)$/, name: 'phone_call', description: "make a call"

      def initialize(*args)
        super
        unless defined?(Ruboty::SlackRTM)
          raise Error, "ruboty-slack_rtm is not installed. ruboty-callng supports only ruboty-slack_rtm for now"
        end
      end

      # call is already used in ruboty
      def phone_call(message)
        Ruboty::Callng::Actions::Call.new(message).call
      end

      # call is already used in ruboty
      def phone_call_with_message(message)
        Ruboty::Callng::Actions::Call.new(message).call_with_message
      end
    end
  end
end
