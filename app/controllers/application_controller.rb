# All controllers should extend this file
# Provides common functionality for all controllers and requires user to login
# to all controllers by default
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login

  protected

    # Checks that the user is logged and redirects to the login page if not
  	def require_login
      redirect_to login_path, notice: 'The requested action requires you to log in' unless session[:user_id]
    end
end
