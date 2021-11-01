class MechanicRidesController < ApplicationController
  def create
    mech = Mechanic.find(params[:mechanic_id])
    ride = Ride.find(params[:ride_id])
    @mechanic_ride = MechanicRide.create(ride: ride, mechanic: mech)


    redirect_to "/mechanics/#{params[:mechanic_id]}"
  end
end
