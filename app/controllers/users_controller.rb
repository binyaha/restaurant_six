class UsersController < ApplicationController

  def show
    @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    
    if @user == current_user
      @user.update(user_params)
      flash[:notice]= "Update success"
      redirect_to user_path(@user)
    else
      flash[:alert]= "You can not pass!!!"
      render :edit
    end
  end


  private
    def user_params
      params.require(:user).permit(:name, :intro, :avatar)
    end

end
