class PayPeriod < ActiveRecord::Base
  attr_accessible :end_date, :gross_income, :net_income, :savings, :start_date, :user_id

  validates_numericality_of :gross_income, :greater_than => 0
  validates_numericality_of :net_income, allow_nil: true
  validates_numericality_of :savings, allow_nil: true

  validates_presence_of :gross_income
  validates_presence_of :start_date
  validates_presence_of :end_date

  before_create :calculate_net_income

  belongs_to :user
  has_many :withdrawals

  def balance
    (net_income * user.allowance) - (withdrawals.map(&:value).reduce(0, :+))
  end

  def calculate_net_income
    self.net_income = gross_income - (user.deductions.map(&:pay_period_value).reduce(0, :+))
  end

  def calculate_savings
    self.savings = net_income - balance
    self.save
  end
end
