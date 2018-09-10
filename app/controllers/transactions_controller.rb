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
        @flight = Flight.find(transaction_params[:flight_id])
        @transaction = Transaction.new(transaction_params)
        amount = transaction_params[:amount]
        token = transaction_params[:token]

        buy_success = @transaction.buy_gateway(token, amount)
        if buy_success && buy_success['transaction']['succeeded'] == true
            if @transaction.save
                redirect_to flights_path, notice: "Your purchase was successful."
            else
                render :new, alert: "payment made but failed to save"
            end
        else
            redirect_to flights_path, alert: "Payment declined"
        end 
    end
    


    private

    def transaction_params
        params.require(:transaction).permit(:email, :token, :amount, :flight_id, :quantity, :save_card)
    end

end
