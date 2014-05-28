class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  validates :full_name, presence: true, length: { minimum: 2 }
  validates :profile_name, presence: true, uniqueness: true , length: { minimum: 3 }

  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :documents
<<<<<<< HEAD

end
=======
end
>>>>>>> updated controllers, models, views, and javascript to get editors working
