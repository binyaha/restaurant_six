class CommentsController < ApplicationController

#function6-step4 Create功能需要參數
  def create
    @restaurant=Restaurant.find(params[:restaurant_id]) #找到此時是在哪一個restaurant
    @comment=@restaurant.comments.build(comment_params) #把form內資料傳入
    @comment.user= current_user #把這條comment對應的user存成現在的user
    @comment.save!
    redirect_to restaurant_path(@restaurant)
  end
#---------------寫comment_params 方法 看最底下

#function6-step6 刪除功能
  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id]) #純粹給redirect用的
    @comment = Comment.find(params[:id]) #找到要刪除的comment

    if current_user.admin? #如果是管理者才給刪除
      @comment.destroy
      redirect_to restaurant_path(@restaurant)
    end
  end
  #--------------function6完成 做function7 個人profile 看db users


  private
#function6-step5 strong parameter
  def comment_params
    params.require(:comment).permit(:content)
  end
#------------做刪除功能看def destroy

end
