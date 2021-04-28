module BoatsHelper
    def chum_pounds(fish_tickets, date = nil)
        if !date.nil? 
            fish_tickets = fish_tickets.select do |x|
                x.date.month == date.month 
            end
        end
        array = fish_tickets.collect do |x|
            x.chum_pounds
        end
        array = array.compact
        array.inject(0, :+).to_s(:delimited)
    end

    def sockeye_pounds(fish_tickets, date = nil)
        if !date.nil? 
            fish_tickets = fish_tickets.select do |x|
                x.date.month == date.month 
            end
        end
        array = fish_tickets.collect do |x|
            x.sockeye_pounds
        end
        array = array.compact
        array.inject(0, :+).to_s(:delimited)
    end

    def coho_pounds(fish_tickets, date = nil)
        if !date.nil? 
            fish_tickets = fish_tickets.select do |x|
                x.date.month == date.month 
            end
        end
        array = fish_tickets.collect do |x|
            x.coho_pounds
        end
        array = array.compact
        array.inject(0, :+).to_s(:delimited)
    end

    def humpy_pounds(fish_tickets, date = nil)
        if !date.nil? 
            fish_tickets = fish_tickets.select do |x|
                x.date.month == date.month 
            end
        end
        array = fish_tickets.collect do |x|
            x.humpy_pounds
        end
        array = array.compact
        array.inject(0, :+).to_s(:delimited)
    end

    def king_pounds(fish_tickets, date = nil)
        if !date.nil? 
            fish_tickets = fish_tickets.select do |x|
                x.date.month == date.month 
            end
        end
        array = fish_tickets.collect do |x|
            x.king_pounds
        end
        array = array.compact
        array.inject(0, :+).to_s(:delimited)
    end
        
end
