class BookSweeper < ActionController::Caching::Sweeper
  observe Book

  # Repopulate the cached list of book titles if a new book is created
  def after_create(book)
    Rails.cache.write(:book_titles, Book::book_titles(true))
  end

  # Repopulate the cached list of book titles if a book is updated
  def after_update(book)
    Rails.cache.write(:book_titles, Book::book_titles(true))
  end

  # Repopulate the cached list of book titles if a book is destroyed
  def after_destroy(book)
    Rails.cache.write(:book_titles, Book::book_titles(true))
  end
end
