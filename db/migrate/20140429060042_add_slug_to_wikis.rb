class AddSlugToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :slug, :string
    add_index :wikis, :slug
    add_column :pages, :slug, :string
    add_index :pages, :slug
  end
end
