class Book < ActiveRecord::Base
  belongs_to :author

  validates :title, :isbn, presence: true
  validates :isbn, format: {
    with: /^ISBN\s((?=[-0-9xX ]{17}$)(?:[0-9]+[- ]){4}[0-9]*[xX0-9]|(?=[-0-9xX ]{13}$)(?:[0-9]+[- ]){3}[0-9]*[xX0-9])$/
  }
  validates :isbn, uniqueness: true

  def self.book_titles(clear = false)
    if clear
      Rails.cache.delete(:book_titles)
    end
    Rails.cache.fetch(:book_titles) { Book.all.collect { |book| 'Book: ' + book.title } }
  end
end
