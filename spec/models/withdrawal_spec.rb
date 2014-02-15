require 'spec_helper'

describe Withdrawal do
  subject { build(:withdrawal) }

  it { should respond_to :value }
  it { should respond_to :memo }

  it { should allow_mass_assignment_of :value }
  it { should allow_mass_assignment_of :memo }
  it { should allow_mass_assignment_of :pay_period_id }

  it { should validate_numericality_of :value }

  it { should validate_presence_of :value }
end
