class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    RideMechanic.create(ride_id: params[:ride_id], mechanic_id: params[:id])
    redirect_to "/mechanics/#{params[:id]}"
  end
end