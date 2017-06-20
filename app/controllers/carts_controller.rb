class CartsController < ApplicationController
	def index
		
	end

	def add
		@items = Item.all	#dps do render view do carriho index pode retirar
		current_cart << {id: params[:item_id], quantity: 1}
		render 'items/index' #render pro view do carrinho index
	end
end
