class Group < ActiveRecord::Base

  validates_presence_of :user_id, :lunch_id
  validates_uniqueness_of :user_id, scope: :lunch_id, message: "is already in this group!"

  belongs_to :lunch
  belongs_to :user

end
