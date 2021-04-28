class TendersController < ApplicationController

    def index
        @tenders = Tender.all
    end

    def show
      
       if params[:month] && params[:month] != "Total"
        @date = params[:month].to_datetime 
       else
        @date = nil
       end
        @tender = Tender.find_by(id: params[:id])
       

    end

    def new
        @tender = Tender.new
    end

    def create 
        @tender = Tender.new(tender_params)
        if @tender.save
            redirect_to tender_path(@tender)
        else
            render :new
        end
    end

    def edit
        @tender = Tender.find_by(id: params[:id])
    end

    def update 
        @tender = Tender.find_by(id: params[:id])
        @tender.update(tender_params)
        if @tender.save
            redirect_to tender_path(@tender)
        else
            render :edit
        end
    end

    def destroy
        @tender = Tender.find_by(id: params[:id])
        if @tender.fish_tickets.count == 0
            flash[:message] = "The #{@tender.name} has been removed from the database."
            @tender.destroy
            redirect_to tenders_path
        else 
            flash[:message] = "The #{@tender.name} cannot be deleted because it has one or more fish tickets"
            redirect_to tender_path(@tender)
        end
    end

    private
    def tender_params
        params.require(:tender).permit(:name, :captain, :home_port, :fish_processor_id)
    end

end
