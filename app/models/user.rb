class User < ActiveRecord::Base

  #attr_accessor :password, :password_confirmation
  has_secure_password

  # validates_presence_of :password, :on => :create
  validates_presence_of :email_id
  validates_uniqueness_of :email_id

end
