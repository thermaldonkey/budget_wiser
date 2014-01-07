require 'spec_helper'

describe "deductions/edit" do
  before(:each) do
    @deduction = assign(:deduction, stub_model(Deduction,
      :value => 1.5,
      :monthly_frequency => 1,
      :user => nil
    ))
  end

  it "renders the edit deduction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", deduction_path(@deduction), "post" do
      assert_select "input#deduction_value[name=?]", "deduction[value]"
      assert_select "input#deduction_monthly_frequency[name=?]", "deduction[monthly_frequency]"
      assert_select "input#deduction_user[name=?]", "deduction[user]"
    end
  end
end
