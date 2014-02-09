class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :allowance, :name, :pay_days, :pending_payment, :email, :password, :password_confirmation, :remember_me

  validates_numericality_of :allowance, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1
  validates_numericality_of :pending_payment, :greater_than_or_equal_to => 0
  validates_uniqueness_of :email
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :password
  validates_presence_of :allowance

  validate :presence_of_pay_days

  has_many :pay_periods
  has_many :deductions
  has_many :notifications

  private

    def presence_of_pay_days
      if self.pay_days.empty?
        self.errors.add(:pay_days, "must not be empty")
      end
    end
end
