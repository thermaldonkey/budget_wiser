require 'spec_helper'

describe "deductions/new" do
  before(:each) do
    assign(:deduction, stub_model(Deduction,
      :value => 1.5,
      :monthly_frequency => 1,
      :user => nil
    ).as_new_record)
  end

  it "renders new deduction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", deductions_path, "post" do
      assert_select "input#deduction_value[name=?]", "deduction[value]"
      assert_select "input#deduction_monthly_frequency[name=?]", "deduction[monthly_frequency]"
      assert_select "input#deduction_user[name=?]", "deduction[user]"
    end
  end
end
