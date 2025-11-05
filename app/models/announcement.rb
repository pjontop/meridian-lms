class Announcement < ApplicationRecord
  belongs_to :classroom
  default_scope { order(created_at: :desc) }
end
