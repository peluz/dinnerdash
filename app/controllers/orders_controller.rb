class OrdersController < ApplicationController
	before_action :require_login

	def index
		@user = current_user
		@orders = @user.orders
	end

	def show
		@order = Order.find(params[:order_id])
		@items = @order.items
		@quantities = Orderitem.where(order_id: @order.id)
	end

	def create
		@user = current_user
		@order = Order.create(status: "em andamento", user_id: @user[:id])
		populate_order(@order)
		current_cart.clear
		redirect_to orders_path

	end

	private

	def populate_order(order)
		current_cart.each do |item|
			Orderitem.create(item_id: item[:id], quantity: item[:quantity], order_id: order.id)
		end
	end

	def require_login
    unless logged_in?
      redirect_to new_user_path
    end
  end

end
