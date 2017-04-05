class RemoveUserIdFromCart < ActiveRecord::Migration[5.0]
  def change
    remove_column :carts, :user_id
  end
end
