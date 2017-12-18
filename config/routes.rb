Rails.application.routes.draw do
#function7-step5 跟路由說user的registrations users/sessionscontroller要用自訂的
  devise_for :users, controllers: { registrations: 'users/registrations',sessions: "users/sessions"  }
#-------------開始做edit功能 回controller users

  
#function7-step2 給users新增路由
  resources :users, only: [:show,:edit, :update]
#---------看controller users


#function5-step1 增加前台路由 do是之後做comment才會增加的
resources :restaurants, only: [:index, :show] do
#----------------看controller restaurants(前台的)

#function6-step2 增加comments路由 因為comment顯示時會對應到餐廳 在這邊用巢狀路由
  resources :comments, only: [:create, :destroy]
end
#----------先讓comment能夠顯示 看view restaurants/show.html.erb

#這是function5時要設定的 是step1
resources :categories, only: [:show]
#----------------------------

#fuction1-step2 建立前後台的首頁，後面有前台resources後應該可以刪掉前台
root "restaurants#index"

namespace :admin do
  root "restaurants#index" 
#----------------------------------接到controller-restaurants

#unction4-step2 增加categories 路由
  resources :categories
#---------------model category 建立表單的關聯

#function2-step1 增加restaurants 路由
  resources :restaurants
#---------轉到controller admin::restaurants
   
end

end
