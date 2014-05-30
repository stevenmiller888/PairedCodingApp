FactoryGirl.define do

  sequence(:profile_name) { |n| "KrispyKremes#{n}" }
  sequence(:email) { |n| "KrispyKremes#{n}@http://email.com" } 

  factory :user, aliases: [:friend] do
    full_name "John Doe"
    profile_name 
    password_confirmation "password"
    email 
    password "password"
  end
  
  factory :document do
    text "hello world"
    user 
    friendship_id 1
  end

  factory :friendship do
    user_id 1
    friend_id 2
  end
end