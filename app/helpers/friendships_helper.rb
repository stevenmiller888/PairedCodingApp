module FriendshipsHelper
  def check_friendship_owner
    friendship = current_user.friendships.where(:id => params[:id]).first
    if friendship.nil?
      redirect_to friendships_path
    end
  end
end