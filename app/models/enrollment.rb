class Enrollment < ActiveRecord::Base
  attr_accessible :course, :user_id, :score
  belongs_to :user
  belongs_to :course
  belongs_to :group

  def message
    "#{self.user.name} has enrolled to #{self.course.title}"
  end

  def to_s
    if self.user.test_results.where('course_id = ?', self.course.id).empty?
      "#{self.user.name} #{self.group}"
    else
      "#{self.user.name} (#{self.user.test_results.where('course_id = ?', self.course.id).first.score}% #{self.group} #{if self.user.answers.where('question_id = ?', 31).first then self.user.answers.where('question_id = ?', 31).first.text end} #{if self.user.answers.where('question_id = ?', 32).first then self.user.answers.where('question_id = ?', 32).first.text end})"
    end
  end

end
