module BoatsHelper
    def chum_pounds(boat, fish_tickets)
        array = fish_tickets.collect do |x|
            x.chum_pounds
        end
        array = array.compact
        array.inject(0, :+).to_s(:delimited)
    end

    def sockeye_pounds(boat, fish_tickets)
        array = boat.fish_tickets.collect do |x|
            x.sockeye_pounds
        end
        array = array.compact
        array.inject(0, :+).to_s(:delimited)
    end

    def coho_pounds(boat, fish_tickets)
        array = boat.fish_tickets.collect do |x|
            x.coho_pounds
        end
        array = array.compact
        array.inject(0, :+).to_s(:delimited)
    end

    def humpy_pounds(boat, fish_tickets)
        array = boat.fish_tickets.collect do |x|
            x.humpy_pounds
        end
        array = array.compact
        array.inject(0, :+).to_s(:delimited)
    end

    def king_pounds(boat, fish_tickets)
        array = boat.fish_tickets.collect do |x|
            x.king_pounds
        end
        array = array.compact
        array.inject(0, :+).to_s(:delimited)
    end
        
end
