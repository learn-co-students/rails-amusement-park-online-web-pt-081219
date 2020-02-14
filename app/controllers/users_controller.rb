class UsersController < ApplicationController

    def new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            flash[:notice] = "Sign up success"
            session[:user_id] = @user.id
            redirect_to user_url(@user)
        else
            flash[:notice] = "Sign up faild"
            redirect_to new_user_url
        end
    end

    def show
    end

    private
    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end

end
