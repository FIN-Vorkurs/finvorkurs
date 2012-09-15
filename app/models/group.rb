class Group < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :enrollments
  has_many :users, through: :enrollments
  # attr_accessible :title, :body
end
