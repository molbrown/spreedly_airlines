class CardsController < ApplicationController

    def create
        @card = Card.create(token: params['token'], email: params['email'])

        if @card.save
            redirect_to :back
        else
            redirect_to new_transaction_path(flight_id: params['flight_id']),  alert: 'Purchase was successful, but payment method did not save.'
        end
    end
    



    private

    def card_params
        params.require(:card).permit(:token, :email)
      end
end
