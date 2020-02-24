class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user 

  def current_user 
    User.find_by(id: session[:user_id])
  end 

  def logged_in?
    redirect_to '/' if !current_user
  end 

  
end
