class Announcement < ApplicationRecord
  belongs_to :classroom, touch: true
  has_rich_text :content
  
  validates :title, presence: true
  
  default_scope { order(created_at: :desc) }

  # Clear classroom cache when announcements change
  after_commit :clear_classroom_cache

  private

  def clear_classroom_cache
    Rails.cache.delete_matched("classroom/show/#{classroom_id}/*") if classroom_id
    Rails.cache.delete_matched("classroom/announcements_section/*")
  end
end
