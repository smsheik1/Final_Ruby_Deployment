class User < ApplicationRecord
	has_many :post, through: :liked_posts
	has_many :likes, through: :User
	has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :name, presence: true, length: { in: 2..20 }
	validates :alias, presence: true, length: { in: 2..20 }
	validates :password, presence: true, length: { in: 8..20 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	before_save do
		self.email.downcase!
	end
end
