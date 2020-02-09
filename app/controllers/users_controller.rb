class UsersController < ApplicationController
    before_action :require_login, only: [:show]

    def new
        @user = User.new
    end
    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/'
        end
    end
    def show 
            @user = User.find(params[:id])
    end


    private
    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end
    def require_login
        redirect_to '/' unless session.include? :user_id
    end
end
