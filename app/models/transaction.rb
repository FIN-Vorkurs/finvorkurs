class Transaction < ActiveRecord::Base
  attr_accessible :amount, :category, :notes, :payee, :subject
end
