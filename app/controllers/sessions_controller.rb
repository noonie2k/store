class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path, alert: 'Invalid username or password'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
