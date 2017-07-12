class CartsController < ApplicationController
	def index
		@cart = merge_cart
		@items = []
		@cart.each do |cart|
			@items << [Item.find(cart[:id]), cart[:quantity]]
		end
	end

	def add
		@items = Item.all	#dps do render view do carriho index pode retirar
		current_cart << {id: params[:item_id], quantity: 1}
		@price = Item.find(params[:item_id]).price.to_f
		@@total += @price
		session[:cart] = merge_cart
		@cart = session[:cart]
		render json: [@cart, params[:item_id], @price, @@total]  
	end

	def destroy
		@cart = merge_cart
		@cart.each do |cart|
			if cart[:id] == params[:item_id] 
				@quantity = cart[:quantity]
			end	
		end	
		@price = Item.find(params[:item_id]).price.to_f
		@cart.delete_if {|cart| cart[:id] == params[:item_id]}
		session[:cart] = @cart
		@@total = @@total - @price * @quantity
		redirect_to carts_path_url
	end
	def minus
		@items = Item.all
		unless current_cart.include?({id: params[:item_id], quantity: 1})
			current_cart << {id: params[:item_id], quantity: -1}
			@price = Item.find(params[:item_id]).price.to_f
			@@total = @@total - @price 
			session[:cart] = merge_cart
			@cart = session[:cart]
		end
		render json: [@cart, params[:item_id], @price, @@total]  
	end	
	private

		def merge_cart
			merged_cart = current_cart.group_by {|h1| h1[:id]}.map do |k,v|
				{:id => k, :quantity => v.map { |h2| h2[:quantity]}.sum}
			end		
		end
end
