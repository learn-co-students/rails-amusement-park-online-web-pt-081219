require 'pry'

class SessionsController < ApplicationController
    def new
        @user=User.new
    end

    def create
       # binding.pry
        @user = User.find_by(name: params[:user][:name])
       # binding.pry
       if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
           redirect_to root_path
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end
end