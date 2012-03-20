class Book < ActiveRecord::Base
  belongs_to :author

  validates :title, :isbn, presence: true
end
