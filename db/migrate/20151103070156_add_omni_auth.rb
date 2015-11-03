class AddOmniAuth < ActiveRecord::Migration
  #def change
  #	add_column :users, :provider, :string
  #end
  def self.up
    create_table :authentications do |t|
      t.references :user
      t.string :provider
      t.string :uid
      t.timestamps
    end
    add_index :authentications, :user_id
    add_index :authentications, [:provider, :uid]
  end

  def self.down
    drop_table :authentications
  end
  
end
