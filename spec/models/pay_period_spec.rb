require 'spec_helper'

describe PayPeriod do
  subject { build(:pay_period) }

  it { should respond_to :end_date }
  it { should respond_to :start_date }
  it { should respond_to :gross_income }
  it { should respond_to :net_income }
  it { should respond_to :savings }

  it { should allow_mass_assignment_of :end_date }
  it { should allow_mass_assignment_of :start_date }
  it { should allow_mass_assignment_of :gross_income }
  it { should allow_mass_assignment_of :net_income }
  it { should allow_mass_assignment_of :savings }
  it { should allow_mass_assignment_of :user_id }

  it { should validate_numericality_of :gross_income }
  it { should validate_numericality_of :net_income }
  it { should validate_numericality_of :savings }

  it { should validate_presence_of :gross_income }
  it { should validate_presence_of :start_date }
  it { should validate_presence_of :end_date }

  it { should belong_to :user }
#  it { should have_many :withdrawals }

#  describe "#balance" do
#    it "should return the value of all income minus expenses" do
#    end
#  end
end
