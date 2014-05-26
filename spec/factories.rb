FactoryGirl.define do

  # sequence :email |n|
  #   "email#{n}@factory.com"
  # end

  factory :user do
    email "email@email.com"
    password "password"
  end

end