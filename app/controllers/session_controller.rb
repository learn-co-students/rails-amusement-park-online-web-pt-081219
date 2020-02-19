class SessionController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(:name => params[:user][:name])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        #putting user.id into  session[:user_id] is signing the user in 
        redirect_to user_path(user)
      else
        render :new
      end
    end

    # def destroy
    #   if !session[:name].nil?
    #     session.delete :name
    #   end
    #   redirect_to '/'
    # end

    def destroy
    if current_user
      session.delete :user_id
      redirect_to root_url
    end
  end
  end

  

  #dealing with sign up and sign out stuff