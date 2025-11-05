class Classroom < ApplicationRecord
  has_many :announcements, dependent: :destroy
  has_one_attached :header_image
  
  validates :name, presence: true
end
