class Classroom < ApplicationRecord
    has_many :announcements, dependent: :destroy
end
