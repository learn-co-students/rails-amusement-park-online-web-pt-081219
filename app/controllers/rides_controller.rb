class RidesController < ApplicationController

  def create
    ride = Ride.new(user: current_user, attraction_id: params[:attraction][:id])
    alert = ride.take_ride
    redirect_to user_path(ride.user), alert: alert
  end

end 