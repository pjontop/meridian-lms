class Announcement < ApplicationRecord
  belongs_to :classroom, touch: true
  has_rich_text :content
  
  validates :title, presence: true
  
  default_scope { order(created_at: :desc) }
end
