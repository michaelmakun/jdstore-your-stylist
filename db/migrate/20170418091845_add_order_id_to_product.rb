class AddOrderIdToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :order_id, :integer
  end
end
