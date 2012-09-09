class TestResult < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  attr_accessible :score

  def message
    "#{self.user.email} finished the test for #{self.course.title} with #{self.score} %"
  end

end
