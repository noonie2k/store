class SearchController < ApplicationController
  def perform
    isbn = /^ISBN\s((?=[-0-9xX ]{17}$)(?:[0-9]+[- ]){4}[0-9]*[xX0-9]|(?=[-0-9xX ]{13}$)(?:[0-9]+[- ]){3}[0-9]*[xX0-9])$/

    if isbn.match(params[:search])
      book = Book.find_by_isbn(params[:search])
    else
      book = Book.find_by_title(params[:search])
    end

    if book
      redirect_to book
      return
    else
      redirect_to root_path, notice: 'Nothing found'
    end
  end
end
