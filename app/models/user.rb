class User < ApplicationRecord

  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships

  has_many :inverse_followships, class_name: "Followship", foreign_key: "following_id"
  has_many :followers, through: :inverse_followships, source: :user

  has_many :rfriendships, dependent: :destroy
  has_many :rfriendings, through: :rfriendships

  has_many :inverse_rfriendships, class_name: "Rfriendship", foreign_key: "rfriending_id"
  has_many :addfriends, through: :inverse_rfriendships, source: :user


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  mount_uploader :avatar, PhotoUploader

#function8-step1 為了透過comment找到restaurants
  has_many :restaurants, through: :comments
#-------------看controller users(不是devise的喔)

  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant


  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant

#function1-step13 在user這個物件增加admin?方法
def admin?
  self.role == "admin"  #如果user的role屬性是admin就回傳true
end
#-----------此時function1登入功能完成 可以進到rails console修改屬性測試，只有管理者可進到後台．
#-----------接著做function2 restaurant後台CRUD功能 看toutes.rb

def following?(user)
  self.followings.include?(user)
end

def friending?(user)
  self.rfriendings.include?(user)
end

def test
  first=self.rfriendings
  
  second=self.addfriends
  (first+second).sort

end

def all_friends
  first=self.rfriendings
  temp2={}
  second=self.addfriends
  temps=(first+second).sort
  temps.each_with_index do |temp , i|
    if temp == temp2
      temps[i]=nil
    end
    temp2=temp
  end
  temps.delete(nil)
  return temps
  
end

end
