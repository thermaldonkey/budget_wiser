require 'spec_helper'

describe User do
  subject { build(:user) }

  it { should respond_to :allowance }
  it { should respond_to :name }
  it { should respond_to :pay_days }
  it { should respond_to :pending_payment }
  it { should respond_to :email }

  it { should allow_mass_assignment_of :allowance }
  it { should allow_mass_assignment_of :name }
  it { should allow_mass_assignment_of :pay_days }
  it { should allow_mass_assignment_of :pending_payment }
  it { should allow_mass_assignment_of :email }

  it { should validate_numericality_of :allowance }
  it { should validate_numericality_of :pending_payment }

  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_presence_of :allowance }

  it { should have_many :pay_periods }
#  it { should have_many :deductions }
#  it { should have_many :notifications }

  it "should require unique email" do
    subject.save
    build(:user, email: subject.email).should_not be_valid
  end

  it "should require pay_days" do
    subject.pay_days.clear
    subject.should_not be_valid
  end
end
