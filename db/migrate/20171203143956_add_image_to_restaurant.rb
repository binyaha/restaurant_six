class AddImageToRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :restuarants, :image, :string
    

  end
end
