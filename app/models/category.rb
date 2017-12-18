class Category < ApplicationRecord

  #function4-step13 name屬性必須存在
  validates_presence_of :name
  #-------做edit功能 看view index.html.erb

  #function4-step3 建立表單的關聯 一個分類有很多餐廳 同時分類被刪除 裡面的餐廳也被刪除
  has_many :restaurants, dependent: :destroy
  #----------到model restaurant建立關聯
end

