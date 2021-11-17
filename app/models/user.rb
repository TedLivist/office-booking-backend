class User < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :username, presence: true, length: { minimum: 3 }
end
