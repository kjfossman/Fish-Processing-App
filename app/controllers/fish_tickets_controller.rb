class FishTicketsController < ApplicationController

    def search
        if params[:search]
            @fish_ticket = FishTicket.find_by(ticket_number: params[:search])
            if @fish_ticket
            redirect_to fish_ticket_path(@fish_ticket)
            else
                flash[:message] = "No Tickets Match That Search"
                redirect_to fish_tickets_path
            end
        end
    end

    def index 
      
        @boat = Boat.find_by(id: params[:boat_id])
      
        if params[:boat_id]
            @fish_tickets = Boat.find_by(id: params[:boat_id]).fish_tickets
        else
            @fish_tickets = FishTicket.all   
        end
    end

    def show   
        @fish_ticket = FishTicket.find_by(id: params[:id])
    end

    def new
    byebug
        @boat = Boat.find_by(id: params[:boat_id]) if params[:boat_id]
        @fish_ticket = FishTicket.new
    end

    def create 
        @fish_ticket = FishTicket.new(fish_ticket_params)
        if @fish_ticket.save
            redirect_to fish_ticket_path(@fish_ticket)
        else
            render :new
        end
    end

    def date 
        @date = params[:date].to_datetime.strftime("%B %d, %Y")
        if params[:boat_id]
            @fish_tickets = FishTicket.by_boat(params[:boat_id])
            @fish_tickets = @fish_tickets.by_day(params[:date].to_datetime)
        else 
            @fish_tickets = FishTicket.by_day(params[:date].to_datetime)
        end
        render :date_index
    end

    def boat
        @boat = Boat.find_by(id: params[:boat])
        @fish_tickets = @boat.fish_tickets
    end

   

    private
    def fish_ticket_params
        params.require(:fish_ticket).permit(:boat_id, :tender_id, :fish_processor_id, :chum_pounds, :coho_pounds, :sockeye_pounds, :humpy_pounds, :king_pounds, :ticket_number, :date, :search, :boat_id)
    end
end
