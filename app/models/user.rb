class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  mount_uploader :avatar, PhotoUploader

#function8-step1 為了透過comment找到restaurants
  has_many :restaurants, through: :comments
#-------------看controller users(不是devise的喔)
  

#function1-step13 在user這個物件增加admin?方法
def admin?
  self.role == "admin"  #如果user的role屬性是admin就回傳true
end
#-----------此時function1登入功能完成 可以進到rails console修改屬性測試，只有管理者可進到後台．
#-----------接著做function2 restaurant後台CRUD功能 看toutes.rb

end
