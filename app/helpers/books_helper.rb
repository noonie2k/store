module BooksHelper
  def book_titles
    Rails.cache.fetch(:book_titles) { BookSweeper.collect_book_titles }
  end
end
