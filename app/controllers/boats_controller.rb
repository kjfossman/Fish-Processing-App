class BoatsController < ApplicationController

    def index 
        @boats = Boat.all
    end

    def show
        @boat = Boat.find_by(id: params[:id])
    end

    def new
        @boat = Boat.new
    end

    def create 
        @boat = Boat.new(boat_params)
        if @boat.save
            redirect_to boat_path(@boat)
        else
            render :new
        end
    end

    private
    def boat_params
        params.require(:boat).permit(:name, :captain, :home_port, :fish_processor_id)
    end
end
