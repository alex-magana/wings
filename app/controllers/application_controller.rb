class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception unless Rails.env.test?
  helper_method :current_user, :require_login

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      flash[:error] = "LOG IN REQUIRED"
      redirect_to root_path
    end
  end
end
