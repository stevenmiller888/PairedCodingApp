class FriendshipsController < ApplicationController

  def index
    @users = User.all
    @friendships = Friendship.all
  end

  def create
    #have a duplicate check
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      @document = Document.create(text: "", friendship_id: @friendship.id)
      flash[:notice] = "Added friend."
      redirect_to friendships_path
    else
      flash[:notice] = "Unable to add friend."
      redirect_to friendships_path
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to friendships_path
  end

  def show
    @document = Document.find(params[:id])
  end

end
