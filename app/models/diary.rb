class Diary < ActiveRecord::Base
  belongs_to :internship
  belongs_to :user, :class_name => "User", :foreign_key => 'user_id'
  validate :user_quota, :on => :create 
  def user_quota
   if user.diaries.today.count >= 1
     errors.add(:base ,"Exceeds daily limit")
   end
  end

  has_many :comments , :dependent => :destroy
  attr_accessible :content, :name, :private, :internship_id
end
