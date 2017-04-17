class AddDetailsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :description, :text
    add_column :users, :image, :string
    add_column :users, :nickname, :string
  end
end
