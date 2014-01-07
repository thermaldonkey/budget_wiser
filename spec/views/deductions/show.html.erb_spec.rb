require 'spec_helper'

describe "deductions/show" do
  before(:each) do
    @deduction = assign(:deduction, stub_model(Deduction,
      :value => 1.5,
      :monthly_frequency => 1,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    rendered.should match(/1/)
    rendered.should match(//)
  end
end
