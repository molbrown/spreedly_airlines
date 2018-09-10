class TransactionsController < ApplicationController

    def index
        @transactions = Transaction.all
    end

    def new
        @flight = Flight.find(params[:flight_id])
        @id = @flight.id 
        @transaction = Transaction.new
    end

    def create
        @flight = Flight.find(params[:flight_id])
        @transaction = Transaction.new(transaction_params)
        amount = @flight.price * transaction_params[:quantity]
        token = transaction_params[:payment_method_token]
        if @transaction.buy_gateway(token, amount)
            if @transaction.save
                redirect_to flights_path, notice: "Your purchase was successful."
            else
                render :new, alert: "payment failed to save"
            end
        else
            redirect_to flights_path, alert: "Payment declined"
        end 
    end
    


    private

    def transaction_params
        params.require(:transaction).permit(:email, :payment_method_token, :amount, :flight_id, :quantity, :save_card)
    end

end
