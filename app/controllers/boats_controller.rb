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

    def edit
        @boat = Boat.find_by(id: params[:id])
    end

    def update 
        @boat = Boat.find_by(id: params[:id])
        @boat.update(boat_params)
        if @boat.save
            redirect_to boat_path(@boat)
        else
            render :edit
        end
    end

    def destroy
        @boat = Boat.find_by(id: params[:id])
        flash[:message] = "The #{@boat.name} has been removed from the database."
        @boat.destroy
        redirect_to boats_path
    end

    private
    def boat_params
        params.require(:boat).permit(:name, :captain, :home_port, :fish_processor_id)
    end
end
