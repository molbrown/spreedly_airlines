class FlightsController < ApplicationController

    def index
        @flights = Flight.order(:destination)
    end

    def show
        @transactions = Transaction.order(created_at: :desc)
    end


end
