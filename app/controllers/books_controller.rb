class BooksController < ApplicationController
  skip_before_filter :require_login, only: [:index, :show]
  cache_sweeper :book_sweeper

  def index
    @author = Author.find(params[:author]) if params[:author] rescue nil
    if @author
      @books = @author.books.paginate(page: params[:page])
    else
      @books = Book.paginate(page: params[:page])
    end
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
    @book = Book.new(params[:book])

    if @book.save
      redirect_to books_path, notice: "#{@book.title} was successfully created"
    else
      render :new
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update_attributes(params[:book])
      redirect_to @book, notice: "#{@book.title} was updated successfully"
    else
      render :new
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy

    redirect_to books_path, notice: "#{book.title} was successfully deleted"
  end
end
