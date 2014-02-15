require 'spec_helper'

describe Deduction do
  subject { build(:deduction) }

  it { should respond_to :monthly_frequency }
  it { should respond_to :value }
  it { should respond_to :memo }

  it { should allow_mass_assignment_of :monthly_frequency }
  it { should allow_mass_assignment_of :value }
  it { should allow_mass_assignment_of :user_id }
  it { should respond_to :memo }

  it { should validate_numericality_of :monthly_frequency }
  it { should validate_numericality_of :value }

  it { should validate_presence_of :monthly_frequency }
  it { should validate_presence_of :value }

  it { should belong_to :user }

  describe "#pay_period_value" do
    it "should return one pay_period's value" do
      create(:deduction, value: 125, monthly_frequency: 2).pay_period_value.should eq 62.5
      create(:deduction, value: 75, monthly_frequency: 3).pay_period_value.should eq 56.25
    end
  end
end
