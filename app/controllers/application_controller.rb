class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_login
    redirect_to '/' if session[:user_id] == nil
  end
  def logedin
    redirect_to '/bright_ideas/#{current_user.id}' if session[:user_id] != nil
  end
  def require_correct_user
    user = User.find(session[:user_id])
    redirect_to "/bright_ideas/#{current_user.id}" if current_user != user
  end
  def current_user
    User.find(session[:user_id]) if session[:user_id] != nil
  end
end
