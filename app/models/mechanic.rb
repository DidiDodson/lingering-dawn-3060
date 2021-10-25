class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.average_years
    self.all.average(:years_of_experience)
  end

  def add_ride(ride)
    self.rides << ride
  end
end
