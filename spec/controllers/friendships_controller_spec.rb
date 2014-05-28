require 'spec_helper'

describe FriendshipsController do

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
  
  describe "Get #index" do
    it "assigns all friendships to @friendships" do
      friendship = Friendship.create(user_id: 1, friend_id: 2)
      get :index
      assigns(:friendships).should eq([friendship])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  # describe "Get #show" do
  #   it "assigns the requested document to @document" do
  #     get :show, id: Factory(:document)
  #     response.should render_template :show
  #   end
  # end

  describe "Delete #destroy" do
    before :each do
      @friendship = FactoryGirl.create(:friendship, user: @user)
    end

    it "deletes the friendship" do
      expect{
        delete :destroy, id: @friendship
      }.to change(Friendship, :count).by(-1)
    end
  end

  describe "Add Friend" do
    it "should not be able to add self as friend" do

      expect{
        post :create, friend_id: @user.id 
      }.not_to change( @user.friends.count )

    end
  end

  


  # describe "Get #show" do
  #   it "displays the document" do
  #   end
  # end
end
