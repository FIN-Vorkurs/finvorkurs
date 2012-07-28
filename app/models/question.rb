class Question < ActiveRecord::Base
  belongs_to :course
  has_many :answers
  attr_accessible :text

  def previous
    self.class.last :order => 'id', :conditions => ['id < ?', self.id]
  end

  def next
    self.class.first :order => 'id', :conditions => ['id > ?', self.id]
  end
end
