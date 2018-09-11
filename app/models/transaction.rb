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
    end

    def buy_expedia(transaction)
        base_uri = 'https://core.spreedly.com/v1/receivers/'
        buy_uri = base_uri + ENV['pmd_token']+'/deliver.json'

        options = {
            headers: {'Content-Type' => 'application/json'},
            basic_auth: {
                "username": ENV['spreedly_env_key'],
                "password": ENV['spreedly_secret']
            },
            body: {
                "delivery": {
                    "payment_method_token": transaction.token,
                    "url": "https://spreedly-echo.herokuapp.com",
                    "headers": "Content-Type: application/json",
                    "body": {  
                        "flight_id": transaction.flight_id,
                        "quantity": transaction.quantity,
                        "amount": transaction.amount,
                        "email": transaction.email,
                        "card_number":"{{ credit_card_number }}"
                        }
                    }
            }.to_json
        }
        
        response = HTTParty.post(buy_uri, options)
        puts response.parsed_response
        response.parsed_response             

    end
end
'{
        "delivery": {
          "payment_method_token": "56wyNnSmuA6CWYP7w0MiYCVIbW6",
          "url": "https://spreedly-echo.herokuapp.com",
          "headers": "Content-Type: application/json",
          "body": "{ \"product_id\": \"916598\", \"card_number\": \"{{credit_card_number}}\" }"
        }
      }'
