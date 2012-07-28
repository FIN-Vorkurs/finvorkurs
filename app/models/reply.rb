class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  attr_accessible :title, :body
end
