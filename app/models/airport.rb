class Airport < ApplicationRecord
  scope :airports_all, -> { order("id ASC") }
end
