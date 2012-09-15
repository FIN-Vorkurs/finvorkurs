class Enrollment < ActiveRecord::Base
  attr_accessible :course, :user, :score
  belongs_to :user
  belongs_to :course
  belongs_to :group

  def message
    "#{self.user.name} has enrolled to #{self.course.title}"
  end

end
