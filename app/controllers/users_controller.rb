class UsersController < ApplicationController

  def index
    @users = User.all
  end

#function7-step3 要傳給show的資料
  def show
    @user=User.find(params[:id]) #找到對應的user
#--------------看view user/show.html.erb

#function8-step2 傳入被評論過的餐廳  
    @commented_restaurants=@user.restaurants.sort #為了刪除重複資料用的
    @temp={}  #跟第一筆資料比較用的


    @favorited_restaurants = @user.favorited_restaurants
    @followings=@user.followings
    @followers=@user.followers


  end
#----------看view users/show

#function7-step6 找到user
  def edit
    @user=User.find(params[:id])
  end
#----看view user/edit.html.erb

#function7-step8 找到user後修改資料 特點是要跟current_user比較 相同才能改
  def update
    @user=User.find(params[:id])
    
    if @user == current_user  #跟current_user才能修改
      @user.update(user_params)
      flash[:notice]= "Update success"
      redirect_to user_path(@user)
    else
      flash[:alert]= "You can not pass!!!"  #甘道夫經典台詞
      render :edit
    end
  end
  #----------function7完成 到routes8 做顯示評論過的餐廳的功能 到model user建立關聯


  def friend_list
    @user=User.find(params[:id])
    @friend_list=@user.rfriendings

    @add_friends=@user.addfriends
  end

  private
  #sorong parameter
    def user_params
      params.require(:user).permit(:name, :intro, :avatar)
    end
  #-----------------

end
