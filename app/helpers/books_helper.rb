module BooksHelper
  def book_titles
    books = []
    Book.all.each do |book|
      books << book.title
    end
    books
  end
end
