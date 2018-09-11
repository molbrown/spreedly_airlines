class TransactionsController < ApplicationController
    include SaveCard

    def index
        @transactions = Transaction.order(created_at: :desc)
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
        if @transaction.valid?
            if @transaction.expedia
                expedia_success = @transaction.buy_expedia(@transaction)
                if expedia_success && expedia_success['transaction']['succeeded'] == true
                    redirect_to flights_path, notice: "Expedia received your reservation."
                else
                    redirect_to '/transactions/new?flight_id='+@flight.id.to_s, alert: "Payment failed."
                end
            else
                buy_success = @transaction.buy_gateway(token, amount)
                if buy_success && buy_success['transaction']['succeeded'] == true
                    if @transaction.save && @transaction.save_card == true
                        @card = new_card(@transaction, buy_success)
                        redirect_to flights_path, notice: "Your purchase was successful and payment method saved."
                    elsif @transaction.save
                        redirect_to flights_path, notice: "Your purchase was successful."
                    else
                        render :new, alert: "Payment made but failed to save. Please contact Spreedly Airlines for your confirmation."
                    end
                else
                    redirect_to '/transactions/new?flight_id='+@flight.id.to_s, alert: "Payment method declined"
                end 
            end
        else 
            redirect_to '/transactions/new?flight_id='+@flight.id.to_s, alert: "Email required"
        end


    end
    


    private

    def transaction_params
        params.require(:transaction).permit(:email, :token, :amount, :flight_id, :quantity, :save_card, :saved_cards_id, :expedia)
    end

end
