module SaveCard
    extend ActiveSupport::Concern

    def new_card(transaction)
        @card = SavedCard.create(
            :email => transaction.email,
            :token => transaction.token
        )
    end

end