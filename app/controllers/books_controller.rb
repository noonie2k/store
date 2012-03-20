class BooksController < ApplicationController
  def index
    @books = Book.paginate(page: params[:page])
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
