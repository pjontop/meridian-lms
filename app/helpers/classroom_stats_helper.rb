module ClassroomStatsHelper
  def classroom_stats(classroom)
    Rails.cache.fetch("#{classroom.cache_key_with_version}/stats", expires_in: 12.hours) do
      {
        announcements_count: classroom.announcements.count,
        latest_announcement: classroom.announcements.first&.created_at,
        updated_at: classroom.updated_at
      }
    end
  end
  
  def user_classrooms(user)
    Rails.cache.fetch("user/#{user.id}/classrooms", expires_in: 1.hour) do
      user.classrooms.to_a if user.respond_to?(:classrooms)
    end
  end
end
