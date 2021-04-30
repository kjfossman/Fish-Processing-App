class FishTicket < ApplicationRecord
    belongs_to :tender
    belongs_to :boat
    belongs_to :fish_processor
    belongs_to :invoice, optional: true

    validates :date, presence: true
    validates :ticket_number, presence: true, uniqueness: true
    validates :chum_pounds, :sockeye_pounds, :coho_pounds, :humpy_pounds, :king_pounds, presence: true

    scope :by_day, ->(day) { where("date = ?", day) }
    scope :by_boat, ->(boat) { where("boat_id = ?", boat) }
    scope :by_tender, ->(tender) { where("tender_id = ?", tender)}
    # scope :invoice, ->(month) { where("invoice_id != nil", month)}
    scope :invoice, -> { where(invoice_id: true) }

    def cb_label
        "#{self.date.strftime("%B %d, %Y")}, Ticket: #{self.ticket_number} Boat: #{self.boat.name},     
        Chum: #{self.chum_pounds} lbs,  Sockeye: #{self.sockeye_pounds} lbs,  Coho: #{self.coho_pounds} lbs,  Humpy: #{self.humpy_pounds} lbs,  King: #{self.king_pounds} lbs, "
    end

     

    # Order.select("created_at").group("created_at")


    # scope :by_day, -> (date) { where("date == ?", date) }

    # scope :costs_more_than, ->(amount) { where("price > ?", amount) }
    
end
