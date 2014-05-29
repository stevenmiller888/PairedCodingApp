FactoryGirl.define do

  factory :user do
    full_name "John Doe"
    profile_name "JohnDoe123"
    password_confirmation "password"
    email "email@email.com"
    password "password"
  end

end