require 'spec_helper'

describe "pay_periods/new" do
  before(:each) do
    assign(:pay_period, stub_model(PayPeriod,
      :gross_income => 1.5,
      :net_income => 1.5,
      :savings => 1.5,
      :belongs_to => ""
    ).as_new_record)
  end

  it "renders new pay_period form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pay_periods_path, "post" do
      assert_select "input#pay_period_gross_income[name=?]", "pay_period[gross_income]"
      assert_select "input#pay_period_net_income[name=?]", "pay_period[net_income]"
      assert_select "input#pay_period_savings[name=?]", "pay_period[savings]"
      assert_select "input#pay_period_belongs_to[name=?]", "pay_period[belongs_to]"
    end
  end
end
