class User < ApplicationRecord
	validates :username, presence: true, uniqueness: true
	VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
	validates :address, presence: true
	has_secure_password

	def User.digest(string)
	    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	                                                  BCrypt::Engine.cost
	    BCrypt::Password.create(string, cost: cost)
  	end
end
