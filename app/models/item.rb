class Item < ApplicationRecord
	has_many :orders
	has_and_belongs_to_many :categories
	has_and_belongs_to_many :orders
	validates :title, presence: true, uniqueness: true
	validates :description, presence: true
	validates_numericality_of :price, :greater_than_or_equal_to => 0.01
end
