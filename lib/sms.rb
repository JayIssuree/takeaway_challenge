require 'twilio-ruby'

class SMS

    account_sid = ''
    auth_token = ''
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from = ''

    def self.get_number
        puts 'What is your phone number?'
        gets.chomp
    end

    def self.send_message(body: )

        @client.messages.create(
            from: @from,
            to: get_number,
            body: body
        )

    end



end