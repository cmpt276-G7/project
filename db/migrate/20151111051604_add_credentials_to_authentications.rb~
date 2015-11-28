class AddCredentialsToAuthentications < ActiveRecord::Migration
  def change
    add_column :authentications, :token, :string
    add_column :authentications, :secret, :string
    add_column :authentications, :expires, :boolean
    add_column :authentications, :expires_at, :string
  end
end
