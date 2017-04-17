class AddIsStylistToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_stylist, :boolean, default: false
  end
end
