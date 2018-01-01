class CreateRfriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :rfriendships do |t|
      t.integer :user_id
      t.integer :rfriending_id

      t.timestamps
    end
  end
end
