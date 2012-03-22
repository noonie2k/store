class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login

  protected
  	def require_login
      redirect_to login_path, notice: 'The requested action requires you to log in' unless session[:user_id]
    end
end
