class Item < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_and_belongs_to_many :services
end
