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
        
    end

    def create
       
        @boat = Boat.find_by(id: params[:invoice][:boat_id]) if params[:invoice][:boat_id]
        @invoice = Invoice.new(invoice_params)
        if @invoice.save 
            redirect_to invoice_path(@invoice)
        else
            render :new
        end
    end

    def show
        @invoice = Invoice.find_by(id: params[:id])
    end

    def update
        @invoice = Invoice.find_by(id: params[:id])
        @invoice.update(paid: params[:invoice][:paid])
        if @invoice.save
            redirect_to invoice_path(@invoice)
        else
            flash[:message] = "Unable to Update Invoice"
            render :show
        end
    end

    private 
    def invoice_params
        params.require(:invoice).permit(:number, :boat_id, :date, :chum_price, :sockeye_price, :coho_price, :humpy_price, :king_price, :fish_ticket_ids => [])
    end
end
