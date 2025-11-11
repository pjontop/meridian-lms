class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  # Valid roles
  ROLES = %w[student teacher admin].freeze
  
  validates :role, inclusion: { in: ROLES }
  
  # Role helper methods
  def student?
    role == "student"
  end
  
  def teacher?
    role == "teacher"
  end
  
  def admin?
    role == "admin"
  end

  # Check if user can manage content (admin or teacher)
  def can_manage?
    admin? || teacher?
  end

  # Generate avatar URL using UI Avatars API with caching
  def avatar_url(size: 128)
    return profile_picture_url if profile_picture_url.present?
    
    Rails.cache.fetch("user/#{id}/avatar/#{size}", expires_in: 24.hours) do
      name = email_address.split('@').first.gsub(/[._-]/, ' ').titleize
      "https://ui-avatars.com/api/?name=#{URI.encode_uri_component(name)}&size=#{size}&background=0D8ABC&color=fff&bold=true&rounded=true"
    end
  end

  # Get display name
  def display_name
    email_address.split('@').first.gsub(/[._-]/, ' ').titleize
  end
end
