require 'spec_helper'

describe "pay_periods/index" do
  before(:each) do
    assign(:pay_periods, [
      stub_model(PayPeriod,
        :gross_income => 1.5,
        :net_income => 1.5,
        :savings => 1.5,
        :belongs_to => ""
      ),
      stub_model(PayPeriod,
        :gross_income => 1.5,
        :net_income => 1.5,
        :savings => 1.5,
        :belongs_to => ""
      )
    ])
  end

  it "renders a list of pay_periods" do
    pending "Work on this later"
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
