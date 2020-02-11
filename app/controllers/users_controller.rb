class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        if session[:user_id]
            @user = User.find(params[:id])
        else
            redirect_to root_path
        end

    end

    def ride
        #binding.pry
        user = User.find(session[:user_id])
        attraction = Attraction.find(params[:id])
        ride = Ride.create(user: user, attraction: attraction)
        flash[:notice] = ride.take_ride
        redirect_to user_path(user)
    end

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :admin, :tickets, :password)
      end
end