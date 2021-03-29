class User < ApplicationRecord
has_many :userinfos, dependent: :destroy

has_many :messages, dependent: :destroy
has_many :images, dependent: :destroy

 has_many :friendships, dependent: :destroy
  has_many :friends, :through => :friendships  
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"  
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user


before_save {self.email = email.downcase}
     
    validates :username, presence: true, 
                    uniqueness: {case_sensitive: false}, 
                    length: {minimum: 3, maximum: 25}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 	 validates :username, presence: true, 
                    uniqueness: {case_sensitive: false}, 
                    length: {minimum: 3, maximum: 25}
 	has_secure_password


def count_friends
	friends.all.count
  end

 
  

end
