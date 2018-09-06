class TransactionsController < ApplicationController


    def new
        @flight = Flight.find(params[:flight_id])
        @transaction = Transaction.new
    end

    def create
        @transaction = Transaction.new(transaction_params)
        # POST to Spreedly gateway, conditional for success/ failed payment
        if @transaction.save
            redirect_to flights_path, notice: "Your purchase was successful."
        else
            render :new
        end
    end
    




    def transaction_params
        params.require(:transaction).permit(:email, :token, :amount, :flight_id, :quantity)
    end

end
