class CreateFollowships < ActiveRecord::Migration[5.1]
  def change
    create_table :followships do |t|
      t.integer :following_id
      t.integer :user_id
      t.timestamps
    end
  end
end
