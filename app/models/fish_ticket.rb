class FishTicket < ApplicationRecord
    belongs_to :tender
    belongs_to :boat
    belongs_to :fish_processor
end
