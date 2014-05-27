class SitesController < ApplicationController

  def index
    @users = User.all
  end

  def about
  end

  def contact
  end

end
