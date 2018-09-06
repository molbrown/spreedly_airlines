class TransactionsController < ApplicationController

    def new
        @flight = Flight.find(params[:flight_id])
        @transaction = Transaction.new
    end
    
end
