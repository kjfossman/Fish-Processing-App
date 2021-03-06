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
        @tender = Tender.find_by(id: params[:tender_id])
        if params[:boat_id]
            @fish_tickets = Boat.find_by(id: params[:boat_id]).fish_tickets
        elsif params[:tender_id]
            @fish_tickets = Tender.find_by(id: params[:tender_id]).fish_tickets
        else
            @fish_tickets = FishTicket.all   
        end
    end

    def show   
        @fish_ticket = FishTicket.find_by(id: params[:id])
    end

    def new
        
        @boat = Boat.find_by(id: params[:boat_id]) if params[:boat_id]
        @tender = Tender.find_by(id: params[:tender_id]) if params[:tender_id]
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
        elsif params[:tender_id]
            @fish_tickets = FishTicket.by_tender(params[:tender_id])
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

    def edit
        @fish_ticket = FishTicket.find_by(id: params[:id])
    end

    def update
        @fish_ticket = FishTicket.find_by(id: params[:id])
        @fish_ticket.update(fish_ticket_params)
        if @fish_ticket.save
            flash[:message] = "Ticket Updated!"
            redirect_to fish_ticket_path(@fish_ticket)
        else
            render :edit
        end
    end

    def destroy
        @fish_ticket = FishTicket.find_by(id: params[:id])
        flash[:message] = "Fish Ticket Number #{@fish_ticket.ticket_number} For The #{@fish_ticket.boat.name} Has Been Removed"
        @fish_ticket.destroy
        redirect_to fish_tickets_path
    end
   

    private
    def fish_ticket_params
        params.require(:fish_ticket).permit(:boat_id, :tender_id, :fish_processor_id, :chum_pounds, :coho_pounds, :sockeye_pounds, :humpy_pounds, :king_pounds, :ticket_number, :date, :search, :boat_id, :tender_id)
    end
end
