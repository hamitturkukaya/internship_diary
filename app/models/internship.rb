class Internship < ActiveRecord::Base
  belongs_to :user
  has_many :diaries, :dependent => :destroy 
  attr_accessible :company, :end_date, :start_date, :title, :internship_type
end
