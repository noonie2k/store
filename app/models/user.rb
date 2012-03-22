class User < ActiveRecord::Base
  has_secure_password

  validates :username, :name, presence: true
  validates :password, presence: true, on: :create
end
