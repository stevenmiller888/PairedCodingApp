class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @friendships = Friendship.all
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      # At creation, the owner is whoever the current user is, which means the user who initited the add
      @document1 = current_user.documents.build(text: "", friendship_id: @friendship.id)
      @document1.save
      # At creation, the owner is the user who was friended, i.e. the one with friend_id
      friend = User.find(params[:friend_id])
      @document2 = friend.documents.build(text: "", friendship_id: @friendship.id)
      @document2.save
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
    #Editing session
    @documents = Document.where(friendship_id: params[:id])
    @documents.each do |document|
      if document.user_id == current_user.id
        #document1 is the current_user's document
        @document1 = document
        @current_user_id = current_user.id
        @current_user = current_user
      else
        #document2 is the friend's document
        @document2 = document
        @friend_id = @document2.user_id
        @friend = User.find(@friend_id)
      end
    end
  end

end
