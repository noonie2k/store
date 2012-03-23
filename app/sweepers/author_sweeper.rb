class AuthorSweeper < ActionController::Caching::Sweeper
  observe Author

  # Repopulate the cached list of author titles if a new author is created
  def after_create(author)
    Rails.cache.write(:author_names, Author::author_names(true))
  end

  # Repopulate the cached list of author titles if a author is updated
  def after_update(author)
    Rails.cache.write(:author_names, Author::author_names(true))
  end

  # Repopulate the cached list of author titles if a author is destroyed
  def after_destroy(author)
    Rails.cache.write(:author_names, Author::author_names(true))
  end
end
