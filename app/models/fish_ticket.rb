class FishTicket < ApplicationRecord
    belongs_to :tender
    belongs_to :boat
    belongs_to :fish_processor

    validates :date, presence: true
    validates :ticket_number, presence: true, uniqueness: true
    validates :chum_pounds, :sockeye_pounds, :coho_pounds, :humpy_pounds, :king_pounds, presence: true

    scope :by_day, ->(day) { where("date = ?", day) }
    scope :by_boat, ->(boat) { where("boat_id = ?", boat) }

    # Order.select("created_at").group("created_at")


    # scope :by_day, -> (date) { where("date == ?", date) }

    # scope :costs_more_than, ->(amount) { where("price > ?", amount) }
    
end
