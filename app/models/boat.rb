class Boat < ApplicationRecord
    
    has_many :fish_tickets
    belongs_to :fish_processor
    has_many :tenders, through: :fish_tickets
    has_many :invoices

    validates :name, presence: true
    validates :captain, presence: true
end
