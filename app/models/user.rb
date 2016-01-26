class User < ActiveRecord::Base

  #attr_accessor :password, :password_confirmation
  has_secure_password

  # validates_presence_of :password, :on => :create
  validates_presence_of :email_id
  validates_uniqueness_of :email_id

  
  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
    self.save
    self.access_token
  end

end
