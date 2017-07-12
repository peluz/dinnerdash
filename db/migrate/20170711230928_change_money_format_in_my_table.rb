class ChangeMoneyFormatInMyTable < ActiveRecord::Migration[5.1]
  def change
  	change_column :items, :price, :numeric
  end
end
