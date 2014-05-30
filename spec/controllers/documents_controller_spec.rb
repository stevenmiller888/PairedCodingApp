require 'spec_helper'

describe DocumentsController do

  before (:each) do
    @user1 = FactoryGirl.create(:user)
    sign_in @user1
    @user2 = FactoryGirl.create(:user)
    @document = FactoryGirl.create(:document)
    @document.user_id = user1.id
  end

  describe "Get #index" do
    it 'should render the right document' do
      get :index, document: { friendship_id: @document.friendship_id }, format: :json
      response.body.should_not eq(nil)
    end
  end

  describe "Update #update" do
    it 'should update itself' do
      # expect(factory).to_be valid
      binding.pry
      put :update, document: {text: @document.text, friendship_id: 1} , format: :json
      # }.to change( @document.text )
      response.body.should_not eq(nil)
    end
  end

end