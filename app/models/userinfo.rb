class Userinfo < ApplicationRecord
      belongs_to :user
        
        validates :title, presence: true, length: {minimum: 6, maximum: 100}
        validates :description, presence: true, length: {minimum: 10, maximum: 300}
        validates  :user_id, :eduction, :from, :contactinfo, :company, :passions, :Jobtitle, presence: true
 end
