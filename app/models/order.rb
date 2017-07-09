class Order < ApplicationRecord
	belongs_to :user
	has_many :orderitems
	has_many :items, through: :orderitems
	validates :status, inclusion: { in: ["em andamento", "pago", "cancelado", "confirmado"] },
	                   presence: true
end
