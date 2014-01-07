require 'spec_helper'

describe "withdrawals/show" do
  before(:each) do
    @withdrawal = assign(:withdrawal, stub_model(Withdrawal,
      :value => 1.5,
      :references => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    rendered.should match(//)
  end
end
