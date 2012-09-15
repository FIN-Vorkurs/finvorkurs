class Group < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :enrollments
  has_many :users, through: :enrollments
  accepts_nested_attributes_for :users
  # attr_accessible :title, :body
end
