class RfriendshipsController < ApplicationController


def create
   @rfriendship = current_user.rfriendships.build(rfriending_id: params[:rfriending_id])

      if @rfriendship.save
        flash[:notice] = "Successfully friend"
        redirect_back(fallback_location: root_path)
      end

end

  def destroy
    @rfriendship=current_user.rfriendships.where(rfriending_id: params[:id]).first
    @rfriendship.destroy

    flash[:alert] = "Followship destroyed"
    redirect_back(fallback_location: root_path)
  end



end
