class BookSweeper < ActionController::Caching::Sweeper
  observe Book

  # Repopulate the cached list of book titles if a new book is created
  def after_create(book)
    Rails.cache.write(:book_titles, BookSweeper::collect_book_titles)
  end

  # Repopulate the cached list of book titles if a book is updated
  def after_update(book)
    Rails.cache.write(:book_titles, BookSweeper::collect_book_titles)
  end

  # Repopulate the cached list of book titles if a book is destroyed
  def after_destroy(book)
    Rails.cache.write(:book_titles, BookSweeper::collect_book_titles)
  end

  protected
    # Collect the titles of all books in the system
    #
    # @return [Array] array of book titles
    def self.collect_book_titles
      Book.all.collect { |book| book.title }
    end
end
