class Comment < ActiveRecord::Base
  belongs_to :user,   :class_name => "User", :foreign_key => 'user_id'
  belongs_to :diary
  attr_accessible :comment, :user_id, :diary_id
end
