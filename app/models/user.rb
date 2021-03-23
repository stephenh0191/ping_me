class User < ApplicationRecord
has_many :messages, dependent: :destroy
has_many :images, dependent: :destroy
before_save {self.email = email.downcase}
     
    validates :username, presence: true, 
                    uniqueness: {case_sensitive: false}, 
                    length: {minimum: 3, maximum: 25}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 	 validates :username, presence: true, 
                    uniqueness: {case_sensitive: false}, 
                    length: {minimum: 3, maximum: 25}
 	has_secure_password
end
