class Deduction < ActiveRecord::Base
  attr_accessible :monthly_frequency, :value, :user_id

  validates_numericality_of :monthly_frequency, :greater_than => 0
  validates_numericality_of :value, :greater_than => 0

  validates_presence_of :monthly_frequency
  validates_presence_of :value

  belongs_to :user

  def pay_period_value
    (value * monthly_frequency) / 4
  end
end
