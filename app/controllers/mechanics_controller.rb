class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all

    @mechanics.average_years
  end

  def show
    @mechanic = Mechanic.find(params[:id])

      if params[:id] == 
        ride = Ride.find(params[:id])
        @mechanic.add_ride(ride)
      else
        @mechanic.rides == "nil"
      end

    @mechanic.rides.open_ride
  end
end
