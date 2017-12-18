class AddImageToRestaurant < ActiveRecord::Migration[5.1]
  def change
    #function3-step2 新增image(檔案位置)
    add_column :restaurants, :image, :string
    #-------注意此時要在終端機下些指令 包誇migrate&產生uploader 接著到model restaurant

  end
end
