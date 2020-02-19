class UsersController < ApplicationController
    # before_action :require_login, only: [:show]
    before_action :require_login, except: [:new, :create]

  
    def new
      @user = User.new
    end
  
    def create
      user = User.create(user_params)
      if user.valid?
        #      # If--and only if--the post is valid, do what we usually do.
        session[:user_id] = user.id #this saves automatically otherwise @user.save
        redirect_to user_path(user) #show page is user_path
      else
        render :new
      end
    end
  
    def show
      # if  session[:user_id] # would return an interger making it truthy no interger would return nil making it falsy
      @user = User.find_by(:id => params[:id])
    
      # end
    end

    # def destroy
    # User.find(params[:id]).destroy
    # redirect_to users_path
    # end 

    def destroy
        @user.destroy
        redirect_to users_path
      end
    private

    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end
  end

