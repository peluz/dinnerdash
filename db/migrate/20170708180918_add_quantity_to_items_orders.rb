class AddQuantityToItemsOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :items_orders, :quantity, :integer
  end
end
