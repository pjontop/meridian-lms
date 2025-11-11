class Classroom < ApplicationRecord
  has_many :announcements, dependent: :destroy
  has_one_attached :header_image
  
  validates :name, presence: true

  # Touch to bust cache when announcements change
  after_update_commit :touch_with_version
  after_destroy_commit :clear_cache

  private

  def touch_with_version
    # Update the updated_at timestamp to bust caches
    touch unless destroyed?
  end

  def clear_cache
    # Clear associated caches
    Rails.cache.delete_matched("classrooms/index/*")
    Rails.cache.delete_matched("classroom/show/#{id}/*")
  end
end
