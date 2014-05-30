require 'spec_helper'

# validates :full_name, presence: true, length: { minimum: 2 }
#  validates :profile_name, presence: true, uniqueness: true , length: { minimum: 3 }


describe User do

  it 'creates a user' do
    FactoryGirl.create(:user).should be_valid
  end

  it 'is not valid without a full_name' do
    FactoryGirl.build(:user, full_name: nil).should_not be_valid
  end


  it 'is not valid without a profile_name' do
    FactoryGirl.build(:user, profile_name:nil).should_not be_valid
  end

  it 'has a profile_name that is unique' do
    profile_name1 = FactoryGirl.create(:user)
    profile_name2  = profile_name1.dup
    profile_name2.should_not be_valid
  end
  
end