class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :replies
  attr_accessible :correct, :text
end
