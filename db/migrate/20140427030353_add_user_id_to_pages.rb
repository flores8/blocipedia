class AddUserIdToPages < ActiveRecord::Migration
  def change
  	add_column :pages, :user_id, :integer
  	add_index :posts, :user_id
  end
end
