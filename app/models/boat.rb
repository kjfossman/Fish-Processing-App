class Boat < ApplicationRecord
    
    has_many :fish_tickets
    belongs_to :fish_processor
    has_many :tenders, through: :fish_tickets
end
