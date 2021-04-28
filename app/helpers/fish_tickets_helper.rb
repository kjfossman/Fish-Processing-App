module FishTicketsHelper

    def total_pounds
        total = FishTicket.sum(:chum_pounds) + FishTicket.sum(:sockeye_pounds) + FishTicket.sum(:coho_pounds) + FishTicket.sum(:humpy_pounds) + FishTicket.sum(:king_pounds)
        total.to_s(:delimited)
    end

    def total_chum_pounds
        total = FishTicket.sum(:chum_pounds)
        total.to_s(:delimited)
    end

    def total_sockeye_pounds
        total = FishTicket.sum(:sockeye_pounds)
        total.to_s(:delimited)
    end

    def total_coho_pounds
        total = FishTicket.sum(:coho_pounds)
        total.to_s(:delimited)
    end

    def total_humpy_pounds
        total = FishTicket.sum(:humpy_pounds)
        total.to_s(:delimited)
    end

    def total_king_pounds
        total = FishTicket.sum(:king_pounds)
        total.to_s(:delimited)
    end


end
