class Item < ApplicationRecord
	has_many :orderitems
	has_many :orders, through: :orderitems
	has_and_belongs_to_many :categories
	validates :title, presence: true, uniqueness: true
	validates :description, presence: true
	validates_numericality_of :price, :greater_than_or_equal_to => 0.01
end
