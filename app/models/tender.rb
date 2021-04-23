class Tender < ApplicationRecord
    
    has_many :fish_tickets
    belongs_to :fish_processor
    has_many :boats, through: :fish_tickets
end
