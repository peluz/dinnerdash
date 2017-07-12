class AddHiddenToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :hidden, :boolean
  end
end
