class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    #function4-step1 建立categories表單 並在restaurants表單新增外鍵:category_id
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end
    add_column :restaurants, :category_id, :integer
  end
    #-------------轉到routes.rb
end
    