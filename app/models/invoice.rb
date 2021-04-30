class Invoice < ApplicationRecord
    belongs_to :boat
    has_many :fish_tickets

    validates :date, presence: true
    validates :number, presence: true
    validates :chum_price, presence: true
    validates :sockeye_price, presence: true
    validates :coho_price, presence: true
    validates :humpy_price, presence: true
    validates :king_price, presence: true

    accepts_nested_attributes_for :fish_tickets

   
end
