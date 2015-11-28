class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :author
      t.string :message
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
