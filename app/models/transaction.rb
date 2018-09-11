require 'httparty'

class Transaction < ApplicationRecord
    belongs_to :flight
    # belongs_to :saved_card
    include HTTParty

    validates :email, presence: true
    validates :token, presence: true
    validates :amount, presence: true

    def buy_gateway(token, amount)
        base_uri = 'https://core.spreedly.com/v1/gateways/'
        buy_uri = base_uri + ENV['gateway_token']+'/purchase.json'

        options = {
            headers: {'Content-Type' => 'application/json'},
            basic_auth: {
                "username": ENV['spreedly_env_key'],
                "password": ENV['spreedly_secret']
            },
            body: {
                "transaction": {
                    "payment_method_token": token,
                    "amount": amount,
                    "currency_code": "USD",
                    "retain_on_success": true
                }
            }.to_json
        }
        
        response = HTTParty.post(buy_uri, options)
        puts response.parsed_response
        response.parsed_response 
		# parse_response(response: response, token: token)
    end
end
