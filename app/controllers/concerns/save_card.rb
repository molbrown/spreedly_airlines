module SaveCard
    extend ActiveSupport::Concern

    def new_card(transaction, response)
        @card = SavedCard.create(
            :email => transaction.email,
            :token => transaction.token,
            :last_four => response['transaction']['payment_method']['last_four_digits']
        )
    end

end