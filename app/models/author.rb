class Author < ActiveRecord::Base
  has_many :books

  default_scope :order => 'last_name ASC, first_name ASC'

  validates :first_name, :last_name, presence: true

  def to_s
    first_name + ' ' + last_name
  end
end
