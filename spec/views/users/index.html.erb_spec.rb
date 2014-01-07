require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :name => "Name",
        :pay_days => "Pay Days",
        :allowance => 1.5,
        :pending_payment => 1.5
      ),
      stub_model(User,
        :name => "Name",
        :pay_days => "Pay Days",
        :allowance => 1.5,
        :pending_payment => 1.5
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Pay Days".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
