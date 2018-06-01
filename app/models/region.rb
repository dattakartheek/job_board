class Region < ApplicationRecord
  has_one :location, dependent: :destroy
  validates :name, presence: true
end
