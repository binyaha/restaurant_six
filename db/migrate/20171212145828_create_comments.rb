class CreateComments < ActiveRecord::Migration[5.1]
  def change
    #function6-step1 設定comment table屬性注意需要有兩個外鍵
    create_table :comments do |t|

      t.string :content
      t.integer :restaurant_id
      t.integer :user_id

      t.timestamps
    end
  end
end
#--------------看routes.rb