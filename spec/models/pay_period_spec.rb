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
  it { should have_many :withdrawals }

  it "should allow nil net_income" do
    period = build(:pay_period)
    period.should be_valid
    period.net_income = nil
    period.should be_valid
  end

  it "should allow nil savings" do
    period = build(:pay_period)
    period.should be_valid
    period.savings = nil
    period.should be_valid
  end

  describe "#balance" do
    let(:period) { create(:pay_period) }

    before do
      period.user.allowance = 0.75
      period.user.save
      period.update_attributes(net_income: 200)
      period.withdrawals << create(:withdrawal, value: 15, pay_period_id: period.id)
      period.withdrawals << create(:withdrawal, value: 25, pay_period_id: period.id)
    end

    subject { period.balance }

    it "should return the value of all income minus expenses" do
      subject.should eq 110
    end
  end

  describe "#calculate_net_income" do
    let(:period) { create(:pay_period, gross_income: 500) }

    before do
      period.user.save
      period.user.deductions << create(:deduction, value: 100, monthly_frequency: 4, user_id: period.user.id)
      period.user.deductions << create(:deduction, value: 125, monthly_frequency: 2, user_id: period.user.id)
    end

    subject { period.calculate_net_income }

    it "should set net_income based on user's deductions" do
      period.net_income.should_not eq 337.5
      subject
      period.net_income.should eq 337.5
    end
  end

  describe "#calculate_savings" do
    let(:period) { create(:pay_period) }

    before do
      period.user.allowance = 0.75
      period.user.save
      period.update_attributes(net_income: 125)
      period.withdrawals << create(:withdrawal, value: 20, pay_period_id: period.id)
      period.withdrawals << create(:withdrawal, value: 32, pay_period_id: period.id)
    end

    subject { period.calculate_savings }

    it "should set savings to net_income minus final balance" do
      period.savings.should_not eq 83.25
      subject
      period.savings.should eq 83.25
    end
  end
end
