class CartsController < ApplicationController
	def index
		@items = Item.all
		@cart = current_cart
	end

	def add
		@items = Item.all	#dps do render view do carriho index pode retirar
		current_cart << {id: params[:item_id], quantity: 1}
		@cart = current_cart
		merged_cart = current_cart.group_by {|h1| h1[:id]}.map do |k,v|
			{:id => k, :quantity => v.map { |h2| h2[:quantity]}.sum}
		end
		@cart = merged_cart
		render 'carts/index' #render pro view do carrinho index
	end

	def destroy
		@cart = merged_cart
		byebug
	end
end
