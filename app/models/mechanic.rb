class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics
  belongs_to :amusement_park

  scope :average_years_experience, -> {average(:years_experience)}

end
