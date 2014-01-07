require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Name",
      :pay_days => "Pay Days",
      :allowance => 1.5,
      :pending_payment => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Pay Days/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
  end
end
