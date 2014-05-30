module UsersHelper
  def check_user_page_owner
    user = User.find(params[:id])
    if user.id != current_user.id
      redirect_to friendships_path
    end
  end
end