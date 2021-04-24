class TendersController < ApplicationController

    def index
        @tenders = Tender.all
    end

    def show
        @tender = Tender.find_by(id: params[:id])
    end

    private
    def tender_params
        params.require(:tender).permit(:name, :captain, :home_port)
    end

end
