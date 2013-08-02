class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :users, through: :enrollments
  has_many :answers, through: :questions
  has_many :questions
  has_many :test_results
  has_many :groups

  def resume_test_path user
    next_question = (self.questions - user.questions).first
    next_question && [self, next_question]
  end

end
