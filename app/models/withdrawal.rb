class Withdrawal < ActiveRecord::Base
  attr_accessible :pay_period_id, :value, :memo

  validates_numericality_of :value, :greater_than => 0

  validates_presence_of :value

  belongs_to :pay_period
end
