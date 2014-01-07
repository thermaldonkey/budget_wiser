require 'spec_helper'

describe "withdrawals/new" do
  before(:each) do
    assign(:withdrawal, stub_model(Withdrawal,
      :value => 1.5,
      :references => ""
    ).as_new_record)
  end

  it "renders new withdrawal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", withdrawals_path, "post" do
      assert_select "input#withdrawal_value[name=?]", "withdrawal[value]"
      assert_select "input#withdrawal_references[name=?]", "withdrawal[references]"
    end
  end
end
