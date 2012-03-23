class Author < ActiveRecord::Base
  has_many :books

  default_scope :order => 'last_name ASC, first_name ASC'

  validates :first_name, :last_name, presence: true

  def to_s
    first_name + ' ' + last_name
  end

  def self.author_names(clear = false)
    if clear
      Rails.cache.delete(:author_names)
    end
    Rails.cache.fetch(:author_names) { Author.all.collect { |author| 'Author: ' + author.to_s } }
  end
end
