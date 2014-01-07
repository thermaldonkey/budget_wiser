require 'spec_helper'

describe "notifications/new" do
  before(:each) do
    assign(:notification, stub_model(Notification,
      :body => "MyString",
      :read => false,
      :user => nil
    ).as_new_record)
  end

  it "renders new notification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", notifications_path, "post" do
      assert_select "input#notification_body[name=?]", "notification[body]"
      assert_select "input#notification_read[name=?]", "notification[read]"
      assert_select "input#notification_user[name=?]", "notification[user]"
    end
  end
end
