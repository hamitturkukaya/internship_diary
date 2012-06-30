class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  has_one  :education,   :dependent => :destroy
  has_many :internships, :dependent => :destroy
  has_many :diaries ,    :dependent => :destroy do    
    def today
      where(:created_at => (Time.now.beginning_of_day..Time.now))
    end 
  end
  
  has_many :comments ,   :dependent => :destroy
  accepts_nested_attributes_for :education, :internships
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :surname
  # attr_accessible :title, :body
  validates_format_of :email, {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+edu.tr)$/i , :on => :create , :message => "Only .edu.tr mails acceptable" }
  validates_uniqueness_of :email
end
