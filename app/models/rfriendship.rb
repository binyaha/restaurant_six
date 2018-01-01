class Rfriendship < ApplicationRecord
  belongs_to :user
  belongs_to :rfriending, class_name: "User"

  validates :rfriending_id, uniqueness: { scope: :user_id }

end
