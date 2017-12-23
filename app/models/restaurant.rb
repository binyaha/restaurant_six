class Restaurant < ApplicationRecord
#function3-step4 建立表單關聯 一間餐廳只屬於一個分類
belongs_to :category
#------------先把原本restaurant後台index頁面加上分類的欄 轉到view admin/restaurants/index.html.erb

has_many :comments,dependent: :destroy


#function2-step10 驗證傳入資料是否有name屬性

has_many :favorites, dependent: :destroy
has_many :favorited_users, through: :favorites, source: :user


validates_presence_of :name
#------------create功能完成 回controller做show功能

#function3-step3 掛載uploader
mount_uploader :image, PhotoUploader
#----轉到view _form頁面

def is_favorited?(user)
  self.favorited_users.include?(user)
end

end
