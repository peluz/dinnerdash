class Order < ApplicationRecord
	belongs_to :user
	has_and_belongs_to_many :items
	validates :status, inclusion: { in: ["em andamento", "pago", "cancelado", "confirmado"] },
	                   presence: true
end
