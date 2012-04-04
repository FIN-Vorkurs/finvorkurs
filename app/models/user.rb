class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation
  validates :password, :presence => true, :on => :create
  validates :email, :uniqueness => true

  def generate_token column
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists? column => self[column]
  end

  def send_password_reset
    generate_token :password_reset_token
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  ADMIN = 2
  TUTOR = 1
  USER = 0

end
