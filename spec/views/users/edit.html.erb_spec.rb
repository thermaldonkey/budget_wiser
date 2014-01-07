require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "MyString",
      :pay_days => "MyString",
      :allowance => 1.5,
      :pending_payment => 1.5
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_name[name=?]", "user[name]"
      assert_select "input#user_pay_days[name=?]", "user[pay_days]"
      assert_select "input#user_allowance[name=?]", "user[allowance]"
      assert_select "input#user_pending_payment[name=?]", "user[pending_payment]"
    end
  end
end
