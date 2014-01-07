require 'spec_helper'

describe "notifications/edit" do
  before(:each) do
    @notification = assign(:notification, stub_model(Notification,
      :body => "MyString",
      :read => false,
      :user => nil
    ))
  end

  it "renders the edit notification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", notification_path(@notification), "post" do
      assert_select "input#notification_body[name=?]", "notification[body]"
      assert_select "input#notification_read[name=?]", "notification[read]"
      assert_select "input#notification_user[name=?]", "notification[user]"
    end
  end
end
