class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  #if you need a method in controller and views then it's best to define it in the controller and turn it into a helper method using the `helper_method` method
  def authenticate_user!
    unless user_signed_in?
      flash[:notice] = "please sign in"
      redirect_to new_session_path
    end
  end

  helper_method :authenticate_user!

  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  helper_method :current_user
end