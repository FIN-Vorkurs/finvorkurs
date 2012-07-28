class TestResult < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  attr_accessible :score
end
