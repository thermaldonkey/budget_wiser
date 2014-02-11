require 'spec_helper'

describe "pay_periods/show" do
  before(:each) do
    user = create(:user)
    @pay_period = assign(:pay_period, stub_model(PayPeriod,
      :gross_income => 1.5,
      :net_income => 1.5,
      :savings => 1.5,
      :user_id => user.id
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(//)
  end
end
