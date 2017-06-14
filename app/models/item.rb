class Item < ApplicationRecord
	has_and_belongs_to_many :category
	validates :title, presence: true, uniqueness: true
	validates :description, presence: true
	validates_numericality_of :price, :greater_than_or_equal_to => 0.01
end
