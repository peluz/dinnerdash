module OrdersHelper
	def current_user
    	@current_user ||= User.find_by(id: session[:user_id])
 	end

 	def total_price(order)
 		@items = order.items
 		@quantities = Orderitem.where(order_id: order.id)
 		total = 0
 		@items.each do |item|
 		  total += item.price * @quantities.find_by(item_id: item.id).quantity
 		end
 		return total
 	end

 	def pretty_time(time)
 		time.strftime("%d/%m/%Y") + time.strftime(' às %H:%M:%S')
 	end

 	def total_orders(status)
 		Order.where(status: status).count
 	end
end
