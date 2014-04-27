class AddUserIdToPages < ActiveRecord::Migration
  def change
  	add_column :pages, :user_id, :integer, index: true
  end
end
