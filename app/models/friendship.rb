class Friendship < ActiveRecord::Base
  belongs_to :user #User who initiated the relationship
  belongs_to :friend, :class_name => 'User' #User who has been friended

  validates :user, presence: true
  validates :friend, presence: true
end