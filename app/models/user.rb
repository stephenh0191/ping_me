class User < ApplicationRecord
before_save {self.email = email.downcase}
    has_many :articles, dependent: :destroy
    validates :username, presence: true, 
                    uniqueness: {case_sensitive: false}, 
                    length: {minimum: 3, maximum: 25}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 	 validates :username, presence: true, 
                    uniqueness: {case_sensitive: false}, 
                    length: {minimum: 3, maximum: 25}
    has_many :messages
 	has_secure_password
end
