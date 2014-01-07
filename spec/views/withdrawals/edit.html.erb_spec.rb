require 'spec_helper'

describe "withdrawals/edit" do
  before(:each) do
    @withdrawal = assign(:withdrawal, stub_model(Withdrawal,
      :value => 1.5,
      :references => ""
    ))
  end

  it "renders the edit withdrawal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", withdrawal_path(@withdrawal), "post" do
      assert_select "input#withdrawal_value[name=?]", "withdrawal[value]"
      assert_select "input#withdrawal_references[name=?]", "withdrawal[references]"
    end
  end
end
