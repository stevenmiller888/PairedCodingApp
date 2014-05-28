class DocumentsController < ApplicationController
  before_action :authenticate_user!

  def index
    #get to here
    @document = Document.where(friendship_id: params["document"]["friendship_id"], user_id: params["document"]["user_id"])[0]
    respond_to do |format|
      format.json { render json: @document, status: :ok}
    end
  end

  def update
    #put to here
    @document = Document.where(friendship_id: params["document"]["friendship_id"], user_id: current_user.id)[0]
    updated_attributes = params.require(:document).permit(:text, :friendship_id, :user_id)
    @document.update_attributes(updated_attributes)
    respond_to do |format|
      format.json { render json: @document, status: :ok }
    end
  end
end
