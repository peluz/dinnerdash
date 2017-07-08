class User < ApplicationRecord
	has_many :orders, :dependent => :destroy
	has_many :items, through: :orders
	validates :username, presence: true, uniqueness: true
	VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
	validates :address, presence: true
	validates :admin, presence: true
	has_secure_password
end
