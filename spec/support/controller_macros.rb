module ControllerMacros


  #method to create a logged in user for the purpose of testing, included in the spec_helper
  def login_user
    before(:each) do
      #used to tell Devise which mapping should be used before a request
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in user
    end
  end

end