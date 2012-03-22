class UsersController < ApplicationController
  skip_before_filter :require_login

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    p params

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: 'User successfully created'
    else
      render :new
    end
  end
end
