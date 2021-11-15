class Item < ApplicationRecord
  has_many :reservations
  has_and_belongs_to_many :services
end
