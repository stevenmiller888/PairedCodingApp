# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :document do
    text "MyText"
    friendship_id 1
  end
end
