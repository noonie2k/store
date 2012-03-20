class AuthorsController < ApplicationController
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
      redirect_to authors_path, notice: 'Author was successfully created'
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end
end
