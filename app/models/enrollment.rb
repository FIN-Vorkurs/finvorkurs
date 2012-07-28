class Enrollment < ActiveRecord::Base
  attr_accessible :course, :user, :score
  belongs_to :user
  belongs_to :course
end
