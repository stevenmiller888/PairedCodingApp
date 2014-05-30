class UsersController < ApplicationController
  include UsersHelper

  before_action :authenticate_user!
  before_action :check_user_page_owner, only: [:show]

  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

end