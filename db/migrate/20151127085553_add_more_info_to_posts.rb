class AddMoreInfoToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :timeposted, :datetime
  end
end
