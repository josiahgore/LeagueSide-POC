class League < ApplicationRecord

  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :price_cents, presence: true

end
