class User < ActiveRecord::Base
  has_secure_password
  has_many :enrollments, dependent: :destroy
  has_many :courses, through: :enrollments
  has_many :replies, dependent: :destroy
  has_many :answers, through: :replies
  has_many :questions, through: :answers
  has_many :test_results, dependent: :destroy
  attr_accessible :email, :name, :password, :password_confirmation, :role
  validates :password, :presence => true, :on => :create
  validates :email, :uniqueness => true
  validates :name, presence: true, :if => proc { |u| not u.courses.empty? }

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

  def send_new_user_notification user
    UserMailer.new_user_notification(self, user).deliver
  end

  def send_newsletter post
    UserMailer.send_newsletter_to_user(self, post).deliver
  end

  def send_enrollment_confirmation course
    UserMailer.send_enrollment_confirmation_to_user(self, course).deliver
  end

  def in_course? course
    self.courses.include? course
  end

  def answers_for course
    self.answers.joins(:question).where questions: {course_id: course}
  end

  def message
    "#{self.email} has created an Account"
  end


  ADMIN = 2
  TUTOR = 1
  USER = 0

end
