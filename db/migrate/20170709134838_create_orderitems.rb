class CreateOrderitems < ActiveRecord::Migration[5.1]
  def change
    create_table :orderitems do |t|
      t.integer :quantity
      t.belongs_to :order, index: true
      t.belongs_to :item, index: true

      t.timestamps
    end
  end
end
