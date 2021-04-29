class InvoicesController < ApplicationController

    def index 
     
        if params[:boat_id]
            @boat = Boat.find_by(id: params[:boat_id])
            @invoices = @boat.invoices 
        else 
            @invoices = Invoice.all
        end
    end

    def new
    
        @boat = Boat.find_by(id: params[:boat_id]) if params[:boat_id]
        @invoice = Invoice.new
        byebug
    end

    def create
     
        @boat = Boat.find_by(id: params[:invoice][:boat_id]) if params[:invoice][:boat_id]
        @invoice = Invoice.new(invoice_params)
        if @invoice.save 
            redirect_to invoice_path(@invoice)
        else
            redirect_to new_boat_invoice_path(@boat)
        end
    end

    private 
    def invoice_params
        params.require(:invoice).permit(:number, :boat_id, :date, :chum_price, :sockeye_price, :coho_price, :humpy_price, :king_price, :fish_ticket_ids => [])
    end
end
