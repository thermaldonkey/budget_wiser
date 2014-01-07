require 'spec_helper'

describe Notification do
  subject { build(:notification) }

  it { should respond_to :body }
  it { should respond_to :read }

  it { should allow_mass_assignment_of :body }
  it { should allow_mass_assignment_of :read }
  it { should allow_mass_assignment_of :user_id }

  it { should validate_presence_of :body }

  it { should belong_to :user }

  it "should default read to false" do
    subject.read = nil
    subject.save
    subject.read.should be_false
  end
end
