class Course < ActiveRecord::Base
  has_many :enrollments
  belongs_to :test
end
