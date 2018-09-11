class FlightsController < ApplicationController

    def index
        @flights = Flight.order(:destination)
    end

end
