class Education < ActiveRecord::Base
  belongs_to :user, :class_name => "User", :foreign_key => 'user_id'
  attr_accessible :department, :faculty, :university, :user_id
  validates_uniqueness_of :user_id
end
