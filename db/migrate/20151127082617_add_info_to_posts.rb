class AddInfoToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :provider, :string
    add_column :posts, :picture, :string
    add_column :posts, :link, :string
  end
end
