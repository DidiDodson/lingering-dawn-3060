class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all

    @mechanics.average_years
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = Ride.all

    @ride = @rides.find do |ride|
      ride.id
    end

    if @ride.id
      ride = Ride.find(@ride.id)
      @mechanic.add_ride(ride)
      require "pry"; binding.pry
    end

    @mechanic.rides.open_ride
  end
end
