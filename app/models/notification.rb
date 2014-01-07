class Notification < ActiveRecord::Base
  attr_accessible :body, :read, :user_id

  validates_presence_of :body

  belongs_to :user
end
