class Ride < ApplicationRecord
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics
  belongs_to :amusement_park

  scope :open_rides, -> {where(open: true)}
  scope :average_thrill, -> {average(:thrill_rating)}
end
