class BoatsController < ApplicationController

    def index 
        @boats = Boat.all
    end

    def show
         
       if params[:month] && params[:month] != "Total"
        @date = params[:month].to_datetime 
       else
        @date = nil
       end
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
        if @boat.fish_tickets.count == 0
            flash[:message] = "The #{@boat.name} has been removed from the database."
            @boat.destroy
            redirect_to boats_path
        else
            flash[:message] = "The #{@boat.name} cannot be deleted because it has one or more fish tickets"
            redirect_to boat_path(@boat)
        end
    end

    private
    def boat_params
        params.require(:boat).permit(:name, :captain, :home_port, :fish_processor_id)
    end
end
