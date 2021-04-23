class FishProcessor < ApplicationRecord
    has_many :boats
    has_many :tenders
    has_many :fish_tickets
end
