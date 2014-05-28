class SitesController < ApplicationController

  def index
    #for signed-in users, skip landing page and redirect to friends page
    if user_signed_in?
      redirect_to friendships_path
    else
      render 'index'
    end
  end

  def about
  end

  def contact
  end

end
