class FlightsController < ApplicationController

    def index
        @flights = Flight.order(:destination)
    end

    def show
        @flight = Flight.find(params[:id])
    end


end
