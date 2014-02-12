require 'spec_helper'

describe "deductions/index" do
  before(:each) do
    assign(:deductions, [
      stub_model(Deduction,
        :value => 1.5,
        :monthly_frequency => 1,
        :user => nil
      ),
      stub_model(Deduction,
        :value => 1.5,
        :monthly_frequency => 1,
        :user => nil
      )
    ])
  end

  it "renders a list of deductions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
