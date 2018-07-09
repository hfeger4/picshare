class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true, presence: true
  has_many :posts

  def to_s
    username
  end
end
