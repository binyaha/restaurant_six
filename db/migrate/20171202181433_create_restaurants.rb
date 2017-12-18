class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      #function1-建立後台登入流程-step1. 一切的起點 建立restaurant model後，增加餐廳需要的基本屬性 
      t.string :name
      t.string :tel
      t.string :address
      t.string :opening_hours
      t.string :description
      #-----------------------------------請接到routes.rb
      t.timestamps
    end
  end
end
