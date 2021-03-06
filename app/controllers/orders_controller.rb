class OrdersController < ApplicationController
	before_action :require_login
	before_action :check_admin, :only => [:edit, :destroy, :update, :index_by_status]

	def index
		if admin?
			@orders = Order.all
		else
			@user = current_user
			@orders = @user.orders
		end
	end

	def index_by_status
		@orders = Order.where(status: params[:status])
		render 'index'
	end

	def show
		@order = Order.find(params[:order_id])
		@items = @order.items
		@quantities = Orderitem.where(order_id: @order.id)
	end

	def create
		@user = current_user
		if current_cart.empty?
			redirect_to items_path
		else
			@order = Order.create(status: "em andamento", user_id: @user[:id])
			populate_order(@order)
			current_cart.clear
			redirect_to orders_path
		end
	end

	def edit
		@order = Order.find(params[:order_id])
		
	end

	def update
  		@order = Order.find(params[:order_id])
 
  		if @order.update(status: params[:status])
    		redirect_to orders_path
 		 else
 	   		render 'edit'
  		end
	end

	private

	def populate_order(order)
		current_cart.each do |item|
			Orderitem.create(item_id: item[:id], quantity: item[:quantity], order_id: order.id)
		end
	end

	def require_login
        redirect_to new_user_path unless logged_in?
    end
end
