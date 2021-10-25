class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all

    @mechanics.average_years
  end

  def show
  end  
end
