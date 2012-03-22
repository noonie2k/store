class AuthorsController < ApplicationController
  skip_before_filter :require_login, only: [:index, :show]

  def index
    @authors = Author.paginate(page: params[:page])
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(
      first_name: params[:author][:first_name],
      last_name: params[:author][:last_name]
    )

    if @author.save
      redirect_to authors_path, notice: "#{@author} was successfully created"
    else
      render :new
    end
  end

  def update
    @author = Author.find(params[:id])

    if @author.update_attributes(params[:author])
      redirect_to @author, notice: "#{@author} was updated successfully"
    else
      render :edit
    end
  end

  def destroy
    author = Author.find(params[:id])
    author.destroy

    redirect_to authors_path, notice: "#{author} was successfully deleted"
  end
end
