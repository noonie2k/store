class SearchController < ApplicationController
  skip_before_filter :require_login

  def perform
    isbn = /^ISBN ((?=[-0-9xX ]{17}$)(?:[0-9]+[- ]){4}[0-9]*[xX0-9]|(?=[-0-9xX ]{13}$)(?:[0-9]+[- ]){3}[0-9]*[xX0-9])$/

    if isbn.match(params[:search])
      path = Book.find_by_isbn(params[:search])
    end

    unless path
      matches = /^(\w+): (.+)$/.match(params[:search])

      if matches && matches.length == 2
        type = matches[1]
        term = matches[2]

        case type
        when 'Book'
          path = book_path(Book.find_by_title(term))
        when 'Author'
          path = author_path(Author.find_by_name(term))
        end
      end
    end

    redirect_to path rescue redirect_to root_path, notice: 'Nothing found'
  end
end
