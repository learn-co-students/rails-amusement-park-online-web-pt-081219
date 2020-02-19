class RidesController < ApplicationController
    before_action :require_login
  
    def create
      ride = Ride.create(user_id: current_user.id, attraction_id: params[:attraction_id])
      if ride
        response = ride.take_ride
        flash[:notice] = response
        redirect_to user_path(ride.user)
      else
        redirect_to attraction_path(ride.attraction)
      end
    end
  end

  #join table for users and attractions
  #this is for when a user goes on a ride it'll read the messages we created in the ride model throught the def take_ride method