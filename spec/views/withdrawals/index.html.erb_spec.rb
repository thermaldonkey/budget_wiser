require 'spec_helper'

describe "withdrawals/index" do
  before(:each) do
    assign(:withdrawals, [
      stub_model(Withdrawal,
        :value => 1.5,
        :references => ""
      ),
      stub_model(Withdrawal,
        :value => 1.5,
        :references => ""
      )
    ])
  end

  it "renders a list of withdrawals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
