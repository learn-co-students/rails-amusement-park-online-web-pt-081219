class SessionsController < ApplicationController
    
    def new
        @users = User.all
    end

    def create
        @user
    end

    def destroy
        session.clear
        redirect_to root_url
    end

end